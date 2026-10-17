# Movement

The default merc's movement and how it interacts with weapons. Every move adds chaos to the held weapon ([aim-spread-chaos.md](aim-spread-chaos.md)); heavier weapons take more (chaos values grow with weight). All speeds at Earth gravity; [environments.md](environments.md) covers other gravities.

## Base speeds

| Move | Speed | Notes |
|---|---|---|
| Run (default pace) | 6.6 m/s | × the held weapon's `move_speed_mult` |
| Walk | 3.3 m/s (0.5 × run) | ADS at this pace or slower has no running penalty |
| Crouch | 3.0 m/s (0.45 × run) | crouching shrinks drift (`aim.crouch_mult`) and kick (`recoil.crouch_mult`) |
| Sprint | 9.2 m/s (1.4 × run) | [sprint-and-stamina.md](sprint-and-stamina.md) |
| Air control | 5.7 m/s max, light steering | |
| Acceleration | 47 m/s² | snappy starts and stops |
| Swim | 3.1 m/s | |

## Jumps and dodges

| Move | Values | Chaos | Stamina |
|---|---|---|---|
| Jump | 0.87 m apex (4.1 m/s up) | `chaos.jump`, barrel kicked by `jump_kick_deg` | 5 |
| Double jump | once per airtime, 1.09 × jump speed, from any point in the air | `chaos.jump` | 5 |
| Dodge | double-tap a direction: 9.9 m/s sideways (1.5 × run) + 2.9 m/s up (0.44 m hop) | `chaos.dodge` | 5 |
| Wall dodge | dodge off a wall while airborne, same speeds, once per wall contact | `chaos.dodge` | 5 |

Landing from a high fall adds `chaos.fall` (applied repeatedly while airborne) and can be turned into a slide.

## Slide

Titanfall / Apex style: crouch while moving fast.

```python
def try_slide(w):
    fast = max(w.speed, w.landing_speed) >= 1.1 * RUN_SPEED or on_downslope(w)
    if w.crouch_pressed and w.on_ground and fast and now() - w.last_slide_end > 0.55:
        w.stamina -= 5; stop_sprint(w)
        boost = SLIDE_BOOST * max(0.25, w.stamina / MAX_STAMINA)      # 7.3 m/s at full stamina
        if backwards(w):
            boost *= 0.6; max_speed = 0.75 * SLIDE_MAX
        w.slide_velocity = w.velocity + 0.5 * w.landing_velocity + dir(w.velocity) * boost
        add_chaos(w, w.weapon.aim.chaos.slide)

def tick_slide(w, dt):
    slope = slope_angle_deg(w)                  # negative = downhill
    friction = SLIDE_DECEL * (env.gravity / 9.81)                       # 24 m/s² at 1 g
    friction *= clamp(1 - abs(slope) / 60, 0.2, 1) if slope < 0 else clamp(1 + slope / 45, 1, 2.5)
    w.slide_velocity += downhill_dir * env.gravity * sin(abs(slope)) * 1.5 * dt
    w.slide_velocity -= dir(w.slide_velocity) * friction * cos(slope) * dt
    w.slide_velocity = clamp_length(w.slide_velocity, SLIDE_MAX)        # 16.5 m/s (2.5 × run)
    if length(w.slide_velocity) < CROUCH_SPEED:
        end_slide(w)
```

You can shoot while sliding (from the hip, or ADS with weapons whose `ads_run_instability` allows running ADS); the low stance gives crouch bonuses to kick.

## Wall-run

| Value | Default |
|---|---|
| Start | airborne, touching a wall within 30–150° of the movement direction, horizontal speed ≥ run speed |
| Speed | 1.1 × sprint speed along the wall |
| Gravity while running | 0.25 × |
| Max duration | 1.8 s, then you slide off |
| Wall jump | 6 m/s away from the wall + 4 m/s up; refreshes double jump |
| Same wall again | not until you touch the ground or another wall |
| Chaos | `chaos.wallrun` on start; drift uses the running state |

## Mantle and vault

| Move | Values |
|---|---|
| Vault | obstacles up to 1.2 m: 0.4 s, keeps 70 % of speed |
| Mantle | ledges up to 2.0 m above the feet: 0.6–0.9 s (slower with heavier weapons: + 0.3 s × heft) |
| Weapon | lowered for the move, can't fire; sights and sprint pose restore after |

## Prone (optional)

| Value | Default |
|---|---|
| Transition | 0.8 s down, 0.6 s up |
| Speed | 1.3 m/s (0.2 × run) |
| Weapon | drift × 0.5, recoil bracing `prone` (see [recoil.md](recoil.md)), bipods deploy |
| Penalty | turning is limited to ±60° without shifting the body (1 s) |

## Adaptation notes

- **2D side-view**: everything maps directly; wall-runs become wall-slides and wall-jumps on vertical walls.
- **Top-down**: jump and dodge become rolls and dashes (keep their chaos and stamina); slide is a sprint-into-crouch dash; wall-run and mantle are vaulting cover.
