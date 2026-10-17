# Durability and jamming

A standard system for every gun and melee weapon. Condition runs from 1.0 (new) to 0.0 (wrecked). Worn guns jam more; the **Cock** key clears jams with a chance that drops as condition drops, and each weapon has a cooldown between attempts.

## Wear

```python
def wear(weapon, event):
    d = weapon.durability
    loss = {"shot": d.wear_per_shot, "hit": d.wear_per_hit, "block": d.wear_per_hit}[event]
    loss *= env.wear_mult                     # sand 2, mud 2, underwater 3, vacuum/clean room 0.5
    if event == "shot" and weapon.heat > 1.0:
        loss *= 2                             # firing overheated cooks the parts
    weapon.condition = max(0.0, weapon.condition - loss)
```

Repairs, cleaning kits, armourers and spare parts restore condition. A wrecked weapon (0.0) still works but jams constantly.

## Jamming

Rolled once per shot, after the shot fires:

```python
def jam_chance(weapon):
    j = weapon.durability.jam
    worn = (1 - weapon.condition) ** j.get("curve", 2.0)
    return lerp(j.chance_new, j.chance_worn, worn) * env.jam_mult      # underwater, sand, cold...

def after_shot(weapon):
    if rand() < jam_chance(weapon):
        weapon.jammed = True
        play(jam_sound)
```

A jammed weapon dry-clicks and can't fire until cleared. Higher `curve` keeps a worn weapon reliable for longer before it falls apart.

## Clearing a jam

`durability.unjam.method` says how:

| Method | Clear by |
|---|---|
| `cock` | the Cock key (default for most guns) |
| `reload` | a reload |
| `cock_and_reload` | needs both: drop the magazine, then cock |
| `fire` | the next trigger pull clears it instead of firing (simple open-bolt guns, revolvers: the cylinder turns) |
| `vent` | energy weapons: the Cock (or Reload) key purges the fault |

Cocking can fail, more often the worse the weapon is:

```python
def try_unjam(weapon):
    u = weapon.durability.unjam
    if now() < weapon.next_unjam_time:
        return                                        # still recovering from the last attempt
    weapon.next_unjam_time = now() + u.cooldown_s
    play(cock_animation)
    chance = lerp(u.chance_worn, u.chance_new, weapon.condition)
    if rand() < chance:
        weapon.jammed = False
        if u.get("wastes_round", True):
            weapon.mag -= 1                           # the stuck round is thrown out
```

A failed attempt still costs the full cooldown, so a badly worn gun can leave you clacking the action in a firefight.

## Reliability classes

Starting points per weapon design; entries may set anything.

| Class | `wear_per_shot` | `jam.chance_new` | `jam.chance_worn` | `unjam.chance_new` / `chance_worn` | `unjam.cooldown_s` | Typical |
|---|---|---|---|---|---|---|
| Rugged | 0.0001 | 0 | 0.02 | 0.98 / 0.6 | 0.5 | simple service rifles, revolvers, pump guns |
| Standard | 0.0003 | 0.0001 | 0.05 | 0.95 / 0.4 | 0.6 | most pistols, SMGs, rifles |
| Precision | 0.0005 | 0.0002 | 0.08 | 0.9 / 0.35 | 0.8 | marksman rifles, high-rate machine pistols, tuned race guns |
| Finicky | 0.001 | 0.0005 | 0.15 | 0.85 / 0.25 | 1.0 | prototypes, exotic actions, cheap junk guns |
| Energy | 0.0004 | 0.0002 | 0.1 | 0.9 / 0.3 | 1.2 (`vent`) | plasma, laser, rail weapons |

`wear_per_shot` 0.0003 means a new gun reaches half condition after ~1,700 shots; tune it to the game's economy.

## Melee weapons

`wear_per_hit` applies to strikes and blocks. Edges dull: damage × `lerp(worn_damage_mult, 1.0, condition)`. Melee weapons don't jam.

## Adaptation notes

- Games without durability: leave condition at 1.0. Weapons still have a small `chance_new` jam rate; set it to 0 for a jam-free game.
- Show condition through sound and handling cues (rattles, slower cock animation) as well as a number.
