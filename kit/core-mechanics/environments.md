# Environments

Weapon numbers assume Earth gravity, air at sea level and dry ground. Environments change outcomes through a few multipliers and the physics in [recoil.md](recoil.md); weapon files stay the same.

## Gravity

| Gravity | Value | Effects |
|---|---|---|
| Zero-g | 0 m/s² | no footing: stance absorb 0, every shot pushes the shooter unless anchored (mag boots, handholds: `anchored_ns` 30–100); projectiles fly straight; no falling, so no `chaos.fall`; jumps are pushes off surfaces; thrown weapons keep going |
| Low-g (moon) | 1.6 m/s² | absorb × 0.16 (rifles push you around a little), long jumps, slides last longer (friction scales with g), grenades travel far |
| Mars-like | 3.7 m/s² | absorb × 0.38 |
| Earth | 9.81 m/s² | the default |
| High-g | 15–25 m/s² | absorb × 1.5–2.5, short jumps, heavy weapons tiring (stamina drain × g / 9.81), steeper projectile drop |

```python
def jump_speed(apex_m=0.87):
    return sqrt(2 * env.gravity * apex_m)            # keep the jump height, not the speed
projectile.gravity = env.gravity * payload.gravity_mult
```

Movement speeds stay the same in every gravity (legs and thrusters do their job); only vertical motion and friction change.

## Underwater

| Effect | Value |
|---|---|
| Hitscan range | capped at `water_range_m` (default: 3 m for bullets, 0 for lasers that boil water, 1 m for fire) |
| Damage | linear falloff to × 0.4 over that range unless the weapon is built for water |
| Projectiles | drag: speed × 0.5 per second; rockets lose `accel` to 50 % |
| Fire, flamethrowers | don't work; `incendiary` payloads fizzle |
| Electric | spreads: `shock` hits everything within 3 m in the same water |
| Explosions | radius × 1.5, damage × 1.2 (pressure carries) |
| Jamming | `jam_mult` × 3 for guns not rated for water; durability wear × 3 |
| Heat | `cooling_mult` × 3 |
| Movement | swim speed, slow turns; chaos from turning × 1.5 |

## Vacuum and thin air

- No sound carries through vacuum (no audio cues for AI or players beyond contact).
- No air cooling: heat `cooling_mult` × 0.3; overheating weapons are much worse.
- Fire needs oxygen: flamethrowers and incendiaries fail unless they carry an oxidiser (say so in the weapon's notes).
- No drag: projectiles keep their speed.

## Gases and atmosphere

| Gas | Effect |
|---|---|
| Flammable (methane, fuel vapour) | ignites from `fire`, `plasma`, sparks on metal and muzzle flash of non-suppressed guns: explodes (blast, radius = cloud size) |
| Toxic | `poison` per second to organics without protection |
| Smoke | blocks vision; thermal and some scopes see through |
| Thick atmosphere | projectile drag × 2; sound carries further |

## Weather and terrain

| Condition | Effect |
|---|---|
| Sand, dust | `wear_mult` × 2, `jam_mult` × 1.5 |
| Mud, rain | `wear_mult` × 2, footing 0.7 |
| Ice | footing 0.5 (stance absorb halved, slides go far) |
| Extreme cold | heat cooling × 1.3; `jam_mult` × 1.3; cryo effects last longer |
| Extreme heat | heat cooling × 0.8 |
| Wind | thrown and slow projectiles drift with the wind (m/s × flight time × 0.3) |

## Adaptation notes

Expose each environment as a small table of multipliers (`gravity`, `footing`, `wear_mult`, `jam_mult`, `cooling_mult`, `heat_mult`, `water`, `vacuum`) on the level or zone, and read them in the formulas above.
