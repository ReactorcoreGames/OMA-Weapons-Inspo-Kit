### User

I had this idea of getting a UT2004 mod and extracting the weapon data from it to port it into another game - just the stats and functions, no art or sounds - and I wondered if its feasible to do that. Like, the Unreal Tournament 2004 had a folder with some .u .ucl or somethig like that - files that had the code and stats and definitions for the content - are those readable in notepad++ or can I extract them for the benefit of an LLM somehow?Show moreShow less

### Assistant

Yes. **This is very feasible**, and UT2004 is actually unusually friendly to this kind of extraction.

The important distinction is:

- `.u` = compiled UnrealScript package. **Not readable directly in Notepad++**, but it contains the classes/bytecode and can be exported/decompiled.
- `.uc` = UnrealScript source. **Plain text**, perfectly readable by Notepad++ and very suitable for feeding to an LLM.
- `.ucl` = package/class metadata used by UT2004 to describe content to the game. It is plain text, but **it isn't where the weapon implementation lives**. 

### The workflow you'd want

If you have something like:

```
MyWeaponMod.u
MyWeaponMod.ucl
MyWeaponMod.int
```

you'd extract the `.u` into `.uc` source files.

UT2004's `ucc.exe` can do this directly. For example:

```
ucc batchexport MyWeaponMod.u class uc ..\MyWeaponMod\Classes\
```

That gives you something along the lines of:

```
MyWeaponMod/
    Classes/
        MyWeapon.uc
        MyWeaponFire.uc
        MyProjectile.uc
        MyAmmo.uc
        ...
```

The `.uc` files are then just text. The `ucc batchexport` method is specifically documented for UT2004.

There are also dedicated package browsers/decompilers such as **WOTgreal**, **UTPT**, and newer tools such as **UE Explorer** that can inspect/decompile Unreal packages. UE Explorer specifically supports UnrealScript decompilation and exporting classes from `.u` packages.

### And this is where your LLM idea gets interesting

You don't necessarily want to give the LLM the entire mod.

You could extract the relevant class hierarchy:

```
Weapon
 └── MyWeapon
      ├── MyWeaponFire
      ├── MyWeaponAltFire
      ├── MyProjectile
      └── MyAmmo
```

Then give the LLM the `.uc` files and ask it to produce something like:

```
Weapon: Plasma Rifle

Primary fire:
- Fire rate: ...
- Projectile speed: ...
- Damage: ...
- Splash radius: ...
- Ammo consumption: ...
- Charge mechanic: ...

Secondary fire:
- ...

Reload:
- ...

Special mechanics:
- ...
```

Or, even better for porting, have it translate the **behavior into a neutral specification**:

```
weapon:
  name: Plasma Rifle

  primary:
    type: projectile
    damage: 40
    fire_interval: 0.25
    projectile_speed: 3000
    ammo_cost: 1

  secondary:
    type: charge
    max_charge_time: 2.0
    damage_curve: ...
```

You could then implement that specification in whatever game you're porting to.

### One important complication

A weapon's behavior may **not be contained in one .uc file**.

UnrealScript uses inheritance heavily. A mod weapon might contain:

```
class MySuperGun extends SomeExistingGun;
```

and `SomeExistingGun` might inherit from another class, which inherits from `Weapon`, while the actual projectile behavior lives in a separate `Projectile` class.

So for accurate extraction you'd want to follow the dependency tree rather than just dump the obvious weapon class.

That's actually something I could help automate.

**If you give me the .u files from the mod**, we could potentially build a pipeline that:

- Extracts/decompiles all `.uc` classes.
- Identifies weapon-related classes.
- Follows their inheritance/dependencies.
- Strips irrelevant rendering/audio code.
- Extracts gameplay properties and functions.
- Produces a compact **weapon specification specifically designed for an LLM to understand**.
- Potentially generates implementation code for your target engine. 

And because `.u` packages contain the compiled UnrealScript and the relevant class information, you don't necessarily need the original mod source to start with.

There is also an important **copyright/licensing consideration** if you're porting somebody else's mod: technically extracting code is one thing; whether you can redistribute the resulting implementation/code is governed by the mod's license and the underlying game's terms. For your own analysis/prototyping, that's a separate question from redistribution.

### User

Hmm ok so far so good. So in theory I wouldn't need UT2004 itself installed - I could just go grab the mod and one of those UE Explorer programs to get the job done? I do have the game on a CD, its no issue to install it or even just get the free one, but I'm trying to keep lean with my HDD space.

### Assistant

Yes — **for extraction/decompilation, you generally don't need a full UT2004 installation**.

The lean setup would be roughly:

```
Mod/
├── SomeMod.u
├── SomeMod.ucl
├── SomeMod.int
└── other package files

Tools/
└── UE Explorer
```

You can point a package explorer/decompiler at the `.u` files and inspect/export the UnrealScript classes.

### The catch

There are two levels of dependency:

**1. Extracting the mod's own classes**

Usually no UT2004 installation required.

You can get:

```
MyWeapon.uc
MyWeaponFire.uc
MyProjectile.uc
MyAmmo.uc
...
```

and inspect them.

**2. Understanding what those classes inherit from**

This is where having the **UT2004 base packages** becomes useful.

For example:

```
class MyRocketLauncher extends xWeapon;
```

The mod's `.u` might tell us what `MyRocketLauncher` does, but some of its behavior comes from:

```
MyRocketLauncher
    ↓
xWeapon
    ↓
Weapon
    ↓
Inventory
    ↓
Actor
```

And `xWeapon`, `Weapon`, etc. live in UT2004's own packages.

So you may encounter references like:

```
Super.FiringMode = 1;
Instigator.Controller.AdjustAim(...);
Spawn(class'Whatever');
```

where understanding the parent class or referenced class makes the behavior much clearer.

### For your particular goal

I'd actually recommend **keeping a small copy of the UT2004 packages somewhere**, rather than installing the entire game.

You'd ideally want things like:

```
UT2004/
    System/
        Core.u
        Engine.u
        UnrealGame.u
        XGame.u
        XWeapons.u
        ...
```

That's probably enough to let us resolve most of the interesting weapon dependencies.

You don't need:

```
Maps/
Textures/
Sounds/
Music/
Movies/
Animations/
```

for the kind of analysis you're describing.

### And there's an even better approach

If your ultimate goal is:

"Give an LLM a UT2004 mod and have it produce the weapon mechanics in a form I can implement elsewhere"

I'd avoid relying entirely on UE Explorer's GUI.

I'd set up a little extraction workspace:

```
UT2004 Mod Extraction/
│
├── input/
│   ├── ModName.u
│   └── ...
│
├── base_packages/
│   ├── Engine.u
│   ├── UnrealGame.u
│   ├── XGame.u
│   └── XWeapons.u
│
├── extracted/
│   └── *.uc
│
└── output/
    ├── weapon_manifest.json
    ├── weapon_specs/
    └── llm_context/
```

Then we can make a script that automatically turns the ugly UnrealScript/decompiled output into **clean, compact LLM context**.

That would be much more useful than dumping 500 `.uc` files into a context window.

If you have the mod already, **you can give me the .u/.ucl files (or zip the relevant folder)** and I can tell you exactly what needs extracting and how I'd structure the pipeline.

