# OMA Weapons Inspo Kit

Project guide for humans and Claude sessions (local or Claude Code cloud). **Work queue and session protocol: [checklist-todo.md](checklist-todo.md).** Decisions come from [docs/open-questions.md](docs/open-questions.md) (the author's answers are inline, prefixed "Author:") and later follow-ups. Keep this file current when decisions change.

## What this project is

We mine **Ballistic Weapons Definitive Edition v2.9** (BW), a UT2004 mod, to build a free, open-source, engine-agnostic **weapon design cookbook** branded **OMA (Offworld Mercenary Arsenal)**. It ships on GitHub and on itch.io (as a free data-asset pack). Users drop it into a game project (2D side-view, top-down, isometric, 3D FPS…) so an LLM can (a) design a data-driven weapon system adapted to that game's perspective, and (b) build concrete weapons from the catalog using the game's own art and sound. Users can also extend it with new weapons, variants and "chimera" weapons that combine functions from several entries.

BW's value is function density: Primary, Secondary, Weapon Function, Fire Mode select, Reload, ADS/scope, Cock, Dual Wield, Melee, all context-sensitive across firearms, energy weapons, melee, throwables, deployables, designators and hybrids. Its stats are proven to be reasonably balanced. Avoid the bland pistol/SMG/shotgun/AR/sniper archetype trap.

The kit **goes beyond BW**: it standardizes things BW did with hacks, and adds systems BW lacked as **standard features** (not optional extensions), e.g. durability, jamming and cock-to-unjam.

Full vision: [docs/project-objective.md](docs/project-objective.md).

## Hard rules

- **Sever the BW link in kit output.** New names and identities. No BW names, BW lore (Skrith, UTC, Cryon, Enravion…), asset paths, or verbatim BW descriptions or code. Pseudo code is written fresh, not transliterated. Mechanics and numbers carry over.
- **Engine- and dimension-agnostic.** Prose plus Python-flavoured pseudo code with dimension-neutral vectors (`aim_dir`, `rotate(aim_dir, angle)`). Pseudo code only where words can't carry the idea.
- **Physically grounded, unclamped units.** Seconds, meters, degrees, kilograms, newton-seconds, etc. No 1–5 caps: every value must be freely pushable beyond BW's range for modding. Each scale gets a reference table (e.g. what "light" vs "heavy" recoil means in numbers). BW conversions: 52.5 Unreal units = 1 m; 65536 rotation units = 360°; UT2004 runs at time dilation 1.1, so BW game seconds ÷ 1.1 = real seconds (speeds × 1.1); damage is absolute HP (100 HP human, 200 HP merc). Details: [docs/research/unit-conversion.md](docs/research/unit-conversion.md).
- **LLM consumption first, human browsing second.** Compact, consistent, predictable structure. Every entry must pass the validator.
- Markdown prose is never hard-wrapped (one line per paragraph).

## Decisions so far

| Topic | Decision |
|---|---|
| Canonical ruleset | **One unified stat set, Classic-based with selected Pro enhancements.** See "Canonical stat merge rules" below and [docs/research/pro-vs-classic.md](docs/research/pro-vs-classic.md). Realism/Tactical are out. |
| Units | Accepted: forces as **impulse (N·s)** resisted by mass, grip and bracing. Recoil and knockback use the same model, so it works in any gravity. BW feel is the calibration target for a default human. See [docs/open-questions-2.md](docs/open-questions-2.md) #2. |
| Health baseline | **200 HP, no regen** = trained mercenary in body armour (the default combatant). 100 HP = ordinary human in basic clothes. Classic damage numbers stay as-is against this pool. Document this in the core docs. |
| Movement baseline | Pro's: slower base movement (ground 315 uu/s = 6.6 m/s real time, jump 294 uu/s), stronger sprint (×1.40). |
| Credit | Public README gets exactly one line: "Inspired by Ballistic Weapons mod for UT2004 by the Runestorm team + Relics and Rayguns server team." |
| Extra sources | Stock UT2004 handheld weapons and Onslaught vehicle weapons are in scope too. They lack BW's mechanics, so their stats are **invented to BW standard** (modes, recoil, aim, layouts…), clearly marked as invented in provenance. |
| Variants | Layouts become named variants inside the weapon's file, named per-weapon by maker style, e.g. base "P7 Kiraric" → variant "P7b Kiraric Tac". Camos are dropped. |
| Names & lore | Fully independent from the old OMA asset-pack items (ignore them except as **tone** reference: `oma-brand/lore-descriptions/`). Claude invents names, makers and lore freely. Descriptions must match functionality. Lore stays vague and swappable (see the OMA lore paragraph in `oma-brand/oma-pack-readme.txt`). |
| Provenance | Private map kit-name → BW class/package in `provenance/`, never shipped. |
| Scope | Everything a player wields or deploys: guns, melee, throwables, deployables, designators/airstrikes, utilities (ammo pack, shield, defib, sandbags). Cosmetic re-skins fold into the base weapon unless mechanics differ. |
| Vehicle weapons | In scope as **detachable heavy weapons** (inspired by Lost Planet's Vital Suit weapons): usable on foot at great cost (huge recoil, knockback that can bowl the user over, can't move-and-shoot, slowdown). Requires a wielder/mount **stability model** (mass, grip strength, recoil mitigation), not an immunity flag: a tank cannon on a pickup truck vs on a tank should both feel it, but the truck may flip. Stats may be extrapolated/invented where BW has none. |
| Taxonomy / filenames | `<carry-class>_<archetype>_<designation>-<name>.md`, e.g. `sidearm_pistol_p7-kiraric.md`. Carry classes (tentative): `sidearm`, `light-melee`, `primary`, `heavy-melee`, `heavy`, `throwable`, `placeable`, `utility`. Tags add damage form (ballistic, energy, explosive, melee, chemical…) and traits (dual-wieldable, charge-up, lock-on, deployable…). Tags must make it easy to filter out e.g. energy/alien weapons for a period game. |
| Core mechanics | The full spectrum: recoil, aim/spread/chaos, ADS/scopes, damage (head/limb, falloff, penetration), fire modes, ammo/reload/cock, dual wield, melee/block, weight/inventory/move speed, heat, special damage effects, layouts/attachments, sprint/stamina, plus durability/jam. Also **movement**: dodge, Titanfall/Apex-style slide, wall-running and parkour. Plus **entity profiles** (organic, robot, cyborg, energy-shielded… with resistances/susceptibilities), **materials** (dirt, wood, stone, metal, concrete, glass, water, gas… penetration, ricochet, flammability and other side effects) and **environments** (variable gravity incl. zero-g and low/high-g, underwater). A schema doc defines every field. |
| Weapon file format | Markdown with YAML front matter holding all stats, then prose: concept, controls table (Primary / Secondary / Weapon Function / Fire Mode / Reload / ADS / Cock / Dual / Melee), variants, design notes (incl. 2D/top-down adaptation hints), pseudo code only if needed. One file per weapon. |
| Packaging | Kit root has a `SKILL.md` (works as a Claude skill and as a plain "start here" index). |
| Browser | Single-file static HTML, generated from the weapon files, read-only, offline. No BW icons. Instead a procedural **"ID badge"**: simple coloured primitive shapes encoding weight class, melee/ranged/throwable, energy/ballistic, with size and saturation showing power. Must also **validate** entries and warn about missing or broken fields. |
| Pseudo code | Python-flavoured. |

## Canonical stat merge rules

Per weapon, start from **Classic** (`ParamsClasses[1]`) and apply:

1. **Fire modes:** union of Classic and Pro modes (Classic already has most). Each mode keeps the parameters of the ruleset it came from.
2. **Pro buffs win:** where Pro is bigger or faster on a power stat (mag/capacity, fire rate, damage, range, projectile speed), take Pro's value. Classic's larger capacities and extra modes stay. Never import Pro's *nerfs*. (Confirmed by the author. Flag individual results that look odd.)
3. **Hipfire spread:** about **2.0× tighter than Classic** (Classic was overkill), scaled by weapon weight: light weapons (pistols, PDWs, SMGs, light melee) lean towards Pro's tighter cone, heavy weapons stay closer to Classic. Recoil, sprinting, jumping, dodging, sliding and parkour remain the *main* drivers of inaccuracy, and hit heavier weapons harder.
4. **Run-while-ADS** (from Pro) becomes a per-weapon parameter, `ads_run_instability` from 0.0 (rock steady while running) to 1.0 (impossible: the weapon drops to a low-ready pose while running, but the trigger still works, firing from the hip or at the ground). Light, ergonomic weapons sit low, heavy weapons at or near 1.0.
5. Other handling (recoil, decline, chaos, sprint/jump penalties) stays Classic, the "believable" feel the author prefers.
6. Bolt-action cycling and grenade "mag" values differ structurally between rulesets, so verify per weapon rather than applying rule 2 blindly.

## Planned kit structure (TBD in detail)

```
kit/                       the shippable folder
  SKILL.md                 entry point / how an LLM should use the kit
  catalog-index.md
  core-mechanics/          one doc per system + schema doc
  weapons/                 one .md per weapon
  catalog.html             generated browser
provenance/                private BW mapping, never shipped
```

## Pipeline

1. ✅ **Decompile v2**: [tools/decompile/](tools/decompile/) (Windows-only: UE Explorer's UELib with the UT2004 natives table + `vartypes.txt` array map). Output in `sources/*/scripts-decompiled-v2/`, kept in the repo so cloud sessions never need to re-run it.
2. ✅ **Extract stats**: `tools/extract/extract_params.py` → `sources/bw-2.9/extracted/bw_weapon_params.json` (raw BW values: 172 weapon classes, 142 registered; per ruleset, layout, fire/aim/recoil/effect params, with inheritance and defaults resolved).
   Side file `bw_aux_classes.json`: gameplay defaults of referenced fire, melee, ammo, projectile and damage-type classes.
2b. ✅ **Merge**: `tools/extract/merge_canonical.py` → `bw_canonical.json` + `docs/research/merge-report.md`.
2c. ✅ **Kit units**: `tools/extract/to_kit_units.py` → `bw_kit_units.json` (raw values kept under `_raw`).
3. ⬜ Impulse calibration, hipfire derivation, then the schema + validator.
4. ⬜ Core-mechanics docs.
5. ⬜ Pilot batch (12, all in `BallisticProV55`), in two steps. **Step A:** X3Knife, M806Pistol, Fifty9MachinePistol together with the core-mechanics drafts and schema, so the author can correct the format early. **Step B:** M50AssaultRifle, E23PlasmaRifle, HVCMk9LightningGun, G5Bazooka, RX22AFlamer, M75Railgun, FP9Explosive, XMV850Minigun, FP7Grenade.
6. ⬜ Remaining BW weapons in batches, then vehicle weapons (BW VPC + Onslaught), then stock UT2004 weapons with invented BW-standard stats, then the browser.

## Repo layout

| Path | What it is |
|---|---|
| `docs/` | Vision, answered questions, research (`research/`), background chats (Gemini overview is **unverified**) |
| `oma-brand/` | OMA readme (lore tone), old OMA lore stubs (tone reference only), images |
| `sources/bw-2.9/scripts-decompiled-v2/` | Full BW decompile, **the source of truth** for code and stats |
| `sources/bw-2.9/extracted/` | Machine-extracted datasets (raw BW units) |
| `sources/bw-2.9/config-localization/` | `.int` (descriptions, mode names), `.ucl` (weapon registry + fallback names), `.ini` |
| `sources/bw-2.9/weapon-icons/` | 154 BW HUD icons (local dev reference only, not in git, never shipped) |
| `sources/ut2004-base/scripts-decompiled-v2/` | UT2004 base classes incl. `Onslaught` (vehicles) |
| `tools/` | Decompile + extract scripts. `ut2004-oldunreal-runtime/` is local-only (not in git) |
| `trash/` | Judged useless or superseded (incl. the flawed v1 decompile). Move here rather than delete |

## How BW code is organized (for reading sources)

Per weapon (example `M806`): `M806Pistol.uc` (weapon class: description, modes, special logic, `ParamsClasses`), `M806PrimaryFire.uc` / `SecondaryFire` / `MeleeFire` (fire behaviour), `M806WeaponParams{Comp,Classic,Realistic,Tactical}.uc` (stats; some packs name Pro `*ParamsArena`). **Always index `ParamsClasses[i]`**: 0=Pro, 1=Classic, 2=Realism, 3=Tactical. Some utilities have only `[0]`. Params files contain `begin object` sub-objects: `WeaponParams` (layout: mag, weight, speed, sights), `FireParams` (interval, ammo per fire, burst), `*EffectParams` (damage, head/limb mult, recoil, chaos, range, penetration, projectile speed/radius), `RecoilParams`, `AimParams`. Params references can point into *another* weapon's params class (copy-paste in BW); the extractor handles it. Cosmetic classes (`Attachment`, `Pickup`, `*Emitter`, `*Trail*`, `*Glow*`, `*Camo*`) are almost always irrelevant.

Framework: `BCoreProV55` (`BallisticWeapon`, `BallisticFire`, `AimComponent`, `RecoilComponent`, `WeaponParams`…). Game-style globals in `GameStyle_*.uc` (Pro: `RecoilScale 0.7`, 100 HP + 100 regenerating shield that absorbs 100%, run-in-ADS, dodge, double jump, crouch-slide). 43 files branch on ruleset in code (`IsArena()`, `IsClassic()`, `IsArenaOrTactical()`…), so check for these when describing a weapon's behaviour.

Original BW `.u` packages are outside the repo at `C:\01 QBay\ut2004\` (only needed to re-run decompile, Windows-only).

## Repository

The working repo is a **temporary public GitHub repo** (private repos aren't an option for the author), used so Claude Code cloud sessions can do the bulk work. When the kit is done, that repo is deleted/reset and a clean public repo is created containing only the shippable `kit/` (plus README with the credit line). Working materials (decompiled sources etc.) stay on the author's machine. Not in git: `tools/ut2004-oldunreal-runtime/` (Epic binaries, Windows-only), `trash/`, `sources/bw-2.9/weapon-icons/` (dev reference only, not needed in cloud).

## Working conventions

- Bulk work goes through scripts in `tools/`. Scratch output stays out of the repo.
- When unsure whether something is useful, move it to `trash/<reason>/` rather than deleting.
- Verify claims against code (`scripts-decompiled-v2`) before writing them into the kit.
