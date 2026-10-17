# Aiming down sights and scopes

The **ADS** key raises the weapon to the sights (or scope). While aiming:

- the drift cone's minimum drops to 0 and its maximum is multiplied by `aim.ads_drift_mult`;
- the camera follows drift by `aim.view_follow.ads` and recoil by `recoil.view_follow.ads`;
- recoil loses the hip multiplier;
- movement is limited ([below](#moving-while-aiming));
- the view zooms (`handling.zoom`).

Raising takes `ads_time_s`. Firing, reloading, getting displaced (wall or hit), sprinting and mantling drop the sights; reloading and switching functions raise them again afterwards if the key is still held.

## Zoom types

| `zoom.type` | Behaviour |
|---|---|
| `irons` | small zoom (`magnification` ≈ 1.2–1.35), sights or reflex optic |
| `fixed` | one magnification (e.g. 4×); usually with a scope overlay that hides the weapon |
| `variable` | steps between `min_magnification` and `magnification`; `steps` count |
| `smooth` | continuous zoom between the two |

Magnification is relative to the game's normal field of view: `fov = 2 * atan(tan(base_fov / 2) / magnification)`.

## Moving while aiming

At walking pace, aiming works normally and movement is multiplied by `ads_move_speed_mult`. Running while aiming depends on `ads_run_instability`:

```python
def aim_while_moving(weapon, w):
    i = weapon.handling.ads_run_instability
    if w.sprinting:
        return LOW_READY                                   # sprint always lowers the weapon
    run_t = clamp((w.speed - w.walk_speed) / (w.run_speed - w.walk_speed), 0, 1)
    if run_t == 0:
        return ADS(speed_mult=weapon.handling.ads_move_speed_mult)
    if i >= 1.0:
        return LOW_READY                                   # trigger still works: fires from low-ready
    return ADS(
        chaos_floor=i * run_t,                             # the sight picture shakes while running
        drift_mult=lerp(weapon.aim.ads_drift_mult, 1.0, i * run_t),   # ADS benefit fades toward hip
        speed=lerp(w.run_speed, w.run_speed * weapon.handling.ads_move_speed_mult, i),
    )
```

| `ads_run_instability` | Running while aiming |
|---|---|
| 0 | knives, compact pistols: as steady as walking |
| ~0.1 | service pistols: barely shakes |
| 0.25–0.35 | SMGs, PDWs: usable |
| ~0.5 | assault rifles: wobbly, fine at short range |
| ~0.7 | LMGs, heavy rifles: mostly a bad idea |
| ≥ 0.9 | any 4×+ scope: nearly impossible |
| 1.0 | miniguns, launchers, detachable vehicle weapons: weapon drops to low-ready; you can still pull the trigger and spray from the hip at the ground ahead |

**Low-ready firing**: the shot uses the hip drift cone at full chaos, pitched down by the sprint pose angle.

## Dual-wield "tight grip"

With two weapons out, ADS doesn't raise sights. It switches to a tighter two-gun stance: zoom 1.1×, drift × 0.8, recoil `view_follow` as hip. See [dual-wield.md](dual-wield.md).

## Melee weapons

Melee weapons that can block use ADS as the block key ([melee-and-blocking.md](melee-and-blocking.md)).

## Adaptation notes

- **2D side-view**: ADS can extend the camera toward the aim direction instead of zooming, and narrows the cone.
- **Top-down**: ADS = "steady aim": slower movement, narrower cone, camera leans toward the cursor by an amount scaled by `magnification`.
