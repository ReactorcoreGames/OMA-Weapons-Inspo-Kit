# Open questions (session 1)

These steer what we keep, what we toss, and what the final kit looks like. Each has my recommendation; answer briefly or just say "go with the recommendation". Numbers matter only for referencing in replies.

## A. Which numbers are canonical

**1. Which BW ruleset should be the source of truth for stats?** Every weapon has four stat sets: **Pro** (arena pace, strong hipfire, balanced, higher time-to-kill), **Classic** (BW 2.5 feel), **Realism** (slow, lethal) and **Tactical** (slower movement, very high damage). They differ a lot (e.g. M806 damage and recoil change per ruleset).
*Recommendation:* use **Pro** as canonical (it's the most actively balanced, and fast play adapts best to 2D). Optionally capture a single "lethality profile" note per weapon from Tactical so a game wanting high-TTK or low-TTK has a reference point. Which style did you actually play and enjoy?

Author: hmm, yeah lets go with Pro - its the best for what I ultimately will need. Though personally, I'm a fan of Classic as it leaned more on making the weapons feel less-gamey and more "believable" with the biggest example the minigun in BW v2.5 having absurd max RPM of 3600 and an ammo count of 800 (I don't know what its like in v2.9, but a hazy memory recalls that they nerfed it RPM and ammo wise to not make it lag badly due to how UT2004 works). I also enjoyed how most weapons in v2.5 classic being strongly affected by inaccuracy systems that made hipfire less viable especially with larger cumbersome weapons, with movement/running/jumping causing considerable aiming inaccuracy issues deliberately, long guns pointing away from a wall if player stood too close to said wall/obstacle and player needing to "know" their weapon and utilize stopping/aiming-down-sights/crouching to stabilize their firearm for the most accurate shot. In that sense part of me almost wants to have sets for Pro and Classic separately - however I think if the mechanics are present in Pro anyway, I could just have recoil/inaccuracy multipliers in a game to tweak those aspects and thus I'd only need Pro. Tactical and Realism are no-go; they're commonly too far in the one-hit-KO territory that I can simply achieve with a damage multiplier implemented to the Pro set anyway. Thus my verdict is do Pro, but peek into Classic to see if Pro had degraded rate of fire, ammo capacities or mitigated recoil mechanics to such a big degree that it would make sense to include a Classic set too. I want to us to explore this question first before I make a final decision.

**2. Layout variants and camos.** Many weapons have alternate layouts that change their function and stats (M806: Laser Sight / Scoped / Underbarrel Shotgun). Camos are purely cosmetic.
*Recommendation:* keep layouts as **variants inside the weapon's file** (they're great design material, e.g. "same pistol, but the secondary becomes a shotgun"). Drop camos entirely.

Author: Yes to variants, no to camos. I want variants to be named in a way where its clear what the original weapon name like "P7 Kiraric" and its variant is like "P7b Kiraric Tac". Naming depends on a per weapon basis since they're assumed from various manufacturers/makers.

**3. Units and raw values.** BW uses Unreal units (distance), rotation units (65536 = 360°, used for recoil and spread), and damage scaled for 100 HP players.
*Recommendation:* the kit shows **normalized, game-facing values** (seconds, degrees, meters, damage relative to a 100 HP baseline, derived DPS and shots-to-kill) plus short **relative ratings** (e.g. recoil: low/med/high, or 1–5) so a 2D game can map them to its own scale. The raw BW numbers stay in a provenance data file that isn't part of the shipped kit.

Author: Yes, I do want normalized values that are more relatable like "seconds, degrees, meters, etc." I do want the numbers to be more concrete and grounded, with also a scale provided for example of what "low vs high recoil" means. I am expecting to use this system for a potential modding system and to create even more new weapons that might even push past the limits of what the BW weapons dare to do, so even for something like recoil I don't want the values to be capped/clamped but something I can freely blow past or go under - I suppose a better idea is for values like recoil or knockback, etc to be more tied to ""light recoil" is considered 10 newtons of force" (I'm not a physics person, I don't know what the actual numbers would make sense here) type of value that is freely tweakable and grounded to something sensible/physical/logical.

## B. Identity, naming and lore

**4. Should kit weapons map onto the existing OMA items?** `oma-brand/lore-descriptions/` has 114 OMA items with names like "Pistol P7 Kiraric" (type, 2–3 char designation, nonsense name) and lore stubs. BW has roughly 140 weapons.
- (a) Fully independent: new names and lore for every BW-derived weapon, and OMA lore is only a tone reference.
- (b) Mapped: where a BW weapon fits an OMA item, give the OMA item BW-derived mechanics. Unmatched BW weapons get new OMA-style names.
- (c) Hybrid: independent catalog, but follow the OMA naming convention and lore style so the two can sit together.

*Recommendation:* **(c)**, since mapping 114 onto 140 weapons with different concepts would bend both. Could revisit later with a "suggested OMA matches" cross-reference.

Author: Ah no no, the original OMA arsenal can be disregarded/ignored. I only included those as inspiration if they'd come in handy when rewriting the descriptions/lore for the new set of weapons that would be fully independent. The naming convention in docs/project-objective.md is what I want since it has the correct weapon class split I envision.


**5. Who invents names and lore?** Should I generate the new names, designations and short descriptions (OMA-style: TYPE / EFFECT / INTENT, vague and swappable), or do you want to supply or approve them?
*Recommendation:* I generate them in batches and you veto or rename. Filenames follow your scheme, e.g. `sidearm_pistol_p7-kiraric.md`.

Author: oma-brand\lore-descriptions can be an inspiration for the lore tone, while this piece from the oma-pack-readme.txt holds true:

<lore>
LORE: (this is the important part for the project)

In a far spacefaring future there be humans, aliens, mercenaries, freelancers, contractors and adventurers that go to different places in the galaxy to blast away various monsters, robots and vehicles that threaten the peace of the galaxy.

OMA is a general umbrella term to describe the entire collective of various weapons, tools and devices that these people may use during their adventures - regardless of what origin or intended purpose the gun originally had. Usually someone got it somewhere, somehow, and decided to use it because they liked it or because it was the only thing available to them.

The lore and weapon descriptions are intentionally vague so that you can inject your own lore into these guns. I merely give a suggestion as to what each piece is and what use-case it could have, but you or your writer are encouraged to replace all that info with whatever weapon stats and description as you wish."
</lore>

However the naming/lore is all up to you, I have no care other than that the descriptions match the functionality of the weapon, while the lore can be whatever that suits the weapon.

For naming, see answer #4.

**6. BW traceability.** Severing the link in the kit is clear. But during development it's very useful for us to know which kit weapon came from which BW class (to re-check stats, fix mistakes).
*Recommendation:* keep a **private provenance map** (`provenance/` folder, kit-name → BW class + package) that's excluded when you copy the kit into a game project.

Author: I agree, go with the recommendation.

**7. Distribution and licensing.** Is the kit for your private use only, or will it be published/sold under the OMA brand (like the asset packs)? This decides how strict we must be: if it's published, no verbatim BW text or code, original descriptions only, and pseudo code written fresh rather than transliterated. Mechanics and numbers are fine either way.

Author: It will be free and open source. I will publish it on github, with the idea that it can be later expanded with even more new entries than what BW v2.9 provided, be it entirely new weapons that follow/inspired-from the same standards as the rest of them, or new variants of existing weapon that either swap some features/functions with a different mode/function or chimera weapons that combine functions from different weapons to create new interesting variants that have their own lineage/manufacturer/stats/style.

I will also want to release this on itch.io as a free data-asset pack that can browsable, hence the simple html or python GUI based read-only catalog that is data-driven. People would be able to download it, toss it into their AI coded project as context, optionally expand it with new entries in an easy way and the catalog app would let them view/browse the collection and also warn them if an entry has issues/missing details that need to be addressed that otherwise would be a problem if given to AI to read/implement. I probably wouldn't have any graphical elements in the app, unless you can implement some ultra simple color primitive shapes based designation to indicate if something is a light/heavy weapon, is it melee/ranged/throwable, energy/ballistic and the shape's side and saturation communicating how powerful of a weapon it is. Sort of like a "ID-badge" that makes browsing easier when there are visual anchors to remember and lock in on with eyes.

Another point with github is that I have Claude Code Cloud usage credits available to me so I wanna load the project to github, then use my Claude Code via the Claude Windows Desktop app to do this job while I work on other stuff.


## C. Scope: what counts as an entry

**8. What's in scope?** Candidates beyond normal guns: target designator and airstrikes (`BWBPAirstrikesPro`), vehicles (`BWBP_VPC_Pro`: bomber, tank and their weapons), deployables (turrets, mines, tripwires), utilities (ammo pack, ballistic shield, defib fists, sandbags), and gold or ice cosmetic re-skins (Gold Eagle, Ice F2000).
*Recommendation:* include everything a player wields or deploys (designators, deployables, utilities included). Fold re-skin variants into their base weapon unless their mechanics differ. Vehicles get a separate later phase (or trash) since you said vehicles are a different design problem. Want vehicle weapons at all?

Author: "include everything a player wields or deploys (designators, deployables, utilities included)." - Yes to these.

Vehicles wise I was thinking of a 'Lost Planet: Extreme Condition' inspired idea where the vehicle weapons can be like the 'Vital Suit weapons' from that game - giant weapons that a player can physically detach from vehicles/mechs/tanks/technicals, carry them around with a lot of effort and even actually use them on foot with some personal risk involved - things like ridiculous recoil/inaccuracy penalties, cannot move and shoot at the same time without getting knocked away like a ragdoll by the knockback, slows down movement, etc.

However I do not know how the vehicle weapons are defined in the code and if it'd be possible to extrapolate or even invent stats to support this idea so I leave that up to you. While the inspo kit takes strong inspiration from the BW v2.9 weapons and mechanics, we can extend beyond it to properly support systems/mechanics that in BW v2.9 itself was achieved with hacks.

In a hypothetical game that would feature detachable vehicle-intended weapons alongside regular infantry weapons, the vehicles/mechs/turrets/mounts or power-armors/cyborgs/robots would have parameters that give those entities grip-strenght, mount-recoil-migitation, mass/weight to resist the different "negative" effects that a regular human would struggle with. It'd be more than just a binary "immune to forces" flag, since I want to capture the different result if a tank cannon is mounted on a pickup truck vs an actual battle tank - both would still "feel the effect" of the weapon, but while the tank might stand, the pickup truck could flip over.

**9. Weapon class taxonomy.** Your draft: sidearm / light melee, primary / heavy melee, throwable / placeable, misc. BW itself groups by slot: melee, pistols, SMGs, assault rifles, energy, machine guns, shotguns, explosives, snipers, grenades/misc.
*Recommendation:* the filename uses **your carry class** as the first token (it's what a game's inventory cares about), and the second token is the **archetype** (pistol, shotgun, beam, launcher, blade, mine…). Tags in the file add damage form (ballistic, energy, explosive, melee, chemical…) and special traits (dual-wieldable, charge-up, lock-on, deployable…). Classes: `sidearm`, `light-melee`, `primary`, `heavy-melee`, `heavy` (launchers, miniguns: maybe merge into primary?), `throwable`, `placeable`, `utility`. Add or merge as you like.

Author: Go with the recommendation, I like your idea more and its a stronger fit than my original simpler filename I proposed.


## D. Core mechanics docs

**10. Which systems get a core-mechanics doc?** Candidates I've seen in `BCoreProV55`: recoil (climb, decline, curves), aim/spread/chaos (hipfire vs ADS, movement/jump/sprint penalties), ADS/scopes/zoom, damage (head/limb multipliers, range falloff, penetration), fire modes (semi, burst, auto, charge, hold), ammo and reload (mag, tactical vs dry reload, cocking, `bMagPlusOne`), dual wield, melee and blocking, weight/inventory size/move speed, heat/overheat, special damage effects (burn, blind, stun, poison…), layouts/attachments, sprint/stamina.
*Recommendation:* all of the above, as one short doc each, plus a "weapon schema" doc that defines every field a weapon file can use. Should player movement (dodge, slide, prone) be in scope, or only where it touches weapon handling? (Note: the Gemini overview mentions prone and slide. I haven't verified BW has them and will check the code before trusting it.)

Author: All of the above as you recommend, I can always tell the AI to disregard a particular mechanic/system during development, but by default I want the full spectrum of systems. The best part about BW is precisely all the detailed tacticool stuff it has that the player has to manage.

I do want dodge, slide and prone stuff too, slide being the slide known from Titanfall/Apex Legends, even including the wall running and such parkour stuff they had there. Weapons and characters are usually interacting with one another so I think we would also have to provide player/NPC parameters too, including some parameters that weapons could exploits like organics vs robots vs cyborgs vs energy shields vs dirt/wood/stone/metal/concrete/glass/etc. vs water or gasses, etc. being more susceptible to certain types of damage and resistant against others or having special interactions in being able to create side effects, like being able to set flammable objects ablaze due to the nature of the payload of the weapon. I'd also assume that gravity can be variable instead, so the weapon system as a whole could be used in low-gravity, high-gravity, zero-gravity, earth-gravity, (plus underwater) environments adaptively.

**11. Your own extensions.** Your vision mentions ideas BW may not have, like durability with cock-to-unjam at decreasing success chance. Include these as clearly marked **"OMA extension (optional)"** mechanics alongside the BW-derived ones?
*Recommendation:* yes, in a separate `core-mechanics/extensions/` section so faithful and invented material never blur.

Author: I want the final product to not be confined to BW, but allow it to extend and improve/standardize things that were implemented in BW as hacks or had some conventions that would be overall a better solution - given all the other answers I've written above so far. I'd actually make the extra stuff I mentioned in my vision that BW doesn't have be a proper standard feature, not an extension.

**12. Pseudo code flavour.** Python-ish, C#-ish, GDScript-ish, or deliberately language-less?
*Recommendation:* Python-flavoured pseudo code (most compact, every LLM reads it well), with dimension-neutral vectors (`aim_dir`, `rotate(aim_dir, angle)`), so it applies equally to 2D and 3D.

Author: Go with the recommendation. Since LLMs are the ones to primarily read it, it makes sense to use whatever is most comfortable/common to them. (I assume python will be easy to interpret/convert/infer into other languages since usually I don't develop games on python? I'm guessing yes.)

## E. Kit format and browsing

**13. Per-weapon file format.** Markdown with a **YAML front-matter block** holding all stats (machine-readable, easy to convert to JSON for a game), followed by prose sections: concept, controls table (Primary / Secondary / Weapon Function / Fire Mode / Reload / ADS / Cock / Dual / Melee), variants, design notes (why it's interesting, adaptation hints for 2D/top-down), and pseudo code only if needed. OK, or do you prefer stats as a separate JSON/CSV per weapon or for the whole catalog?

Author: Ok, YAML works. Per weapon files is good so that users can browse and choose the ones they want and skip the rest - like if someone makes a game that takes place in an older time period where energy weapons or alien weapons don't make sense, they can look at the filenames or tags and be like "please skip those" or select them and remove them before they load them into an AI session.

**14. Packaging as a Claude skill.** You described the kit as a "skill-like" thing. Should the kit root have a `SKILL.md` (skill front-matter plus "how to use this kit" instructions for an LLM), so it can be installed directly as a Claude Code skill in a game project?
*Recommendation:* yes. It costs little and makes "use the OMA inspo kit as a cookbook" a one-liner.

Author: Sure, I'm ok with it - might help with navigating it I guess as a sort of index or nexus, dunno. Originally I didn't intend it to be a literal 'Claude skill.md', but just something I'd throw into a folder and say "hey look at this inspo kit and take X,Y,Z parts of it, but omit the A,B,C parts for this particular project". If its a useful, sure, why not.

**15. Browser app.** Options: (a) none, just markdown; (b) a generated **single-file static HTML** catalog (filter by class/tag, sort by stats, compare two weapons, read the full entry), no server needed and opens offline; (c) a Python GUI app.
*Recommendation:* **(b)**, generated from the weapon files by a script so it never drifts out of sync. Python GUIs add install friction for no real gain. Should it show the BW icons? (That conflicts with severing the link. Fine for a private dev browser, not for a shipped kit.)

Author: Ok single-file static HTML is good. About the bw icons, no skip them in favor of the idea I proposed in answer #7.

**16. Batch strategy.** Once the above is settled, the plan is: (1) full v2 re-decompile, (2) write a script that pulls each weapon's stats from its params/fire/projectile classes into a structured dataset, (3) draft core-mechanics docs, (4) write weapon entries in batches by package or class, starting with a pilot batch of ~5 diverse weapons for you to review before scaling. Any weapons you specifically want in the pilot (favourites, or the weirdest ones)?

Author: Good plan and strategy. About specific ones to review first, hmm, a diverse and familiar set I recognize are these:
- X3 Knife
- M806A2 .45 Pistol
- Fifty-9 Machine Pistol
- M50 Assault Rifle
- E-23 'Viper' Plasma Rifle
- HVC-Mk9 Lightning Gun
- G5 RPG Launcher
- RX-22A Flamethrower
- M75 Railgun
- FP9A5 Explosive Device
- XMV-850 Minigun
- FP7 Grenade

They don't cover all the mechanics, but are each distinctly different to cover a lot of archetypes nonetheless. I avoided similar weapons like variants of assault rifles or pistols and picked the ones that differ the most and represent (somewhat) a larger category of weapon types. If these are too much, feel free to limit to the first 3 on that list - they're the staples of BW.