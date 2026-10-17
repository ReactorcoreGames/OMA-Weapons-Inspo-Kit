"""Merge BW's Classic and Pro rulesets into the kit's single canonical stat set.

Implements the "Canonical stat merge rules" from CLAUDE.md:
  1. Classic (ParamsClasses[1]) is the base. Fire modes are the union of Classic and Pro modes;
     each mode keeps the fire parameters of the ruleset it came from.
  2. Pro buffs win on power stats (capacity, fire rate, damage, range, projectile speed). Pro nerfs
     are never imported.
  5. Handling (recoil, aim, chaos, sprint/jump penalties) stays Classic.
  6. Bolt-action cycling and grenade "mag" values are structural, so they are flagged, not merged.
Rules 3 and 4 (hipfire tightening, ads_run_instability) are kit-unit derivations and live in the
unit-conversion step, not here.

Output keeps raw BW units but restructures each layout so every fire mode carries its own explicit
fire / alt-fire params (BW indexes FireParams by CurrentWeaponMode, which is awkward downstream).
Every Pro override and every structural flag is logged to a markdown report.

Usage: python merge_canonical.py <bw_weapon_params.json> <scripts_v2_root> <out.json> <report.md>
"""
import copy
import difflib
import json
import os
import re
import sys

BURST_IDS = {"WM_Burst", "WM_BigBurst"}
# Probe distances (Unreal units) used to decide whether a Pro damage-falloff bundle is a strict buff
FALLOFF_PROBES = [262.5, 525, 1050, 1575, 2625, 3675, 5250, 7875]  # 5..150 m


# ---------- small helpers ----------
def num(v):
    return isinstance(v, (int, float)) and not isinstance(v, bool)


def as_list(v):
    if v is None:
        return []
    if isinstance(v, dict) and v and all(str(k).isdigit() for k in v):
        return [v[k] for k in sorted(v, key=int)]
    return v if isinstance(v, list) else [v]


def pick(lst, i):
    """BW's Min(CurrentWeaponMode, Length-1) indexing, tolerant of None holes."""
    lst = as_list(lst)
    if not lst:
        return None
    return lst[min(i, len(lst) - 1)]


def mode_family(m):
    mid = m.get("ModeID") or "WM_None"
    if mid in BURST_IDS:
        return "burst"
    return {"WM_SemiAuto": "semi", "WM_FullAuto": "auto"}.get(mid, "other")


def available_modes(weapon, layout):
    """Effective WeaponModes for a layout: layout override, else weapon-class defaults.
    Returns [(bw_index, mode_dict)] for modes that are not bUnavailable."""
    wm = as_list(layout.get("WeaponModes")) or as_list(weapon.get("WeaponModes"))
    return [(i, m) for i, m in enumerate(wm) if isinstance(m, dict) and not m.get("bUnavailable")]


def norm_name(s):
    return re.sub(r"[^a-z0-9]+", " ", (s or "").lower()).strip()


# ---------- layout matching ----------
def match_layouts(classic, pro):
    """Pair Classic layouts with Pro layouts: exact name, then LayoutTags, then fuzzy name, then
    position when both sides have a single leftover. Returns (pairs, unmatched_pro)."""
    pairs = {i: None for i in range(len(classic))}
    free = set(range(len(pro)))
    how = {}

    def take(ci, pi, why):
        pairs[ci] = pi
        free.discard(pi)
        how[ci] = why

    if len(classic) == 1 and len(pro) == 1:
        take(0, 0, "single layout")
        return pairs, [], how
    for ci, c in enumerate(classic):
        for pi in sorted(free):
            if norm_name(c.get("LayoutName")) and norm_name(c.get("LayoutName")) == norm_name(pro[pi].get("LayoutName")):
                take(ci, pi, "name")
                break
    for ci, c in enumerate(classic):
        if pairs[ci] is not None or not c.get("LayoutTags"):
            continue
        for pi in sorted(free):
            if c.get("LayoutTags") == pro[pi].get("LayoutTags"):
                take(ci, pi, "tags")
                break
    for ci, c in enumerate(classic):
        if pairs[ci] is not None:
            continue
        best, best_r = None, 0.0
        for pi in sorted(free):
            r = difflib.SequenceMatcher(None, norm_name(c.get("LayoutName")), norm_name(pro[pi].get("LayoutName"))).ratio()
            if r > best_r:
                best, best_r = pi, r
        if best is not None and best_r >= 0.6:
            take(ci, best, f"fuzzy name ({best_r:.2f})")
    left_c = [ci for ci in pairs if pairs[ci] is None]
    if len(left_c) == 1 and len(free) == 1:
        take(left_c[0], next(iter(free)), "last leftover by position")
    return pairs, sorted(free), how


# ---------- mode matching ----------
def match_modes(cmodes, pmodes):
    """cmodes/pmodes: [(bw_index, mode)]. Returns dict classic_pos -> pro_pos and list of pro-only positions."""
    pairs, used = {}, set()
    # 1. same family + same name; 2. same family (+ burst count, + Value for 'other'); never cross-family
    for strict in (True, False):
        for ci, (_, cm) in enumerate(cmodes):
            if ci in pairs:
                continue
            for pi, (_, pm) in enumerate(pmodes):
                if pi in used or mode_family(cm) != mode_family(pm):
                    continue
                fam = mode_family(cm)
                if fam == "burst" and cm.get("Value") != pm.get("Value"):
                    continue
                if fam == "other" and not strict and cm.get("Value") != pm.get("Value"):
                    continue
                if strict and norm_name(cm.get("ModeName")) != norm_name(pm.get("ModeName")):
                    continue
                pairs[ci] = pi
                used.add(pi)
                break
    pro_only = [pi for pi in range(len(pmodes)) if pi not in used]
    return pairs, pro_only


# ---------- falloff ----------
def effective_decay(eff):
    """BW: if DecayRange.Max is 0 or <= Min, DecayRange.Max becomes TraceRange.Max."""
    tr = eff.get("TraceRange") or {}
    dr = dict(eff.get("DecayRange") or {"Min": 0.0, "Max": 0.0})
    dr.setdefault("Min", 0.0)
    dr.setdefault("Max", 0.0)
    if not dr["Max"] or dr["Max"] <= dr["Min"]:
        dr["Max"] = tr.get("Max", 5000.0)
    return dr


def falloff_factor(eff, dist):
    tr = eff.get("TraceRange") or {"Min": 5000.0, "Max": 5000.0}
    if dist > tr.get("Max", 5000.0):
        return 0.0
    atten = eff.get("RangeAtten", 1.0)
    if atten == 1.0:
        return 1.0
    dr = effective_decay(eff)
    if dist <= dr["Min"]:
        return 1.0
    if dist >= dr["Max"]:
        return atten
    a = (dist - dr["Min"]) / (dr["Max"] - dr["Min"])
    return 1.0 + (atten - 1.0) * a


# ---------- the merge ----------
class Log:
    def __init__(self):
        self.entries = []

    def add(self, cls, where, field, classic, pro, kind, note=""):
        self.entries.append({"class": cls, "where": where, "field": field, "classic": classic, "pro": pro, "kind": kind, "note": note})


def merge_effect(cls, where, c, p, log, fire_c, fire_p):
    """Merge one FireEffectParams dict (Classic base). Returns merged copy."""
    out = copy.deepcopy(c)
    if not isinstance(p, dict):
        return out
    if c.get("_class") != p.get("_class"):
        log.add(cls, where, "_class", c.get("_class"), p.get("_class"), "flag", "effect class differs between rulesets; Pro values not merged")
        return out

    def buff(field, higher=True, kind="buff"):
        cv, pv = c.get(field), p.get(field)
        if not num(cv) or not num(pv) or cv == pv:
            return
        if (pv > cv) == higher:
            out[field] = pv
            log.add(cls, where, field, cv, pv, kind)

    # damage (shotguns compare total payload Damage * TraceCount)
    if "TraceCount" in c or "TraceCount" in p:
        ct, pt = c.get("TraceCount", 1), p.get("TraceCount", 1)
        cd, pd = c.get("Damage", 0) * ct, p.get("Damage", 0) * pt
        if num(cd) and num(pd) and pd > cd:
            out["Damage"], out["TraceCount"] = p.get("Damage"), pt
            log.add(cls, where, "Damage x TraceCount", f"{c.get('Damage')} x {ct}", f"{p.get('Damage')} x {pt}", "buff")
    else:
        buff("Damage")
    buff("HeadMult", kind="buff-judgement")
    buff("LimbMult", kind="buff-judgement")
    buff("DamageRadius", kind="buff-judgement")
    buff("ImpactDamage")
    # projectile speed
    buff("Speed")
    buff("MaxSpeed")
    # range: max trace range, then the falloff bundle (DecayRange + RangeAtten) only if strictly better
    if "TraceRange" in c and "TraceRange" in p:
        out["DecayRange"] = effective_decay(c)  # freeze Classic falloff before TraceRange may change
        ctr, ptr = c["TraceRange"], p["TraceRange"]
        if num(ptr.get("Max")) and num(ctr.get("Max")) and ptr["Max"] > ctr["Max"]:
            out["TraceRange"] = dict(ptr) if ptr.get("Min", 0) >= ctr.get("Min", 0) else {"Min": ctr.get("Min"), "Max": ptr["Max"]}
            log.add(cls, where, "TraceRange", ctr, out["TraceRange"], "buff")
        if c.get("RangeAtten", 1.0) != 1.0 or p.get("RangeAtten", 1.0) != 1.0:
            cf = [falloff_factor(c, x) for x in FALLOFF_PROBES]
            pf = [falloff_factor(p, x) for x in FALLOFF_PROBES]
            if all(b >= a - 1e-9 for a, b in zip(cf, pf)) and any(b > a + 1e-9 for a, b in zip(cf, pf)):
                out["DecayRange"], out["RangeAtten"] = effective_decay(p), p.get("RangeAtten", 1.0)
                log.add(cls, where, "falloff (DecayRange, RangeAtten)", (effective_decay(c), c.get("RangeAtten", 1.0)),
                        (effective_decay(p), p.get("RangeAtten", 1.0)), "buff")
            elif cf != pf and any(b > a for a, b in zip(cf, pf)):
                log.add(cls, where, "falloff (DecayRange, RangeAtten)", (effective_decay(c), c.get("RangeAtten", 1.0)),
                        (effective_decay(p), p.get("RangeAtten", 1.0)), "kept", "Pro falloff better at some ranges, worse at others: Classic kept")
    return out


def merge_fire(cls, where, c, p, log, cock_after_fire):
    """Merge one FireParams dict. c is the Classic base; p the Pro counterpart (or None)."""
    if not isinstance(c, dict):
        return copy.deepcopy(p) if isinstance(p, dict) else None
    out = copy.deepcopy(c)
    if not isinstance(p, dict):
        return out
    ci, pi = c.get("FireInterval"), p.get("FireInterval")
    if num(ci) and num(pi) and pi < ci:
        if cock_after_fire or c.get("bCockAfterFire") or p.get("bCockAfterFire"):
            log.add(cls, where, "FireInterval", ci, pi, "structural", "bolt/pump cycling: rulesets fold cycling into FireInterval differently; Classic kept, verify per weapon")
        else:
            out["FireInterval"] = pi
            log.add(cls, where, "FireInterval", ci, pi, "buff")
    ce, pe = as_list(c.get("FireEffectParams")), as_list(p.get("FireEffectParams"))
    out["FireEffectParams"] = [merge_effect(cls, f"{where} effect[{i}]", e, pe[i] if i < len(pe) else None, log, c, p) for i, e in enumerate(ce)]
    # odd-result flag: combined DPS jump
    try:
        c0, o0 = ce[0], out["FireEffectParams"][0]
        dps_c = c0.get("Damage", 0) * c0.get("TraceCount", 1) / c["FireInterval"]
        dps_o = o0.get("Damage", 0) * o0.get("TraceCount", 1) / out["FireInterval"]
        if dps_c and dps_o / dps_c >= 1.5:
            log.add(cls, where, "DPS", round(dps_c, 1), round(dps_o, 1), "flag", f"merged DPS is x{dps_o / dps_c:.2f} Classic")
    except (KeyError, ZeroDivisionError, TypeError, IndexError):
        pass
    return out


def rescale_pro_fire(fire, ratio):
    """A Pro-origin fire mode keeps Pro's power numbers but its per-shot kick is re-expressed in
    Classic's recoil calibration (handling stays Classic, rule 5)."""
    f = copy.deepcopy(fire)
    for e in as_list(f.get("FireEffectParams")):
        if isinstance(e, dict) and num(e.get("Recoil")):
            e["Recoil"] = round(e["Recoil"] * ratio, 1)
    return f


def base_recoil(layout, mode_index=0):
    f = pick(layout.get("FireParams"), mode_index)
    if not isinstance(f, dict):
        return None
    e = pick(f.get("FireEffectParams"), 0)
    return e.get("Recoil") if isinstance(e, dict) else None


def is_structural_grenade(weapon_cls, chain):
    return any("Grenade" in c and ("HandGrenade" in c or c.endswith("Grenade")) for c in chain)


def class_chain(src_classes, cls):
    out = []
    while cls in src_classes and cls not in out:
        out.append(cls)
        cls = src_classes[cls]
    return out


def load_parents(root):
    parents, files = {}, {}
    rx = re.compile(r"^class\s+(\w+)\s+extends\s+([\w.]+)", re.M)
    for pkg in os.listdir(root):
        cdir = os.path.join(root, pkg, "Classes")
        if not os.path.isdir(cdir):
            continue
        for f in os.listdir(cdir):
            if f.endswith(".uc"):
                path = os.path.join(cdir, f)
                with open(path, encoding="utf-8", errors="replace") as fh:
                    head = fh.read(4000)
                m = rx.search(head)
                if m:
                    parents[m.group(1)] = m.group(2).split(".")[-1]
                    files[m.group(1)] = path
    return parents, files


def fire_class_cocks(files, parents, ref):
    """True if the fire class (or an ancestor) sets bCockAfterFire=true in defaultproperties."""
    m = re.match(r"Class'[\w]+\.(\w+)'", ref or "")
    cls = m.group(1) if m else None
    while cls and cls in files:
        with open(files[cls], encoding="utf-8", errors="replace") as fh:
            txt = fh.read()
        hit = re.search(r"^\s*bCockAfterFire=(true|false)", txt, re.M)
        if hit:
            return hit.group(1) == "true"
        cls = parents.get(cls)
    return False


def merge_weapon(w, log, parents, files):
    cls = w["class"]
    styles = w["styles"]
    wdef = w["weapon"]
    flags = []
    if "classic" not in styles:
        base_key, other_key = "pro", None
        flags.append("no Classic params: Pro used as base (rule 1 cannot apply)")
    else:
        base_key, other_key = "classic", "pro" if "pro" in styles else None
    base_layouts = [l for l in styles[base_key]["layouts"] if isinstance(l, dict)]
    pro_layouts = [l for l in styles[other_key]["layouts"] if isinstance(l, dict)] if other_key else []
    chain = class_chain(parents, cls)
    grenade = is_structural_grenade(cls, chain) or bool(wdef.get("bWT_Grenade"))
    fire_refs = as_list(wdef.get("FireModeClass"))
    cocks = [fire_class_cocks(files, parents, r) for r in fire_refs]
    if any(cocks):
        flags.append("fire class cocks after every shot (bolt/pump/lever): FireInterval not merged")

    pairs, pro_only_layouts, how = match_layouts(base_layouts, pro_layouts) if pro_layouts else ({i: None for i in range(len(base_layouts))}, [], {})
    out_layouts = []

    def build(lay, origin, pro_lay, li):
        where0 = f"layout '{lay.get('LayoutName')}'"
        L = {k: copy.deepcopy(v) for k, v in lay.items() if k not in ("FireParams", "AltFireParams", "WeaponModes", "RecoilParams", "AimParams")}
        L["_origin"] = origin
        if pro_lay is not None:
            L["_pro_layout"] = pro_lay.get("LayoutName")
            L["_pro_match"] = how.get(li)
            # capacity
            cm, pm = lay.get("MagAmmo"), pro_lay.get("MagAmmo")
            if num(cm) and num(pm) and pm > cm:
                if grenade or wdef.get("bNoMag"):
                    log.add(cls, where0, "MagAmmo", cm, pm, "structural", "no-mag / grenade weapon: MagAmmo means different things per ruleset; Classic kept")
                else:
                    L["MagAmmo"] = pm
                    log.add(cls, where0, "MagAmmo", cm, pm, "buff")
            elif num(cm) and num(pm) and cm != pm and (grenade or wdef.get("bNoMag")):
                log.add(cls, where0, "MagAmmo", cm, pm, "structural", "no-mag / grenade weapon: stack vs per-throw count; Classic kept")
        L["RecoilParams"] = copy.deepcopy(as_list(lay.get("RecoilParams")))
        L["AimParams"] = copy.deepcopy(as_list(lay.get("AimParams")))
        cmodes = available_modes(wdef, lay)
        pmodes = available_modes(wdef, pro_lay) if pro_lay is not None else []
        mpairs, pro_only = match_modes(cmodes, pmodes)
        modes = []
        cfire, cfalt = as_list(lay.get("FireParams")), as_list(lay.get("AltFireParams"))
        pfire = as_list(pro_lay.get("FireParams")) if pro_lay is not None else []
        pfalt = as_list(pro_lay.get("AltFireParams")) if pro_lay is not None else []
        implicit = not cmodes
        if implicit:
            cmodes = [(0, {"ModeName": "Default", "ModeID": "WM_None", "Value": 0.0, "RecoilParamsIndex": 0, "AimParamsIndex": 0})]
            mpairs = {0: 0} if pro_lay is not None else {}
            pmodes = pmodes or [(0, {})]
            pro_only = []
        for pos, (bi, m) in enumerate(cmodes):
            ppos = mpairs.get(pos)
            pbi = pmodes[ppos][0] if ppos is not None else None
            where = f"{where0} mode '{m.get('ModeName')}'"
            if pbi is None and pmodes and pro_lay is not None:
                # Classic-only mode. If it shares its fire params object with a matched mode, it is the
                # same cartridge: reuse that mode's Pro counterpart. Plain semi/burst/auto selectors are
                # also the same cartridge: compare with the nearest Pro mode. Anything else (ammo swaps,
                # special modes) has no Pro counterpart.
                obj = (pick(cfire, bi) or {}).get("_object")
                twin = [q for q, (bj, _) in enumerate(cmodes) if q in mpairs and obj and (pick(cfire, bj) or {}).get("_object") == obj]
                if twin:
                    pm = pmodes[mpairs[twin[0]]]
                elif mode_family(m) in ("semi", "burst", "auto"):
                    same = [x for x in pmodes if mode_family(x[1]) == mode_family(m)]
                    pm = (same or [x for x in pmodes if mode_family(x[1]) in ("semi", "burst", "auto")] or [None])[0]
                else:
                    pm = None
                if pm is not None:
                    pbi = pm[0]
                    where += f" (vs Pro '{pm[1].get('ModeName')}')"
            fire = merge_fire(cls, where + " primary", pick(cfire, bi), pick(pfire, pbi) if pbi is not None else None, log, cocks[0] if cocks else False)
            alt = merge_fire(cls, where + " secondary", pick(cfalt, bi), pick(pfalt, pbi) if pbi is not None else None, log, cocks[1] if len(cocks) > 1 else False)
            modes.append({
                "name": m.get("ModeName"), "mode_id": m.get("ModeID"), "value": m.get("Value"),
                "origin": origin if origin == "pro" else ("both" if ppos is not None else origin),
                "pro_name": pmodes[ppos][1].get("ModeName") if ppos is not None else None,
                "bw_index": bi, "bw_index_pro": pbi,
                "recoil_index": m.get("RecoilParamsIndex", 0) or 0, "aim_index": m.get("AimParamsIndex", 0) or 0,
                "fire": fire, "alt_fire": alt,
            })
        if pro_lay is not None and pro_only:
            cr = base_recoil(lay, cmodes[0][0])
            pr = base_recoil(pro_lay, pmodes[mpairs[0]][0] if 0 in mpairs else 0)
            ratio = (cr / pr) if num(cr) and num(pr) and pr else None
            for ppos in pro_only:
                pbi, pm = pmodes[ppos]
                pf = pick(pfire, pbi)
                if not isinstance(pf, dict):
                    continue
                fire = rescale_pro_fire(pf, ratio) if ratio else copy.deepcopy(pf)
                name = pm.get("ModeName")
                if mode_family(pm) == "burst" and any(norm_name(x["name"]) == norm_name(name) for x in modes):
                    name = f"{name} ({int(pm.get('Value', 0))})"
                modes.append({
                    "name": name, "mode_id": pm.get("ModeID"), "value": pm.get("Value"), "origin": "pro",
                    "pro_name": pm.get("ModeName"), "bw_index": None, "bw_index_pro": pbi,
                    "recoil_index": 0, "aim_index": 0, "fire": fire,
                    "alt_fire": copy.deepcopy(modes[0]["alt_fire"]) if modes else copy.deepcopy(pick(pfalt, pbi)),
                })
                log.add(cls, where0, "fire mode", None, f"{pm.get('ModeName')} ({pm.get('ModeID')} {pm.get('Value')})", "mode-union",
                        f"Pro-only mode added; Pro fire params, kick rescaled x{ratio:.2f} to Classic calibration" if ratio else "Pro-only mode added; kick not rescaled (no common base mode)")
                if ratio and not 0.25 <= ratio <= 4.0:
                    log.add(cls, where0, "kick rescale", None, round(ratio, 2), "flag", f"Pro-only mode '{name}': Classic/Pro kick ratio is extreme, check the mode's recoil by hand")
        # fire params that are not addressed by a weapon mode (e.g. code-selected projectile overrides)
        n_modes_idx = max([bi for bi, _ in available_modes(wdef, lay)] + [0]) + 1
        for key, src_c, src_p in (("extra_fire", cfire, pfire), ("extra_alt_fire", cfalt, pfalt)):
            extra = []
            for i in range(n_modes_idx, len(src_c)):
                extra.append({"bw_index": i, "params": merge_fire(cls, f"{where0} {key}[{i}]", src_c[i], src_p[i] if i < len(src_p) else None, log, False)})
            if extra:
                L[key] = extra
        L["modes"] = modes
        return L

    for li, lay in enumerate(base_layouts):
        pl = pro_layouts[pairs[li]] if pairs.get(li) is not None else None
        out_layouts.append(build(lay, base_key, pl, li))
        if pro_layouts and pl is None:
            log.add(cls, f"layout '{lay.get('LayoutName')}'", "layout", lay.get("LayoutName"), None, "info", "Classic-only layout (no Pro counterpart)")
    for pi in pro_only_layouts:
        pl = copy.deepcopy(pro_layouts[pi])
        # Pro-only layout: Pro power numbers, Classic handling of the base layout (rule 5)
        donor = base_layouts[0] if base_layouts else pl
        pl["RecoilParams"], pl["AimParams"] = copy.deepcopy(as_list(donor.get("RecoilParams"))), copy.deepcopy(as_list(donor.get("AimParams")))
        L = build(pl, "pro", None, None)
        cr, pr = base_recoil(donor), base_recoil(pro_layouts[pi])
        ratio = (cr / pr) if num(cr) and num(pr) and pr else None
        if ratio:
            for m in L["modes"]:
                m["fire"] = rescale_pro_fire(m["fire"], ratio) if m["fire"] else m["fire"]
        L["_handling_from"] = donor.get("LayoutName")
        out_layouts.append(L)
        log.add(cls, f"layout '{pl.get('LayoutName')}'", "layout", None, pl.get("LayoutName"), "mode-union",
                f"Pro-only layout added as variant; handling from Classic '{donor.get('LayoutName')}'" + (f", kick rescaled x{ratio:.2f}" if ratio else ""))
    return {
        "class": cls, "package": w["package"], "parent": w["parent"], "registered": w["registered"],
        "fallback_name": w["fallback_name"], "weapon": wdef, "class_chain": chain,
        "base_ruleset": base_key, "params_class": {k: v["params_class"] for k, v in styles.items() if k in ("classic", "pro")},
        "flags": flags, "layouts": out_layouts,
    }


def fmt(v):
    if isinstance(v, float):
        return f"{v:g}"
    if isinstance(v, dict):
        return "(" + ", ".join(f"{k} {fmt(x)}" for k, x in v.items()) + ")"
    if isinstance(v, (list, tuple)):
        return "[" + ", ".join(fmt(x) for x in v) + "]"
    return "-" if v is None else str(v)


def write_report(path, merged, log):
    by = {}
    for e in log.entries:
        by.setdefault(e["class"], []).append(e)
    kinds = {}
    for e in log.entries:
        kinds[e["kind"]] = kinds.get(e["kind"], 0) + 1
    lines = [
        "# Merge report: Classic base + Pro buffs",
        "",
        "Generated by `tools/extract/merge_canonical.py` from `sources/bw-2.9/extracted/bw_weapon_params.json`. Do not edit by hand; re-run the script. Values are raw BW units (Unreal units, rotation units, game seconds).",
        "",
        "How to read it: **buff** = Pro value replaced Classic (rule 2). **buff-judgement** = same, but on a field the rules don't name explicitly (head/limb multiplier, splash radius); veto any you dislike. **mode-union** = a Pro-only fire mode or layout was added (rule 1). **structural** = values differ for structural reasons (bolt cycling, grenade stacks), Classic kept, verify when writing the entry (rule 6). **flag** = looks odd, check it. **kept** = Pro was better somewhere but not everywhere, Classic kept. **info** = context only.",
        "",
        "Counts: " + ", ".join(f"{k} {v}" for k, v in sorted(kinds.items())),
        "",
        "Weapons with a DPS jump of x1.5 or more are listed under `flag`. Falloff bundles are compared at 5–150 m and only taken from Pro when they are at least as good at every probe distance.",
        "",
    ]
    order = sorted(merged.values(), key=lambda w: (not w["registered"], w["package"], w["class"]))
    review = [e for e in log.entries if e["kind"] in ("flag", "structural", "mode-union")]
    lines += ["## Review first: flags, structural cases, added modes and layouts", "",
              "| Weapon | Where | Field | Classic | Pro | Kind | Note |", "|---|---|---|---|---|---|---|"]
    for w in order:
        for e in review:
            if e["class"] == w["class"]:
                lines.append(f"| {w['class']} | {e['where']} | {e['field']} | {fmt(e['classic'])} | {fmt(e['pro'])} | {e['kind']} | {e['note']} |")
    lines += ["", "# Per-weapon detail", ""]
    for w in order:
        ents = by.get(w["class"], [])
        if not ents and not w["flags"]:
            continue
        title = f"## {w['class']}" + (f" ({w['fallback_name']})" if w["fallback_name"] else "") + f" · {w['package']}" + ("" if w["registered"] else " · unregistered")
        lines += [title, ""]
        for f in w["flags"]:
            lines.append(f"- **flag:** {f}")
        if ents:
            lines += ["", "| Where | Field | Classic | Pro | Kind | Note |", "|---|---|---|---|---|---|"]
            for e in ents:
                lines.append(f"| {e['where']} | {e['field']} | {fmt(e['classic'])} | {fmt(e['pro'])} | {e['kind']} | {e['note']} |")
        lines.append("")
    with open(path, "w", encoding="utf-8") as fh:
        fh.write("\n".join(lines))


def main(params_json, src_root, out_json, report_md):
    data = json.load(open(params_json, encoding="utf-8"))
    parents, files = load_parents(src_root)
    log = Log()
    merged = {cls: merge_weapon(w, log, parents, files) for cls, w in sorted(data.items())}
    os.makedirs(os.path.dirname(out_json), exist_ok=True)
    with open(out_json, "w", encoding="utf-8", newline="\r\n") as fh:
        json.dump(merged, fh, indent=1, ensure_ascii=False)
    write_report(report_md, merged, log)
    kinds = {}
    for e in log.entries:
        kinds[e["kind"]] = kinds.get(e["kind"], 0) + 1
    print(f"{len(merged)} weapons merged -> {out_json}; {len(log.entries)} log entries {kinds} -> {report_md}")


if __name__ == "__main__":
    main(*sys.argv[1:5])
