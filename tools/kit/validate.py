"""Validate OMA weapon entries against the weapon schema (kit/core-mechanics/weapon-schema.md).

Checks front matter (fields, types, units, enums, tags), fire-mode inheritance, recoil consistency,
variant patches (each variant is applied and validated as a full weapon), the filename, and the prose
sections. Importable: the catalog browser generator calls validate_file() and shows the same messages.

Usage:
  python tools/kit/validate.py [paths...]            files or folders (default: kit/weapons)
  python tools/kit/validate.py --json [paths...]     machine-readable report
  options: --blocklist FILE   words that must not appear in entries (default: provenance/name-blocklist.txt
                              if it exists; the list is a development aid and is never shipped)
Exit code 1 if any entry has errors. Needs PyYAML (pip install pyyaml).
"""
import copy
import json
import os
import re
import sys

try:
    import yaml
except ImportError:  # pragma: no cover
    sys.exit("validate.py needs PyYAML: pip install pyyaml")

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import recoil_model  # noqa: E402

SCHEMA_ID = "oma-weapon/1"

CARRY_CLASSES = ["sidearm", "light-melee", "primary", "heavy-melee", "heavy", "throwable", "placeable", "utility"]
ARCHETYPES = ["knife", "sword", "axe", "hammer", "polearm", "fist", "shield", "pistol", "revolver", "machine-pistol", "smg",
              "pdw", "carbine", "assault-rifle", "battle-rifle", "marksman-rifle", "sniper-rifle", "anti-materiel-rifle",
              "shotgun", "lmg", "hmg", "minigun", "grenade-launcher", "rocket-launcher", "flamethrower", "beam", "railgun",
              "plasma-rifle", "plasma-cannon", "crossbow", "grenade", "mine", "charge", "turret", "designator", "medical",
              "ammo-supply", "barricade", "autocannon", "cannon"]
TAG_GROUPS = {
    "damage_form": ["ballistic", "blade", "blunt", "explosive", "incendiary", "plasma", "laser", "electric", "cryo", "chemical",
                    "toxic", "sonic", "kinetic", "radiation", "non-lethal"],
    "era": ["era-historic", "era-modern", "era-near-future", "era-far-future", "era-alien"],
    "fire_control": ["semi-auto", "burst", "full-auto", "bolt-action", "pump-action", "lever-action", "break-action",
                     "single-shot", "charge-up", "continuous"],
    "payload": ["hitscan", "pellets", "projectile", "beam", "thrown", "splash", "penetrating", "ricochet", "homing", "lock-on",
                "guided", "bouncing", "sticky", "timed-fuse", "remote-detonation", "area-denial"],
    "handling": ["dual-wieldable", "one-handed", "two-handed", "scoped", "variable-zoom", "laser-sight", "suppressible",
                 "underbarrel", "bladed", "stock-toggle", "bipod", "shell-loading", "overheats", "self-damage", "slows-carrier"],
    "role": ["deployable", "utility", "healing", "support", "designator", "detachable-vehicle-weapon", "stealth"],
}
ALL_TAGS = {t for ts in TAG_GROUPS.values() for t in ts}
HOLDS = ["one_hand", "two_hand", "shouldered", "hip_braced", "melee"]
DAMAGE_TYPES = ["ballistic", "slash", "pierce", "blunt", "blast", "fragment", "fire", "plasma", "laser", "electric", "cryo",
                "acid", "toxic", "sonic", "kinetic", "radiation"]
PAYLOAD_TYPES = ["hitscan", "pellets", "projectile", "thrown", "beam", "melee", "none"]
GUN_PAYLOADS = {"hitscan", "pellets", "projectile", "beam"}
# status effects: allowed parameter names per type (all numeric unless listed in EFFECT_BOOL)
EFFECTS = {
    "hit_slow": ["mult", "duration_s"],
    "displace_aim": ["min_damage", "duration_s", "scaling"],
    "flinch": ["mult"],
    "burn": ["dps", "duration_s", "ignite_chance", "spread_radius_m"],
    "bleed": ["dps", "duration_s", "stacks"],
    "poison": ["dps", "duration_s", "stacks"],
    "stun": ["duration_s"],
    "blind": ["duration_s", "radius_m"],
    "deafen": ["duration_s", "radius_m"],
    "slow": ["mult", "duration_s"],
    "freeze": ["mult", "duration_s", "shatter_mult"],
    "shock": ["duration_s", "chain_targets", "chain_range_m"],
    "emp": ["duration_s", "radius_m", "drain"],
    "corrode": ["armor_mult", "duration_s", "dps"],
    "knockdown": ["min_impulse_ns", "duration_s"],
    "mark": ["duration_s", "damage_taken_mult"],
    "heal": ["hp", "hp_per_s", "duration_s"],
    "shield_damage": ["mult"],
    "detonates_explosives": [],
    "ignites": ["chance"],
}
EFFECT_BOOL = {"scaling"}

# ---- spec primitives ----
NUM = {"t": "num"}
NUMN = {"t": "num", "neg": True}          # may be negative (angles, offsets)
BOOL = {"t": "bool"}
STR = {"t": "str"}
PAIR = {"t": "pair"}
PAIRN = {"t": "pair", "neg": True}
NUM_OR_PAIR = {"t": "num_or_pair"}


def R(spec):
    """Mark a spec as required."""
    s = dict(spec)
    s["req"] = True
    return s


def ENUM(values):
    return {"t": "enum", "values": values}


def MAP(fields, **kw):
    d = {"t": "map", "fields": fields}
    d.update(kw)
    return d


def LIST(item, **kw):
    d = {"t": "list", "item": item}
    d.update(kw)
    return d


FOLLOW = MAP({"hip": R(NUM), "ads": R(NUM)})
FALLOFF = MAP({"start_m": R(NUM), "end_m": R(NUM), "min_mult": R(NUM)})
PENETRATION = MAP({"body": NUM, "after_body_mult": NUM, "wall_m": NUM, "after_wall_mult": NUM})
SPLASH = MAP({"radius_m": R(NUM), "damage": NUM, "falloff": ENUM(["linear", "quadratic", "none"])})
FUSE = MAP({"arming_s": NUM, "fuse_s": NUM, "detonate": ENUM(["timer", "impact", "impact_after_arming", "when_still", "remote"]),
            "on_body": ENUM(["bounce", "detonate", "stick"])})
LUNGE = MAP({"stop": NUM, "pull_mps": NUM})
EFFECT = {"t": "effect"}
PAYLOAD = MAP({
    "type": R(ENUM(PAYLOAD_TYPES)), "damage": NUM, "damage_type": ENUM(DAMAGE_TYPES), "pellets": NUM, "head_mult": NUM,
    "limb_mult": NUM, "range_m": NUM_OR_PAIR, "falloff": FALLOFF, "spread_deg": NUM_OR_PAIR,
    "spread_shape": ENUM(["circle", "rectangle", "scatter"]), "hip_spread_mult": NUM, "penetration": PENETRATION,
    "speed_mps": NUM, "max_speed_mps": NUM, "accel_mps2": NUM, "gravity_mult": NUMN, "splash": SPLASH, "fuse": FUSE,
    "damage_gain": MAP({"mult": R(NUM), "start_s": NUM, "end_s": R(NUM)}), "knockback_ns": NUM, "blockable": BOOL,
    "effects": LIST(EFFECT), "lunge": LUNGE, "charge_bonus_mult": NUM, "flank_mult": NUM, "back_mult": NUM, "fatigue": NUM,
    "notes": STR,
})
SHOT_RECOIL = MAP({"impulse_ns": R(NUM), "kick_factor": R(NUM), "kick_deg": R(NUM)})
TRIGGERS = ["semi", "burst", "auto", "charge", "hold", "special"]
FIRE_MODE = MAP({
    "name": R(STR), "trigger": R(ENUM(TRIGGERS)), "burst_count": NUM, "burst_repeats_on_hold": BOOL, "rpm": R(NUM),
    "burst_rpm": NUM, "burst_cooldown_s": NUM, "ammo_per_shot": R(NUM), "windup_s": NUM, "max_charge_s": NUM,
    "cock_after_shot": BOOL, "cock_s": NUM, "payload": R(PAYLOAD), "recoil": SHOT_RECOIL, "notes": STR,
})
FUNCTION = MAP({
    "name": R(STR), "kind": R(ENUM(["attack", "toggle", "hold", "action", "alias"])), "alias_of": STR, "payload": PAYLOAD,
    "modifiers": {"t": "modifiers"}, "time_s": NUM, "notes": STR, "rpm": NUM, "ammo_per_shot": NUM,
    "trigger": ENUM(TRIGGERS), "recoil": SHOT_RECOIL, "ammo_pool": STR, "burst_count": NUM, "max_charge_s": NUM,
    "cooldown_s": NUM,
})
MELEE = MAP({
    "name": R(STR), "damage": R(NUM), "damage_type": R(ENUM(DAMAGE_TYPES)), "range_m": R(NUM), "interval_s": R(NUM),
    "charge": MAP({"max_s": R(NUM), "bonus_mult": R(NUM)}), "flank_mult": NUM, "back_mult": NUM, "effects": LIST(EFFECT),
    "lunge": LUNGE, "knockback_ns": NUM, "notes": STR,
})
WEAPON = MAP({
    "schema": R(STR), "id": R(STR), "designation": R(STR), "name": R(STR), "full_name": R(STR), "maker": R(STR),
    "carry_class": R(ENUM(CARRY_CLASSES)), "archetype": R(STR), "tags": R(LIST(STR)), "summary": R(STR),
    "physical": R(MAP({"mass_kg": R(NUM), "length_m": R(NUM), "bulk": R(NUM), "hold": R(ENUM(HOLDS))})),
    "handling": R(MAP({
        "move_speed_mult": R(NUM), "jump_mult": NUM, "draw_s": R(NUM), "holster_s": R(NUM), "draw_and_cock_s": NUM,
        "ads_time_s": NUM, "ads_move_speed_mult": NUM, "ads_run_instability": NUM, "aimable": BOOL,
        "zoom": MAP({"type": R(ENUM(["irons", "fixed", "variable", "smooth"])), "magnification": R(NUM),
                     "min_magnification": NUM, "steps": NUM}),
    })),
    "aim": MAP({
        "drift_deg": R(PAIR), "ads_drift_mult": R(NUM), "settle_s": R(NUM), "moving_settle_mult": NUM, "pose_shift_s": NUM,
        "crouch_mult": NUM, "view_follow": R(FOLLOW),
        "chaos": R(MAP({"full_speed_mps": R(NUM), "full_turn_deg_s": R(NUM), "recovery_s": R(NUM), "recovery_delay_s": NUM,
                        "sprint": R(NUM), "jump": R(NUM), "fall": R(NUM), "dodge": R(NUM), "slide": R(NUM), "wallrun": R(NUM)})),
        "jump_kick_deg": PAIRN, "sprint_pose_deg": PAIRN, "flinch_damage": R(NUM),
    }),
    "recoil": MAP({
        "max_deg": R(NUM), "recovery_s": R(NUM), "recovery_delay_s": R(NUM), "climb_s": NUM, "view_follow": R(FOLLOW),
        "view_recovers": BOOL, "hip_mult": R(NUM), "moving_mult": NUM, "crouch_mult": R(NUM),
        "pattern": R(MAP({"pitch": R({"t": "curve"}), "yaw": R({"t": "curve"}), "pitch_factor": NUMN, "yaw_factor": NUMN})),
        "scatter": R(PAIR), "scatter_floor": NUM,
    }),
    "ammo": R(MAP({
        "feed": R(ENUM(["magazine", "cylinder", "tube", "belt", "cell", "fuel", "charge", "stack", "none"])), "magazine": NUM,
        "chamber_plus_one": BOOL, "reserve": NUM, "ammo_type": STR, "reload_s": NUM, "reload_empty_s": NUM,
        "shells_per_load": NUM, "reload_interruptible": BOOL, "cock_s": NUM, "cock_on_draw": BOOL, "cock_after_reload": BOOL,
        "cock_on_empty": BOOL,
        "extra_pools": LIST(MAP({"name": R(STR), "used_by": R(STR), "magazine": R(NUM), "reserve": NUM, "reload_s": NUM,
                                 "feed": ENUM(["magazine", "cylinder", "tube", "belt", "cell", "fuel", "charge", "stack"])})),
    })),
    "durability": MAP({
        "wear_per_shot": NUM, "wear_per_hit": NUM, "worn_damage_mult": NUM,
        "jam": MAP({"chance_new": R(NUM), "chance_worn": R(NUM), "curve": NUM}),
        "unjam": MAP({"method": R(ENUM(["cock", "reload", "cock_and_reload", "fire", "vent"])), "chance_new": R(NUM),
                      "chance_worn": R(NUM), "cooldown_s": R(NUM), "wastes_round": BOOL}),
    }),
    "heat": MAP({
        "per_shot": R(NUM), "cool_per_s": R(NUM), "cool_delay_s": NUM,
        "overheat": MAP({"mode": R(ENUM(["lockout", "self_damage", "jam", "boost"])), "resume_at": NUM, "self_damage": NUM}),
        "effects_by_heat": LIST(MAP({"at": R(NUM), "field": R(STR), "mult": R(NUM)})),
    }),
    "dual_wield": R(MAP({"allowed": R(BOOL), "mixing": BOOL, "hold": ENUM(HOLDS), "notes": STR})),
    "fire_modes": R(LIST(FIRE_MODE, min=1)),
    "secondary": FUNCTION, "weapon_function": FUNCTION, "melee": MELEE,
    "variants": LIST(MAP({"designation": R(STR), "name": R(STR), "summary": R(STR), "tags_add": LIST(STR),
                          "tags_remove": LIST(STR), "changes": R({"t": "changes"})})),
})

REQUIRED_SECTIONS = ["Concept", "Lore", "Controls", "Design notes"]
CONTROL_KEYS = ["Primary", "Secondary", "Weapon Function", "Fire Mode", "Reload", "ADS", "Cock", "Dual", "Melee"]


# ---------- helpers ----------
def slug(s):
    s = re.sub(r"[^a-z0-9 -]+", "", str(s).lower())
    return re.sub(r"[ -]+", "-", s).strip("-")


def is_num(v):
    return isinstance(v, (int, float)) and not isinstance(v, bool)


class Report:
    def __init__(self):
        self.errors, self.warnings = [], []

    def err(self, where, msg):
        self.errors.append(f"{where}: {msg}" if where else msg)

    def warn(self, where, msg):
        self.warnings.append(f"{where}: {msg}" if where else msg)


def check(value, spec, where, rep):
    t = spec["t"]
    if t == "num":
        if not is_num(value):
            rep.err(where, f"expected a number, got {value!r}")
        elif value < 0 and not spec.get("neg"):
            rep.err(where, f"must not be negative ({value})")
    elif t == "bool":
        if not isinstance(value, bool):
            rep.err(where, f"expected true/false, got {value!r}")
    elif t == "str":
        if not isinstance(value, str) or not value.strip():
            rep.err(where, f"expected text, got {value!r}")
    elif t == "enum":
        if value not in spec["values"]:
            rep.err(where, f"unknown value {value!r} (allowed: {', '.join(map(str, spec['values']))})")
    elif t in ("pair", "num_or_pair"):
        if t == "num_or_pair" and is_num(value):
            check(value, NUM, where, rep)
        elif not (isinstance(value, list) and len(value) == 2 and all(is_num(x) for x in value)):
            rep.err(where, f"expected [a, b] numbers, got {value!r}")
        elif not spec.get("neg") and any(x < 0 for x in value):
            rep.err(where, f"must not be negative ({value})")
    elif t == "curve":
        if not (isinstance(value, list) and value and all(isinstance(p, list) and len(p) == 2 and all(is_num(x) for x in p) for p in value)):
            rep.err(where, "expected a list of [x, y] points")
    elif t == "list":
        if not isinstance(value, list):
            rep.err(where, "expected a list")
            return
        if len(value) < spec.get("min", 0):
            rep.err(where, f"needs at least {spec['min']} item(s)")
        for i, v in enumerate(value):
            check(v, spec["item"], f"{where}[{i}]", rep)
    elif t == "map":
        if not isinstance(value, dict):
            rep.err(where, "expected a mapping")
            return
        for k, sub in spec["fields"].items():
            if sub.get("req") and k not in value:
                rep.err(where, f"missing required field '{k}'")
        for k, v in value.items():
            if str(k).startswith("x_"):
                continue  # custom extension field
            if k not in spec["fields"]:
                rep.err(where, f"unknown field '{k}' (typo? custom fields must start with x_)")
                continue
            check(v, spec["fields"][k], f"{where}.{k}" if where else k, rep)
    elif t == "effect":
        if not isinstance(value, dict) or "type" not in value:
            rep.err(where, "effect needs a 'type'")
            return
        et = value["type"]
        if et not in EFFECTS:
            rep.err(where, f"unknown effect type {et!r} (allowed: {', '.join(EFFECTS)})")
            return
        for k, v in value.items():
            if k == "type" or str(k).startswith("x_"):
                continue
            if k not in EFFECTS[et]:
                rep.err(where, f"effect '{et}' has no parameter '{k}' (allowed: {', '.join(EFFECTS[et]) or 'none'})")
            elif k in EFFECT_BOOL:
                check(v, BOOL, f"{where}.{k}", rep)
            else:
                check(v, NUM, f"{where}.{k}", rep)
    elif t == "modifiers":
        if not isinstance(value, dict):
            rep.err(where, "expected a mapping of dotted.field: multiplier")
        else:
            for k, v in value.items():
                check(v, NUMN, f"{where}.{k}", rep)
    elif t == "changes":
        if not isinstance(value, dict) or not value:
            rep.err(where, "expected a non-empty mapping of dotted.path: value")


# ---------- semantics ----------
def resolved_modes(d):
    modes = d.get("fire_modes") or []
    if not modes or not isinstance(modes[0], dict):
        return modes
    base = modes[0]
    out = [base]
    for m in modes[1:]:
        if isinstance(m, dict):
            merged = deep_merge(copy.deepcopy(base), m)
            out.append(merged)
    return out


def with_resolved_modes(d):
    """Copy of d whose fire modes have inheritance from the first mode applied (structure checks
    must see the effective modes, not the sparse ones written in the file)."""
    if not isinstance(d.get("fire_modes"), list):
        return d
    out = dict(d)
    out["fire_modes"] = resolved_modes(d)
    return out


def deep_merge(a, b):
    for k, v in b.items():
        if isinstance(v, dict) and isinstance(a.get(k), dict):
            deep_merge(a[k], v)
        else:
            a[k] = copy.deepcopy(v)
    return a


def semantic_checks(d, rep, where=""):
    w = (where + ": ") if where else ""
    if d.get("schema") != SCHEMA_ID:
        rep.err(f"{w}schema", f"must be '{SCHEMA_ID}'")
    des, name = d.get("designation"), d.get("name")
    if isinstance(des, str) and not re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9-]*", des):
        rep.err(f"{w}designation", "letters, digits and hyphens only")
    if isinstance(des, str) and isinstance(name, str):
        if d.get("full_name") != f"{des} {name}":
            rep.err(f"{w}full_name", f"must be '{des} {name}'")
        if d.get("id") != slug(f"{des}-{name}"):
            rep.err(f"{w}id", f"must be '{slug(des + '-' + name)}'")
    arch = d.get("archetype")
    if isinstance(arch, str):
        if arch != slug(arch):
            rep.err(f"{w}archetype", "must be a lowercase-hyphen slug")
        elif arch not in ARCHETYPES:
            rep.warn(f"{w}archetype", f"'{arch}' is not in the recommended list")
    tags = d.get("tags") or []
    for t in tags:
        if isinstance(t, str) and t not in ALL_TAGS and not t.startswith("x-"):
            rep.err(f"{w}tags", f"unknown tag '{t}' (custom tags must start with x-)")
    if not set(tags) & set(TAG_GROUPS["damage_form"]):
        rep.err(f"{w}tags", "needs at least one damage-form tag")
    if not set(tags) & set(TAG_GROUPS["era"]):
        rep.err(f"{w}tags", "needs at least one era tag")
    if isinstance(d.get("summary"), str) and len(d["summary"]) > 160:
        rep.warn(f"{w}summary", f"{len(d['summary'])} characters (aim for 160 or fewer)")
    modes = resolved_modes(d)
    gun = False
    for i, m in enumerate(modes):
        if not isinstance(m, dict):
            continue
        mw = f"{w}fire_modes[{i}] ({m.get('name')})"
        p = m.get("payload") or {}
        trig = m.get("trigger")
        if trig == "burst":
            for k in ("burst_count", "burst_repeats_on_hold", "burst_rpm", "burst_cooldown_s"):
                if k not in m:
                    rep.err(mw, f"burst mode needs '{k}'")
        if trig == "charge" and "max_charge_s" not in m:
            rep.err(mw, "charge mode needs 'max_charge_s'")
        if m.get("cock_after_shot") and "cock_s" not in m:
            rep.warn(mw, "cock_after_shot without cock_s")
        ptype = p.get("type")
        if ptype in GUN_PAYLOADS:
            gun = True
            if "recoil" not in m:
                rep.err(mw, "ranged fire mode needs 'recoil' {impulse_ns, kick_factor, kick_deg}")
            if ptype == "pellets" and "pellets" not in p:
                rep.err(mw, "pellets payload needs 'pellets'")
        if ptype not in (None, "none") and "damage" in p and "damage_type" not in p:
            rep.warn(mw, "damaging payload without damage_type")
        rc = m.get("recoil")
        phys = d.get("physical") or {}
        if isinstance(rc, dict) and all(is_num(rc.get(k)) for k in ("impulse_ns", "kick_factor", "kick_deg")) \
                and is_num(phys.get("mass_kg")) and phys.get("hold") in recoil_model.HOLD_GRIP_KG:
            hold = phys["hold"]
            expect = recoil_model.kick_deg(rc["impulse_ns"], rc["kick_factor"], phys["mass_kg"], hold)
            if rc["kick_deg"] and abs(expect - rc["kick_deg"]) / max(abs(rc["kick_deg"]), 1e-9) > 0.05:
                rep.warn(f"{mw}.recoil", f"kick_deg {rc['kick_deg']} but impulse, kick_factor, mass and hold give {expect:.3g}")
    handling = d.get("handling") or {}
    aimable = handling.get("aimable", True) and d.get("carry_class") not in ("throwable", "placeable")
    if aimable:
        for k in ("ads_time_s", "ads_move_speed_mult", "ads_run_instability", "zoom"):
            if k not in handling:
                rep.err(f"{w}handling", f"aimable weapon needs '{k}' (or set aimable: false)")
        if "aim" not in d:
            rep.err(w + "aim", "aimable weapon needs an 'aim' block (or set handling.aimable: false)")
    if gun:
        if "recoil" not in d:
            rep.err(w + "recoil", "weapon with ranged fire modes needs a 'recoil' block")
        dur = d.get("durability") or {}
        for k in ("wear_per_shot", "jam", "unjam"):
            if k not in dur:
                rep.err(w + "durability", f"gun needs '{k}'")
    if d.get("carry_class") not in ("throwable", "placeable") and "durability" not in d:
        rep.err(w + "durability", "missing (required except for throwables and placeables)")
    melee_main = any(isinstance(m, dict) and (m.get("payload") or {}).get("type") == "melee" for m in modes)
    if melee_main and "wear_per_hit" not in (d.get("durability") or {}):
        rep.err(w + "durability", "melee weapon needs 'wear_per_hit'")
    ammo = d.get("ammo") or {}
    if ammo.get("feed") not in (None, "none") and "magazine" not in ammo:
        rep.err(w + "ammo", "needs 'magazine'")
    if ammo.get("feed") not in (None, "none", "stack", "charge") and "reload_s" not in ammo:
        rep.err(w + "ammo", "needs 'reload_s'")
    pools = {p.get("name") for p in ammo.get("extra_pools") or [] if isinstance(p, dict)} | {"main"}
    for key in ("secondary", "weapon_function"):
        f = d.get(key)
        if not isinstance(f, dict):
            continue
        if f.get("kind") == "attack" and "payload" not in f:
            rep.err(f"{w}{key}", "attack function needs a 'payload'")
        if f.get("kind") == "alias" and f.get("alias_of") not in ("primary", "secondary", "weapon_function", "melee", "reload", "cock", "ads"):
            rep.err(f"{w}{key}", "alias needs alias_of: primary | secondary | weapon_function | melee | reload | cock | ads")
        if f.get("ammo_pool") and f["ammo_pool"] not in pools:
            rep.err(f"{w}{key}.ammo_pool", f"'{f['ammo_pool']}' is not 'main' or an ammo.extra_pools name")
        if (f.get("payload") or {}).get("type") in GUN_PAYLOADS and "recoil" not in f:
            rep.err(f"{w}{key}", "ranged attack needs 'recoil'")
        for path in (f.get("modifiers") or {}):
            if get_path(d, path) is MISSING:
                rep.err(f"{w}{key}.modifiers", f"'{path}' doesn't exist in this weapon")
    if d.get("carry_class") in ("sidearm", "primary", "heavy", "light-melee", "heavy-melee") and "melee" not in d:
        rep.warn(w + "melee", "no Melee-key attack defined (every held weapon can usually strike)")
    da = d.get("dual_wield") or {}
    if da.get("allowed") and "dual-wieldable" not in tags:
        rep.warn(w + "tags", "dual_wield.allowed but no 'dual-wieldable' tag")


# ---------- patches ----------
MISSING = object()
TOKEN = re.compile(r"([^.\[\]]+)|\[([^\]]+)\]")


def parse_path(path):
    toks = []
    for m in TOKEN.finditer(path):
        toks.append(("key", m.group(1)) if m.group(1) is not None else ("name", m.group(2)))
    return toks


def get_path(d, path):
    cur = d
    for kind, tok in parse_path(path):
        if kind == "key":
            if not isinstance(cur, dict) or tok not in cur:
                return MISSING
            cur = cur[tok]
        else:
            if not isinstance(cur, list):
                return MISSING
            hit = [x for x in cur if isinstance(x, dict) and x.get("name") == tok]
            if not hit:
                return MISSING
            cur = hit[0]
    return cur


def apply_patch(base, changes, rep, where):
    d = copy.deepcopy(base)
    for path, value in changes.items():
        toks = parse_path(str(path))
        if not toks:
            rep.err(where, f"bad path '{path}'")
            continue
        cur = d
        ok = True
        for i, (kind, tok) in enumerate(toks):
            last = i == len(toks) - 1
            if kind == "key":
                if not isinstance(cur, dict):
                    ok = False
                    break
                if last:
                    if value is None:
                        cur.pop(tok, None)
                    elif isinstance(value, dict) and isinstance(cur.get(tok), dict):
                        deep_merge(cur[tok], value)
                    else:
                        cur[tok] = copy.deepcopy(value)
                else:
                    if tok not in cur:
                        nxt_kind = toks[i + 1][0]
                        if nxt_kind == "name":
                            ok = False
                            break
                        cur[tok] = {}
                    cur = cur[tok]
            else:
                if not isinstance(cur, list):
                    ok = False
                    break
                idx = [j for j, x in enumerate(cur) if isinstance(x, dict) and x.get("name") == tok]
                if last:
                    if value is None:
                        if idx:
                            cur.pop(idx[0])
                        else:
                            ok = False
                    elif idx:
                        if isinstance(value, dict):
                            deep_merge(cur[idx[0]], value)
                        else:
                            ok = False
                    else:
                        if isinstance(value, dict):
                            item = {"name": tok}
                            item.update(copy.deepcopy(value))
                            cur.append(item)
                        else:
                            ok = False
                else:
                    if not idx:
                        ok = False
                        break
                    cur = cur[idx[0]]
        if not ok:
            rep.err(where, f"patch path '{path}' doesn't resolve")
    return d


# ---------- prose ----------
def prose_checks(body, d, rep, has_variants):
    lines = body.splitlines()
    h1 = [l for l in lines if l.startswith("# ")]
    if not h1 or h1[0][2:].strip() != d.get("full_name"):
        rep.err("prose", f"first heading must be '# {d.get('full_name')}'")
    sections = [l[3:].strip() for l in lines if l.startswith("## ")]
    need = REQUIRED_SECTIONS + (["Variants"] if has_variants else [])
    for s in need:
        if s not in sections:
            rep.err("prose", f"missing section '## {s}'")
    if "Controls" in sections:
        i = lines.index(next(l for l in lines if l.startswith("## ") and l[3:].strip() == "Controls"))
        rows = []
        for l in lines[i + 1:]:
            if l.startswith("## "):
                break
            if l.startswith("|"):
                cells = [c.strip() for c in l.strip().strip("|").split("|")]
                if cells and not set(cells[0]) <= set("-: ") and cells[0] != "Key":
                    rows.append(cells)
        keys = [r[0] for r in rows]
        if keys != CONTROL_KEYS:
            rep.err("prose", f"Controls table must list exactly {', '.join(CONTROL_KEYS)} in that order (found: {', '.join(keys) or 'none'})")
        for r in rows:
            if len(r) < 3:
                rep.err("prose", f"Controls row '{r[0]}' needs Key | Action | Notes")


def load_blocklist(path):
    if not path or not os.path.exists(path):
        return []
    words = []
    with open(path, encoding="utf-8") as fh:
        for line in fh:
            line = line.split("#", 1)[0].strip()
            if line:
                words.append(line)
    return words


# ---------- entry point ----------
def split_front_matter(text):
    text = text.lstrip("﻿")
    if not text.startswith("---"):
        return None, text
    parts = re.split(r"^---[ \t]*$", text, maxsplit=2, flags=re.M)
    if len(parts) < 3:
        return None, text
    return parts[1], parts[2]


def validate_file(path, blocklist=()):
    rep = Report()
    with open(path, encoding="utf-8") as fh:
        text = fh.read()
    fm, body = split_front_matter(text)
    if fm is None:
        rep.err("", "no YAML front matter (--- block at the top)")
        return rep, None
    try:
        d = yaml.safe_load(fm)
    except yaml.YAMLError as e:
        rep.err("yaml", str(e).replace("\n", " "))
        return rep, None
    if not isinstance(d, dict):
        rep.err("yaml", "front matter must be a mapping")
        return rep, None
    check(with_resolved_modes(d), WEAPON, "", rep)
    semantic_checks(d, rep)
    if all(isinstance(d.get(k), str) for k in ("carry_class", "archetype", "designation", "name")):
        expect = f"{d['carry_class']}_{slug(d['archetype'])}_{slug(d['designation'])}-{slug(d['name'])}.md"
        if os.path.basename(path) != expect:
            rep.err("filename", f"must be '{expect}'")
    variants = d.get("variants") or []
    for i, v in enumerate(variants):
        if not isinstance(v, dict):
            continue
        vw = f"variants[{i}] ({v.get('designation')} {v.get('name')})"
        bd, bn = d.get("designation", ""), d.get("name", "")
        if isinstance(v.get("designation"), str) and not re.fullmatch(re.escape(str(bd)) + r"([a-z]|-[A-Za-z0-9]+)", v["designation"]):
            rep.err(vw, f"designation must be '{bd}' + a lowercase letter or a -suffix (e.g. {bd}b, {bd}-S)")
        if isinstance(v.get("name"), str) and not (v["name"].startswith(str(bn) + " ") and len(v["name"]) > len(str(bn)) + 1):
            rep.err(vw, f"name must start with '{bn} ' and add at least one word")
        if isinstance(v.get("changes"), dict):
            merged = apply_patch({k: x for k, x in d.items() if k != "variants"}, v["changes"], rep, vw)
            merged["designation"], merged["name"] = v.get("designation"), v.get("name")
            merged["full_name"] = f"{v.get('designation')} {v.get('name')}"
            merged["id"] = slug(f"{v.get('designation')}-{v.get('name')}")
            merged["summary"] = v.get("summary", merged.get("summary"))
            tags = [t for t in merged.get("tags", []) if t not in (v.get("tags_remove") or [])] + list(v.get("tags_add") or [])
            merged["tags"] = tags
            sub = Report()
            check(with_resolved_modes(merged), WEAPON, "", sub)
            semantic_checks(merged, sub)
            base_msgs = set(rep.errors) | set(rep.warnings)
            rep.errors += [f"{vw} -> {e}" for e in sub.errors if e not in base_msgs]
            rep.warnings += [f"{vw} -> {e}" for e in sub.warnings if e not in base_msgs]
    prose_checks(body, d, rep, bool(variants))
    if blocklist:
        low = text.lower()
        for word in blocklist:
            if re.search(r"(?<![a-z0-9])" + re.escape(word.lower()) + r"(?![a-z0-9])", low):
                rep.warn("names", f"blocklisted source-material word found: '{word}'")
    return rep, d


def collect(paths):
    files = []
    for p in paths:
        if os.path.isdir(p):
            files += sorted(os.path.join(p, f) for f in os.listdir(p) if f.endswith(".md"))
        else:
            files.append(p)
    return files


def main(argv):
    as_json = "--json" in argv
    argv = [a for a in argv if a != "--json"]
    blk = None
    if "--blocklist" in argv:
        i = argv.index("--blocklist")
        blk = argv[i + 1]
        argv = argv[:i] + argv[i + 2:]
    here = os.path.dirname(os.path.abspath(__file__))
    root = os.path.normpath(os.path.join(here, "..", ".."))
    if blk is None:
        blk = os.path.join(root, "provenance", "name-blocklist.txt")
    blocklist = load_blocklist(blk)
    files = collect(argv or [os.path.join(root, "kit", "weapons")])
    results, ids, n_err = [], {}, 0
    for f in files:
        rep, d = validate_file(f, blocklist)
        if d and d.get("id"):
            if d["id"] in ids:
                rep.err("id", f"duplicate id, also used by {ids[d['id']]}")
            ids[d["id"]] = os.path.basename(f)
            for v in d.get("variants") or []:
                if isinstance(v, dict):
                    vid = slug(f"{v.get('designation')}-{v.get('name')}")
                    if vid in ids:
                        rep.err("id", f"variant id '{vid}' collides with {ids[vid]}")
                    ids[vid] = os.path.basename(f)
        n_err += len(rep.errors)
        results.append({"file": f, "errors": rep.errors, "warnings": rep.warnings})
    if as_json:
        print(json.dumps(results, indent=1))
    else:
        for r in results:
            status = "OK" if not r["errors"] else "FAIL"
            print(f"{status:4} {os.path.relpath(r['file'], root)}  ({len(r['errors'])} errors, {len(r['warnings'])} warnings)")
            for e in r["errors"]:
                print(f"     error:   {e}")
            for wmsg in r["warnings"]:
                print(f"     warning: {wmsg}")
        print(f"{len(results)} file(s), {n_err} error(s){'' if blocklist else ' (no name blocklist loaded)'}")
    return 1 if n_err else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
