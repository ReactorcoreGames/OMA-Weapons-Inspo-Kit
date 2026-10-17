# BW Weapons data extraction

## About

The purpose of this project is to create a document or set of documents that can be fed to an LLM as context for it to create a set of content for a video game that features combat and weapons.

In particular its based on Ballistic Weapons Definitive Edition v2.9 (I'll call it BW from now) that is a mod for Unreal Tournament 2004 (UT2004).

BW is special because its roster of highly tactical (and tacticool) weapons is not only large but each weapon is exceptionally rich in functions.

Most BW weapons have access to several keyboard control keys:
- Primary
- Secondary
- Weapon Function
- Fire Mode Select
- Reload
- Aim-Down-Sights (ADS) or Scope or Zoom (generally theres an inaccuracy and recoil mechanic in BW and not holding ADS will have the weapon to be in "hip-fire" mode, which is commonly less accurate.) May work differently if weapon is being dual wielded vs solo wielded.
- Cock (for coolness, simply does cocking/similar animation on weapon - satisfying to do for absolutely no reason, might be useful if game has durability system and degraded weapon jams and cocking can be used to fix/unjam weapon - with a decreasing % chance to succeed the worse the weapon condition is and each weapon may have its own cock cooldown before it can be tried again.)
- Dual Wield (if applicable and a pair of said weapon is available - all functions still work, pressing primary/secondary fires both weapons, wep-func/reload/firemode triggers on both weapons. If an uneven amount of ammo is on weapons (they both track their own ammo magazines) and one runs out before the other, then only the weapon that still has ammo will keep firing)
- Melee strike (will swing the weapon - even if its a bazooka)

I had gemini gather some info too in here:
ballistic_weapons_reference By Gemini AI.md

These controls can be used context sensitively by firearms (ballistic or energy based), melee weapons (also ballistic or energy based), throwables, deployables (planted mines/laser tripwire) and hybrids of any of those, plus non-standard weapons like laser designators for airstrikes. Essentially each weapon has its own unique scripting that determines what it does and what game systems it taps into.

As an example, the most "basic" pistol in BW does this:
Primary: fire bullets as per firing mode
Secondary: toggle targeting laser on/off
Weapon Function: Attach/Remove silencer
Fire Modes: Single fire/burst fire (on other weapon can change ammo types or swap between operational modes, etc.)
ADS: aim down sights if solo wield or slightly zoom with pistols held more tightly for better accuracy, but maybe some drawback like slower movespeed or decreased FOV
Melee key: do pistol whip
Dual wield: dual wield pistols

While BW/UT2004 itself is a 3D first person shooter game, a lot of the ideas can also be adopted into 2D sideview or 2D topdown games too. The best part about it is that it allows for player to have excellent control over their weapons and be able to shootouts like in the old Matrix movie's Lobby Shootout scene. And I mean the control is both manual, the aiming is manual, yet intuitive and streamlined that it makes combat feel like a properly rich experience than just being a boring "Press W and Mouse1 to win the game". BW has a lot of nuance and flavor in how its weapons are designed that its a joy to use them, no matter if its a pistol or a plasma cannon.

## The mission

A lot of the games I want to make feature data driven content for weapons, projectiles, items, characters, props and stages. I've already seen and gotten bored by the typical boring archetype of pistol/smg/shotgun/ar/sniper/grenade that are often highly simple. Even vehicles in most games boil down to "machineguns + rockets".

To both give a good foundation of content to implement into a game and source of ideas to be inspired by, I want to extract the stat parameters the weapons use for the various core mechanics of the game that affect damage, ammo counts, rate of fire, recoil and many such common stats, but also descriptions of what each key mentioned above does for a weapon in plain english.

I think we can find all this information in the notepad-openable files I've already extracted, but the tough part is to find all the stats and description and functions to make sense of what is useless info (and placed into a trash/ folder) and what is relevant so that we can build the docs that list both the core rules and also lists various weapon classes (TBD what classes, but I think this setup is good: sidearms or light melee (dual-wieldables), primary weapons or heavy melee (two-handed), throwables/placeables, misc/other (sandbags)), that as a whole will give enough information and good target stats to aim for that have been already proven to be somewhat balanced and sensible.

I'm a bit 50/50 on this, but I think theres 154 total weapons/devices the player can wield in BW. I have the folder called "small icon of all BW v2.9 weapons" that has an icon for each of them.

Part of me thinks this is a big task, so it might be better to start with analysing the folder contents and eliminating the files that for sure are not needed and then gradually work our way to figure out which ones to keep and what info to grab about of them.

I'd want to assign each weapon a new name so the link the BW is severed and the weapons could have their own new identity, graphics, sounds and animations as per each game needs them, with us mostly creating a catalogue of ideas that contains stats, descriptions, perhaps snippets of pseudo-code that can better explain how a weapon works, especially in situations when a simple plain english writing wouldn't be able to describe adequately or usefully enough for an LLM to grasp the concept.

In regards to final structure is TBD, but I envision this:
catalog index.md
core mechanics/ (folder for core mechanics info .md files live here)
weapons/ (in this folder every weapon is stored in its own unique .md file, with a filename that helps categorize it by class type, designation and name/ID/nickname. Probably like "sidearm_pistol_direwolf-44r.md" or "heavy-melee_zweihander_XL-boneslicer.md" or "primary_shotgun_roadhog.md".

And then when I'm developing a game and I want to create some cool guns for it, I can take this folder into the project folder, throw in my graphics, descriptions and sounds into my assets/ folder for the game and then tell the LLM to check out the "OMA Weapons Inspo Kit" and use my provided assets to build out new guns using the OMA inspo kit as a cookbook. And prior to that, I'd also tell it "hey I wanna create a data driven weapon system for my 2D game, look at this OMA inspo kit and create an adapted weapons system inspired by it to my game's camera/dimension perspective sensibilities."

Note: OMA = Offworld Mercenary Arsenal