# Recoil, impulse and knockback

Two layers: **kick** (how the weapon climbs and how the player fights it) and **impulse** (the physical push in newton-seconds that moves bodies, mounts and floating shooters). One impulse unit also drives knockback on targets.

## Kick: per-shot climb

Each shot adds kick to an accumulator. The accumulator maps through the weapon's pattern into a barrel deflection; shots go where the barrel points.

```python
def on_shot(weapon, mode, wielder):
    kick = mode.recoil.kick_deg * wielder_scale(weapon, mode, wielder)   # 1.0 for the default merc, see "Impulse"
    if not wielder.aiming:   kick *= weapon.recoil.hip_mult
    if wielder.crouched:     kick *= weapon.recoil.crouch_mult
    if wielder.moving:       kick *= lerp(1, weapon.recoil.moving_mult, wielder.speed_fraction)
    r = weapon.recoil_state
    r.accum = min(r.accum + kick, weapon.recoil.max_deg)
    r.rand = (rand(-1, 1), rand(-1, 1))
    if r.accum == weapon.recoil.max_deg:
        r.rand = (r.rand[0] * 3, r.rand[1] * 3)                    # pinned at max: it gets wild
    r.last_shot = now()

def barrel_offset(weapon):
    r, rc = weapon.recoil_state, weapon.recoil
    t = r.accum / rc.max_deg
    pitch = rc.max_deg * curve(rc.pattern.pitch, t) * rc.pattern.pitch_factor
    yaw   = rc.max_deg * curve(rc.pattern.yaw, t)   * rc.pattern.yaw_factor
    pitch += r.accum * rc.scatter[1] * 0.3 * r.rand[1]
    yaw   += r.accum * rc.scatter[0] * 0.3 * r.rand[0]
    return pitch, yaw

def tick_recoil(weapon, dt):
    r, rc = weapon.recoil_state, weapon.recoil
    if now() - r.last_shot > rc.recovery_delay_s:
        r.accum = max(0, r.accum - rc.max_deg * dt / rc.recovery_s)
```

The camera follows `view_follow.hip` (or `.ads`) of the barrel offset; the rest shows as the gun pointing off the crosshair. Low view-follow makes a weapon feel heavy and honest: the crosshair stays put while the muzzle climbs away from it. With `view_recovers`, the camera drifts back down as recoil recovers.

`climb_s` spreads each kick over a short time instead of snapping (0 = instant).

### Reading kick numbers

| `kick_deg` per shot | Feel |
|---|---|
| < 0.5 | automatic fire, controlled by the accumulator and pattern |
| 0.5–3 | rifles, shotguns, controllable semi |
| 5–12 | handguns: re-aim between shots |
| 15–40 | magnum revolvers, bolt-action heavies, anti-materiel |

| `max_deg` | Feel |
|---|---|
| 10–25 | stays on target even when emptied |
| 40–60 | climbs out of the target in a long burst |
| 90+ | wild |

## Impulse: the physical push

`impulse_ns` is the momentum each shot throws backwards (projectile + propellant gas, or a device's reaction mass). It does three things.

**1. Scales kick for other wielders.** `kick_deg` is the reference for the default merc. For anyone else, `wielder_scale` = their `kick_deg(...)` below ÷ the reference:

```python
CLIMB_GAIN = 12.0     # degrees of climb per m/s of rearward velocity of gun + hands
HOLD_GRIP_KG = {"one_hand": 1.5, "two_hand": 4, "shouldered": 25, "hip_braced": 40}
BRACING = {"standing": 1, "crouched": 1, "rested": 2, "prone": 2.5, "bipod": 4, "power_armour": 4}

def kick_deg(mode, weapon, hold, bracing="standing", grip_mult=1.0, mount_mass_kg=None):
    grip = mount_mass_kg if mount_mass_kg else HOLD_GRIP_KG[hold] * BRACING[bracing] * grip_mult
    return CLIMB_GAIN * mode.recoil.kick_factor * mode.recoil.impulse_ns / (weapon.physical.mass_kg + grip)
```

`kick_factor` is how much of the impulse turns into muzzle climb: compensators, gas systems, buffers, bore axis and deliberate tuning. Automatic weapons sit at 0.05–0.3 so sustained fire stays controllable; plain handguns near 1; punishing heavy-hitters at 2–3.

**2. Pushes the shooter** when the stance can't soak it:

```python
ABSORB_PER_KG = {"standing": 0.6, "crouched": 0.9, "prone": 1.5, "vehicle": 0.6, "airborne": 0.0}

def absorb_ns(total_mass_kg, stance, gravity, footing=1.0, anchored_ns=0.0):
    return ABSORB_PER_KG[stance] * total_mass_kg * (gravity / 9.81) * footing + anchored_ns

def shooter_push(mode, weapon, shooter):
    m = shooter.mass_kg + weapon.physical.mass_kg
    excess = max(0, mode.recoil.impulse_ns - absorb_ns(m, shooter.stance, env.gravity, shooter.footing, shooter.anchored_ns))
    shooter.velocity -= aim_dir * (excess / m)
```

A standing merc (≈100 kg) soaks ~60 N·s per shot: no handheld small arm moves them on Earth. In zero-g with nothing to hold, every shot pushes (a pistol 0.04 m/s per shot; a handheld minigun is a thruster). Footing: 1 good ground, 0.5 ice or mud, 0 floating.

**3. Tests mounts and vehicles** with the same formula, using the vehicle's mass and `vehicle` absorb: a 120 mm gun (≈30,000 N·s) throws a 2.2 t pickup at ~5 m/s (roll it over if the push is above its tipping speed) and is fully soaked by a 60 t tank.

### Impulse reference

| Shot | `impulse_ns` |
|---|---|
| 9 mm pistol | 3.3 |
| .45 pistol | 4.2 |
| magnum revolver | 8 |
| 5.56 mm rifle | 6 |
| 7.62 mm battle rifle | 12 |
| 12-gauge | 15 |
| .50 anti-materiel | 55 |
| 40 mm grenade | 18 |
| rocket / recoilless | 0–10 (danger is behind you) |
| 30 mm autocannon | 700 |
| 120 mm tank gun | 30,000 |

## Knockback on targets

Same unit, same absorb rule:

```python
def knockback(hit_impulse_ns, target):
    excess = max(0, hit_impulse_ns - absorb_ns(target.mass_kg, target.stance, env.gravity, target.footing))
    target.velocity += hit_dir * (excess / target.mass_kg)
    if excess / target.mass_kg > target.profile.knockdown_speed_mps:
        knock_down(target)
```

A hit's impulse is the payload's `knockback_ns` if set (melee, explosions, shotgun slugs with stagger), otherwise the projectile's own momentum, which for bullets is too small to move anyone standing.

## Adaptation notes

- **2D side-view**: kick is pitch only (muzzle rises); yaw scatter becomes vertical noise. Push and knockback are 2D vectors.
- **Top-down**: there is no pitch. Map kick to a growing aim cone (accumulated kick in degrees = extra spread) and a short screen shake; keep yaw scatter as sideways wander. Push and knockback stay physical.
- **Simple games**: keep `kick_deg`, `max_deg`, `recovery_s` and `hip_mult`; drop impulse unless you have zero-g, mounts or knockback.
