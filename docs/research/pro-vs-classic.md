# Pro vs Classic: does Pro water down the weapons?

> **Status: resolved.** The author chose a single Classic-based stat set with selected Pro enhancements (see the Author answer at the bottom). The operational version is "Canonical stat merge rules" in [CLAUDE.md](../../CLAUDE.md). The recommendation section below is superseded.

Research for open question 1. Data: all 142 registered BW weapons, extracted from the v2 decompile (`sources/bw-2.9/extracted/bw_weapon_params.json`). Per-weapon numbers are in [pro-vs-classic.csv](pro-vs-classic.csv). Comparison uses each weapon's default layout and first primary fire mode. Reproduce with `tools/extract/compare_styles.py`.

## Short answer

Pro did **not** systematically cut fire rate, magazine size or damage. Medians are identical, and the changes go both ways (Pro is sometimes faster or has bigger mags). What Pro *did* change is (1) **accuracy and handling**, made much more forgiving across the board, (2) **toughness**, with players effectively at double health, and (3) **fire-mode variety** on about 20 weapons, where the selective-fire switch was flattened.

## 1. Handling: this is where Classic's "believable" feel lives

| Metric (Pro ÷ Classic, median) | Ratio | Meaning |
|---|---|---|
| Max hipfire spread | **0.37** | Pro hipfire cone is ~2.7× tighter. Classic punishes hipfire hard. |
| Sprint chaos | **0.25** | Sprinting wrecks aim ~4× less in Pro. |
| Felt recoil per shot | **0.70** | Pro applies a global `RecoilScale = 0.7` on top of per-weapon recoil. |
| Recoil recovery time | 0.92 | Pro recovers slightly faster. |
| Max recoil accumulation | 1.35 | Pro lets recoil stack higher before capping (but each shot kicks less). |
| Chaos speed threshold | 0.69 | Pro reaches full movement-inaccuracy at *lower* speed, but the ceiling is the much tighter cone above, so net penalty is smaller. |

Classic also uses a **different chaos formula in code** (the aim component branches on ruleset). Pro additionally allows **running while aiming down sights** (`bRunInADS`), while Classic does not. Wall/long-gun displacement exists in **both** rulesets: it's driven by per-weapon gun length, not by ruleset.


## 2. Toughness: Pro has double health

Pro gives every player 100 health **plus 100 regenerating shield**, and BW's shield absorbs 100% of damage until depleted. So Pro's effective health is **200**, versus Classic's **100**, at near-identical per-shot damage. Pro roughly **doubles time-to-kill** through the player model, not the guns. Pro also has slower base movement (ground speed 315 vs 360, jump 294 vs 340) but a stronger sprint (×1.40 vs ×1.35).

For the kit this matters: Pro damage numbers are "right" relative to each other. A game wanting Classic or Tactical lethality just changes the health pool or applies a damage multiplier, exactly as you guessed.

## 3. Fire modes: Pro strips selective fire from ~20 weapons

The clearest losses (Classic → Pro):

| Weapon | Classic modes | Pro modes | Other cuts |
|---|---|---|---|
| XMV-850 Minigun | 1200 / 2400 / 3600 RPM | 1200 RPM only | 900 → 300 round box |
| M50 Assault Rifle | Semi / Burst / Auto | Auto | |
| AK-490 Assault Rifle | Semi / Rapid Burst / Auto | Auto | |
| AM67 Assault Pistol | Semi / Burst / Auto | Semi | mag 14 → 9 |
| Gaucho and Stallion | Semi / Full Auto | Burst of Four | |
| Conqueror MGL | Timed / Impact | Impact | |
| Fifty-9, XMk5, LK-05, MARS-2, XRS-10 | Semi / Burst / Auto | Burst / Auto | mags reduced on most |
| AR23, SRS-900 | Semi / Burst / Auto | Semi / Burst | SRS-900 RPM halved |
| XK2 SMG, M353 LMG, SKAS-21 | 3–4 modes | one fewer | mags reduced |
| All hand grenades | Charged / Long / Short throw | Fixed / Charged throw | |

Notable capacity or rate cuts beyond modes: RX-22A Flamethrower (150 → 40 fuel), Dark Star and Nova Staff (66 → ~30 charge), FSSG-50 / R78A1 / M75 (smaller mags, much slower cycling), Bulldog, M925, Redwood Coach Gun. Your minigun memory was right: Classic still has the absurd 3600 RPM / 900-round mode in v2.9.

Where **Pro is bigger or faster** (not a one-way nerf): E-23 ViPeR (45 → 100 mag), H-V and E-V plasma cannons (30 → 200/300), CX61 and CX85 (bigger mags, much faster fire), GRS-9 (400 → 1091 RPM), M2020 Gauss DMR, MX-32, ZX-98, VSK-42.

Caveat: very slow "RPM" values for bolt actions mix in cycling differently per ruleset, and grenades show a "30 → 1 mag" artifact (stack vs per-throw). I'll verify these per weapon when writing entries.

## Recommendation

Don't ship two full stat sets. Classic's value is concentrated in two places that compose cleanly with Pro:

1. **Pro as the canonical numbers** (damage, mag, rate, ranges, mobility).
2. **Union of fire modes:** each weapon gets every mode it had in *either* ruleset. Modes only Classic had (e.g. 2400/3600 RPM, semi-auto on the M50) are restored with Classic's mode parameters, converted to kit units. This adds back the selective-fire richness at no cost to balance, since the player can still pick the Pro mode.
3. **Two handling presets per weapon:** `arcade` (Pro aim/recoil/chaos) and `grounded` (Classic aim/recoil/chaos: big hipfire cone, punishing sprint and jump, heavier kick). A game picks one globally, and your recoil/inaccuracy multipliers tune between or beyond them. It's a small block per weapon, not a second weapon set.
4. Where Classic's capacity or rate differs dramatically and *is* the identity (XMV-850's 900-round 3600 RPM monster, RX-22A's 150 fuel), record it as a **variant** (e.g. "XMV-850b … Unleashed") rather than a hidden number.

Decision needed: accept this recommendation, or prefer something else?


Author: Wow, this analysis changes my decision dramatically. I actually now want Classic primarily instead of Pro but with some caveats:
- "Where **Pro is bigger or faster**" Add/overwrite these instead of classic values. I essentially only want one "true" set of stats that takes the best of both worlds, but swears by Classic's design both in bigger firemode selection, better realism, larger ammo counts, more features. I want the buffs from Pro because I recall some weapons in Classic actually being weaker than I think they should be and Pro funnily enough fixes those despite the other nerfs that I don't want.
- "Pro additionally allows **running while aiming down sights**" I do want this - I think theres excellent potential for lightweight weapons (PDW, SMGS, pistols, melee - if it makes sense) with good handling/ergonomics to be usable in ADS mode while running. I think a parameter that determines the stability of being able to run-with-ADS up until a certain threshold value (1.0) making it impossible for said weapon, forcing it to not be possible to be held up while running (but the trigger can still be pulled, even if the gun is point down at the ground while running/sprinting).
- "Pro hipfire cone is ~2.7× tighter." - I want a compromise of ~2.0x tighter - i do remember Classic being a bit overkill with hipfire penalties that I'd want to tone down a bit especially for smaller/lighter weapons, while letting recoil, running/sprinting, jumping, parkour/dodging/sliding be the bigger driver of inaccuracy penalties, more so with larger/heavier weapons, but still allowing smaller weapons to have Pro-leaning accuracy/stability bonuses.
- "So Pro's effective health is **200**" - As a combat character default I'd actually want 200 to be the default health, but no regen. The reasoning is that 100hp is a regular human in basic clothes while 200hp is a trained & toughened mercenary in kevlar that is expected as the main combatant in a game. Have a note for this in the core docs.
- "Pro also has slower base movement (ground speed 315 vs 360, jump 294 vs 340) but a stronger sprint (×1.40 vs ×1.35)." This I want from Pro actually - regular movement should be slower, while sprint notably faster.