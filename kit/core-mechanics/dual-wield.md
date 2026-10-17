# Dual wield

Weapons with `dual_wield.allowed` can be paired: the **Dual** key draws a second copy (or, with `dual_wield.mixing`, any other dual-wieldable weapon carried).

## Rules

- **Both fire.** Primary fires both weapons. With identical weapons they alternate to keep a steady rhythm; with mixed weapons each fires at its own rate. Secondary does the same for secondary functions that can work one-handed (others are disabled while paired).
- **Separate ammo.** Each weapon keeps its own magazine. When one runs dry, the other keeps firing alone.
- **Functions apply to both.** Weapon Function, Fire Mode and Reload act on both weapons (Reload refills both; it takes the longer of the two reload times plus 0.2 s).
- **One hand each.** Recoil uses the `one_hand` grip (`dual_wield.hold`), so each gun kicks harder than when held in two hands (a pistol roughly doubles).
- **No sights.** ADS becomes a **tight grip**: zoom 1.1×, drift cone × 0.8, no ADS movement penalty, recoil camera follow stays at the hip value. Scoped weapons can't use their scope while paired.
- **Melee** strikes with the main-hand weapon.
- **Swapping out**: pressing Dual again holsters the off-hand weapon.

```python
def dual_fire(main, off, now):
    a, b = (main, off) if main.last_shot <= off.last_shot else (off, main)   # alternate
    for gun in (a, b):
        if gun.mag > 0 and can_fire(gun, now):
            fire_shot(gun, gun.mode)
            if gun.same_model_as(other(gun)):
                break                           # identical guns alternate: one per trigger tick
```

## Why pair

Two weapons double sustained fire and magazine size at the cost of accuracy and recoil control, which suits close-range sidearms and light melee. Layouts that block pairing (a scoped variant, an underbarrel attachment needing the support hand) say so in the Controls table.

## Adaptation notes

- **2D**: draw both muzzles; alternate shots from each for readability.
- **Top-down**: each gun can aim at the same cursor; slight angular offset (±2°) between them sells the effect.
