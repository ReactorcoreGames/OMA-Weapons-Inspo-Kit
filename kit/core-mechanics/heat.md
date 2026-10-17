# Heat and overheating

Weapons with a `heat` block build heat as they fire. Heat is measured as a fraction of the overheat threshold: 0 cold, 1.0 overheated. It is not capped; some weapons are meant to run past 1.0.

```python
def on_shot(weapon):
    h = weapon.heat_cfg
    weapon.heat += h.per_shot * env.heat_mult            # hot environments 1.2, cold 0.8, vacuum 1.5 (no air cooling)
    weapon.last_shot = now()
    if weapon.heat >= 1.0:
        overheat(weapon)

def tick_heat(weapon, dt):
    h = weapon.heat_cfg
    if now() - weapon.last_shot > h.get("cool_delay_s", 0):
        weapon.heat = max(0, weapon.heat - h.cool_per_s * env.cooling_mult * dt)   # underwater 3, vacuum 0.3
    if weapon.locked_out and weapon.heat <= h.overheat.get("resume_at", 0.0):
        weapon.locked_out = False

def overheat(weapon):
    mode = weapon.heat_cfg.overheat.mode
    if mode == "lockout":     weapon.locked_out = True                   # can't fire until cooled to resume_at
    if mode == "self_damage": hurt(weapon.owner, weapon.heat_cfg.overheat.self_damage, "fire")   # per shot above 1.0
    if mode == "jam":         weapon.jammed = True                       # clear as in durability-and-jamming.md
    if mode == "boost":       pass                                       # effects_by_heat does the work
```

`effects_by_heat` ramps multipliers in with heat: e.g. `{at: 0.5, field: payload.spread_deg, mult: 2.0}` doubles spread by the time heat reaches 0.5 (linear from 0). Use it for barrels that wander as they heat, or plasma weapons that hit harder the hotter they run.

Reload on a `cell` or `charge` weapon can vent: heat drops to 0 for the cost of the reload time.

## Reference

| Weapon style | `per_shot` | `cool_per_s` | `cool_delay_s` | Meaning |
|---|---|---|---|---|
| Plasma rifle | 0.08 | 0.6 | 0.3 | ~12 rapid shots, then wait |
| Beam (per second of fire) | 0.25 | 0.5 | 0.5 | 4 s of beam, 2 s to cool |
| Overclocked minigun | 0.006 | 0.4 | 1.0 | long bursts glow the barrel, then lock out |
| Heat-boosted cannon | 0.2 | 1.0 | 0.2 | stronger as it heats, hurts the user past 1.0 |

Durability: firing above 1.0 doubles wear ([durability-and-jamming.md](durability-and-jamming.md)).

## Adaptation notes

Show heat on the weapon (glow, steam, rising pitch) before showing a bar.
