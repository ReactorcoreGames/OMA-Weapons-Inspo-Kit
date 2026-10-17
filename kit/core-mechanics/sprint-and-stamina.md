# Sprint and stamina

## Sprint

- Speed: run speed × **1.4** (default merc with a rifle: 6.6 → 9.2 m/s).
- Forward only (within ~45° of facing). Strafing, backpedalling, crouching, landing in the air or running out of stamina ends it.
- The weapon drops into its sprint pose (`aim.sprint_pose_deg`) over `aim.pose_shift_s` and adds `aim.chaos.sprint` when the sprint starts.
- Firing, aiming, reloading with a weapon that needs both hands, and melee wind-up end the sprint; it resumes if the sprint key is still held.

## Stamina

| Value | Default |
|---|---|
| Max | 100 |
| Drain while sprinting | 11 per second (× 1.5 if somehow crouched) → ~9 s of sprint |
| Recharge | 16.5 per second, starting 1.4 s after the last drain |
| Recharge bonus | +16.5 per second while standing still; +8 per second while crouched |
| Jump / dodge | 5 each (and delays recharge) |
| Slide start | 5 (and the slide boost scales with stamina left, see [movement.md](movement.md)) |

```python
def tick_stamina(w, dt):
    if w.sprinting:
        w.stamina -= SPRINT_DRAIN * (1.5 if w.crouched else 1) * dt
        if w.stamina <= 0 or not w.on_ground or not moving_forward(w):
            stop_sprint(w)
    elif w.on_ground:
        regen = 0
        if w.speed == 0:        regen += REGEN
        elif w.crouched:        regen += REGEN / 2
        if now() > w.recharge_after: regen += REGEN
        w.stamina = min(MAX_STAMINA, w.stamina + regen * dt)
    w.speed_mult = 1.4 if w.sprinting else 1.0
```

## Heavy weapons

Weapons with `move_speed_mult` below ~0.8 still sprint, but slowly (the multipliers stack). A game wanting detachable vehicle weapons to be a real burden can disable sprint while one is held, or drain stamina 2× faster.

## Adaptation notes

Low stamina should read in the character (breathing, slower recovery animations) as well as a bar.
