"""OMA recoil and knockback model: one impulse unit (N*s) for kick, shooter push and target knockback.

Shared by the calibration report (run this file) and the validator (import it). The derivation and
reference tables are in docs/research/impulse-calibration.md; the player-facing rules are in
kit/core-mechanics/recoil.md.

  kick_deg  = CLIMB_GAIN * kick_factor * impulse_ns / (weapon_mass_kg + hold_grip_kg * bracing)
  push_mps  = max(0, impulse_ns - absorb(body + weapon)) / (body_mass_kg + weapon_mass_kg)
  knockback = max(0, hit_impulse_ns - absorb(target)) / target_mass_kg
  absorb(M) = stance coefficient (N*s/kg) * M * (gravity / 9.81) * footing + anchoring

Usage:
  python tools/kit/recoil_model.py <bw_kit_units.json> <out.md>               calibration table
  python tools/kit/recoil_model.py solve <bw_kick_deg> <impulse_ns> <mass_kg> <hold>   kick_factor for an entry
"""
import json
import statistics
import sys

# deg of muzzle climb per m/s of rearward velocity given to the gun + hands system.
# Calibrated so an unmitigated two-handed handgun (kick_factor 1.0) matches BW's M806 class of kick.
CLIMB_GAIN = 12.0

# Effective mass (kg) the wielder's hold couples to the weapon, for a default human (trained merc).
HOLD_GRIP_KG = {
    "one_hand": 1.5,        # pistol at arm's length, dual-wielding, one-handed launcher
    "two_hand": 4.0,        # handgun / machine pistol / PDW held in both hands, no stock
    "shouldered": 25.0,     # stocked long gun against the shoulder
    "hip_braced": 40.0,     # heavy weapon held at the hip / under the arm with a sling or harness
    "melee": 0.0,           # no firing recoil
}

# Multiplier on hold_grip_kg (stance and support). Weapon-specific crouch / hip multipliers from BW
# are applied separately as weapon handling, so "standing" and "crouched" are both 1.0 here.
BRACING = {
    "standing": 1.0,
    "crouched": 1.0,
    "prone": 2.5,
    "rested": 2.0,          # weapon laid on cover / sandbags
    "bipod": 4.0,
    "power_armour": 4.0,    # servo-assisted grip
    "mounted": None,        # use the mount's mass instead of hold grip (vehicle, tripod, turret)
}

# Impulse a stance soaks per shot without moving the body, per kg of total mass (body + weapon, or
# vehicle + weapon), at 1 g on good footing (N*s per kg). Scales with gravity and footing; 0 in zero-g
# unless anchored. A 100 kg merc standing soaks ~60 N*s: no handheld small arm moves them.
STANCE_ABSORB_NS_PER_KG = {"standing": 0.6, "crouched": 0.9, "prone": 1.5, "braced_vehicle": 0.6, "airborne": 0.0}
DEFAULT_BODY_MASS_KG = 100.0   # trained merc in body armour with kit (UT pawn mass 100)
EARTH_G = 9.81

# Default mass estimate from BW bulk (InventorySize) when a weapon entry has no better figure.
BULK_MASS_KG = {1: 0.4, 2: 0.8, 3: 1.2, 4: 1.8, 5: 2.4, 6: 3.2, 7: 3.8, 8: 4.6, 9: 7.5, 10: 10.0,
                11: 14.0, 12: 16.0, 13: 18.0, 14: 20.0, 15: 23.0, 16: 26.0}


def hold_grip(hold, bracing="standing", mount_mass_kg=None):
    if bracing == "mounted":
        if mount_mass_kg is None:
            raise ValueError("mounted bracing needs mount_mass_kg")
        return mount_mass_kg
    return HOLD_GRIP_KG[hold] * BRACING[bracing]


def kick_deg(impulse_ns, kick_factor, weapon_mass_kg, hold, bracing="standing", grip_mult=1.0, mount_mass_kg=None):
    """Muzzle climb per shot (deg) before BW-style stance multipliers (hip / crouch / moving).
    grip_mult scales the wielder's grip (1.0 = default merc; a child 0.4, power armour see BRACING)."""
    return CLIMB_GAIN * kick_factor * impulse_ns / (weapon_mass_kg + hold_grip(hold, bracing, mount_mass_kg) * grip_mult)


def solve_kick_factor(target_kick_deg, impulse_ns, weapon_mass_kg, hold):
    """kick_factor that makes a default merc feel exactly target_kick_deg (the BW calibration)."""
    if not impulse_ns:
        return None
    return target_kick_deg * (weapon_mass_kg + HOLD_GRIP_KG[hold]) / (CLIMB_GAIN * impulse_ns)


def stance_absorb(total_mass_kg, stance="standing", gravity_mps2=EARTH_G, footing=1.0, anchored_ns=0.0):
    """Impulse soaked per shot (N*s). footing: 1 good ground, 0.5 ice / mud, 0 floating.
    anchored_ns: mag boots, harness, wall grab, spikes (independent of gravity)."""
    return STANCE_ABSORB_NS_PER_KG[stance] * total_mass_kg * (gravity_mps2 / EARTH_G) * footing + anchored_ns


def shooter_push_mps(impulse_ns, weapon_mass_kg, stance="standing", gravity_mps2=EARTH_G, footing=1.0,
                     body_mass_kg=DEFAULT_BODY_MASS_KG, anchored_ns=0.0):
    """Velocity the shot gives the shooter (backwards along the aim)."""
    total = body_mass_kg + weapon_mass_kg
    excess = max(0.0, impulse_ns - stance_absorb(total, stance, gravity_mps2, footing, anchored_ns))
    return excess / total


def knockback_mps(hit_impulse_ns, target_mass_kg, stance="standing", gravity_mps2=EARTH_G, footing=1.0, anchored_ns=0.0):
    """Velocity a hit gives the target (along the hit direction)."""
    excess = max(0.0, hit_impulse_ns - stance_absorb(target_mass_kg, stance, gravity_mps2, footing, anchored_ns))
    return excess / target_mass_kg


# ---------- calibration report ----------
# Real-world ballpark impulse per BW inventory group, used ONLY to show where BW's kick sits relative
# to physics. Weapon entries pick their own impulse from the reference table in the research doc.
GROUP_IMPULSE_NS = {2: 4.0, 3: 3.0, 4: 6.0, 5: 3.0, 6: 7.0, 7: 15.0, 8: 6.0, 9: 15.0}
GROUP_NAME = {2: "pistols", 3: "SMG / machine pistols", 4: "assault rifles", 5: "energy", 6: "machine guns",
              7: "shotguns", 8: "launchers", 9: "snipers / marksman"}


def default_hold(w, layout):
    if w["weapon"].get("melee_weapon"):
        return "melee"
    if w["weapon"].get("dual_wieldable"):
        return "two_hand"
    if (layout.get("bulk") or 0) >= 11 and (layout.get("move_speed_mult") or 1.0) <= 0.85:
        return "hip_braced"
    return "shouldered"


def report(kit_units_path, out_md):
    data = json.load(open(kit_units_path, encoding="utf-8"))["weapons"]
    rows = []
    for cls, w in sorted(data.items()):
        if not w["registered"] or not w["layouts"]:
            continue
        L = w["layouts"][0]
        grp = w["weapon"].get("inventory_group")
        if grp not in GROUP_IMPULSE_NS or not L.get("modes"):
            continue
        p = L["modes"][0].get("primary") or {}
        e = (p.get("effects") or [{}])[0]
        kick = e.get("recoil_kick_deg")
        if not kick or e.get("payload") in ("function", "melee"):
            continue
        hold = default_hold(w, L)
        mass = BULK_MASS_KG.get(L.get("bulk"), 4.0)
        J = GROUP_IMPULSE_NS[grp]
        if grp == 9 and (e.get("damage") or 0) >= 140:
            J = 45.0
        kf = solve_kick_factor(kick, J, mass, hold)
        rows.append({"class": cls, "name": w["bw_name"], "group": grp, "hold": hold, "mass": mass, "J": J, "kick": kick,
                     "rpm": p.get("rpm"), "kf": kf})
    lines = ["# Impulse calibration table (generated)", "",
             "Generated by `tools/kit/recoil_model.py` from `bw_kit_units.json`. Default layout, first fire mode, registered BW weapons. "
             f"CLIMB_GAIN = {CLIMB_GAIN} deg per m/s; hold grip (kg) = {HOLD_GRIP_KG}. Mass is the bulk-based default estimate and impulse is the "
             "real-world ballpark for the weapon's BW group, so `kick_factor` here shows how far BW's tuned kick sits from unmitigated physics. "
             "Weapon entries recompute it with their own mass and impulse.", "",
             "## Summary per group", "", "| Group | n | median kick (deg) | median kick_factor | min | max |", "|---|---|---|---|---|---|"]
    for g in sorted(GROUP_NAME):
        rs = [r for r in rows if r["group"] == g]
        if not rs:
            continue
        kfs = [r["kf"] for r in rs]
        lines.append(f"| {GROUP_NAME[g]} | {len(rs)} | {statistics.median(r['kick'] for r in rs):.2f} | {statistics.median(kfs):.2f} | {min(kfs):.2f} | {max(kfs):.2f} |")
    lines += ["", "## Per weapon", "", "| BW class | Group | Hold | Mass kg | Impulse N·s | BW kick deg | RPM | kick_factor |", "|---|---|---|---|---|---|---|---|"]
    for r in sorted(rows, key=lambda r: (r["group"], r["kf"])):
        lines.append(f"| {r['class']} | {GROUP_NAME[r['group']]} | {r['hold']} | {r['mass']} | {r['J']} | {r['kick']:.2f} | {r['rpm']} | {r['kf']:.2f} |")
    with open(out_md, "w", encoding="utf-8") as fh:
        fh.write("\n".join(lines) + "\n")
    print(f"{len(rows)} weapons -> {out_md}")


def cli_solve(args):
    """python recoil_model.py solve <bw_kick_deg> <impulse_ns> <mass_kg> <hold>"""
    kick, J, mass, hold = float(args[0]), float(args[1]), float(args[2]), args[3]
    kf = solve_kick_factor(kick, J, mass, hold)
    print(f"kick_factor = {kf:.3f}  (check: {kick_deg(J, kf, mass, hold):.3f} deg for a default merc)")
    for alt in ("one_hand", "two_hand", "shouldered", "hip_braced"):
        if alt != hold:
            print(f"  same gun held {alt}: {kick_deg(J, kf, mass, alt):.2f} deg")
    print(f"  prone: {kick_deg(J, kf, mass, hold, 'prone'):.2f} deg; power armour: {kick_deg(J, kf, mass, hold, 'power_armour'):.2f} deg")
    print(f"  shooter push standing 1 g: {shooter_push_mps(J, mass):.3f} m/s; zero-g: {shooter_push_mps(J, mass, gravity_mps2=0):.4f} m/s per shot")


if __name__ == "__main__":
    if sys.argv[1:2] == ["solve"]:
        cli_solve(sys.argv[2:])
    else:
        report(*sys.argv[1:3])
