# Special damage effects

Status effects carried by a payload's `effects` list (or a melee block's). Each is `{type, ...parameters}`; entity profiles can resist or ignore them ([entity-profiles.md](entity-profiles.md)). Durations are seconds, rates per second.

| `type` | Parameters | What it does |
|---|---|---|
| `hit_slow` | `mult`, `duration_s` | brief slow on every hit (bullets: 0.6–0.7 for ~0.1 s). Makes fleeing under fire harder |
| `flinch` | `mult` | scales the aim flinch the hit causes ([aim-spread-chaos.md](aim-spread-chaos.md)) |
| `displace_aim` | `min_damage`, `duration_s`, `scaling` | knocks the victim's weapon aside: no firing or aiming for `duration_s` (× damage / `min_damage` if `scaling`); needs at least `min_damage` |
| `burn` | `dps`, `duration_s`, `ignite_chance`, `spread_radius_m` | sets the target on fire; burning targets can ignite flammable surroundings and each other |
| `bleed` | `dps`, `duration_s`, `stacks` | damage over time; organic targets only |
| `poison` | `dps`, `duration_s`, `stacks` | damage over time; organic targets only; gas masks and sealed armour stop it |
| `stun` | `duration_s` | can't act |
| `blind` | `duration_s`, `radius_m` | screen white-out / AI loses targets; strongest when facing the source |
| `deafen` | `duration_s`, `radius_m` | no sound cues; AI hearing off |
| `slow` | `mult`, `duration_s` | movement × `mult` |
| `freeze` | `mult`, `duration_s`, `shatter_mult` | slow that builds; frozen targets take × `shatter_mult` from blunt and blast |
| `shock` | `duration_s`, `chain_targets`, `chain_range_m` | stagger plus chaining to nearby targets; strong against robots, shields, anyone in water |
| `emp` | `duration_s`, `radius_m`, `drain` | disables electronics: robots stall, energy shields drop by `drain`, scopes and smart weapons go dark |
| `corrode` | `armor_mult`, `duration_s`, `dps` | armour absorbs × `armor_mult` while active; metal targets take `dps` |
| `knockdown` | `min_impulse_ns`, `duration_s` | knocked flat if the hit's impulse beats `min_impulse_ns` (see [recoil.md](recoil.md)) |
| `mark` | `duration_s`, `damage_taken_mult` | target highlighted to allies; takes extra damage |
| `heal` | `hp`, `hp_per_s`, `duration_s` | restores HP (medical darts, stims, defibrillators) |
| `shield_damage` | `mult` | extra damage against energy shields |
| `detonates_explosives` | — | hits set off mines, charges and grenades on the ground |
| `ignites` | `chance` | can light flammable surfaces, fuel and gas ([materials.md](materials.md)) |

```python
def apply_effects(payload, hit, target):
    for fx in payload.get("effects", []):
        if target.profile.immune_to(fx.type):
            continue
        scale = target.profile.effect_mult.get(fx.type, 1.0)
        target.add_status(fx.type, params=fx, strength=scale)
```

Stacking: unless `stacks` says otherwise, a new application refreshes the duration and keeps the stronger value.

## Adaptation notes

- Keep effects readable: one primary effect per weapon is usually enough. Many weapons only need `hit_slow` (guns) or `displace_aim` (melee).
- Top-down games show effects as tints and icons on targets; side-view games add posture changes (stagger, knocked down).
