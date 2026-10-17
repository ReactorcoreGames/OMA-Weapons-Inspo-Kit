# Unit conversion: BW raw units → kit units

How `tools/extract/to_kit_units.py` turns the canonical stat set (`sources/bw-2.9/extracted/bw_canonical.json`, raw Unreal units) into kit units (`sources/bw-2.9/extracted/bw_kit_units.json`). Every converted block keeps the BW fields it came from under `_raw`, so any kit number can be traced back. Weapon entries in `kit/` never show the raw values; provenance stays private.

Pipeline: `extract_params.py` → `bw_weapon_params.json` + `bw_aux_classes.json` → `merge_canonical.py` → `bw_canonical.json` → `to_kit_units.py` → `bw_kit_units.json`.

```
python tools/extract/extract_params.py sources/bw-2.9/scripts-decompiled-v2 sources/bw-2.9/config-localization sources/bw-2.9/extracted/bw_weapon_params.json
python tools/extract/merge_canonical.py sources/bw-2.9/extracted/bw_weapon_params.json sources/bw-2.9/scripts-decompiled-v2 sources/bw-2.9/extracted/bw_canonical.json docs/research/merge-report.md
python tools/extract/to_kit_units.py sources/bw-2.9/extracted/bw_canonical.json sources/bw-2.9/extracted/bw_aux_classes.json sources/bw-2.9/extracted/bw_kit_units.json
```

## Base constants

| Quantity | BW unit | Kit unit | Conversion | Source |
|---|---|---|---|---|
| Distance | Unreal unit (uu) | m | ÷ 52.5 | BW's own manual strings (`InstantEffectParams.GetStats`: `TraceRange.Max / 52.5` "m") |
| Angle | rotation unit (rot) | deg | × 360 / 65536 | Unreal rotator format |
| Time | game second | real second | ÷ 1.1 | UT2004 `LevelInfo.TimeDilation = 1.1`; BW's manual multiplies fire rates by `DEFAULT_TIME_DILATION = 1.1` (`FireParams.uc`) |
| Speed | uu per game second | m/s | × 1.1 ÷ 52.5 | follows from the two lines above |
| Acceleration | uu/s² | m/s² | × 1.21 ÷ 52.5 | idem |
| Angular rate | rot per game second | deg/s | × 1.1 × 360 / 65536 | idem |
| Momentum / knockback | UT momentum | N·s | × 1.1 ÷ 52.5 | UT applies `momentum / Mass` as velocity change; a UT pawn has `Mass = 100`, read as a 100 kg armoured mercenary with kit |
| Damage | HP | HP | unchanged | Classic numbers kept as-is against the 200 HP merc baseline (CLAUDE.md) |

### Time dilation matters

UT2004 runs its whole simulation 10 % fast (`TimeDilation = 1.1`), so a BW `FireInterval` of 0.08 is 0.0727 real seconds (825 RPM, not 750), and BW's own in-game weapon manual already reports the faster figure. The kit uses **real seconds** everywhere, which makes numbers match what a player experienced. Consequence for the movement baseline in CLAUDE.md: Pro ground speed 315 uu/s is **6.6 m/s** in real time (6.0 m/s if dilation were ignored). CLAUDE.md now quotes the real-time figure.

### Gravity (open point for the environments doc)

UT2004's default gravity is −950 uu/s², which is **21.9 m/s² (2.2 g)** in real time. BW's jump heights, grenade arcs and falling chaos are tuned against that. The kit's default environment is Earth gravity (9.81 m/s²), so anything ballistic (thrown grenades, launcher arcs, jump velocity) has to be re-expressed by **matching range or apex height, not speed** when a weapon entry is written. Example: Pro jump 294 uu/s → 6.16 m/s at 21.9 m/s² gives a 0.87 m apex; the same apex at 1 g needs 4.13 m/s. The converter keeps the raw-converted speed; the per-weapon entry decides. See `kit/core-mechanics/environments.md`.

## Field mapping

Names on the right are the converter's working names; the weapon schema (`kit/core-mechanics/weapon-schema.md`) is the authority for shipped field names.

### Weapon class (`weapon`)

| BW | Kit | Notes |
|---|---|---|
| `BringUpTime`, `PutDownTime` | `draw_s`, `holster_s` | ÷ 1.1 |
| `CockingBringUpTime` | `draw_and_cock_s` | first draw when the weapon arrives uncocked |
| `AIReloadTime` | `reload_hint_s` | **Estimate only.** BW reload length comes from animation length × `ReloadAnimRate`, which lives in the mesh packages, not the scripts. `AIReloadTime` is how long BW tells bots a reload takes; it is the best scripted proxy. Entries mark reload times as estimated. |
| `GunLength` | `gun_length_m` | long-gun wall displacement distance |
| `bShovelLoad`, `ShovelIncrement` | `shell_by_shell`, `shells_per_load` | tube / cylinder loading |
| `bNoMag`, `bNonCocking`, `bCockAfterReload`, `bCockOnEmpty`, `bCanSkipReload` | `no_magazine`, `never_cocks`, `cock_after_reload`, `cock_on_empty`, `reload_interruptible` | |
| class chain contains `BallisticHandgun` | `dual_wieldable` | only handgun-class weapons can pair in BW |
| `MeleeFireClass` defaults | `melee` block | the Melee key's swing is defined on the melee fire class, not in params, and is the same in every ruleset |
| `FireModeClass[i].AmmoClass` → `MaxAmmo`, `InitialAmount` | `reserve_ammo` | reserve carried |

### Layout (`layouts[]`)

| BW | Kit | Notes |
|---|---|---|
| `MagAmmo`, `bMagPlusOne` | `magazine`, `mag_plus_one` | +1 = a round can sit in the chamber on a tactical reload |
| `PlayerSpeedFactor`, `PlayerJumpFactor` | `move_speed_mult`, `jump_mult` | multiplies the wielder's base speed |
| `SightMoveSpeedFactor` | `ads_move_speed_mult` | while aiming |
| `SightingTime` | `ads_time_s` | ÷ 1.1 |
| `InventorySize` | `bulk` | BW inventory slots (1 knife … 16 heaviest cannon). **BW has no weapon mass**: the layout `Weight` field is the random-spawn probability of that layout, not kilograms. Mass is a kit addition (see impulse calibration). |
| `ZoomType`, `MaxZoom`, `MinZoom`, `ZoomStages` | `zoom_type`, `zoom_max`, … | irons / fixed / logarithmic / minimum / smooth |
| `bNeedCock` | `cock_on_draw` | |
| `bDualBlocked`, `bDualMixing` | `dual_blocked`, `dual_mixing` | layout can't be paired / can pair with a different handgun |
| `DisplaceDurationMult` | `displace_time_mult` | how long hits knock this weapon off target |
| `ReloadAnimRate`, `CockAnimRate` | `reload_speed_mult`, `cock_speed_mult` | |

### Recoil (`recoil[]`, from `RecoilParams`)

BW recoil is an accumulating counter in rotation units. Each shot adds its `Recoil` (× stance multipliers), capped at `MaxRecoil`. The counter maps through the pitch/yaw curves into a barrel deflection, plus a random scatter of `±counter × rand_factor × 0.3`. The shot goes where the barrel points. The camera follows only `ViewBindFactor` of the deflection; the rest shows as the gun pointing off the crosshair. After `DeclineDelay` without firing, the counter decays to zero over `DeclineTime × counter / MaxRecoil`.

| BW | Kit | Notes |
|---|---|---|
| fire effect `Recoil` | `recoil_kick_deg` (per mode) | barrel deflection per shot at the ADS baseline; turned into an impulse in the calibration step |
| `MaxRecoil` | `max_deg` | ceiling of accumulated deflection |
| `DeclineTime`, `DeclineDelay`, `ClimbTime` | `recovery_s`, `recovery_delay_s`, `climb_s` | ÷ 1.1; climb is how fast one kick is applied (0 = instant) |
| `ViewBindFactor`, `ADSViewBindFactor` | `view_follow_hip`, `view_follow_ads` | 0 = camera still, gun climbs off the crosshair; 1 = camera takes all of it |
| `HipMultiplier`, `MaxMoveMultiplier`, `CrouchMultiplier` | `hip_mult`, `moving_mult`, `crouch_mult` | kick multipliers; moving scales with speed up to ground speed |
| `PitchFactor`, `YawFactor`, `XCurve`, `YCurve` | `pitch_factor`, `yaw_factor`, `pattern_yaw`, `pattern_pitch` | pattern = [fraction of max recoil, deflection fraction] pairs |
| `XRandFactor`, `YRandFactor`, `MinRandFactor` | `scatter_x`, `scatter_y`, `scatter_floor` | |
| `bViewDecline` | `view_recovers` | camera also returns as recoil decays |

### Aim (`aim[]`, from `AimParams`)

BW "aim" is a **drifting aim offset**: the barrel wanders to a random point inside a cone and re-aims every `AimAdjustTime`. The cone size runs from `AimSpread.Min` (chaos 0) to `AimSpread.Max` (chaos 1). Chaos rises with speed, view turning, jumping, sprinting and falling, and decays over `ChaosDeclineTime`. ADS multiplies the offset by `ADSMultiplier` and drops the minimum to 0. Hits flinch the aim (`AimDamageThreshold` = damage that gives a full flinch). This is separate from per-shot spread (below).

| BW | Kit | Notes |
|---|---|---|
| `AimSpread.Min/Max` | `drift_min_deg`, `drift_max_deg` | half-angle of the drift cone. The kit's hipfire tightening (≈2× vs Classic, weight-scaled) is applied in the hipfire derivation step, not here |
| `ADSMultiplier` | `ads_drift_mult` | |
| `AimAdjustTime`, `VelocityAimAdjustMult` | `settle_s`, `moving_settle_mult` | BW swings to each new drift point over 2 × `AimAdjustTime` × lerp(1, mult, speed fraction); `settle_s` = 2 × `AimAdjustTime` ÷ 1.1, the real swing time at rest |
| `OffsetAdjustTime` | `pose_shift_s` | time to move into the sprint pose and back |
| `CrouchMultiplier` | `crouch_mult` | shrinks drift and speeds chaos recovery while crouched |
| `ChaosSpeedThreshold`, `ChaosTurnThreshold` | `chaos_full_speed_mps`, `chaos_full_turn_deg_s` | speed / turn rate that alone gives full chaos (turning only counts in Classic, which the kit follows) |
| `ChaosDeclineTime`, `ChaosDeclineDelay` | `chaos_recovery_s`, `chaos_recovery_delay_s` | |
| `SprintChaos`, `JumpChaos`, `FallingChaos` | same names | chaos added on sprint start, jump, each re-aim while airborne |
| `SprintOffset`, `JumpOffset` | `sprint_pose_deg`, `jump_kick_deg` | [pitch, yaw] |
| `ViewBindFactor`, `ADSViewBindFactor` | `view_follow_hip`, `view_follow_ads` | how much of the drift the camera shows |

### Fire modes (`modes[]`)

| BW | Kit | Notes |
|---|---|---|
| `WeaponModes[i].ModeID` | `trigger` | `semi`, `burst`, `auto`, `special` (code-defined, e.g. ammo swap, throw style) |
| `WM_Burst` vs `WM_BigBurst` | `burst_repeats_on_hold` | `WM_Burst` keeps bursting while held; `WM_BigBurst` fires one burst per pull |
| `FireInterval` | `interval_s`, `rpm` | ÷ 1.1 |
| `BurstFireRateFactor` | `burst_shot_interval_s`, `burst_cooldown_s` | inside a burst shots come at interval × factor; after it BW waits interval × (1 + n × (1 − factor)), so a burst cycle averages the normal interval |
| `PreFireTime`, `MaxHoldTime` | `windup_s`, `max_charge_s` | |
| `bCockAfterFire` (params or fire class) | `cock_after_shot` | bolt / pump / lever |
| `TargetState` | `code_state` | the fire class switches behaviour in code (e.g. `Scope`, `Shotgun`); the entry writer must read that state |

### Fire effects (`effects[]`)

| BW | Kit | Notes |
|---|---|---|
| effect class | `payload` | `hitscan`, `pellets`, `projectile`, `grenade`, `melee`, `function` (no damage: laser toggle, scope…) |
| `Damage`, `TraceCount`, `HeadMult`, `LimbMult` | `damage`, `pellets`, `head_mult`, `limb_mult` | |
| `TraceRange.Min/Max` | `range_min_m`, `range_max_m` | BW rolls the actual reach between the two each shot |
| `DecayRange`, `RangeAtten` | `falloff_start_m`, `falloff_end_m`, `falloff_min_mult` | linear from 1.0 at start to `min_mult` at end. If BW's `DecayRange.Max` is unset, decay runs from start to max range (BW rule), and the converter writes that out explicitly |
| `Inaccuracy.X/Y`, `SpreadMode` | `shot_spread_deg`, `spread_shape` | per-shot random spread, applied on top of aim drift and recoil. Classic uses it in hip and ADS alike |
| `HipSpreadFactor` | `hip_spread_mult` | shotguns only |
| `PenetrateForce`, `PDamageFactor` | `body_penetration`, `after_body_mult` | a shot passes through a body if `force / (bodies_passed + 1) > random(0, target max HP)` (+ shield), halved for leg and high head hits |
| `PenetrationEnergy`, `WallPDamageFactor` | `wall_penetration_m`, `after_wall_mult` | wall depth in metres of the reference material (rock / default). Other surfaces scale the depth: dirt ×2, wood ×6, ice ×6, plant/snow/glass ×16, metal ×0.33, water ×0.25 (`BallisticInstantFire.SurfaceScale`). Up to 5 walls |
| `PushbackForce` | `shooter_push_mps` | velocity removed from the shooter along the aim (vertical part × 0.25), ground only |
| `MomentumTransfer`, melee `KickForce` | `knockback_ns` | impulse on the target |
| `Heat` | `heat_per_shot` | |
| `HookStopFactor`, `HookPullForce` | `lunge_stop`, `lunge_pull_mps` | melee hits brake the victim and pull them in |
| projectile `Speed`, `MaxSpeed`, `AccelSpeed` | `speed_mps`, `max_speed_mps`, `accel_mps2` | |
| `DamageRadius`, `RadiusFallOffType` | `splash_radius_m`, `splash_falloff` | |
| `MaxDamageGainFactor`, `DamageGainStartTime/EndTime` | `damage_gain_mult`, `damage_gain_start_s/end_s` | damage that grows with flight time |
| grenade `ArmingDelay`, `DetonateDelay`, `*DetonateOn`, `*PlayerImpactType`, `ImpactDamage` | `arming_s`, `fuse_s`, `detonate_*`, `on_body_*`, `impact_damage` | |
| melee `ChargeDamageBonusFactor`, `FlankDamageMult`, `BackDamageMult`, `Fatigue` | `charge_bonus_mult`, `flank_mult`, `back_mult`, `fatigue_per_hit` | |

### Damage-type side effects (`damage_effects`)

BW hangs several mechanics on the damage-type class rather than the weapon. The converter resolves them from `bw_aux_classes.json`:

| BW | Kit | Notes |
|---|---|---|
| `DamageDescription` | `forms` | e.g. Bullet, Slash, Blunt, Shell, Explode, Hazard, Electro, Stab… |
| `bCanBeBlocked`, `BlockPenetration`, `BlockFatiguePenalty` | `blockable`, `block_bypass`, `block_fatigue` | |
| `DisplacementType`, `AimDisplacementDamageThreshold`, `AimDisplacementDuration` | `displaces_aim`, `displace_min_damage`, `displace_s` | a hit that knocks the victim's weapon aside: can't fire or aim for the duration (scaling = longer for bigger hits) |
| `TagMultiplier`, `TagDuration` | `hit_slow_mult`, `hit_slow_s` | brief slow on being hit (BW only enables it in Tactical; the kit treats it as a standard optional effect) |
| `ShieldDamage`, `bIgniteFires`, `bDetonatesBombs`, `VehicleDamageScaling` | `shield_damage`, `ignites`, `detonates_explosives`, `vehicle_damage_mult` | |

### Derived

`dps` = damage × pellets ÷ interval (bursts average to the same rate). `shots_to_kill` against a 100 HP human body, a 200 HP merc body and a 200 HP merc head.

## Known gaps

- **Reload and cock durations** are animation-driven in BW and not in the scripts. Entries use `reload_hint_s` and mark it as an estimate.
- **Spread model**: the converter does not yet apply the kit's hipfire tightening or `ads_run_instability`; that is the hipfire derivation step.
- **Recoil as impulse**: `recoil_kick_deg` is the BW feel target; turning it into `recoil_impulse` (N·s) needs weapon mass and wielder grip, which is the impulse calibration step.
- **Code-defined behaviour** (`code_state`, `special` triggers, per-weapon code such as M806's laser or the Fifty-9's stock) is invisible to the converter. The entry writer reads the weapon's `.uc` files.
