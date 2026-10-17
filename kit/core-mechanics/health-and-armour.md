# Health and armour

## Baseline

| Combatant | HP | Notes |
|---|---|---|
| Ordinary human in basic clothes | 100 | civilians, untrained guards, crew |
| **Trained mercenary in body armour** | **200** | the default combatant every weapon is balanced against |

No regeneration by default. Healing comes from items, medics and stations. A game wanting faster or slower fights scales damage or HP globally; every weapon number stays valid relative to the others.

Reference: a .45-class pistol round (35 damage) kills a civilian in 3 body hits and a merc in 6, or 2 to the head. A light SMG round (19) needs 11 body hits on a merc.

## Hit zones

| Zone | Where | Multiplier field |
|---|---|---|
| Head | a sphere of ~0.25 m radius around the head | `head_mult` (typical 2–3.5 for bullets, 1–1.5 for blunt melee) |
| Limbs | anything below the hips | `limb_mult` (typical 0.5–0.75) |
| Body | everything else | 1.0 |

A shot counts as a head hit if its line passes within the head radius, even if it grazes. Explosions, gas, fire and most melee use no zones (`head_mult` 1.0).

For 2D side-view: head = top ~15 % of the hitbox, limbs = bottom ~45 %. For top-down: no vertical zones; use `head_mult` as a crit chance proxy or ignore it.

## Armour

Body armour is part of the 200 HP merc baseline, so the default needs no armour rules. Games that want separate armour use the entity profile's `armour` block ([entity-profiles.md](entity-profiles.md)):

```python
def apply_armour(damage, damage_type, target):
    a = target.armour
    if a is None or a.points <= 0:
        return damage
    absorbed = damage * a.absorb_fraction * a.type_mult.get(damage_type, 1.0)
    absorbed = min(absorbed, a.points)
    a.points -= absorbed * a.wear_per_point
    return damage - absorbed
```

Shields (energy barriers) work the same way but recharge after a delay and have their own type multipliers (strong against `ballistic`, weak against `electric` and `plasma`).

## Healing

`heal` effects restore HP up to the maximum (see [special-damage-effects.md](special-damage-effects.md)). Overheal above maximum is a design choice; if allowed, it should decay back over time.
