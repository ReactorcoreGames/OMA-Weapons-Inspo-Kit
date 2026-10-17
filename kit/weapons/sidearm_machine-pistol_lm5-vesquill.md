---
schema: oma-weapon/1
id: lm5-vesquill
designation: LM5
name: Vesquill
full_name: LM5 Vesquill
maker: Lukash Field Mechanics
carry_class: sidearm
archetype: machine-pistol
tags: [ballistic, blade, era-modern, semi-auto, burst, full-auto, hitscan, dual-wieldable, one-handed, bladed, stock-toggle]
summary: Buzzing 900-RPM machine pistol with an underslung blade and a folding stock; murderous up close, hopeless past a room's length.
physical:
  mass_kg: 2.2
  length_m: 0.3
  bulk: 3
  hold: two_hand
handling:
  move_speed_mult: 1.1
  draw_s: 0.45
  holster_s: 0.36
  ads_time_s: 0.23
  ads_move_speed_mult: 0.5
  ads_run_instability: 0.25
  zoom: {type: irons, magnification: 1.2}
aim:
  drift_deg: [0.47, 3.73]
  ads_drift_mult: 0.7
  settle_s: 0.82
  moving_settle_mult: 0.67
  pose_shift_s: 0.27
  crouch_mult: 0.8
  view_follow: {hip: 0.05, ads: 1.0}
  chaos:
    full_speed_mps: 25.1
    full_turn_deg_s: 792
    recovery_s: 0.55
    sprint: 0.4
    jump: 0.2
    fall: 0.4
    dodge: 0.26
    slide: 0.53
    wallrun: 0.53
  jump_kick_deg: [5.5, -2.7]
  flinch_damage: 100
recoil:
  max_deg: 45
  recovery_s: 0.73
  recovery_delay_s: 0.27
  view_follow: {hip: 0.2, ads: 1.0}
  view_recovers: true
  hip_mult: 1.0
  crouch_mult: 0.8
  pattern:
    pitch: [[0, 0], [0.1, 0.2], [0.2, 0.5], [0.4, 0.65], [0.6, 0.8], [1, 1]]
    yaw: [[0, 0], [0.2, 0.1], [0.4, 0], [0.6, 0.2], [0.8, 0.4], [1, 0.2]]
    pitch_factor: 1.0
    yaw_factor: 1.0
  scatter: [0.4, 0.4]
ammo:
  feed: magazine
  magazine: 45
  reserve: 100
  ammo_type: light pistol-calibre
  reload_s: 1.0
  cock_s: 0.6
  cock_on_draw: true
  cock_on_empty: true
durability:
  wear_per_shot: 0.0005
  jam: {chance_new: 0.0002, chance_worn: 0.08, curve: 2.0}
  unjam: {method: cock, chance_new: 0.9, chance_worn: 0.35, cooldown_s: 0.7}
dual_wield:
  allowed: true
  mixing: true
  notes: Pairs with any dual-wieldable sidearm. Weapon Function folds or unfolds both stocks; the blades stay usable with Melee.
fire_modes:
  - name: Auto
    trigger: auto
    rpm: 916
    ammo_per_shot: 1
    payload:
      type: hitscan
      damage: 19
      damage_type: ballistic
      head_mult: 3.5
      limb_mult: 0.75
      range_m: 95
      falloff: {start_m: 0, end_m: 95, min_mult: 0.6}
      spread_deg: 0.18
      penetration: {body: 135, after_body_mult: 0.6, wall_m: 0.31, after_wall_mult: 0.4}
      effects:
        - {type: hit_slow, mult: 0.7, duration_s: 0.09}
    recoil: {impulse_ns: 3.0, kick_factor: 0.0606, kick_deg: 0.352}
  - name: Semi
    trigger: semi
  - name: Burst
    trigger: burst
    burst_count: 3
    burst_repeats_on_hold: false
    burst_rpm: 916
    burst_cooldown_s: 0.07
  - name: Burst 5
    trigger: burst
    burst_count: 5
    burst_repeats_on_hold: true
    burst_rpm: 1412
    burst_cooldown_s: 0.18
    notes: Five rounds in 0.17 s, a short pause, and again while the trigger is held.
secondary:
  name: Underslung blade
  kind: attack
  trigger: auto
  rpm: 132
  ammo_per_shot: 0
  payload:
    type: melee
    damage: 55
    damage_type: slash
    head_mult: 1.0
    limb_mult: 1.0
    range_m: 2.86
    blockable: true
    lunge: {stop: 1.7, pull_mps: 2.1}
    effects:
      - {type: displace_aim, min_damage: 40, duration_s: 0.45}
  notes: Hold to keep slashing with the blade under the muzzle. No backstab bonus.
weapon_function:
  name: Folding stock
  kind: toggle
  time_s: 0.4
  modifiers:
    recoil.pattern.pitch_factor: 0.8
    recoil.pattern.yaw_factor: 0.8
    recoil.scatter: 0.8
    recoil.crouch_mult: 0.8
    aim.drift_deg: 1.2
    aim.settle_s: 1.5
    aim.chaos.recovery_s: 1.2
    aim.crouch_mult: 0.7
    handling.ads_time_s: 1.5
  notes: Starts folded. Unfolded, the climb is a fifth smaller and the sight picture much steadier, but the gun is clumsier from the hip and slower to the eye. Switching drops the sights.
melee:
  name: Blade swipe
  damage: 55
  damage_type: slash
  range_m: 2.86
  interval_s: 0.45
  lunge: {stop: 1.7, pull_mps: 2.1}
  effects:
    - {type: displace_aim, min_damage: 40, duration_s: 0.45}
  notes: The same blade as Secondary.
variants:
  - designation: LM5b
    name: Vesquill Chatter
    summary: Bladeless, laser-equipped build with a fixed stock and a faster 1,100 RPM bolt, limited to semi and five-round bursts.
    tags_add: [laser-sight]
    tags_remove: [blade, bladed, full-auto, stock-toggle]
    changes:
      fire_modes:
        - name: Burst
          trigger: burst
          burst_count: 5
          burst_repeats_on_hold: false
          burst_rpm: 1101
          burst_cooldown_s: 0.055
          rpm: 1101
          ammo_per_shot: 1
          payload:
            type: hitscan
            damage: 19
            damage_type: ballistic
            head_mult: 3.5
            limb_mult: 0.75
            range_m: 95
            falloff: {start_m: 0, end_m: 95, min_mult: 0.6}
            spread_deg: 0.18
            penetration: {body: 135, after_body_mult: 0.6, wall_m: 0.31, after_wall_mult: 0.4}
            effects:
              - {type: hit_slow, mult: 0.7, duration_s: 0.09}
          recoil: {impulse_ns: 3.0, kick_factor: 0.0606, kick_deg: 0.352}
        - name: Semi
          trigger: semi
      aim.drift_deg: [0.56, 4.48]
      aim.settle_s: 1.23
      aim.chaos.recovery_s: 0.65
      aim.crouch_mult: 0.56
      recoil.pattern.pitch_factor: 0.8
      recoil.pattern.yaw_factor: 0.8
      recoil.scatter: [0.32, 0.32]
      recoil.crouch_mult: 0.64
      handling.ads_time_s: 0.34
      secondary: {name: Aim, kind: alias, alias_of: ads}
      weapon_function:
        name: Laser sight
        kind: toggle
        time_s: 0.18
        modifiers: {aim.drift_deg: 0.65, aim.settle_s: 0.75}
        notes: The dot is visible to everyone.
      melee:
        name: Stock butt
        damage: 35
        damage_type: blunt
        range_m: 2.4
        interval_s: 0.45
        effects:
          - {type: displace_aim, duration_s: 0.27}
  - designation: LM5c
    name: Vesquill Hush
    summary: Integrally suppressed, bladeless build with the stock fixed folded; slower 825 RPM bolt and softer kick, no flash and little noise.
    tags_add: [stealth]
    tags_remove: [blade, bladed, stock-toggle]
    changes:
      fire_modes[Auto].rpm: 825
      fire_modes[Auto].recoil: {impulse_ns: 2.7, kick_factor: 0.0606, kick_deg: 0.317}
      fire_modes[Burst].burst_rpm: 825
      fire_modes[Burst].burst_cooldown_s: 0.073
      fire_modes[Burst 5].burst_rpm: 1269
      fire_modes[Burst 5].burst_cooldown_s: 0.2
      handling.ads_time_s: 0.25
      secondary: {name: Aim, kind: alias, alias_of: ads}
      weapon_function: null
      melee:
        name: Muzzle jab
        damage: 30
        damage_type: blunt
        range_m: 2.3
        interval_s: 0.45
        effects:
          - {type: displace_aim, duration_s: 0.27}
        notes: Jabbing with the suppressor can wear it; design choice for games with attachment durability.
---

# LM5 Vesquill

*Buzzing 900-RPM machine pistol with an underslung blade and a folding stock; murderous up close, hopeless past a room's length.*

## Concept

A compact open-frame machine pistol that empties a 45-round magazine in three seconds. Each round is light (19 damage) and falls off to 60 % by 95 m, but a head hit triples it and the sheer rate shreds anything inside a room. Per-shot kick is tiny; the climb comes from the accumulator, which bends up and drifts sideways in a fixed shape the longer the trigger is held, so short controlled bursts stay on target and long ones walk away from it.

Four fire modes: full auto (default), semi, a three-round burst per pull, and a repeating five-round burst. A blade under the muzzle turns Secondary into continuous slashes that knock weapons aside. Weapon Function unfolds a wire stock: steadier recoil and sight picture for mid-range work, clumsier from the hip.

## Lore

**TYPE:** Stamped-steel machine pistol with a top-mounted charging handle, a forward-folding wire stock, a 45-round double-stack magazine and a fixed blade welded under the muzzle.

**EFFECT:** High cyclic rate of light pistol rounds that chew through unarmoured targets and soft cover at close range. Accuracy collapses beyond a few dozen metres. The blade is a crude but sharp chopping edge for when the magazine runs dry in someone's face. The open action collects grit and needs regular cleaning, or it starts to stutter.

**INTENT:** Built by a field-repair outfit to arm convoy crews and station security with something small that could clear a corridor. Copied, modified and sold on so many times that every one seems slightly different; the factory still offers a laser-and-stock "chatter" build for organised outfits and a quiet suppressed model for people who prefer not to be heard.

## Controls

| Key | Action | Notes |
|---|---|---|
| Primary | Fire | 19 damage, 916 RPM in auto, head ×3.5 |
| Secondary | Blade slash | hold to keep slashing, 55 damage; hits of 40+ knock the target's weapon aside |
| Weapon Function | Fold / unfold stock | 0.4 s; unfolded: climb ×0.8, steadier sights, hip cone ×1.2, ADS ×1.5 slower |
| Fire Mode | Auto / Semi / Burst / Burst 5 | Burst: 3 per pull; Burst 5: repeats while held |
| Reload | Reload | 1.0 s; needs a cock after running dry |
| ADS | Aim | 1.2× irons; camera takes all the climb while aimed |
| Cock | Charging handle | clears jams; needed after draw and after an empty magazine |
| Dual | Pair with another sidearm | mixed pairs allowed; both stocks fold together |
| Melee | Blade swipe | same blade as Secondary |

## Variants

- **LM5b Vesquill Chatter.** No blade; the stock is fixed open (steadier, slower to aim) and a laser sits on the rail (Weapon Function: drift ×0.65, settle ×0.75 while on). The bolt runs faster at 1,100 RPM, but the selector only offers five-round bursts (one per pull, default) and semi. Secondary works as an aim button. Melee is a stock butt-stroke. Pick it to fight at mid range with bursts instead of hosing.
- **LM5c Vesquill Hush.** No blade and no stock, but an integral suppressor: no muzzle flash, quiet shots, a slower 825 RPM bolt and slightly softer kick (impulse 2.7 N·s). Same four modes. Secondary works as an aim button; Melee is a muzzle jab. Pick it for ambushes and stealth.

## Design notes

- **Feel target**: a buzzsaw. Damage per second (≈290 sustained) beats most rifles inside 20 m; the price is magazine time (under 3 s), poor reach and a fast-wandering climb pattern.
- **Recoil pattern**: the pitch curve rises fast over the first fifth of the accumulator, then flattens; yaw wobbles right then swings back. Players learn to pull down and slightly left. In ADS the camera follows all of it, so it reads as screen climb; from the hip the gun climbs off the crosshair instead.
- **Stock toggle** is a real trade, not an upgrade: unfolded is better for aimed bursts at 15–30 m, folded is better for hip-spraying while moving.
- **Dual-wielding** two Vesquills is the "lobby shootout" fantasy: ~1,800 RPM combined and two blades for Melee, at the cost of hip-only aim (no sights while paired).
- **Burst 5** auto-repeats; the plain Burst needs a pull per burst. Keep both: the first suits panic, the second discipline.
- **2D side-view**: render the pattern as an upward, slightly wavering arc; the blade is a forward stab-slash at gun height.
- **Top-down**: turn the accumulated climb into a widening yaw cone and keep the sideways wobble from the yaw curve.
- **Durability**: the open action wears quickly (0.0005 per shot); a worn Vesquill jams often and clearing it takes longer (0.7 s cooldown).

## Pseudo code

```python
def toggle_stock(gun):
    gun.stock_open = not gun.stock_open
    drop_sights(gun, for_s=0.4)
    m = gun.weapon_function.modifiers
    for path, mult in m.items():
        set_field(gun.live, path, get_field(gun.base, path) * (mult if gun.stock_open else 1.0))
```
