# Ammo, reload and cocking

## Feeds

| `ammo.feed` | Reload behaviour |
|---|---|
| `magazine` | swap the whole magazine (`reload_s`, or `reload_empty_s` from empty) |
| `cylinder` | revolver: reload all chambers at once (speedloader) or per round if the weapon says so |
| `tube` | shell by shell: `shells_per_load` per cycle, can be interrupted by firing if `reload_interruptible` |
| `belt` | long reload, often with a slower `reload_empty_s` (open cover, lay belt) |
| `cell` | swap an energy cell; may also vent heat |
| `fuel` | swap a fuel canister |
| `charge` | regenerates by itself (`notes` give the rate); Reload may force a vent |
| `stack` | throwables: `magazine` is how many can be carried, nothing to reload |
| `none` | melee weapons without ammo |

`reserve` is what the weapon starts with in a default loadout. Games with ammo scarcity scale it.

## Chamber +1

With `chamber_plus_one`, a reload before the magazine is empty keeps the chambered round: capacity becomes `magazine + 1`. A reload from empty gives exactly `magazine`.

## Reload rules

```python
def start_reload(weapon):
    if weapon.mag >= capacity(weapon) or weapon.reserve == 0 or weapon.busy:
        return
    stop_firing(weapon); drop_sights(weapon)
    t = weapon.ammo.reload_empty_s if weapon.mag == 0 and "reload_empty_s" in weapon.ammo else weapon.ammo.reload_s
    after(t, finish_reload)

def finish_reload(weapon):
    n = min(capacity(weapon) - weapon.mag, weapon.reserve)
    weapon.mag += n; weapon.reserve -= n
    if weapon.ammo.cock_after_reload or (weapon.ammo.cock_on_empty and weapon.was_empty):
        weapon.needs_cock = True
    clear_jam_if(weapon.durability.unjam.method in ("reload", "cock_and_reload"))
```

Tube feeds loop: each cycle inserts `shells_per_load`, and pressing fire with a round loaded ends the reload early when `reload_interruptible`.

Separate pools (`ammo.extra_pools`) reload independently: the Reload key reloads the pool of the function last used, then the other.

## Cocking

The **Cock** key cycles the action by hand (`ammo.cock_s`). It is needed when:

- the weapon arrives uncocked (`cock_on_draw`): the first draw takes `draw_and_cock_s`;
- after every reload (`cock_after_reload`), or only after running empty (`cock_on_empty`);
- after every shot on manual-action weapons (`cock_after_shot`, done automatically while the trigger is held);
- to clear a jam ([durability-and-jamming.md](durability-and-jamming.md)).

Cocking a weapon that doesn't need it ejects the chambered round (lost) and re-chambers. Pointless, satisfying, and it doubles as a jam check. Weapons with nothing to cock (most melee, energy weapons with `vent` unjam) use Cock for their own action as described in the entry.

## Adaptation notes

- Reload durations are good-faith estimates for a trained user. Animations should be timed to them, not the other way round.
- Games without reserve ammo can treat `reserve` as "magazines carried × magazine".
