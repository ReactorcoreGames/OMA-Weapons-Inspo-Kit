"""Extract every BW weapon's stats from the v2 decompile into one structured JSON dataset.

Walks weapon class -> ParamsClasses[i] (0=pro, 1=classic, 2=realism, 3=tactical) -> Layouts ->
WeaponParams -> Recoil/Aim/Fire/AltFire params -> FireEffectParams, resolving params-class
inheritance and BCoreProV55 base-class defaults so every value is the effective one.

Raw BW units are kept as-is (Unreal units, rotation units, 100 HP scale). Normalization into
kit units happens in a later step; this file is provenance data.

Usage: python extract_params.py <scripts_v2_root> <config_localization_dir> <out.json>
"""
import json
import os
import re
import sys

STYLES = ["pro", "classic", "realism", "tactical"]
CLASS_RE = re.compile(r"^class\s+(\w+)\s+extends\s+([\w.]+)", re.M)
OBJ_BEGIN_RE = re.compile(r'^\s*begin object name="?(\w+)"?\s+class=([\w.]+)', re.I)
PROP_RE = re.compile(r"^\s*(\w+)(?:\[(\d+)\])?=(.*)$")
REF_RE = re.compile(r"^(\w+)'([\w.]+)'$")
# Weapon-level defaults worth keeping (gameplay-relevant, not cosmetic)
WEAPON_KEYS = {
    "ItemName", "Description", "InventoryGroup", "Priority", "bWT_Bullet", "bWT_Shotgun", "bWT_Hazardous",
    "bWT_Splash", "bWT_Sidearm", "bWT_Machinegun", "bWT_Energy", "bWT_Projectile", "bWT_Heal",
    "bWT_Super", "bWT_RapidProj", "bWT_Trap", "bWT_Grenade", "bMeleeWeapon", "bNoMag", "bNonCocking",
    "bCockOnEmpty", "bShowChargingBar", "bUseSights", "ZoomType", "MeleeFireClass", "FireModeClass",
    "SpecialInfo", "WeaponModes", "CurrentWeaponMode", "CockingBringUpTime", "PutDownTime",
    "BringUpTime", "bNoCrosshairInScope", "AIRating", "ManualLines", "PickupClass",
}


# ---------- value parsing ----------
def split_top(s, sep=","):
    out, depth, cur, q = [], 0, [], False
    for ch in s:
        if ch == '"':
            q = not q
        if not q:
            if ch == "(":
                depth += 1
            elif ch == ")":
                depth -= 1
            elif ch == sep and depth == 0:
                out.append("".join(cur))
                cur = []
                continue
        cur.append(ch)
    if cur:
        out.append("".join(cur))
    return out


def parse_value(v):
    v = v.strip()
    if v.startswith('"') and v.endswith('"'):
        return v[1:-1]
    if v in ("true", "false"):
        return v == "true"
    if v == "none":
        return None
    if v.startswith("(") and v.endswith(")"):
        inner = v[1:-1]
        parts = split_top(inner)
        if all("=" in p.split("(")[0] for p in parts if p.strip()):
            d = {}
            for p in parts:
                if not p.strip():
                    continue
                k, _, val = p.partition("=")
                k = k.strip()
                pv = parse_value(val)
                if k in d:  # repeated key in decompiled struct output: keep as list
                    d[k] = d[k] if isinstance(d[k], list) else [d[k]]
                    d[k].append(pv)
                else:
                    d[k] = pv
            return d
        return [parse_value(p) for p in parts]
    try:
        return int(v)
    except ValueError:
        pass
    try:
        return float(v)
    except ValueError:
        return v


def set_prop(props, key, idx, val):
    if idx is None:
        props[key] = val
    else:
        arr = props.setdefault(key, {})
        if not isinstance(arr, dict):
            arr = props[key] = {}
        arr[int(idx)] = val


# ---------- file parsing ----------
def parse_uc(text):
    """Return (class_name, parent, defaultprops dict, objects dict name->{'class','props'})."""
    m = CLASS_RE.search(text)
    if not m:
        return None
    cls, parent = m.group(1), m.group(2).split(".")[-1]
    defaults, objects = {}, {}
    in_defaults, obj_stack = False, []
    for line in text.splitlines():
        s = line.strip()
        if s.startswith("defaultproperties"):
            in_defaults = True
            continue
        bm = OBJ_BEGIN_RE.match(line)
        if bm:
            obj_stack.append(bm.group(1))
            objects.setdefault(bm.group(1), {"class": bm.group(2).split(".")[-1], "props": {}})
            continue
        if s.lower() == "end object":
            if obj_stack:
                obj_stack.pop()
            continue
        if in_defaults and s == "}" and not obj_stack:
            in_defaults = False
            continue
        pm = PROP_RE.match(line)
        if not pm or s.startswith("//"):
            continue
        key, idx, val = pm.group(1), pm.group(2), parse_value(pm.group(3))
        if obj_stack:
            set_prop(objects[obj_stack[-1]]["props"], key, idx, val)
        elif in_defaults:
            set_prop(defaults, key, idx, val)
    return cls, parent, defaults, objects


def load_all(root):
    classes = {}
    for pkg in sorted(os.listdir(root)):
        cdir = os.path.join(root, pkg, "Classes")
        if not os.path.isdir(cdir):
            continue
        for f in os.listdir(cdir):
            if not f.endswith(".uc"):
                continue
            with open(os.path.join(cdir, f), encoding="utf-8", errors="replace") as fh:
                r = parse_uc(fh.read())
            if r:
                cls, parent, defaults, objects = r
                classes[cls] = {"package": pkg, "parent": parent, "defaults": defaults, "objects": objects}
    return classes


# ---------- resolution ----------
def chain(classes, cls):
    out = []
    while cls in classes and cls not in out:
        out.append(cls)
        cls = classes[cls]["parent"]
    return out  # most-derived first


def merged_defaults(classes, cls):
    d = {}
    for c in reversed(chain(classes, cls)):
        for k, v in classes[c]["defaults"].items():
            if isinstance(v, dict) and isinstance(d.get(k), dict) and all(isinstance(i, int) for i in v):
                d[k] = {**d[k], **v}
            else:
                d[k] = v
    return d


def merged_objects(classes, cls):
    objs = {}
    for c in reversed(chain(classes, cls)):
        objs.update(classes[c]["objects"])
    return objs


def resolve(value, objs, classes, depth=0):
    if depth > 8:
        return value
    if isinstance(value, str):
        m = REF_RE.match(value)
        parts = m.group(2).split(".") if m else [value]
        name = parts[-1]
        o = None
        # A full path (Pkg.OuterClass.Name) may point into another params class: BW copy-pastes
        # references between weapons, so an object owned by a different class is legitimate.
        if len(parts) >= 3 and parts[-2] in classes and name in classes[parts[-2]]["objects"]:
            o = classes[parts[-2]]["objects"][name]
        elif name in objs:
            o = objs[name]
        if o is not None:
            props = merged_defaults(classes, o["class"])
            props.update(o["props"])
            out = {"_object": name, "_class": o["class"]}
            out.update({k: resolve(v, objs, classes, depth + 1) for k, v in props.items()})
            return out
        return value
    if isinstance(value, dict):
        if value and all(isinstance(k, int) for k in value):
            return [resolve(value[k], objs, classes, depth + 1) for k in sorted(value)]
        return {k: resolve(v, objs, classes, depth + 1) for k, v in value.items()}
    if isinstance(value, list):
        return [resolve(v, objs, classes, depth + 1) for v in value]
    return value


def class_ref_name(v):
    m = REF_RE.match(v) if isinstance(v, str) else None
    return m.group(2).split(".")[-1] if m else None


def registered_weapons(cfg_dir):
    reg = {}
    for f in os.listdir(cfg_dir):
        if f.endswith(".ucl"):
            with open(os.path.join(cfg_dir, f), encoding="utf-8", errors="replace") as fh:
                for line in fh:
                    m = re.match(r"Weapon=\(ClassName=([\w.]+).*?FallbackName=\"([^\"]*)\"", line)
                    if m:
                        reg[m.group(1).split(".")[-1]] = m.group(2)
    return reg


def main(root, cfg_dir, out_path):
    classes = load_all(root)
    reg = registered_weapons(cfg_dir)
    weapons = {}
    for cls in sorted(classes):
        d = merged_defaults(classes, cls)
        pcs = d.get("ParamsClasses")
        if not isinstance(pcs, dict) or not pcs:
            continue
        entry = {
            "class": cls,
            "package": classes[cls]["package"],
            "parent": classes[cls]["parent"],
            "registered": cls in reg,
            "fallback_name": reg.get(cls),
            "weapon": {k: v for k, v in d.items() if k in WEAPON_KEYS},
            "styles": {},
        }
        for i, ref in sorted(pcs.items()):
            pc = class_ref_name(ref)
            if not pc or pc not in classes:
                continue
            objs = merged_objects(classes, pc)
            pdef = merged_defaults(classes, pc)
            layouts = resolve(pdef.get("Layouts", {}), objs, classes)
            style = STYLES[i] if i < len(STYLES) else f"style{i}"
            entry["styles"][style] = {"params_class": pc, "layouts": layouts}
        weapons[cls] = entry
    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as fh:
        json.dump(weapons, fh, indent=1, ensure_ascii=False)
    print(f"{len(weapons)} weapon classes ({sum(w['registered'] for w in weapons.values())} registered) -> {out_path}")
    missing = sorted(set(reg) - set(weapons))
    if missing:
        print("registered but no params found:", ", ".join(missing))


if __name__ == "__main__":
    main(*sys.argv[1:4])
