# Layouts, attachments and variants

Three ways a weapon changes without becoming a different weapon:

| Kind | When | Where it lives |
|---|---|---|
| **Attachment toggle** | switched in the field: laser on/off, suppressor on/off, stock open/closed | a function (`secondary` or `weapon_function`) with `kind: toggle` and `modifiers` |
| **Fire mode** | selected with the Fire Mode key: burst, ammo type, throw style | `fire_modes` |
| **Variant** | a different factory build: scope instead of laser, underbarrel shotgun, extended mags | `variants` in the same file |

## Toggles

A toggle multiplies fields while it's on:

```yaml
weapon_function:
  name: Folding stock
  kind: toggle
  time_s: 0.4
  modifiers:
    recoil.pattern.pitch_factor: 0.8      # steadier recoil...
    aim.drift_deg: 1.2                    # ...but clumsier in the hip
    handling.ads_time_s: 1.5
  notes: Starts folded.
```

`modifiers` multiply numbers (a pair multiplies both values). Toggles that change behaviour rather than numbers (a suppressor that changes sound and muzzle flash) describe it in `notes`. Switching takes `time_s` and drops the sights.

## Variants

A variant is a patch on the base weapon. Naming:

- `designation`: base designation + a lowercase letter (`P7` → `P7b`, `P7c`) or a hyphenated suffix (`P7-S`, `P7-CQB`).
- `name`: base name + one or more words that say what changed (`Kiraric` → `Kiraric Tac`, `Kiraric Longeye`).

```yaml
variants:
  - designation: P7b
    name: Kiraric Longeye
    summary: Fixed 4x optic instead of the laser; better at range, worse up close.
    tags_add: [scoped]
    tags_remove: [laser-sight]
    changes:
      handling.zoom: {type: fixed, magnification: 4}
      handling.ads_time_s: 0.32
      secondary: null
      dual_wield.allowed: false
```

Paths address any front-matter field; `fire_modes[Burst].rpm` addresses a named list item; a new name appends; `null` removes. The validator applies each patch and checks the result as a full weapon.

## Chimera weapons

New weapons that combine functions from several entries are new files with their own designation and maker. Good chimeras take the **base platform** (mass, handling, aim, recoil handling) from one parent and **functions** (secondary, weapon function, an extra fire mode) from others, then fix the numbers that must follow:

- a heavier combination raises `mass_kg` and `bulk`, lowers `move_speed_mult`, and changes handling through **heft**, the catalog's 0–1 weight measure:

```python
heft = clamp(log(mass_kg / 0.8) / log(20 / 0.8), 0, 1)        # 0 at <= 0.8 kg, 1 at >= 20 kg
ads_run_instability = heft * (0.8 if hold in ("one_hand", "two_hand") else 1.0)
ads_run_instability = 1.0 if hold == "hip_braced" else max(ads_run_instability, scope_floor)  # 2-4x 0.5, 4-8x 0.9, 8x+ 1.0
drift_deg = parent.drift_deg * (2.7 - 1.4 * parent_heft) / (2.7 - 1.4 * heft)   # heavier -> wider hip cone
chaos.dodge   = chaos.jump * (1 + heft)
chaos.slide   = max(chaos.jump, chaos.sprint) * (1 + heft)
chaos.wallrun = chaos.sprint * (1 + heft)
```

- a different cartridge changes `impulse_ns`; recompute `kick_deg` for the new mass (`12 × kick_factor × impulse / (mass + grip)`, see [recoil.md](recoil.md));
- a borrowed attack function brings its own ammo pool.

Mention the lineage in the Lore section in-world ("built on the P7 frame with a salvaged underbarrel drum"), not as a reference to other files.
