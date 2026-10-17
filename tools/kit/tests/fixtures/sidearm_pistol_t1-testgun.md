---
schema: oma-weapon/1
id: t1-testgun
designation: T1
name: Testgun
full_name: T1 Testgun
maker: Fixture Works
carry_class: sidearm
archetype: pistol
tags: [ballistic, era-modern, semi-auto, burst, dual-wieldable, hitscan]
summary: Validator fixture.
physical: {mass_kg: 1.2, length_m: 0.2, bulk: 3, hold: two_hand}
handling:
  move_speed_mult: 1.1
  draw_s: 0.27
  holster_s: 0.27
  ads_time_s: 0.2
  ads_move_speed_mult: 0.5
  ads_run_instability: 0.1
  zoom: {type: irons, magnification: 1.2}
aim:
  drift_deg: [0.1, 2.2]
  ads_drift_mult: 0.7
  settle_s: 0.41
  view_follow: {hip: 0.05, ads: 1.0}
  chaos: {full_speed_mps: 29.3, full_turn_deg_s: 1188, recovery_s: 0.45, sprint: 0.4, jump: 0.2, fall: 0.4, dodge: 0.23, slide: 0.45, wallrun: 0.45}
  flinch_damage: 100
recoil:
  max_deg: 45
  recovery_s: 0.45
  recovery_delay_s: 0.09
  view_follow: {hip: 0.2, ads: 0.3}
  hip_mult: 1.6
  crouch_mult: 0.7
  pattern: {pitch: [[0, 0], [1, 1]], yaw: [[0, 0], [1, 1]], pitch_factor: 1, yaw_factor: 0}
  scatter: [0.25, 0.25]
ammo: {feed: magazine, magazine: 12, reserve: 42, reload_s: 1.4}
durability:
  wear_per_shot: 0.0004
  jam: {chance_new: 0.0, chance_worn: 0.06}
  unjam: {method: cock, chance_new: 0.95, chance_worn: 0.35, cooldown_s: 0.6}
dual_wield: {allowed: true}
fire_modes:
  - name: Semi
    trigger: semi
    rpm: 264
    ammo_per_shot: 1
    payload: {type: hitscan, damage: 35, damage_type: ballistic, range_m: [95, 114]}
    recoil: {impulse_ns: 4.2, kick_factor: 1.04, kick_deg: 10.08}
  - name: Burst
    trigger: burst
    burst_count: 3
    burst_repeats_on_hold: true
    burst_rpm: 352
    burst_cooldown_s: 0.4
secondary:
  name: Laser
  kind: toggle
  modifiers: {aim.drift_deg: 0.65, aim.settle_s: 0.65}
melee: {name: Whip, damage: 35, damage_type: blunt, range_m: 2.7, interval_s: 0.41}
variants:
  - designation: T1b
    name: Testgun Scoped
    summary: Scoped.
    changes:
      handling.zoom: {type: fixed, magnification: 4}
      fire_modes[Burst].rpm: 300
      ammo.magazine: 8
---

# T1 Testgun

*Validator fixture.*

## Concept
x
## Lore
x
## Controls

| Key | Action | Notes |
|---|---|---|
| Primary | Fire | |
| Secondary | Laser | |
| Weapon Function | — | |
| Fire Mode | Semi / Burst | |
| Reload | Reload | |
| ADS | Aim | |
| Cock | Cock | |
| Dual | Pair | |
| Melee | Whip | |

## Variants
x
## Design notes
x
