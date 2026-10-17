# Damage

Damage is absolute HP (see [health-and-armour.md](health-and-armour.md)). One pipeline handles every hit; weapons only supply numbers.

## Pipeline

```python
def damage_for_hit(payload, hit, target):
    dmg = payload.damage                                   # per pellet for pellets, per second for beams
    dmg *= zone_mult(payload, hit)                         # head_mult / limb_mult / 1.0
    dmg *= falloff_mult(payload, hit.distance_m)           # range falloff
    dmg *= payload.penetration.after_body_mult ** hit.bodies_passed
    if hit.walls_passed:
        dmg *= payload.penetration.after_wall_mult ** hit.walls_passed
        dmg *= hit.wall_depth_left_m / payload.penetration.wall_m   # weaker the more wall it chewed through
    dmg *= weapon.condition_damage_mult()                  # durability (1.0 unless worn_damage_mult < 1)
    dmg *= target.profile.type_mult.get(payload.damage_type, 1.0)   # entity resistances
    dmg = apply_armour(dmg, payload.damage_type, target)
    return ceil(dmg)
```

Splash damage ([below](#splash)) and status effects ([special-damage-effects.md](special-damage-effects.md)) are applied separately.

## Range and falloff

- `range_m` is the reach. If it's a pair `[min, max]`, each shot rolls its reach between the two, so the edge of a weapon's range is a little ragged.
- `falloff`: full damage up to `start_m`, then a straight line down to `min_mult` at `end_m`, then flat to the end of the reach.

```python
def falloff_mult(payload, d):
    f = payload.falloff
    if f is None or d <= f.start_m:
        return 1.0
    if d >= f.end_m:
        return f.min_mult
    return lerp(1.0, f.min_mult, (d - f.start_m) / (f.end_m - f.start_m))
```

Typical: pistols and SMGs lose 20–50 % by 30–100 m; rifles 10–25 % by 100–150 m; shotgun pellets lose most of their damage by 20–40 m. Projectiles don't fall off by distance; they lose damage only through `damage_gain` (which can also raise it with flight time).

## Penetration

**Bodies.** A round passes through a target if `penetration.body / (bodies_passed + 1)` beats a random roll between 0 and the target's max HP (plus any shield). Hits low on the legs or high on the head count the target as half as tough (thinner cross-section). After each body: damage × `after_body_mult`.

| `body` | Meaning vs a 200 HP merc |
|---|---|
| 0 / omitted | never passes through |
| 100–150 | sometimes through one body, rarely two (pistol, SMG) |
| 200–400 | usually through one, often two (rifles) |
| 1000+ | through a line of people (anti-materiel, rail weapons) |

**Walls.** `wall_m` is how much reference wall (rock or concrete) the round can punch through. Other materials scale it ([materials.md](materials.md)): wood ×6, dirt ×2, metal ×0.33, glass ×16. Up to 5 walls; each exit deflects the round by up to ±0.18° at random. After a wall: damage × `after_wall_mult`, and × the fraction of penetration depth still left.

| `wall_m` | Can shoot through |
|---|---|
| 0.3 | a wooden door, a car door, thin drywall |
| 0.5 | a brick wall's worth of wood, a thin interior wall |
| 1.0+ | concrete partitions; light cover stops being cover |

## Splash

Explosions deal `splash.damage` (or the payload's `damage`) at the centre, falling to 0 at `splash.radius_m`:

- `linear`: `damage × (1 − d / radius)`
- `quadratic` (default for explosives): `damage × (1 − (d / radius)²)` (flatter near the centre, steep at the edge)
- `none`: full damage across the radius

Splash checks line of sight from the blast centre; solid walls block it. Splash ignores hit zones and uses the `blast` damage type unless the payload says otherwise.

## Damage types

| Type | Is | Typical sources |
|---|---|---|
| `ballistic` | bullets and pellets | most guns |
| `pierce` | a point driven in | stabs, bolts, darts, flechettes, thrown knives |
| `slash` | an edge drawn across | blades |
| `blunt` | crushing impact | bashes, clubs, shields, kinetic slugs at low speed |
| `blast` | overpressure | explosions |
| `fragment` | shrapnel | frag grenades, flak |
| `fire` | heat and burning | flamethrowers, incendiaries |
| `plasma` | superheated matter | plasma weapons; partly fire, partly blast |
| `laser` | focused light | lasers, beam weapons |
| `electric` | current | tasers, lightning guns, arc weapons |
| `cryo` | extreme cold | freeze weapons |
| `acid` | corrosion | acid guns, corrosive grenades |
| `toxic` | poison and gas | gas grenades, toxic darts |
| `sonic` | pressure waves | sonic weapons, concussion |
| `kinetic` | hypervelocity mass | rail and gauss weapons |
| `radiation` | ionising energy | exotic weapons |

Each entity profile multiplies these ([entity-profiles.md](entity-profiles.md)): robots shrug off `toxic` and `fire` but suffer `electric`; organics bleed from `slash`; energy shields drink `ballistic` and break to `electric`.

## Adaptation notes

- **Hitscan in 2D**: trace the line in the play plane; penetration and falloff work unchanged.
- **Projectiles in top-down**: keep speed and `gravity_mult` as "arc time" if the game has height, or ignore drop.
- **Simpler games**: keep `damage`, `damage_type`, `head_mult`, `falloff` and drop penetration; the weapons still rank the same.
