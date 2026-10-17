# Hipfire tightening and `ads_run_instability`

Derivation for merge rules 3 and 4 in CLAUDE.md. Implementation: `tools/kit/handling_model.py` (also used by `to_kit_units.py`, which writes the results into each layout's `kit_estimates`). Generated review table for every registered BW weapon: [hipfire-table.md](hipfire-table.md). Player-facing rules: `kit/core-mechanics/aim-spread-chaos.md` and `kit/core-mechanics/ads-and-scopes.md`.

## What "hipfire spread" is in Classic

Reading `AimComponent.uc` and `BallisticProInstantFire.uc`, Classic has three separate sources of inaccuracy:

1. **Aim drift.** The barrel wanders to a random point inside a cone and re-aims every ~0.5–1 s. The cone's half-angle runs from `drift_min` (chaos 0) to `drift_max` (chaos 1). **Chaos** comes from movement speed, turning the view, jumping, sprinting and falling, and decays over `chaos_recovery_s`. ADS multiplies the cone by `ads_drift_mult` and drops the minimum to 0. Standing still and aiming, the drift is zero.
2. **Per-shot spread** (`shot_spread_deg`, BW `Inaccuracy`): a small random cone on every shot, the same in hip and ADS.
3. **Recoil**, with a per-weapon `hip_mult` (Classic M806: 1.6× kick from the hip).

(Pro uses a different model in code: a fire-chaos cone that blooms with each shot. The kit follows Classic, which is the rule-set the author chose.)

The research figure "Pro hipfire cone is ~2.7× tighter" compared `drift_max`, the cone at **full chaos**. So Classic's "overkill hipfire" is mostly felt while moving: the drift cone is wide, and walking alone already gives a fair amount of chaos.

## Rule 3: tighten the hip drift cone by weight

```python
heft = clamp(log(mass_kg / 0.8) / log(20 / 0.8), 0, 1)     # 0 at <= 0.8 kg, 1 at >= 20 kg
hip_divisor = 2.7 - 1.4 * heft                              # 2.7 (Pro's median) .. 1.3
drift_min_deg = classic_drift_min_deg / hip_divisor
drift_max_deg = classic_drift_max_deg / hip_divisor
```

| Mass | heft | Divisor | Typical weapon |
|---|---|---|---|
| ≤ 0.8 kg | 0 | 2.70 | knife, compact pistol |
| 1.2 kg | 0.13 | 2.52 | service pistol |
| 2.4 kg | 0.34 | 2.22 | machine pistol, PDW |
| 3.8 kg | 0.48 | 2.02 | assault rifle |
| 4.6 kg | 0.54 | 1.94 | battle rifle, shotgun |
| 7.5 kg | 0.70 | 1.73 | heavy rifle, LMG |
| 14 kg | 0.89 | 1.46 | heavy launcher, minigun |
| ≥ 20 kg | 1 | 1.30 | detachable vehicle weapons and up |

Across the 117 registered BW weapons with aim (bulk-based default masses) the **median divisor is 2.02**, which is the "about 2× tighter" the author asked for, and light weapons get Pro's 2.7×.

Why this keeps movement as the main driver: the divisor shrinks the whole cone, but the cone still opens with chaos, and chaos still comes from running, turning, jumping, sprinting, dodging, sliding and parkour. Heavy weapons keep more of Classic's cone (smaller divisor), so the same movement costs them more. ADS keeps its own `ads_drift_mult` on top. Per-shot spread and recoil are untouched (Classic, rule 5).

### Kit-new movement chaos

BW has jump, falling and sprint chaos. The kit adds dodge, slide, wall-run and mantle (movement doc). Their defaults are derived from the BW values and weight, so heavy weapons suffer more:

```python
dodge_chaos   = jump_chaos * (1 + heft)
slide_chaos   = max(jump_chaos, sprint_chaos) * (1 + heft)
wallrun_chaos = sprint_chaos * (1 + heft)
mantle: the weapon is lowered for the mantle (no firing), like BW's sprint pose
```

Entries may override them per weapon.

## Rule 4: `ads_run_instability`

Pro allows aiming while running at full speed (`bRunInADS`); Classic forces walking speed while aiming. The kit makes it a per-weapon parameter from 0.0 to 1.0:

```python
base = heft(mass_kg)
if hold in ("one_hand", "two_hand"):
    base *= 0.8                  # handguns ride the arms' own suspension better than a stock
if hold == "hip_braced":
    base = 1.0                   # heavy weapons can't be aimed on the move at all
base = max(base, scope_floor)    # magnified optics: 2x-4x -> 0.5, 4x-8x -> 0.9, 8x+ -> 1.0
if melee:
    base = 0.0
```

| Weapon | Value | Running while aiming |
|---|---|---|
| knife, compact pistol | 0.0 | as steady as walking |
| service pistol | ~0.1 | barely shakes |
| SMG, PDW | ~0.25–0.35 | usable |
| assault rifle | ~0.5 | wobbly, fine at short range |
| LMG, heavy rifle | ~0.7 | mostly a bad idea |
| any 4×+ scope | ≥ 0.9 | nearly impossible |
| minigun, launcher, vehicle weapon | 1.0 | can't: the weapon drops to low-ready |

Values above 1.0 behave like 1.0; it is a fraction, not a cap on modding.

### Behaviour

```python
def aim_while_moving(weapon, wielder):
    i = weapon.ads_run_instability
    run_t = clamp((wielder.speed - wielder.walk_speed) / (wielder.run_speed - wielder.walk_speed), 0, 1)
    if wielder.is_sprinting:
        return LOW_READY                     # sprint always lowers the weapon (BW sprint pose)
    if run_t == 0:
        return ADS_NORMAL                    # walking ADS: Classic behaviour
    if i >= 1.0:
        return LOW_READY                     # trigger still works: fires from low-ready at hip drift,
                                             # pitched down by the sprint pose angle (at the ground ahead)
    # running ADS is allowed, but the sight picture degrades with i
    chaos_floor = i * run_t                  # chaos can't drop below this while running
    drift_mult = lerp(weapon.ads_drift_mult, 1.0, i * run_t)   # ADS benefit fades toward hip
    move_speed = lerp(wielder.run_speed, wielder.run_speed * weapon.ads_move_speed_mult, i)
    return ADS_RUNNING(chaos_floor, drift_mult, move_speed)
```

A light pistol (0.1) runs and guns almost as if walking. An assault rifle (0.5) can be aimed at a run but slows a little and wobbles. A 1.0 weapon is lowered while running; the player can still pull the trigger and spray from low-ready, like the author described.

## Inputs and overrides

Both derivations need `mass_kg`, which BW doesn't have. `to_kit_units.py` uses the bulk-based default from `recoil_model.BULK_MASS_KG`; weapon entries choose a mass from the reference table in [impulse-calibration.md](impulse-calibration.md) and recompute. Entries may override `ads_run_instability` with a design note (e.g. a gyro-stabilised scope).
