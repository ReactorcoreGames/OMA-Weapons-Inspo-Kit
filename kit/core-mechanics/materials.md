# Materials and surfaces

How shots, blasts and fire interact with what they hit. Every surface in the world has a material.

## Material table

`pen_mult` multiplies a round's `penetration.wall_m` (reference: rock / concrete = 1). `ricochet` is the chance multiplier for glancing hits ([below](#ricochet)).

| Material | `pen_mult` | Ricochet | Flammable | Side effects |
|---|---|---|---|---|
| rock / concrete | 1 | 1.0 | no | chips, dust cloud (brief vision block) |
| brick | 1.2 | 0.8 | no | |
| dirt / sand | 2 | 0.1 | no | sand and dirt raise weapon wear while fighting in them |
| wood | 6 | 0.3 | yes (ignites, burns 10–30 s) | splinters (2–5 fragment damage near the exit) |
| plant / foliage | 16 | 0 | yes when dry | blocks sight, not shots |
| flesh | 1 | 0 | — | bodies use the body-penetration rule instead |
| ice | 6 | 0.6 | no | can crack and break under weight after enough damage |
| snow | 16 | 0 | no | |
| glass | 16 | 0.2 | no | shatters (blocks nothing after); shards cut (`slash`) |
| sheet metal / car body | 0.6 | 1.2 | no | sparks (can ignite fuel and gas) |
| armour plate | 0.33 | 1.5 | no | sparks |
| water | 0.25 | 2.0 at very shallow angles | — | hitscan range is cut underwater ([environments.md](environments.md)) |
| fuel / oil puddle | — | 0 | very (ignites from fire, plasma, sparks) | burning pools deal `fire` damage per second |
| flammable gas | — | — | explodes | [environments.md](environments.md) |
| energy barrier | 0 | 0 | no | absorbs by its own shield rules |

## Penetration through walls

```python
def penetrate_wall(shot, wall, thickness_m):
    needed = thickness_m / wall.material.pen_mult       # equivalent depth of reference wall
    if shot.walls_passed >= 5 or needed > shot.wall_depth_left_m:
        return STOP
    shot.wall_depth_left_m -= needed
    shot.walls_passed += 1
    shot.dir = rotate(shot.dir, rand(-0.18, 0.18), rand(-0.18, 0.18))   # exit deflection, degrees
    return CONTINUE
```

Damage after walls: see [damage.md](damage.md).

## Ricochet

Glancing hits on hard surfaces can bounce:

```python
def ricochet_chance(shot, surface, impact_angle_deg):     # angle between shot and surface plane
    if impact_angle_deg > 25 or shot.payload.type not in ("hitscan", "pellets", "projectile"):
        return 0
    return surface.material.ricochet * (1 - impact_angle_deg / 25) * 0.6
# on ricochet: reflect the direction, add ±5° scatter, keep 40-60 % damage, wall_depth_left halves
```

Explosive and energy payloads don't ricochet unless the weapon says so (`ricochet` tag).

## Fire and flammability

- `fire` and `plasma` damage, burning targets, `ignites` effects and sparks from metal can light flammable materials.
- Burning surfaces deal `fire` damage per second to anything inside (10–20 dps typical), spread to adjacent flammables after 2–5 s, and burn out.
- Water puts fire out; burning targets that enter water stop burning.

## Destructibles

Walls, doors and barricades can have HP. They take damage by type (blast and kinetic best; ballistic mostly penetrates rather than destroys; fire only damages wood and plant). Give each destructible `hp` and `type_mult` like an entity profile.

## Adaptation notes

- **2D**: each tile or collider gets a material. Thickness is the distance the shot travels inside the collider.
- **Simple games**: keep `pen_mult` for 3–4 materials (soft, wood, hard, metal) and skip ricochet.
