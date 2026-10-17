# Fire modes

The **Fire Mode** key cycles a weapon's `fire_modes` list in order (the first is the default). A mode is more than a rate selector: it can switch ammo, throw style, charge behaviour or projectile. Every mode carries its own payload and per-shot recoil; later modes inherit unset fields from the first.

## Triggers

| `trigger` | Behaviour |
|---|---|
| `semi` | one shot per pull, no faster than `rpm` |
| `burst` | `burst_count` shots per pull at `burst_rpm`, then `burst_cooldown_s`. With `burst_repeats_on_hold`, holding keeps firing bursts; without, release and pull again |
| `auto` | fires at `rpm` while held |
| `charge` | hold to charge up to `max_charge_s`, fires on release; payload scales with charge (see notes per weapon) |
| `hold` | continuous while held: beams, flamers, sprays. `damage` is per second, `rpm` is the tick rate |
| `special` | anything else, described in the mode's `notes` (ammo swaps, throw styles, deploy modes) |

`windup_s` delays the first shot after the pull (spin-up, capacitor charge) and resets once the trigger is released for longer than the windup.

## Burst timing

Bursts fire faster than the sustained rate and then pause, so that a full cycle averages out to `rpm`:

```python
interval     = 60 / rpm
shot_gap     = 60 / burst_rpm                         # inside the burst
cooldown     = burst_cooldown_s                       # after the last shot
# usual design: burst_count * interval == (burst_count - 1) * shot_gap + cooldown
```

Letting go mid-burst ends the burst and starts the cooldown.

## Manual actions

`cock_after_shot` weapons (bolt, pump, lever) must be cycled after every shot. The cycle takes `cock_s` and happens automatically if the trigger is held, or on the **Cock** key. Firing again before it finishes is impossible. A cycle is also a chance to clear a jam ([durability-and-jamming.md](durability-and-jamming.md)).

## Firing rules

```python
def try_fire(weapon, mode, now):
    if now < weapon.next_fire_time:            return
    if weapon.reloading or weapon.melee_busy:  return
    if weapon.jammed:                          return play(dry_click)
    if weapon.needs_cock:                      return play(dry_click)
    if weapon.mag < mode.ammo_per_shot:        return play(dry_click); weapon.needs_reload = True
    if mode.trigger == "semi" and weapon.shots_this_pull >= 1:            return
    if mode.trigger == "burst" and weapon.shots_this_pull >= mode.burst_count \
            and not mode.burst_repeats_on_hold:                            return
    fire_shot(weapon, mode)                     # payload, recoil, heat, wear, jam roll
    weapon.next_fire_time = now + next_gap(weapon, mode)
```

## Adaptation notes

- Fire modes are cheap content: a second ammo type or a burst setting on an existing gun is a new mode, not a new weapon.
- Top-down and 2D games keep the same timings; only the payload geometry changes.
