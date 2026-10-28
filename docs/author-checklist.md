# Author checklist

Personal to-do list for the author (not for Claude sessions; their queue is [checklist-todo.md](../checklist-todo.md)). Tick items as you go. Delete this file or move it to `trash/` once everything is done.

## 1. Now: get Phase 1 onto your machine

- [ ] Pull `main` into the local repo (`git pull origin main`). Phase 1 + pilot step A arrive with it.
- [ ] `pip install pyyaml` locally if you want to run the validator (`python tools/kit/validate.py`).
- [ ] Check that the large regenerated JSON files under `sources/bw-2.9/extracted/` didn't clash with local copies (they are CRLF now, so a diff on line endings alone is expected).

## 2. Review what the previous session built

Nothing here is urgent, but the items marked **(decide)** are open questions Claude is waiting on. Write answers inline in the file they come from (prefix "Author:") or straight into `CLAUDE.md`.

Format and core docs:

- [ ] Skim `kit/core-mechanics/README.md` (index, controls, conventions) and the schema `kit/core-mechanics/weapon-schema.md`. This is the main format decision: does the YAML front matter read well, is anything missing or overbuilt?
- [ ] Skim the three pilot entries in `kit/weapons/` (knife, pistol, machine pistol) as an end user would: names, makers, lore tone, controls table, variants, design notes.
- [ ] Recoil: already decided to simplify to vertical + horizontal per shot (recorded in `CLAUDE.md`, queued in `checklist-todo.md`). Note anything else in `kit/core-mechanics/recoil.md` you want kept or dropped, e.g. hip/crouch/moving multipliers, recovery delay, the impulse (N·s) physics layer.
- [ ] Other docs that will likely be affected by your new melee / armour / damage-type work, so worth reading before you start: `melee-and-blocking.md`, `damage.md`, `health-and-armour.md`, `entity-profiles.md`, `special-damage-effects.md`, `materials.md`.
- [ ] Kit-new mechanics with invented numbers (BW has no equivalent), check the values feel right: `durability-and-jamming.md`, `movement.md` (wall-run, mantle, prone), dual-wield ADS in `dual-wield.md`, ricochet in `materials.md`, `environments.md`.

Open questions (decide):

- [ ] **Knife:** no block on ADS (the source knife can't block; its Weapon Function is the throw). Keep it that way, or give it a block? (`provenance/weapons.yaml`, `rk3-halvenn`)
- [ ] **Machine pistol:** the Pro-only Burst 5 mode was added to the bladed and suppressed builds, using the Classic cartridge payload. OK as a reading of merge rule 1? (`lm5-vesquill`)
- [ ] **Machine pistol:** the Pro buff takes the blade from 35 to 55 damage, making the melee key strong (121 DPS + weapon displacement). Keep or veto?
- [ ] **Merge report:** the "Review first" table at the top of `docs/research/merge-report.md` lists every Pro buff that looks odd (DPS jumps ×1.5 and more, e.g. ScarabGrenade ×4.4, XOXOStaff ×3.2, CX85 secondary ×3). Veto the ones you dislike; otherwise Claude keeps them and flags them again per weapon when writing entries.
- [ ] **Merge report, `buff-judgement` rows:** head/limb multipliers and splash radius were taken from Pro when bigger, which the rules don't explicitly cover. Blanket yes, blanket no, or per weapon?

Facts the previous session found that changed earlier assumptions (just be aware):

- [ ] UT2004 runs at time dilation 1.1: all BW durations ÷ 1.1, speeds × 1.1. Base movement is therefore 6.6 m/s, not 6.0 (`CLAUDE.md` updated).
- [ ] BW reload and cock times are animation-driven, so kit values are estimates (marked `estimated` in provenance).
- [ ] BW gravity is 2.2 g, which matters for grenade arcs and jump heights.

## 3. Local sessions: integrate your new material

- [ ] Expanded melee system → `CLAUDE.md` decisions table + `kit/core-mechanics/melee-and-blocking.md` (or a note for Claude to rewrite it).
- [ ] Super weapons → decide where they live in the taxonomy (new carry class? tag?) and add to `CLAUDE.md`.
- [ ] Armour → `health-and-armour.md` / `entity-profiles.md`; check the 200 HP merc baseline still holds.
- [ ] Damage types → the `damage_type` enum in `weapon-schema.md` and `damage.md` (current list: ballistic, slash, pierce, blunt, blast, fragment, fire, plasma, laser, electric, cryo, acid, toxic, sonic, kinetic, radiation).
- [ ] Add matching work items to `checklist-todo.md` (Phase 1 rework section) so the cloud session picks them up in order, and tick the "Author's local foundation additions" item.
- [ ] Commit and push to `main`.

## 4. Later: back in the cloud session

- [ ] Tell the session to read `CLAUDE.md` + `checklist-todo.md` and continue. It will do, in order: integrate your foundation changes into the schema/validator/docs, the recoil simplification, re-fit the three pilot entries, then pilot step B (9 weapons) and stop for your review.
- [ ] Review pilot step B when it stops.
- [ ] Later stops that need you: license choice and public README before release.
