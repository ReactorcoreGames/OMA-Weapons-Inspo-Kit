# Melee and blocking

Every held weapon can strike with the **Melee** key (`melee` block): pistol whips, stock bashes, a swing of a launcher tube. Dedicated melee weapons also attack with Primary / Secondary, and many can block.

## Striking

```python
def melee_press(weapon):
    weapon.melee_held_since = now()            # wind-up starts; sprint stops; sights drop

def melee_release(weapon, m):
    held = min(now() - weapon.melee_held_since, m.charge.max_s if "charge" in m else 0)
    bonus = lerp(1.0, m.charge.bonus_mult, held / m.charge.max_s) if "charge" in m else 1.0
    sweep(weapon, m, bonus)
    weapon.next_melee_time = now() + m.interval_s * (1 + max(0, weapon.fatigue - 0.15))
    weapon.fatigue = min(1.0, weapon.fatigue + m.get("fatigue", 0.035))
```

**Sweep.** A strike traces several rays fanned across the swing (5 by default, ±14° for a horizontal slash; vertical for overhead blows), each `range_m` long and ~0.3 m thick. The ray nearest the centre that hits counts. A wall hit ends the swing early.

**Damage modifiers**

| Situation | Multiplier |
|---|---|
| Wind-up | `lerp(1, charge.bonus_mult, held / charge.max_s)`: a typical `bonus_mult` of 2.0 doubles damage after a full wind-up (≈1.4 s) |
| Hit from the side (the attack comes in 53–75° off the victim's back) | `flank_mult` (≈1.15) |
| Hit from behind (within 53° of the victim's back) | `back_mult` (≈1.3) |
| Closing speed (charging in) | `damage × (1 + closing_speed / 21 m/s)` for weapons that say so |

All melee multipliers together are capped at ×3.

**Lunge** (`lunge.stop`, `lunge.pull_mps`): a hit brakes the victim's movement by `stop` × their speed and pulls them toward the attacker, so melee can't be shrugged off by running through it.

Melee damage ignores hit zones unless the payload sets `head_mult` (blades often do).

## Fatigue

Each strike adds `fatigue` (0–1). Fatigue slows swings (animation rate ÷ (1 + 0.75 × fatigue), extra delay above 0.15) and weakens blocks. It starts recovering 0.7 s after the last strike and drains from full in 3.6 s. Heavy two-handed blows cost 0.15–0.3 per swing; quick knife slashes 0–0.05.

## Blocking

Melee weapons with a block hold **ADS** (or their Weapon Function, as the entry says) to block:

```python
def on_hit_while_blocking(weapon, dmg, attack, from_dir):
    facing = dot(normalize(from_dir), weapon.owner.view_dir)
    if not attack.blockable or facing <= 0.4 or weapon.recently_attacked(1.0):
        return dmg                                     # outside the ±66° front arc, or mid-swing
    reducible = dmg * (1 - attack.block_bypass)
    dmg -= reducible * (1 - 0.5 * weapon.fatigue)      # tired blocks leak damage
    weapon.fatigue = min(1, weapon.fatigue + attack.block_fatigue)    # ≈0.1 per block
    attacker.weapon.fatigue = min(1, attacker.weapon.fatigue + 2.5 * attacker.melee.fatigue)
    wear(weapon, "block")
    return dmg
```

Bullets and explosions are not blockable unless the weapon is a shield. Blocking punishes the attacker with fatigue, so trading blows into a guard is a losing game.

## Knocking weapons aside

Many melee hits (gun bashes, blades) carry `displace_aim`: the victim's weapon is knocked aside and can't fire or aim for a short time (see [aim-spread-chaos.md](aim-spread-chaos.md)). This is what makes a pistol whip worth doing at arm's length.

## Thrown melee weapons

Throwing knives, axes and similar are a function with a `thrown` payload. They fly with gravity, stick in walls and can be picked back up (returning ammo). Stuck in a body, they're lost or drop on death, as the game prefers.

## Adaptation notes

- **2D side-view**: sweep as an arc in front of the character; overhead blows hit above, thrusts straight ahead.
- **Top-down**: sweep in the facing direction; back and flank multipliers come from target facing.
