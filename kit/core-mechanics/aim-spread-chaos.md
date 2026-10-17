# Aim, spread and chaos

A shot's direction is the view direction plus four offsets:

```python
shot_dir = rotate(view_dir, aim_drift + recoil_offset + displacement) then rotate by random shot_spread
```

1. **Aim drift**: the barrel wanders inside a cone. Its size depends on **chaos**.
2. **Recoil**: see [recoil.md](recoil.md).
3. **Displacement**: the gun is pushed off line by a nearby wall or knocked aside by a hit.
4. **Shot spread**: a small random cone on every shot (`payload.spread_deg`).

Standing still and aiming down sights, drift is zero and only shot spread and recoil remain. Movement, turning, jumping and getting hit are what make a weapon inaccurate, and heavy weapons suffer more from them.

## Chaos

Chaos is a 0–1 measure of how unsettled the wielder is.

```python
def update_chaos(w, aim, dt, turn_rate_deg_s):
    # recalculated each time the barrel picks a new drift point
    speed_chaos = w.speed_mps / aim.chaos.full_speed_mps
    turn_chaos  = (aim.crouch_mult if w.crouched else 1) * turn_rate_deg_s / aim.chaos.full_turn_deg_s
    w.chaos = clamp(max(speed_chaos, w.chaos) + turn_chaos, 0, 1)

def on_event(w, aim, event):            # added on top
    w.chaos = clamp(w.chaos + aim.chaos[event], 0, 1)   # sprint (on start), jump, dodge, slide, wallrun
    # "fall" is added on every new drift point while airborne

def decay_chaos(w, aim, dt):
    if now() - w.last_chaos_event > aim.chaos.get("recovery_delay_s", 0):
        rate = 1 / aim.chaos.recovery_s
        if w.crouched:
            rate /= aim.crouch_mult            # crouching settles faster
        w.chaos = max(0, w.chaos - rate * dt)
```

## Aim drift

The barrel swings to a random point inside the cone, settles, then picks the next one:

```python
def next_drift_point(w, aim):
    lo, hi = aim.drift_deg
    if w.aiming:
        lo, hi = 0, hi * aim.ads_drift_mult
    cone = lerp(lo, hi, w.chaos)
    if w.crouched:
        cone *= aim.crouch_mult
    # biased toward the direction the view is turning: a turning wielder's gun swings ahead of the view
    yaw   = cone * biased_rand(w.turn_dir_yaw)
    pitch = cone * biased_rand(w.turn_dir_pitch)
    swing_time = aim.settle_s * lerp(1, aim.moving_settle_mult, w.speed_fraction)
    return (pitch, yaw), swing_time            # move there with smooth interpolation
```

`view_follow.hip` / `.ads` is the fraction of drift the camera shows. Hip drift usually barely moves the camera (0.05): the crosshair stays still and the gun wanders around it, which the player sees as the weapon model swaying. In ADS the camera shows all of it (1.0): the sight picture itself wobbles.

### Reading drift numbers

| `drift_deg` max | Hipfire at full chaos (running, turning hard) |
|---|---|
| 1–3° | pistols, PDWs: hip-shooting on the move is fine at short range |
| 4–8° | rifles: hip-shooting on the move only at close range |
| 8–12° | heavies: stop, or accept spraying |

`drift_deg` min is what you get standing still from the hip: usually 0.05–0.5°.

## Sprinting, jumping and other events

- **Sprint** adds `chaos.sprint` and moves the weapon into the sprint pose (`sprint_pose_deg`, a low-ready angle) over `pose_shift_s`. See [sprint-and-stamina.md](sprint-and-stamina.md).
- **Jump** adds `chaos.jump`, kicks the barrel by `jump_kick_deg` and forces a fast re-aim.
- **Dodge, slide, wall-run** add their chaos values ([movement.md](movement.md)). Mantling lowers the weapon.
- **Falling** adds `chaos.fall` at every new drift point while airborne, so long falls get worse and worse.

## Flinch

Taking damage knocks the aim:

```python
def flinch(w, aim, damage):
    f = min(1, damage / aim.flinch_damage)               # flinch_damage: a hit this big gives a full flinch
    w.chaos = clamp(w.chaos + 2 * f, 0, 1)
    offset = (rand(-1, 1) * 33 * f, rand(-1, 1) * 38 * f) # degrees (pitch, yaw), on top of the drift cone
    swing_to(offset, time=0.3 * current_swing_time)
```

Entity profiles can scale it (`flinch_mult`: robots and power armour flinch less).

## Displacement

**Wall displacement.** A weapon longer than the gap to the wall ahead is pushed off line:

```python
gap = distance_to_obstacle_ahead - body_radius
if gap < weapon.physical.length_m:
    f = acos(gap / weapon.physical.length_m) / (pi / 2)     # 0 when clear, 1 when touching
    barrel offset += LONG_GUN_POSE * f                      # turned aside and pointed down
    ads_allowed = False
```

Short weapons (pistols, knives) never displace in practice; long rifles do at doorways and corners. In 2D side-view, use the horizontal gap to the wall; top-down, the gap along the aim line.

**Hit displacement.** Some hits (melee bashes and blades mostly; see `displace_aim` in [special-damage-effects.md](special-damage-effects.md)) knock the victim's weapon aside for a duration: it swings away over 0.2 s, can't fire or aim, and swings back over 0.35 s when the duration ends. Durations stack to at most 2 s.

## Shot spread

`payload.spread_deg` is applied to every shot, hip or ADS, on top of everything else. A single number is a circle; `[x, y]` is a cone wider in one axis. `spread_shape`: `circle` (default, denser in the middle), `rectangle` (uniform in a box), `scatter` (uniform in an ellipse). Pellet weapons multiply it by `hip_spread_mult` from the hip.

## Adaptation notes

- **2D side-view**: drift and spread are pitch only. Show the cone as a fan from the muzzle. Turning becomes aim-speed (degrees per second of mouse or stick movement).
- **Top-down**: drift and spread are yaw only. Movement speed is the main chaos source; turning still counts.
- **Simple games**: one cone = `lerp(drift min, drift max, chaos)`, with chaos from speed and jumps, plus `spread_deg`. Skip view-follow.
