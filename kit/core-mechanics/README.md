# Core mechanics

The rules every weapon in the catalog assumes. Each doc is short: what the system does, its numbers, and pseudo code where words aren't enough. Field names match [weapon-schema.md](weapon-schema.md).

## Conventions used everywhere

- **Units**: seconds (real time), metres, degrees, kilograms, newton-seconds (N·s) for impulse, m/s, HP for damage. The unit is in the field name (`_s`, `_m`, `_deg`, `_kg`, `_ns`, `_mps`, `_mult`).
- **No caps**: reference tables describe the catalog; every value can go past them.
- **Default combatant**: a trained mercenary in body armour, 200 HP, no regeneration, 100 kg with kit, Earth gravity. Weapon numbers describe how a weapon behaves for them; other bodies, mounts and places change the result through the formulas here.
- **Dimension-neutral**: vectors are `aim_dir`, `rotate(aim_dir, angle)`, `pitch` / `yaw` offsets. A 2D side-view game uses pitch only; a top-down game uses yaw only (or maps pitch to range scatter); a 3D game uses both. Each doc has adaptation notes.
- **Pseudo code** is Python-flavoured and engine-free.

## The controls

Every weapon describes these nine inputs (some do nothing on some weapons):

| Key | Default role |
|---|---|
| Primary | fire the current fire mode |
| Secondary | the weapon's second function: alternate attack, toggle, aim aid… |
| Weapon Function | a third function: attachments, stock, special action |
| Fire Mode | cycle the fire modes |
| Reload | reload (or the weapon's equivalent: vent, swap cell…) |
| ADS | aim down sights / scope / tight grip when dual-wielding / block on melee weapons |
| Cock | manually cycle the action; also the standard way to clear a jam |
| Dual | pick up and wield a second copy (dual-wieldable weapons) |
| Melee | strike with the weapon, whatever it is |

## Index

| Doc | Covers |
|---|---|
| [weapon-schema.md](weapon-schema.md) | every field a weapon file can use |
| [health-and-armour.md](health-and-armour.md) | 200 HP baseline, hit zones, armour |
| [damage.md](damage.md) | damage pipeline, damage types, falloff, penetration |
| [fire-modes.md](fire-modes.md) | semi, burst, auto, charge, hold, manual actions |
| [recoil.md](recoil.md) | kick accumulation, impulse (N·s), shooter push, knockback |
| [aim-spread-chaos.md](aim-spread-chaos.md) | aim drift, chaos, per-shot spread, flinch, wall displacement |
| [ads-and-scopes.md](ads-and-scopes.md) | aiming, zoom, running while aiming |
| [ammo-reload-cock.md](ammo-reload-cock.md) | feeds, reloads, cocking |
| [durability-and-jamming.md](durability-and-jamming.md) | condition, wear, jams, cock-to-unjam |
| [dual-wield.md](dual-wield.md) | pairing weapons |
| [melee-and-blocking.md](melee-and-blocking.md) | strikes, charge, fatigue, blocking, backstabs |
| [weight-inventory-movement.md](weight-inventory-movement.md) | mass, bulk, carry speed |
| [heat.md](heat.md) | heat build-up and overheating |
| [special-damage-effects.md](special-damage-effects.md) | status effects vocabulary |
| [layouts-and-attachments.md](layouts-and-attachments.md) | variants, attachments, chimera weapons |
| [sprint-and-stamina.md](sprint-and-stamina.md) | sprint, stamina |
| [movement.md](movement.md) | walk, jump, dodge, slide, wall-run, mantle, prone |
| [entity-profiles.md](entity-profiles.md) | organic, robot, cyborg, shielded… resistances and stability |
| [materials.md](materials.md) | surfaces: penetration, ricochet, flammability |
| [environments.md](environments.md) | gravity, zero-g, underwater, vacuum, gases |
