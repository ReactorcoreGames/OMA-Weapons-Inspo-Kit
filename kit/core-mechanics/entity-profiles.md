# Entity profiles

Targets and wielders are described by a profile. Weapons never change; profiles decide how a hit lands and how well a body handles a weapon.

## Fields

```yaml
profile: organic-armoured           # name
hp: 200
mass_kg: 100
armour: {points: 0, absorb_fraction: 0.0, wear_per_point: 1.0, type_mult: {}}   # optional extra layer
shield: {points: 0, recharge_delay_s: 4, recharge_per_s: 25, type_mult: {}}     # optional energy barrier
type_mult: {ballistic: 1.0, slash: 1.0}   # damage taken per damage type (missing = 1.0)
immune: []                           # status effects ignored
effect_mult: {}                      # status strength per effect type
hit_zones: {head_radius_m: 0.25, limbs_below: hips}
stability:                           # resisting recoil and knockback (recoil.md)
  grip_mult: 1.0                     # wielder grip strength (scales hold grip)
  absorb_mult: 1.0                   # stance absorb multiplier
  knockdown_speed_mps: 3.0           # knockback that knocks them flat
flinch_mult: 1.0                     # aim flinch when hit
```

## Profile families

| Profile | HP | Mass | Takes more from | Takes less from / immune | Stability |
|---|---|---|---|---|---|
| `organic-civilian` | 100 | 75 | everything (no armour) | — | grip 0.7, knockdown 2 m/s |
| `organic-armoured` (default merc) | 200 | 100 | — | — | grip 1.0, knockdown 3 m/s |
| `organic-beast` (large animal / monster) | 300–3000 | 200–5000 | fire ×1.2, slash ×1.2 | ballistic ×0.8 (thick hide) | grip n/a, absorb ×1.5 |
| `robot-light` (drones, androids) | 150 | 60–120 | electric ×2, emp disables, kinetic ×1.2 | toxic, poison, bleed immune; fire ×0.5 | grip 3, flinch 0.3 |
| `robot-heavy` (mechs, war frames) | 800–3000 | 500–8000 | electric ×1.5, emp, armour-piercing | ballistic ×0.5, toxic/bleed/poison immune, fire ×0.3 | grip 10, knockdown 8 m/s |
| `cyborg` | 250 | 140 | electric ×1.3, emp (stun, not shutdown) | toxic ×0.5, bleed ×0.5 | grip 2.5, flinch 0.6 |
| `power-armour` | 400 | 300 | electric ×1.2, emp slows | ballistic ×0.6, fragment ×0.5, fire ×0.6 | grip 4, absorb ×2, knockdown 6 m/s |
| `energy-shielded` (any + shield) | base + shield | base | shield: electric ×2, plasma ×1.5 | shield: ballistic ×0.7, toxic passes through | as base |
| `swarm` (insects, nanites) | 20–60 each | 0.1–5 | blast ×2, fire ×2, sonic ×2 | ballistic ×0.3 (miss most), slash ×0.5 | n/a |
| `vehicle-light` (bike, pickup) | 600–1500 | 300–2500 | blast ×1.5, kinetic ×1.5 | ballistic ×0.35, slash/blunt ×0.1, toxic immune | absorb 0.6/kg, mount for weapons |
| `vehicle-armoured` (APC, tank) | 2000–6000 | 10,000–60,000 | anti-armour (kinetic, plasma, shaped blast) | ballistic ×0.05, small arms ignore | absorb 0.6/kg |
| `structure` (walls, doors, barricades) | by material | — | see [materials.md](materials.md) | — | — |

These are starting points; a game should keep its list short.

## How a hit resolves

```python
def resolve_hit(payload, hit, target):
    dmg = damage_for_hit(payload, hit, target)                 # damage.md (uses target.type_mult)
    if target.shield and target.shield.points > 0:
        dmg = absorb_with_shield(dmg, payload.damage_type, target.shield)
    target.hp -= dmg
    apply_effects(payload, hit, target)                        # special-damage-effects.md
    flinch(target, dmg * target.flinch_mult)                   # aim-spread-chaos.md
    knockback(payload_impulse(payload), target)                # recoil.md, uses target.stability
```

## Wielding

The same profile drives how a body handles a weapon:

- **Grip**: `grip_mult` multiplies hold grip in the kick formula. A civilian (0.7) feels a pistol kick harder; power armour (4) makes a heavy rifle kick like a pistol.
- **Absorb**: `absorb_mult` multiplies stance absorb, so a mech stands its ground with weapons that bowl a human over.
- **Speed**: heavy weapons slow everyone the same fraction; a power-armour profile can set its own `move_speed_mult` floor.

Detachable vehicle weapons ([weapon-schema.md](weapon-schema.md) carry class `heavy`) are designed around this: miserable for a merc, fine for power armour, natural on a vehicle mount.
