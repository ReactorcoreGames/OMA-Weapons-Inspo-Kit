# Weapon schema

Every weapon is one Markdown file in `weapons/`: a YAML front-matter block with all stats, then prose. This document defines every field. `validate.py` enforces it, and the catalog browser shows the same warnings.

Schema id: `oma-weapon/1`.

## Conventions

- **Units are in the field name.** `_s` seconds, `_m` metres, `_deg` degrees, `_kg` kilograms, `_ns` newton-seconds, `_mps` m/s, `_mps2` m/s², `_deg_s` degrees per second, `_mult` dimensionless multiplier (1.0 = unchanged), `rpm` rounds per minute. Damage is in hit points (HP) with no suffix. Fields without a suffix are counts, fractions (0–1 by meaning, never clamped) or words.
- **No caps.** Typical ranges below describe the original catalog, not limits. Push any number past them when modding. The only hard rules are physical sense: masses, times and distances are not negative.
- **Real time.** All durations are real seconds. Rates are per real second.
- **Default wielder.** Every handling number describes a trained mercenary in body armour (200 HP, 100 kg with kit) on Earth gravity. Other wielders, mounts and environments change outcomes through the formulas in the core-mechanics docs, not through the weapon file.
- **Inheritance inside a file.** Each fire mode after the first inherits every field it doesn't set from the first mode. Each variant is a patch on the base weapon (see [Variants](#variants)).
- **Custom fields** start with `x_` (`x_my_engine_id: 42`) and are allowed at any level; the validator skips them. Anything else it doesn't know is reported as a probable typo.
- **Optional means omit.** Leave a field out instead of writing `null`. A missing optional field means "doesn't apply" or "use the default given here".

## File layout

```
weapons/<carry_class>_<archetype>_<designation>-<name>.md
```

All lowercase, spaces become hyphens, other punctuation is dropped: `full_name` "P7 Kiraric", carry class `sidearm`, archetype `pistol` → `sidearm_pistol_p7-kiraric.md`.

```markdown
---
<front matter>
---

# <full_name>

*<summary>*

## Concept
## Lore
## Controls
## Variants          (required when the file has variants)
## Design notes
## Pseudo code       (optional: only where prose can't carry the idea)
```

**Controls** is a table with exactly these nine rows, in this order: Primary, Secondary, Weapon Function, Fire Mode, Reload, ADS, Cock, Dual, Melee. Columns: `Key | Action | Notes`. Write "—" for a key that does nothing, and say so in Notes if the absence matters (e.g. "can't be dual-wielded: two hands needed").

## Identity

| Field | Type | Req | Meaning |
|---|---|---|---|
| `schema` | string | yes | `oma-weapon/1` |
| `id` | slug | yes | `<designation>-<name>` lowercase, unique in the catalog, e.g. `p7-kiraric` |
| `designation` | string | yes | maker's model code: letters, digits, hyphens, e.g. `P7`, `KR-55`, `Q2` |
| `name` | string | yes | the weapon's name, e.g. `Kiraric` |
| `full_name` | string | yes | `<designation> <name>` exactly |
| `maker` | string | yes | manufacturer, workshop or culture that builds it |
| `carry_class` | enum | yes | see [Carry classes](#carry-classes) |
| `archetype` | slug | yes | what kind of weapon, e.g. `pistol`, `machine-pistol`, `knife`. See [Archetypes](#archetypes) |
| `tags` | list of tags | yes | filter vocabulary, see [Tags](#tags). At least one damage-form tag and one era tag |
| `summary` | string | yes | one line, ≤ 160 characters, what it is and why you'd pick it |

### Carry classes

| Class | Meaning |
|---|---|
| `sidearm` | one-handed-capable gun, usually dual-wieldable, carried as a backup |
| `light-melee` | one-handed melee weapon, often dual-wieldable or paired with a gun |
| `primary` | two-handed main gun |
| `heavy-melee` | two-handed melee weapon |
| `heavy` | launchers, heavy machine guns, beam cannons, detachable vehicle weapons: slows the carrier a lot |
| `throwable` | grenades, throwing weapons, consumed on use |
| `placeable` | mines, charges, turrets, tripwires: deployed into the world |
| `utility` | designators, healing, ammo, shields, barricades: support first, damage second |

### Archetypes

Recommended list (others are allowed but give a warning so the catalog stays consistent): `knife`, `sword`, `axe`, `hammer`, `polearm`, `fist`, `shield`, `pistol`, `revolver`, `machine-pistol`, `smg`, `pdw`, `carbine`, `assault-rifle`, `battle-rifle`, `marksman-rifle`, `sniper-rifle`, `anti-materiel-rifle`, `shotgun`, `lmg`, `hmg`, `minigun`, `grenade-launcher`, `rocket-launcher`, `flamethrower`, `beam`, `railgun`, `plasma-rifle`, `plasma-cannon`, `crossbow`, `grenade`, `mine`, `charge`, `turret`, `designator`, `medical`, `ammo-supply`, `barricade`, `autocannon`, `cannon`.

### Tags

Lowercase slugs. Free tags are allowed with an `x-` prefix (`x-my-studio-thing`); anything else must come from these lists.

| Group | Tags |
|---|---|
| Damage form (≥ 1) | `ballistic`, `blade`, `blunt`, `explosive`, `incendiary`, `plasma`, `laser`, `electric`, `cryo`, `chemical`, `toxic`, `sonic`, `kinetic`, `radiation`, `non-lethal` |
| Era (≥ 1) | `era-historic`, `era-modern`, `era-near-future`, `era-far-future`, `era-alien` |
| Fire control | `semi-auto`, `burst`, `full-auto`, `bolt-action`, `pump-action`, `lever-action`, `break-action`, `single-shot`, `charge-up`, `continuous` |
| Payload | `hitscan`, `pellets`, `projectile`, `beam`, `thrown`, `splash`, `penetrating`, `ricochet`, `homing`, `lock-on`, `guided`, `bouncing`, `sticky`, `timed-fuse`, `remote-detonation`, `area-denial` |
| Handling | `dual-wieldable`, `one-handed`, `two-handed`, `scoped`, `variable-zoom`, `laser-sight`, `suppressible`, `underbarrel`, `bladed`, `stock-toggle`, `bipod`, `shell-loading`, `overheats`, `self-damage`, `slows-carrier` |
| Role | `deployable`, `utility`, `healing`, `support`, `designator`, `detachable-vehicle-weapon`, `stealth` |

Era tags are what a period game filters on: `era-modern` means believable today, `era-near-future` is plausible extrapolation (railguns, smart rounds), `era-far-future` is clearly sci-fi (plasma, energy blades), `era-alien` is non-human technology.

## Physical (`physical`)

| Field | Type | Req | Meaning | Typical |
|---|---|---|---|---|
| `mass_kg` | number | yes | loaded weight | knife 0.3, pistol 1.2, rifle 3.8, minigun 18+ |
| `length_m` | number | yes | overall length; drives wall displacement (a gun this long is pushed off-line near walls) | pistol 0.2, rifle 0.9 |
| `bulk` | number | yes | inventory space, in slots (1 knife … 16 heaviest) | 1–16 |
| `hold` | enum | yes | `one_hand`, `two_hand`, `shouldered`, `hip_braced`, `melee` (see `recoil.md`) | |

## Handling (`handling`)

| Field | Type | Req | Meaning | Typical |
|---|---|---|---|---|
| `move_speed_mult` | number | yes | wielder's movement speed multiplier while carrying it in hand | 0.65–1.15 |
| `jump_mult` | number | no (1.0) | jump height multiplier | |
| `draw_s`, `holster_s` | number | yes | time to bring up / put away | 0.2–0.7 |
| `draw_and_cock_s` | number | no | first draw when it arrives uncocked (includes cocking) | |
| `ads_time_s` | number | yes for aimable weapons | time to raise to the sights | 0.15–0.9 |
| `ads_move_speed_mult` | number | yes for aimable weapons | movement multiplier while aiming at walking pace | 0.5–0.9 |
| `ads_run_instability` | number | yes for aimable weapons | 0 = steady aiming while running … 1 = can't aim while running (drops to low-ready, trigger still works). See `ads-and-scopes.md` | 0–1 |
| `zoom` | map | yes for aimable weapons | `type`: `irons` (slight zoom), `fixed`, `variable`, `smooth`; `magnification` (irons ≈ 1.2–1.35); `min_magnification` and `steps` for variable | |
| `aimable` | bool | no (true) | false for weapons with no aim system (most melee, thrown knives use their own) | |

## Aim (`aim`)

The barrel drifts inside a cone that widens with **chaos** (0–1). Chaos rises with speed, turning, jumping, sprinting, falling, dodging, sliding and wall-running, and decays over time. See `aim-spread-chaos.md`.

| Field | Type | Req | Meaning | Typical |
|---|---|---|---|---|
| `drift_deg` | [min, max] | yes | half-angle of the hip drift cone at chaos 0 and 1 | pistol [0.1, 2.2], rifle [0.05, 7.6] |
| `ads_drift_mult` | number | yes | ADS multiplies the cone by this and drops the minimum to 0 | 0.5–0.9 |
| `settle_s` | number | yes | time the barrel takes to swing to each new drift point, standing | 0.6–1.2 |
| `moving_settle_mult` | number | no (0.67) | settle time multiplier at full ground speed | |
| `pose_shift_s` | number | no (0.27) | time to move into and out of the sprint pose | |
| `crouch_mult` | number | no (0.8) | cone multiplier while crouched; also speeds chaos recovery | 0.6–0.9 |
| `view_follow` | {hip, ads} | yes | fraction of drift the camera shows (0 = only the gun moves) | hip 0.05, ads 1.0 |
| `chaos.full_speed_mps` | number | yes | ground speed that alone gives chaos 1 | 10–30 |
| `chaos.full_turn_deg_s` | number | yes | view turn rate that alone gives chaos 1 | 600–1200 |
| `chaos.recovery_s` | number | yes | time for chaos to fall from 1 to 0 | 0.3–2 |
| `chaos.recovery_delay_s` | number | no (0) | wait after the last chaos event | |
| `chaos.sprint`, `jump`, `fall`, `dodge`, `slide`, `wallrun` | number | yes | chaos added per event (`fall` per re-aim while airborne) | 0.1–0.8 |
| `jump_kick_deg` | [pitch, yaw] | no | barrel offset on take-off | |
| `sprint_pose_deg` | [pitch, yaw] | no | low-ready angle while sprinting | |
| `flinch_damage` | number | yes | damage taken in one hit that fully knocks the aim | 100 |

## Recoil (`recoil`)

Per-shot impulse lives in each fire mode; this block is the weapon's recoil handling. See `recoil.md`.

| Field | Type | Req | Meaning | Typical |
|---|---|---|---|---|
| `max_deg` | number | yes | ceiling of accumulated barrel climb | 10–90 |
| `recovery_s` | number | yes | time to recover from `max_deg` (proportional below it) | 0.3–2 |
| `recovery_delay_s` | number | yes | wait after the last shot before recovery starts | 0.05–0.3 |
| `climb_s` | number | no (0) | time over which one kick is applied (0 = instant) | |
| `view_follow` | {hip, ads} | yes | fraction of climb the camera takes; the rest shows as the gun pointing off the crosshair | hip 0.2, ads 0.3–1 |
| `view_recovers` | bool | no (true) | camera returns as recoil recovers | |
| `hip_mult` | number | yes | kick multiplier from the hip | 1.0–1.6 |
| `moving_mult` | number | no (1.0) | kick multiplier at full ground speed | |
| `crouch_mult` | number | yes | kick multiplier while crouched | 0.6–0.9 |
| `pattern` | map | yes | `pitch` and `yaw`: lists of [accumulated fraction, deflection fraction] points; `pitch_factor`, `yaw_factor` scale them | |
| `scatter` | [x, y] | yes | random sideways / vertical scatter as a fraction of accumulated recoil | 0.05–0.5 |
| `scatter_floor` | number | no (0) | scatter never drops below this fraction of `max_deg` | |

## Ammo (`ammo`)

| Field | Type | Req | Meaning |
|---|---|---|---|
| `feed` | enum | yes | `magazine`, `cylinder`, `tube` (shell by shell), `belt`, `cell` (energy pack), `fuel`, `charge` (regenerating), `stack` (throwables carried as count), `none` (melee) |
| `magazine` | number | yes unless `feed: none` | rounds per load (for `stack`: how many can be carried) |
| `chamber_plus_one` | bool | no (false) | tactical reload keeps a round chambered |
| `reserve` | number | no | default carried reserve |
| `ammo_type` | string | no | free description, e.g. ".45 high-velocity", "fuel canister" |
| `reload_s` | number | yes unless `feed: none`/`stack` | full reload time |
| `reload_empty_s` | number | no (= `reload_s`) | reload from empty, if different |
| `shells_per_load` | number | `tube` only | rounds inserted per load cycle |
| `reload_interruptible` | bool | no (false) | firing cancels the reload (tube feeds) |
| `cock_s` | number | no | time for a manual cock / charge / rack |
| `cock_on_draw` | bool | no (false) | arrives uncocked |
| `cock_after_reload` | bool | no (false) | needs a cock after every reload |
| `cock_on_empty` | bool | no (false) | needs a cock after running dry |
| `extra_pools` | list | no | separate ammo for another function, each `{name, used_by, magazine, reserve, reload_s}` (e.g. an underbarrel shotgun's drum) |

## Durability and jamming (`durability`)

Standard feature: every gun and melee weapon wears and every gun can jam. Condition runs from 1.0 (new) to 0.0 (wrecked). See `durability-and-jamming.md` for formulas and the reliability table.

| Field | Type | Req | Meaning | Typical |
|---|---|---|---|---|
| `wear_per_shot` | number | yes for guns | condition lost per shot | 0.0001–0.002 |
| `wear_per_hit` | number | yes for melee | condition lost per melee hit or block | 0.0005–0.003 |
| `jam.chance_new` | number | yes for guns | chance per shot at condition 1 | 0–0.001 |
| `jam.chance_worn` | number | yes for guns | chance per shot at condition 0 | 0.02–0.15 |
| `jam.curve` | number | no (2.0) | exponent: higher keeps a worn weapon reliable for longer | 1–4 |
| `unjam.method` | enum | yes for guns | `cock`, `reload`, `cock_and_reload`, `fire` (next pull clears it), `vent` (energy: purge) |
| `unjam.chance_new` | number | yes for guns | chance one unjam attempt works at condition 1 | 0.8–1 |
| `unjam.chance_worn` | number | yes for guns | chance at condition 0 | 0.2–0.5 |
| `unjam.cooldown_s` | number | yes for guns | minimum time between attempts | 0.4–1.5 |
| `unjam.wastes_round` | bool | no (true) | clearing ejects the jammed round |
| `worn_damage_mult` | number | no (1.0) | damage multiplier at condition 0 (blades dull, coils degrade) | |

## Heat (`heat`, optional)

Heat is a fraction of the overheat threshold: 1.0 = overheated. Not capped: weapons can run past 1.0 if `overheat.mode` allows it.

| Field | Type | Meaning |
|---|---|---|
| `per_shot` | number | heat added per shot (or per second for continuous fire) |
| `cool_per_s` | number | heat removed per second once cooling starts |
| `cool_delay_s` | number | wait after firing before cooling starts |
| `overheat.mode` | enum | `lockout` (can't fire until cooled to `resume_at`), `self_damage` (keeps firing, hurts the wielder), `jam`, `boost` (hotter = stronger, see notes) |
| `overheat.resume_at` | number | heat level that ends a lockout |
| `overheat.self_damage` | number | HP per shot fired above 1.0 |
| `effects_by_heat` | list | `[{at, field, mult}]` multipliers that ramp in with heat (e.g. spread grows, damage grows) |

## Dual wield (`dual_wield`)

| Field | Type | Req | Meaning |
|---|---|---|---|
| `allowed` | bool | yes | can be paired |
| `mixing` | bool | no (false) | can pair with a different dual-wieldable weapon |
| `hold` | enum | no (`one_hand`) | hold used per weapon while paired (recoil uses it) |
| `notes` | string | no | what changes when paired (ADS becomes a tighter grip, functions apply to both…) |

## Fire modes (`fire_modes`)

A list. The **Fire Mode** key cycles through it in order; the first entry is the default. Each later mode inherits every field it doesn't set from the first.

| Field | Type | Req | Meaning |
|---|---|---|---|
| `name` | string | yes | as shown to the player: "Semi", "Burst", "Slug", "Charged throw" |
| `trigger` | enum | yes | `semi`, `burst`, `auto`, `charge` (hold to charge, release to fire), `hold` (fires continuously while held: beams, flamers), `special` (described in notes) |
| `burst_count` | number | `burst` | shots per burst |
| `burst_repeats_on_hold` | bool | `burst` | holding the trigger keeps firing bursts (else one burst per pull) |
| `rpm` | number | yes | sustained rate; `interval_s` = 60 / rpm |
| `burst_rpm` | number | `burst` | rate inside a burst |
| `burst_cooldown_s` | number | `burst` | pause after a burst; usually chosen so a full burst cycle averages out to `rpm` |
| `ammo_per_shot` | number | yes | |
| `windup_s` | number | no | delay between pull and first shot (spin-up, charge) |
| `max_charge_s` | number | `charge` | hold time for full charge |
| `cock_after_shot` | bool | no | manual action after every shot (bolt, pump, lever) |
| `cock_s` | number | with `cock_after_shot` | time of that action |
| `payload` | map | yes | what leaves the weapon, see below |
| `recoil` | map | yes for guns | `impulse_ns`, `kick_factor`, `kick_deg` (see below) |
| `notes` | string | no | anything code-like the numbers don't say |

### Per-shot recoil (`fire_modes[].recoil`)

| Field | Meaning | Typical |
|---|---|---|
| `impulse_ns` | momentum thrown backwards per shot; drives shooter push, zero-g drift, mount stability | 9 mm 3.3, rifle 6, shotgun 15, .50 55 |
| `kick_factor` | how much impulse becomes muzzle climb (compensators, gas systems, tuning) | autos 0.05–0.3, handguns ~1, bolt heavies 2–3 |
| `kick_deg` | reference climb per shot for the default wielder, ADS, standing: `12 × kick_factor × impulse_ns / (mass_kg + hold_grip_kg)`. The validator recomputes it and warns if stale | |

### Payload (`fire_modes[].payload`)

| Field | Type | Applies to | Meaning |
|---|---|---|---|
| `type` | enum | all | `hitscan`, `pellets`, `projectile`, `thrown`, `beam`, `melee`, `none` |
| `damage` | number | damaging | HP per hit (per pellet for `pellets`, per second for `beam`) |
| `damage_type` | enum | damaging | `ballistic`, `slash`, `pierce`, `blunt`, `blast`, `fragment`, `fire`, `plasma`, `laser`, `electric`, `cryo`, `acid`, `toxic`, `sonic`, `kinetic`, `radiation` (see `damage.md`) |
| `pellets` | number | `pellets` | pellets per shot |
| `head_mult`, `limb_mult` | number | damaging | multipliers on head and limb hits (1.0 = no zones) |
| `range_m` | number or [min, max] | hitscan, pellets, beam, melee | maximum reach (a pair means each shot rolls a reach between them) |
| `falloff` | {start_m, end_m, min_mult} | hitscan, pellets, beam | damage falls linearly from 1.0 at `start_m` to `min_mult` at `end_m` |
| `water_range_m` | number | hitscan, pellets, beam | reach underwater (default 3 m bullets; see `environments.md`) |
| `spread_deg` | number or [x, y] | ranged | per-shot random spread half-angle (hip and ADS alike) |
| `spread_shape` | enum | ranged | `circle` (default), `rectangle`, `scatter` |
| `hip_spread_mult` | number | pellets | pellet spread multiplier from the hip |
| `penetration` | {body, after_body_mult, wall_m, after_wall_mult} | hitscan, pellets | `body`: passes through a target if `body / (targets_passed + 1)` beats a roll of the target's max HP; `wall_m`: depth of reference wall (rock) it can punch through; see `materials.md` for other surfaces |
| `speed_mps` | number | projectile, thrown | launch speed |
| `max_speed_mps`, `accel_mps2` | number | projectile | rockets |
| `gravity_mult` | number | projectile, thrown | 1 = full gravity, 0 = straight line |
| `splash` | {radius_m, damage, falloff} | explosive | area damage; `falloff`: `linear`, `quadratic`, `none` |
| `fuse` | {arming_s, fuse_s, detonate, on_body} | grenades, rockets | `detonate`: `timer`, `impact`, `impact_after_arming`, `when_still`, `remote`; `on_body`: `bounce`, `detonate`, `stick` |
| `damage_gain` | {mult, start_s, end_s} | projectile | damage that grows with flight time |
| `knockback_ns` | number | all | impulse on the target (see `recoil.md`); omit for bullets (their momentum is negligible) |
| `blockable` | bool | melee, thrown | can be blocked |
| `effects` | list | all | status effects on hit, each `{type, ...}`; see `special-damage-effects.md` |
| `lunge` | {stop, pull_mps} | melee | the hit brakes the victim (`stop`, fraction of their speed) and pulls them in |
| `charge_bonus_mult`, `flank_mult`, `back_mult` | number | melee | damage multipliers: full charge, hit from the side, hit from behind |
| `fatigue` | number | melee | melee fatigue added per swing (see `melee-and-blocking.md`) |

## Functions: Secondary, Weapon Function, Melee

Every key that isn't plain firing is described as a **function**. `secondary` and `weapon_function` are each one function; `melee` is the Melee key's attack.

| Field | Type | Meaning |
|---|---|---|
| `name` | string | "Laser sight", "Stock", "Throw knife", "Underbarrel shotgun" |
| `kind` | enum | `attack` (has a `payload`), `toggle` (on/off state), `hold` (active while held), `action` (one-shot action), `alias` (same as another key: `alias_of`) |
| `payload` | map | for `attack`, same as a fire mode payload; plus `rpm`, `ammo_per_shot`, `trigger`, `recoil`, `ammo_pool` (name in `ammo.extra_pools`, or `main`) |
| `modifiers` | map | for `toggle` / `hold`: `{dotted.field: multiplier}` applied while active, e.g. `aim.drift_deg: 0.65` |
| `time_s` | number | time the action or switch takes |
| `notes` | string | behaviour the numbers don't say |

`melee` (expected on every held weapon: anything can be swung, even a launcher):

| Field | Type | Meaning | Typical |
|---|---|---|---|
| `name` | string | "Pistol whip", "Stock bash", "Slash" | |
| `damage` | number | HP | 30–60 for gun bashes |
| `damage_type` | enum | usually `blunt` or `slash` | |
| `range_m` | number | reach | 1.8–3 |
| `interval_s` | number | time between strikes | 0.4–0.8 |
| `charge` | {max_s, bonus_mult} | hold to wind up: damage × `lerp(1, bonus_mult, held / max_s)` | max 1–1.5 s, bonus 2.0 |
| `flank_mult`, `back_mult` | number | side / behind multipliers | 1.15 / 1.3 |
| `effects` | list | status effects (aim displacement for gun bashes) | |
| `lunge` | {stop, pull_mps} | | |

## Variants (`variants`)

Layouts, attachments and factory versions of the same weapon. Each variant is a **patch** on the base front matter.

| Field | Type | Req | Meaning |
|---|---|---|---|
| `designation` | string | yes | base designation + a lowercase letter or a hyphenated suffix: `P7` → `P7b`, `P7-S` |
| `name` | string | yes | starts with the base `name`, then one or more words: `Kiraric` → `Kiraric Tac` |
| `summary` | string | yes | one line: what changed and why you'd pick it |
| `tags_add`, `tags_remove` | list | no | tag changes |
| `changes` | map | yes | `dotted.path: value`. Paths address front-matter fields; list items with a `name` are addressed by name in brackets: `fire_modes[Burst].rpm: 300`. Setting a map replaces that map's listed keys only; setting a list replaces the list; `fire_modes[New Mode]: {...}` appends a mode; `null` removes the field or list item |

The validator applies each patch and validates the result as a full weapon.

## Validation rules (summary)

Errors: missing required field; wrong type; negative mass, time, distance, rate or damage; unknown field (typo guard); unknown enum value; tag not in the vocabulary and not `x-`; no damage-form or era tag; filename doesn't match `carry_class`, `archetype`, `designation`, `name`; `full_name` ≠ `designation name`; `id` mismatch; variant designation or name doesn't extend the base; a variant patch path that doesn't exist; missing required prose section; Controls table without the nine keys in order.

Warnings: archetype not in the recommended list; `kick_deg` differs from the formula by more than 5 %; `summary` over 160 characters; words from the optional name blocklist found anywhere in the file (a development aid to keep source-material names out of the catalog; the list itself is not shipped); a damaging payload with no `damage_type`.
