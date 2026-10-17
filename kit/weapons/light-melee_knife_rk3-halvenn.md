---
schema: oma-weapon/1
id: rk3-halvenn
designation: RK3
name: Halvenn
full_name: RK3 Halvenn
maker: Kesh & Darrow Edgeworks
carry_class: light-melee
archetype: knife
tags: [blade, era-modern, one-handed, thrown, charge-up]
summary: Fast combat knife with a wound-up power slash and a bandolier of throwing blades that can be picked back up.
physical:
  mass_kg: 0.3
  length_m: 0.3
  bulk: 1
  hold: melee
handling:
  move_speed_mult: 1.15
  draw_s: 0.18
  holster_s: 0.18
  aimable: false
ammo:
  feed: stack
  magazine: 12
  ammo_type: balanced throwing blades (the knife in hand is not one of them)
durability:
  wear_per_hit: 0.0004
  worn_damage_mult: 0.75
dual_wield:
  allowed: false
  notes: The off hand stays free for climbing, grabbing and throwing.
fire_modes:
  - name: Slash
    trigger: auto
    rpm: 264
    ammo_per_shot: 0
    payload:
      type: melee
      damage: 45
      damage_type: slash
      head_mult: 1.0
      limb_mult: 1.0
      range_m: 2.5
      blockable: true
      lunge: {stop: 1.3, pull_mps: 2.1}
      effects:
        - {type: displace_aim, min_damage: 25, duration_s: 0.45}
    notes: Holding the trigger chains four alternating slashes. No back or flank bonus; that belongs to the prepared slash.
secondary:
  name: Prepared slash
  kind: attack
  trigger: charge
  max_charge_s: 1.36
  rpm: 220
  ammo_per_shot: 0
  payload:
    type: melee
    damage: 75
    damage_type: slash
    head_mult: 1.0
    limb_mult: 1.0
    range_m: 2.5
    blockable: true
    charge_bonus_mult: 2.0
    flank_mult: 1.15
    back_mult: 1.3
    lunge: {stop: 1.7, pull_mps: 2.1}
    effects:
      - {type: displace_aim, min_damage: 25, duration_s: 0.45}
  notes: Hold to draw the blade back, release to strike. Damage climbs linearly to x2 over 1.36 s; a full wind-up from behind deals 195.
weapon_function:
  name: Throw blade
  kind: attack
  trigger: semi
  cooldown_s: 0.55
  ammo_per_shot: 1
  ammo_pool: main
  payload:
    type: thrown
    damage: 50
    damage_type: pierce
    head_mult: 2.5
    limb_mult: 0.75
    speed_mps: 35
    gravity_mult: 1.0
    blockable: false
  notes: Needs at least two blades carried (you never throw the last one). Thrown blades stick in walls and floors for 20 s and in bodies until they fall; walking over one picks it back up.
melee:
  name: Quick slash
  damage: 45
  damage_type: slash
  range_m: 2.5
  interval_s: 0.23
  lunge: {stop: 1.3, pull_mps: 2.1}
  effects:
    - {type: displace_aim, min_damage: 25, duration_s: 0.45}
  notes: Same strike as Primary, so the knife works the same whichever key the player reaches for.
---

# RK3 Halvenn

*Fast combat knife with a wound-up power slash and a bandolier of throwing blades that can be picked back up.*

## Concept

A short, heavy-spined fighting knife. Primary chains quick slashes as long as the trigger is held. Secondary is a prepared slash: hold to wind the blade back, release to cut, with damage doubling over a second and a half and extra damage into an enemy's flank or back, so a patient wielder who gets behind someone can nearly open them up in one stroke. Weapon Function throws one of the balanced blades carried in a chest bandolier; they fly fast and drop quickly, stick wherever they land, and can be collected again.

Every hit that lands hard enough knocks the victim's weapon aside for a moment, which is what makes closing to knife range against a gunman worth the risk.

## Lore

**TYPE:** One-handed fighting knife with a thick spine, a short guard and a ring pommel, sold as a set with a bandolier of twelve skeletonised throwing blades.

**EFFECT:** Cuts through soft armour joints and clothing with little effort. The spine takes prying and hammering without chipping, but the edge does dull with heavy use and needs a stone to stay keen. The throwing blades are weighted to land point-first at short range and little else.

**INTENT:** A frontier workshop's answer to "what do I carry when the gun is empty". Cheap enough to lose, tough enough to keep, and common in every boarding crew, salvage gang and mercenary kit bag that has ever fought in a corridor.

## Controls

| Key | Action | Notes |
|---|---|---|
| Primary | Slash | hold to keep slashing, 264 strikes/min |
| Secondary | Prepared slash | hold to wind up (up to ×2 over 1.36 s), release to strike; ×1.15 from the side, ×1.3 from behind |
| Weapon Function | Throw blade | 50 damage, head ×2.5; 0.55 s between throws; keeps the last blade |
| Fire Mode | — | single mode |
| Reload | — | blades are recovered by walking over them |
| ADS | — | a knife this short can't parry; see design notes |
| Cock | — | nothing to cycle |
| Dual | — | off hand stays free |
| Melee | Quick slash | same strike as Primary |

## Design notes

- **Role**: the always-there backup. Fast to draw (0.18 s), speeds the wielder up (×1.15), never runs dry. The throw gives it a short-range answer to a fleeing or reloading target.
- **The knife's real weapon is the displacement**: any hit of 25+ damage knocks the victim's gun aside for 0.45 s, during which they can't fire or aim. Two quick slashes chain that into a short lockout.
- **Prepared slash vs Slash**: Slash out-damages the prepared slash per second (≈200 vs ≈90 DPS including the wind-up), but the prepared slash front-loads it into one hit, which matters against blocking enemies and for ambushes.
- **Parry (optional)**: a game that wants knife duels can give ADS a block (see the melee doc) with `block_bypass` 0.3; it isn't part of the base design.
- **2D side-view**: Slash is a short horizontal arc at chest height; the prepared slash a lunging thrust; thrown blades arc and stick into tiles.
- **Top-down**: slash arc in the facing direction; backstab bonus uses target facing. Throws are short-range projectiles with a little scatter instead of drop.
- **Durability**: blocks and hits dull the edge; at condition 0 damage is ×0.75.
