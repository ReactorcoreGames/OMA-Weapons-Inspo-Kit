# Checklist / TODO

Work queue for all sessions (local or Claude Code cloud). Read [CLAUDE.md](CLAUDE.md) first: it holds every decision and rule. This file only tracks *what's next*.

## Session protocol

1. Read `CLAUDE.md`, then this file. Pick the first unchecked item whose dependencies are done.
2. Verify mechanics against `sources/*/scripts-decompiled-v2/` before writing anything into `kit/`. Don't trust `docs/background/` (unverified AI summaries).
3. When an item is finished, tick it here, add a one-line note if useful (file paths, caveats), and commit with a clear message.
4. Items marked **[author review]** end with a stop: summarize what to review and wait for feedback before continuing past them.
5. New decisions from the author go into `CLAUDE.md` (decisions table), not only into chat.
6. Cloud environment note: the decompile tools are Windows-only and **don't need re-running**: v2 output and `bw_weapon_params.json` are in the repo. Python 3 is all the remaining pipeline needs.

## Done

- [x] Reorganize project folders; trash irrelevant packages
- [x] v2 decompile of BW 2.9 + UT2004 base (+ Onslaught), all stats recovered (`tools/decompile/`)
- [x] Stats extraction to `sources/bw-2.9/extracted/bw_weapon_params.json` (`tools/extract/extract_params.py`)
- [x] Pro vs Classic research and decision (`docs/research/pro-vs-classic.md`, merge rules in `CLAUDE.md`)
- [x] Answered question rounds 1 and 2 (`docs/open-questions.md`, `docs/open-questions-2.md`)
- [x] Git repo + push to GitHub (temporary public repo)

## Phase 1: Foundations

- [x] **Merged stat set.** Script `tools/extract/merge_canonical.py` applying the "Canonical stat merge rules" (Classic base, union of modes, Pro buffs on damage/capacity/fire rate/range/projectile speed, never Pro nerfs) → `sources/bw-2.9/extracted/bw_canonical.json`. Log every field where Pro overrode Classic into a report (`docs/research/merge-report.md`) so odd picks are easy to spot. Handle bolt-action cycling and grenade "mag" artifacts explicitly.
  - Done: `tools/extract/merge_canonical.py` → `sources/bw-2.9/extracted/bw_canonical.json` + `docs/research/merge-report.md` (starts with a "review first" table). Output gives every fire mode explicit fire/alt-fire params. Classic-only selector modes are compared against the nearest Pro mode; ammo-swap modes are not. Head/limb multipliers and splash radius are logged as `buff-judgement` so they can be vetoed. Also fixed `extract_params.py` (hyphenated object names such as `ClassicParams-Irons` were unresolved; output now always CRLF).
- [x] **Unit conversion layer.** Script converting raw BW units to kit units: 52.5 uu = 1 m, 65536 rot = 360°, fire interval → RPM and seconds, damage stays absolute (100 HP human / 200 HP merc baseline). Keep raw values alongside for provenance.
  - Done: `tools/extract/to_kit_units.py` → `sources/bw-2.9/extracted/bw_kit_units.json`; write-up and field mapping in `docs/research/unit-conversion.md`. Found that UT2004 runs at time dilation 1.1, so all durations ÷ 1.1 and speeds × 1.1 (BW's own manual does this); CLAUDE.md movement baseline corrected to 6.6 m/s. Gaps: reload/cock durations are animation-driven (only the bot `AIReloadTime` hint exists), and BW gravity is 2.2 g (matters for grenade arcs and jumps).
- [ ] **Recoil and knockback impulse model.** Define `recoil_impulse` (N·s), weapon `mass` (kg), wielder `grip` / `bracing` / `mass`, and the felt-kick formula. Calibrate defaults so a default human reproduces BW's view-kick feel. Write up the derivation and reference scale table in `docs/research/impulse-calibration.md`.
- [ ] **Hipfire and run-ADS derivation.** Implement "about 2× tighter than Classic, weight-scaled towards Pro for light weapons" and the `ads_run_instability` 0–1 parameter. Document the formula and how weight/class maps to it.
- [ ] **Weapon schema.** `kit/core-mechanics/weapon-schema.md`: every YAML field, type, unit, meaning, required/optional, typical range with reference examples (no caps). Includes controls (Primary / Secondary / Weapon Function / Fire Mode / Reload / ADS / Cock / Dual / Melee), fire modes, variants, tags, durability/jam fields, carry class, archetype.
- [ ] **Validator.** `tools/kit/validate.py`: checks every `kit/weapons/*.md` against the schema (missing/unknown fields, bad units or types, broken variant naming, filename matches carry-class/archetype). The browser later reuses the same rules.
- [ ] **Core-mechanics drafts.** One short doc each in `kit/core-mechanics/`: recoil, aim/spread/chaos, ADS & scopes, damage (head/limb, falloff, penetration), fire modes, ammo/reload/cock, durability & jamming (standard feature: cock-to-unjam with decreasing success chance and per-weapon cooldown), dual wield, melee & blocking, weight/inventory/move speed, heat/overheat, special damage effects, layouts/attachments, sprint/stamina, movement (dodge, Titanfall/Apex slide, wall-run, parkour), health & armour baseline (200 HP merc note), entity profiles (organic/robot/cyborg/shielded…), materials & surfaces (penetration, ricochet, flammability, side effects), environments (gravity incl. zero-g, underwater, gases). Prose + Python-flavoured dimension-neutral pseudo code where needed.

## Phase 2: Pilot

- [ ] **Pilot step A [author review].** Weapon entries for X3Knife, M806Pistol, Fifty9MachinePistol in `kit/weapons/` (new names, makers, lore, variants from layouts), plus `provenance/` mapping entries. Must pass the validator. Present together with Phase 1 docs for format feedback.
- [ ] Apply author feedback to schema, docs and the three entries.
- [ ] **Pilot step B [author review].** M50AssaultRifle, E23PlasmaRifle, HVCMk9LightningGun, G5Bazooka, RX22AFlamer, M75Railgun, FP9Explosive, XMV850Minigun (with Classic's 900-round 3600 RPM identity), FP7Grenade.
- [ ] `kit/SKILL.md` and `kit/catalog-index.md` first versions.

## Phase 3: Full catalog

- [ ] Remaining `BallisticProV55` weapons (batches by carry class)
- [ ] `BWBP_SKC_Pro`
- [ ] `BWBP_OP_Pro`
- [ ] `BWBP_APC_Pro`
- [ ] `BWBP_JCF_Pro`, `BWBP_SWC_Pro`
- [ ] `BWBPAirstrikesPro` (designator + airstrikes)
- [ ] Unregistered variant classes: fold into base weapons or drop (30 classes in the dataset with `registered: false`)
- [ ] Deployables and utilities sweep (turrets, mines, tripwires, ammo pack, shields, sandbags), checking nothing was missed

## Phase 4: Beyond BW

- [ ] Wielder/mount stability model doc (humans, power armour, cyborgs, vehicles/mounts) for detachable heavy weapons
- [ ] Vehicle weapons from `BWBP_VPC_Pro` and UT2004 `Onslaught` as the `heavy` detachable class (stats invented to BW standard, marked in provenance)
- [ ] Stock UT2004 handheld weapons (`XWeapons`, `UTClassic`) reimagined to BW standard

## Phase 5: Release

- [ ] Browser: single-file `kit/catalog.html` generated by script (filter, sort, compare, full entry view), procedural ID badges (shape/colour = weight class, melee/ranged/throwable, energy/ballistic; size/saturation = power), validator warnings shown inline
- [ ] Final consistency pass (naming, tags, balance sanity check across classes)
- [ ] Public README (with the credit line), license choice **[author review]**
- [ ] Release: new clean public repo with `kit/` only; itch.io package
