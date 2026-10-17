---
schema: oma-weapon/1
id: hv9-corvane
designation: HV9
name: Corvane
full_name: HV9 Corvane
maker: Talmont Arms Concern
carry_class: sidearm
archetype: pistol
tags: [ballistic, era-modern, semi-auto, burst, hitscan, penetrating, dual-wieldable, one-handed, laser-sight]
summary: Hard-kicking heavy-calibre service pistol; a laser tightens its aim, and every shot has to be brought back down onto the target.
physical:
  mass_kg: 1.2
  length_m: 0.22
  bulk: 3
  hold: two_hand
handling:
  move_speed_mult: 1.1
  draw_s: 0.27
  holster_s: 0.27
  draw_and_cock_s: 1.0
  ads_time_s: 0.2
  ads_move_speed_mult: 0.5
  ads_run_instability: 0.1
  zoom: {type: irons, magnification: 1.2}
aim:
  drift_deg: [0.1, 2.23]
  ads_drift_mult: 0.7
  settle_s: 0.82
  moving_settle_mult: 0.67
  pose_shift_s: 0.27
  crouch_mult: 0.7
  view_follow: {hip: 0.05, ads: 1.0}
  chaos:
    full_speed_mps: 29.3
    full_turn_deg_s: 1188
    recovery_s: 0.45
    sprint: 0.4
    jump: 0.2
    fall: 0.4
    dodge: 0.23
    slide: 0.45
    wallrun: 0.45
  jump_kick_deg: [5.5, -2.7]
  flinch_damage: 100
recoil:
  max_deg: 45
  recovery_s: 0.45
  recovery_delay_s: 0.09
  view_follow: {hip: 0.2, ads: 0.3}
  view_recovers: true
  hip_mult: 1.6
  crouch_mult: 0.7
  pattern:
    pitch: [[0, 0], [1, 1]]
    yaw: [[0, 0], [1, 1]]
    pitch_factor: 1.0
    yaw_factor: 0.0
  scatter: [0.25, 0.25]
ammo:
  feed: magazine
  magazine: 12
  reserve: 28
  ammo_type: .45-calibre high-velocity
  reload_s: 1.4
  cock_s: 0.5
  cock_on_draw: true
durability:
  wear_per_shot: 0.0003
  jam: {chance_new: 0.0001, chance_worn: 0.05, curve: 2.0}
  unjam: {method: cock, chance_new: 0.95, chance_worn: 0.4, cooldown_s: 0.6}
dual_wield:
  allowed: true
  mixing: false
  notes: Pairs with another Corvane only. Both lasers switch together.
fire_modes:
  - name: Semi
    trigger: semi
    rpm: 264
    ammo_per_shot: 1
    payload:
      type: hitscan
      damage: 35
      damage_type: ballistic
      head_mult: 3.0
      limb_mult: 0.75
      range_m: [95, 114]
      falloff: {start_m: 0, end_m: 114, min_mult: 0.8}
      spread_deg: 0.02
      penetration: {body: 150, after_body_mult: 0.6, wall_m: 0.46, after_wall_mult: 0.4}
      effects:
        - {type: hit_slow, mult: 0.7, duration_s: 0.09}
    recoil: {impulse_ns: 4.4, kick_factor: 0.993, kick_deg: 10.08}
  - name: Burst
    trigger: burst
    burst_count: 3
    burst_repeats_on_hold: true
    burst_rpm: 352
    burst_cooldown_s: 0.4
secondary:
  name: Laser sight
  kind: toggle
  time_s: 0.18
  modifiers:
    aim.drift_deg: 0.65
    aim.settle_s: 0.65
  notes: The dot is visible to everyone, enemies included. It hides while reloading, sprinting or striking.
weapon_function:
  name: Laser sight
  kind: alias
  alias_of: secondary
melee:
  name: Pistol whip
  damage: 35
  damage_type: blunt
  range_m: 2.67
  interval_s: 0.41
  charge: {max_s: 1.36, bonus_mult: 2.0}
  flank_mult: 1.15
  back_mult: 1.3
  lunge: {stop: 1.7}
  effects:
    - {type: displace_aim, duration_s: 0.27}
variants:
  - designation: HV9b
    name: Corvane Longeye
    summary: Fixed 4x optic in place of the laser; reaches out to the edge of its range, but slow to raise and useless on the run.
    tags_add: [scoped]
    tags_remove: [laser-sight]
    changes:
      handling.zoom: {type: fixed, magnification: 4}
      handling.ads_time_s: 0.32
      handling.ads_run_instability: 0.9
      secondary: null
      weapon_function: null
      dual_wield.mixing: true
      dual_wield.notes: Pairs with any dual-wieldable sidearm; the optic can't be used while paired.
  - designation: HV9c
    name: Corvane Breacher
    summary: Six-shell rotary drum under the barrel fires a 12-pellet blast on Secondary; too front-heavy to pair.
    tags_add: [pellets, underbarrel]
    tags_remove: [laser-sight, dual-wieldable]
    changes:
      handling.ads_time_s: 0.23
      dual_wield: {allowed: false, notes: The support hand works the drum.}
      ammo.extra_pools:
        - {name: drum, used_by: secondary, feed: magazine, magazine: 6, reserve: 12, reload_s: 1.6}
      weapon_function: null
      secondary:
        name: Underbarrel shotgun
        kind: attack
        trigger: semi
        rpm: 94
        ammo_per_shot: 1
        ammo_pool: drum
        payload:
          type: pellets
          damage: 6
          damage_type: ballistic
          pellets: 12
          head_mult: 2.0
          limb_mult: 0.75
          range_m: 95
          falloff: {start_m: 0, end_m: 95, min_mult: 0.75}
          spread_deg: 2.2
          hip_spread_mult: 2.0
          penetration: {body: 100, after_body_mult: 0.75}
          effects:
            - {type: hit_slow, mult: 0.6, duration_s: 0.12}
        recoil: {impulse_ns: 12, kick_factor: 0.102, kick_deg: 2.82}
        notes: Reload refills the pistol magazine first if it is low, then the drum.
---

# HV9 Corvane

*Hard-kicking heavy-calibre service pistol; a laser tightens its aim, and every shot has to be brought back down onto the target.*

## Concept

A full-size pistol firing hot .45-calibre rounds. Each shot hits hard (35, ×3 to the head, so two head hits drop an armoured merc) and punches through a body or a door, but the gun climbs about ten degrees per shot and only part of that moves the view, so the muzzle visibly rises off the crosshair. Firing at the 264 RPM cap empties the climb budget fast; the skill is pacing shots so the climb recovers (about half a second) between them. A three-round burst mode trades that control for a fast stack of damage at close range.

Secondary switches a laser on and off. With the laser on, the hip drift cone is a third smaller and the gun settles faster, which makes hip-shooting while moving viable, at the cost of showing everyone where the shooter is aiming.

## Lore

**TYPE:** Steel-framed semi-automatic pistol with a fixed accessory rail, a heavy slide and a twelve-round extended magazine.

**EFFECT:** High-velocity heavy rounds that defeat light body armour and keep their punch out to a hundred metres. A selector adds a three-round burst for doorway work. The integral laser module runs off a button cell and can be toggled without breaking grip. Recoil is stiff; the frame's weight is what keeps it shootable at all.

**INTENT:** Built as a frontier police and corporate-security sidearm, it found a second life with mercenaries who wanted one pistol that still mattered when the rifle ran dry. Talmont sells it in three factory builds: the standard laser model, an optic-topped marksman's version and a breaching model with a rotary shell drum slung under the barrel.

## Controls

| Key | Action | Notes |
|---|---|---|
| Primary | Fire | 35 damage, head ×3, passes through one body or a thin wall |
| Secondary | Laser on / off | drift cone and settle time ×0.65 while on |
| Weapon Function | Laser on / off | same as Secondary |
| Fire Mode | Semi / Burst | Burst: 3 rounds at 352 RPM, keeps bursting while held |
| Reload | Reload | 1.4 s; arrives uncocked, first draw 1.0 s |
| ADS | Aim | 1.2× irons; kick ×1 instead of ×1.6 from the hip |
| Cock | Rack the slide | clears jams; ejects a live round if not jammed |
| Dual | Pair with a second Corvane | both lasers switch together; each gun kicks harder one-handed |
| Melee | Pistol whip | 35 blunt, hold up to 1.36 s for ×2; knocks the target's weapon aside for 0.27 s |

## Variants

- **HV9b Corvane Longeye.** A fixed 4× optic replaces the laser module, so Secondary and Weapon Function do nothing. Raising the sight takes 0.32 s and running while aiming is close to impossible (0.9). It can pair with other sidearms, but the optic can't be used while paired. Pick it to plink at the end of the pistol's range.
- **HV9c Corvane Breacher.** A six-shell rotary drum under the barrel turns Secondary into a 12-pellet shotgun blast (6 per pellet, 72 total, 94 shots/min) with a separate reserve and its own reload. The extra weight up front slows sighting slightly (0.23 s) and the support hand works the drum, so it can't be dual-wielded. Pick it for corridors and doors.

## Design notes

- **Feel target**: the gun should feel heavy and honest. The view follows only 20 % of the climb from the hip (30 % aimed), so the player watches the muzzle rise and must pull it back down; hip kick is ×1.6. That is the core of its identity.
- **Laser as a real choice**: the laser is a handling buff and a stealth cost. AI should react to a visible dot (look toward it, take cover).
- **Dual-wielding** doubles sustained fire, but at one hand per gun each shot kicks about twice as hard (≈19°), so paired Corvanes are a close-range spray.
- **2D side-view**: kick is pure pitch: the arm and muzzle visibly rise. The laser is a line to the first hit, and the narrower cone is the reward.
- **Top-down**: use the accumulated kick as extra aim cone plus a short camera kick; the laser draws a line on the floor that enemies notice.
- **Balance hooks**: two head hits or six body hits kill a 200 HP merc; falloff only reaches ×0.8 at 114 m, so it stays relevant at mid range for patient shooters.

## Pseudo code

```python
def corvane_shot(gun, w):
    fire_hitscan(gun.mode.payload, rotate(w.view_dir, gun.drift + barrel_offset(gun)))
    kick = gun.mode.recoil.kick_deg * (1.6 if not w.aiming else 1.0) * (0.7 if w.crouched else 1.0)
    gun.recoil_accum = min(gun.recoil_accum + kick, 45)
    w.view_pitch += kick * (0.3 if w.aiming else 0.2)      # the rest shows as the muzzle off the crosshair
```
