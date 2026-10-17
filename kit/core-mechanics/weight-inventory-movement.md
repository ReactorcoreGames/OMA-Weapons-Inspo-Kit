# Weight, inventory and movement speed

## Mass and bulk

- `physical.mass_kg` is the real weight. It feeds recoil, the hipfire and run-ADS derivations, throwing, and any encumbrance system.
- `physical.bulk` is inventory space in slots: knife 1, pistol 2–3, SMG 3–5, rifle 6–8, machine gun 9–10, launcher or minigun 11–14, detachable vehicle weapon 16+.

A default loadout budget of **14–20 slots** gives a rifle, a sidearm, a melee weapon and a few grenades, and forces a choice when a heavy weapon comes along. Games with slot-per-category inventories can ignore bulk.

## Speed while holding

Only the weapon **in hand** changes movement:

```python
run_speed  = BASE_RUN_SPEED * weapon.handling.move_speed_mult        # 6.6 m/s base for the default merc
jump_speed = BASE_JUMP_SPEED * weapon.handling.get("jump_mult", 1.0)
if aiming:
    run_speed *= ads_speed_factor(weapon)                            # see ads-and-scopes.md
```

| `move_speed_mult` | Weapon |
|---|---|
| 1.10–1.20 | knives, light melee, pistols: faster than empty-handed jogging |
| 1.00 | rifles, SMGs, shotguns |
| 0.85–0.95 | machine guns, heavy rifles |
| 0.70–0.85 | launchers, miniguns, beam cannons |
| 0.65 and below | detachable vehicle weapons |

## Optional encumbrance

For games that want carried weight to matter too:

```python
carried = sum(w.physical.mass_kg for w in inventory) + armour_kg
enc = max(0, carried - FREE_LOAD_KG) / (MAX_LOAD_KG - FREE_LOAD_KG)      # e.g. 25 kg free, 60 kg max
run_speed *= lerp(1.0, 0.7, clamp(enc, 0, 1))
stamina_drain *= 1 + enc
```

## Draw and holster

`draw_s` and `holster_s` add up on every swap. Heavier weapons take longer (0.2 s knife, 0.3 s pistol, 0.5 s rifle, 0.7–1.0 s heavy). Dual-wielding draws the second weapon in parallel.

## Adaptation notes

- Top-down and 2D games often have faster base movement; keep the multipliers and scale the base.
- Detachable vehicle weapons should feel like a burden: low `move_speed_mult`, no sprint while held if the game wants it ([sprint-and-stamina.md](sprint-and-stamina.md)).
