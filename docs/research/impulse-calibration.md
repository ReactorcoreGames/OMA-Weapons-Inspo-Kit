# Recoil and knockback impulse model: derivation and calibration

Answer to open question 2 of round 2 ("recoil = push in N·s, resisted by mass and grip"). The model lives in `tools/kit/recoil_model.py` (shared with the validator), the generated per-weapon table is [impulse-calibration-table.md](impulse-calibration-table.md), and the player-facing rules are in `kit/core-mechanics/recoil.md`.

## What BW actually does

BW has no mass and no physical recoil. Each shot adds a fixed `Recoil` amount (rotation units) to an accumulating counter that is mapped through a pattern curve into barrel deflection, multiplied by stance factors (hip, moving, crouch), with only part of it moving the camera. The per-shot numbers are pure game tuning. Converted to degrees for the default layout of every registered weapon (generated table):

| BW group | Median kick per shot | Range |
|---|---|---|
| Pistols | 11.3° | 0.1–22.5° (the low end is a tranquiliser pistol) |
| SMG / machine pistols | 0.46° | 0.1–5.6° |
| Assault rifles | 0.70° | 0.4–1.6° |
| Machine guns | 0.74° | 0.2–2.8° |
| Shotguns | 2.8° | 1.4–5.6° |
| Snipers / marksman | 8.2° | 0.7–38° |
| Launchers | 1.9° | 0.03–44° |

The pattern is not "bigger cartridge, bigger kick". It is controllability tuning. Automatic weapons get a tiny per-shot kick because the counter accumulates over many shots and the pattern curve shapes the climb. Semi-auto handguns kick about as hard as physics suggests. Slow, heavy-hitting guns (bolt rifles, magnum revolvers, anti-materiel rifles) kick far harder than physics, so every shot has to be re-aimed.

A physical model can't reproduce that with mass and impulse alone. So the kit splits **physics** from **feel**:

- `impulse_ns` is the real momentum the shot throws backwards. It drives everything physical: shooter push, zero-g drift, stagger, mount stability, flipping a truck.
- `kick_factor` is how much of that impulse turns into muzzle climb for the wielder. It covers compensators, gas systems, buffers, bore axis, stock design, and BW's deliberate tuning. It is calibrated per fire mode so a default merc feels exactly BW's kick.

## The formulas

```python
# Muzzle climb per shot (degrees), before the weapon's own stance multipliers
kick_deg = CLIMB_GAIN * kick_factor * impulse_ns / (weapon_mass_kg + hold_grip_kg * bracing * grip_mult)

# Velocity the shot gives the shooter, backwards along the aim
push_mps = max(0, impulse_ns - absorb(body_mass_kg + weapon_mass_kg)) / (body_mass_kg + weapon_mass_kg)

# Velocity a hit gives the target, along the hit direction
knockback_mps = max(0, hit_impulse_ns - absorb(target_mass_kg)) / target_mass_kg

# Impulse soaked by stance and footing
absorb(M) = absorb_per_kg[stance] * M * (gravity / 9.81) * footing + anchoring_ns
```

`impulse_ns / (weapon_mass + effective grip mass)` is the rearward velocity the gun-and-hands system picks up. `CLIMB_GAIN` turns that velocity into rise, in degrees per m/s. It is a single global constant, set to **12° per m/s**, so an unmitigated two-handed handgun lands at `kick_factor ≈ 1`: BW's M806-class .45 pistol (kick 10.1°, 1.2 kg, ~4.2 N·s) gives `kick_factor` 1.04.

After that, the weapon's BW stance multipliers (`hip_mult`, `crouch_mult`, `moving_mult`) still apply on top, exactly as in BW, because they are per-weapon handling, not physics.

## Wielder parameters (defaults = trained merc, 100 kg with armour and kit)

### Hold grip: effective mass the hold couples to the weapon

| Hold | Grip kg | Used for |
|---|---|---|
| `one_hand` | 1.5 | pistol at arm's length, dual-wielding, one-handed launcher |
| `two_hand` | 4 | handgun, machine pistol, stockless PDW in both hands |
| `shouldered` | 25 | anything with a stock against the shoulder |
| `hip_braced` | 40 | heavy weapon at the hip or under the arm on a sling / harness |
| `mounted` | mount mass | tripod, turret, vehicle: the mount's mass replaces grip |

Dual-wielding one handgun per hand drops `two_hand` to `one_hand`, so the same pistol kicks about twice as hard (M806-class: 10° → 19°), which matches BW's dual-wield feel.

### Bracing: multiplier on grip

| Bracing | × grip | Notes |
|---|---|---|
| standing, crouched | 1.0 | BW's per-weapon `crouch_mult` already handles crouching |
| rested on cover | 2.0 | sandbags, window sill |
| prone | 2.5 | |
| bipod deployed | 4.0 | |
| power armour / cyborg arms | 4.0 | or set `grip_mult` on the entity profile |
| mounted | — | use mount mass |

`grip_mult` on the entity profile scales grip for non-default wielders: a child or a frail civilian 0.3–0.5, a heavy-worlder 1.5, a combat robot 3–10.

### Absorb: impulse a stance soaks per shot without moving the body

| Stance | N·s per kg of total mass | Default merc (≈100 kg) |
|---|---|---|
| standing | 0.6 | 60 N·s |
| crouched | 0.9 | 90 N·s |
| prone | 1.5 | 150 N·s |
| vehicle on wheels / tracks with brakes | 0.6 | 1,300 N·s for a 2.2 t pickup |
| airborne / zero-g | 0 | 0 |

Absorb scales with gravity (friction needs weight) and with footing (1 good ground, 0.5 ice or mud, 0 floating). Anchoring (mag boots, harness, spikes, grabbing a wall) adds a flat amount independent of gravity. With these numbers no handheld small arm moves a standing merc at 1 g, while detachable vehicle weapons do, and a light vehicle gets thrown by a tank gun while the tank only rocks.

## Reference scales

### Impulse per shot (real-world ballpark, before muzzle brakes)

Momentum ≈ projectile mass × muzzle velocity + propellant gas mass × gas velocity (≈1.2–1.7 × muzzle velocity).

| Shot | Impulse N·s | Feel |
|---|---|---|
| .22 rimfire | ~0.9 | negligible |
| 9 mm pistol | ~3.3 | light |
| .45 ACP | ~4.2 | light-medium |
| .44 Magnum | ~8 | stout handgun |
| 5.56 mm rifle | ~6 | light rifle |
| 7.62×39 mm | ~7.5 | |
| 7.62×51 mm battle rifle | ~12 | heavy rifle |
| 12-gauge buckshot / slug | ~14–16 | heavy shoulder |
| .338 magnum | ~22 | very heavy shoulder |
| .50 BMG anti-materiel | ~55–60 | brutal, braced only (brakes cut it ~40 %) |
| 20 mm anti-materiel | ~140 | bipod and brake or nothing |
| 40 mm low-velocity grenade | ~18 | thump |
| Recoilless rifle / rocket | ~0–10 net | backblast balances it; the danger is behind you |
| 30 mm autocannon | ~700 | vehicle weapon |
| 120 mm tank gun | ~30,000 | vehicle weapon |
| 155 mm howitzer | ~60,000 | emplacement |

Energy weapons have no physical reason to recoil, but a device can still throw reaction mass (plasma, coolant vent, field kick). Give them an "equivalent impulse" that suits the fiction and let `kick_factor` handle feel.

### Weapon mass

| Weapon | Mass kg |
|---|---|
| Knife | 0.2–0.4 |
| Hand grenade | 0.4–0.6 |
| Compact pistol | 0.6–0.8 |
| Service pistol | 0.9–1.3 |
| Magnum revolver | 1.3–1.8 |
| Machine pistol | 1.5–3 |
| SMG / PDW | 2.5–4 |
| Assault rifle / carbine | 3–4.5 |
| Battle rifle / DMR | 4–5.5 |
| Shotgun | 3–4.5 |
| LMG / GPMG | 7–12 |
| Anti-materiel rifle | 13–17 |
| Shoulder launcher (loaded) | 6–10 |
| Handheld minigun with power pack | 18–40 |
| Vehicle autocannon | 100–200 |
| Tank gun | 2,500–4,000 |

BW has no mass field (its layout `Weight` is the spawn probability of a layout), so converted weapons start from a bulk-based default (`BULK_MASS_KG` in the module: bulk 3 → 1.2 kg, bulk 7 → 3.8 kg, bulk 11 → 14 kg) and the entry writer picks a better value from this table.

### kick_factor

| kick_factor | Meaning | BW examples (generated table) |
|---|---|---|
| 0.05–0.3 | automatic fire tuned to be controllable; recoil comes from accumulation and pattern | machine pistols, SMGs, assault rifles, machine guns |
| 0.3–0.7 | semi-auto long guns, pump shotguns | shotguns median 0.45 |
| ~1.0 | unmitigated semi-auto handgun | M806-class pistol 1.04 |
| 2–3 | deliberately punishing: every shot must be re-aimed | magnum revolver 2.4, bolt sniper 2.7, .50 rifle 2.3 |

## Calibration procedure (per weapon entry)

1. Pick `mass_kg` from the mass table, matching the weapon's concept.
2. Pick `impulse_ns` per fire mode from the impulse table (or the fiction for energy and exotic weapons).
3. Pick the hold (`two_hand` for handguns, `shouldered` for stocked guns, `hip_braced` for heavies).
4. Solve `kick_factor` so the default merc gets BW's converted kick (`recoil_kick_deg` in `bw_kit_units.json`):

```
python tools/kit/recoil_model.py solve <bw_kick_deg> <impulse_ns> <mass_kg> <hold>
```

The entry stores `impulse_ns`, `kick_factor` and the resulting `kick_deg` (reference kick for a default merc, ADS, standing). The validator recomputes `kick_deg` from the other three and warns if it is stale, so a modder who changes the cartridge or the mass sees the consequence.

## Worked examples

| Case | Result |
|---|---|
| .45 pistol, 1.2 kg, 4.2 N·s, `kick_factor` 1.04, two hands | 10.1° (BW feel) |
| same pistol, dual-wielded (one hand) | 19.4° |
| same pistol, power armour | 3.1° |
| same pistol, zero-g, unanchored | each shot pushes the shooter back 0.04 m/s |
| handheld minigun, 18 kg, 7 N·s × 22 shots/s, zero-g | 1.3 m/s² of thrust: it's a jetpack |
| 30 mm autocannon detached (150 kg) fired from the hip by a merc | 2.2 m/s push per shot: bowled over |
| 120 mm tank gun (3 t) on a 2.2 t pickup | 5.2 m/s jolt: the truck is thrown (rollover check in the stability-model doc) |
| same gun on a 60 t tank | fully absorbed: the tank rocks on its suspension |
| rocket blast 1,885 N·s (BW `MomentumTransfer`) on a standing merc | 18 m/s: thrown (BW rocket-jump scale) |

## Knockback on targets

Use the same unit. A hit's impulse is the projectile's momentum (small for bullets: 3–15 N·s gives a merc nothing at 1 g, a nudge in zero-g) or the weapon's explicit `knockback_ns` (BW's `MomentumTransfer` / melee `KickForce`, converted at 1 UT momentum unit = 1.1 / 52.5 N·s on the 100 kg reference body). Explosives in BW are in the 400–6,300 N·s range: a real shove to a full throw. Stagger and knockdown thresholds belong to the entity profile (`kit/core-mechanics/entity-profiles.md`).

## Open points for the author

- `CLIMB_GAIN = 12` and the grip masses are tuned for feel, not measured. They only matter for **non-default** wielders and holds, since default-merc kick is pinned to BW by `kick_factor`.
- BW's `PushbackForce` (a velocity shove on the shooter on a few shotguns, the railgun and some cannons) is much larger than physics would give a standing merc. The kit treats it as a design "lurch" an entry can describe, not as the physics push.
