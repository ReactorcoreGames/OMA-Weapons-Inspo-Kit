"""Compare two BW rulesets (default pro vs classic) across all registered weapons.

Uses each weapon's first layout and first primary fire mode. Writes a CSV of per-weapon values
and prints aggregate ratios. Pro's global GameStyle RecoilScale (0.7) is applied to pro recoil
so the comparison reflects what the player actually feels.

Usage: python compare_styles.py <bw_weapon_params.json> <out.csv> [styleA] [styleB]
"""
import csv
import json
import statistics
import sys

GLOBAL_RECOIL_SCALE = {"pro": 0.7, "classic": 1.0, "realism": 1.0, "tactical": 1.0}
ROT_TO_DEG = 360.0 / 65536.0


def g(d, *path, default=None):
    for p in path:
        if isinstance(d, list):
            d = d[p] if isinstance(p, int) and p < len(d) else None
        elif isinstance(d, dict):
            d = d.get(p)
        else:
            return default
        if d is None:
            return default
    return d


def metrics(style_key, style):
    L = g(style, "layouts", 0) or {}
    fire = g(L, "FireParams", 0) or {}
    eff = g(fire, "FireEffectParams", 0) or {}
    aim = g(L, "AimParams", 0) or {}
    rec = g(L, "RecoilParams", 0) or {}
    interval = fire.get("FireInterval") or 0
    dmg = eff.get("Damage") or 0
    traces = eff.get("TraceCount") or 1
    spread = aim.get("AimSpread") or {}
    m = {
        "layout": L.get("LayoutName"),
        "mag": L.get("MagAmmo"),
        "rpm": round(60 / interval) if interval else None,
        "damage": dmg * traces,
        "dps": round(dmg * traces / interval, 1) if interval else None,
        "head_mult": eff.get("HeadMult"),
        "recoil": round((eff.get("Recoil") or 0) * GLOBAL_RECOIL_SCALE.get(style_key, 1), 1),
        "max_recoil": rec.get("MaxRecoil"),
        "recoil_decline_s": rec.get("DeclineTime"),
        "hip_spread_deg": round(spread["Max"] * ROT_TO_DEG, 2) if isinstance(spread, dict) and spread.get("Max") else None,
        "min_spread_deg": round(spread["Min"] * ROT_TO_DEG, 2) if isinstance(spread, dict) and spread.get("Min") is not None else None,
        "ads_mult": aim.get("ADSMultiplier"),
        "sprint_chaos": aim.get("SprintChaos"),
        "jump_chaos": aim.get("JumpChaos"),
        "chaos_speed_threshold": aim.get("ChaosSpeedThreshold"),
        "move_speed": L.get("PlayerSpeedFactor"),
        "sight_time": L.get("SightingTime"),
    }
    return m


def main(path, out_csv, a="pro", b="classic"):
    weapons = json.load(open(path, encoding="utf-8"))
    rows = []
    for cls, w in sorted(weapons.items()):
        if not w["registered"] or a not in w["styles"] or b not in w["styles"]:
            continue
        ma, mb = metrics(a, w["styles"][a]), metrics(b, w["styles"][b])
        row = {"class": cls, "name": w["fallback_name"], "group": g(w, "weapon", "InventoryGroup")}
        for k in ma:
            row[f"{k}_{a}"] = ma[k]
            row[f"{k}_{b}"] = mb[k]
        rows.append(row)
    with open(out_csv, "w", newline="", encoding="utf-8") as fh:
        wr = csv.DictWriter(fh, fieldnames=list(rows[0]))
        wr.writeheader()
        wr.writerows(rows)

    print(f"{len(rows)} weapons with both {a} and {b}\n")
    print(f"{'metric':24} {'median '+a+'/'+b:>16} {a+' higher':>10} {b+' higher':>12} {'equal':>6}")
    for k in ["mag", "rpm", "damage", "dps", "head_mult", "recoil", "max_recoil", "recoil_decline_s",
              "hip_spread_deg", "min_spread_deg", "ads_mult", "sprint_chaos", "jump_chaos",
              "chaos_speed_threshold", "move_speed", "sight_time"]:
        ratios, hi_a, hi_b, eq = [], 0, 0, 0
        for r in rows:
            va, vb = r[f"{k}_{a}"], r[f"{k}_{b}"]
            if not isinstance(va, (int, float)) or not isinstance(vb, (int, float)):
                continue
            if va == vb:
                eq += 1
            elif va > vb:
                hi_a += 1
            else:
                hi_b += 1
            if vb:
                ratios.append(va / vb)
        med = f"{statistics.median(ratios):.2f}" if ratios else "-"
        print(f"{k:24} {med:>16} {hi_a:>10} {hi_b:>12} {eq:>6}")


if __name__ == "__main__":
    main(*sys.argv[1:])
