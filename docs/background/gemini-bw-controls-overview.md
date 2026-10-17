# Ballistic Weapons Design Reference Manual
*An overview of the gameplay mechanics, weapon interaction controls, and movement systems inspired by the Unreal Tournament 2004 mod.*

---

## 1. Weapon Interaction & Tactical Controls

These controls manage the technical and tactical operations of individual firearms. Instead of streamlining weapon behaviors, these inputs require active mechanical management from the player.

*   **`Reload`** (`Reload | OnRelease ReloadRelease`)
    *   **Tactical vs. Dry Reloading:** Swaps the ammunition magazine. If the magazine is partially full, the weapon retains a round in the chamber, resulting in a faster reload animation. If completely empty (dry), the player must wait through an extended animation to manually cycle the action.
*   **`CockGun`** (`CockGun`)
    *   **Manual Action & Jam Clearing:** Cycles the slide, bolt, or pump handle. Used to manually chamber the first round of an empty gun, clear mechanical jams/misfires caused by rapid overheating, or manually cycle pump-action shotguns and bolt-action rifles.
*   **`ScopeView`** (`ScopeView | OnRelease ScopeViewRelease`)
    *   **Aim Down Sights (ADS):** Seamlessly shifts the camera perspective. For standard weapons, this lowers the weapon model to align with iron sights or holographic optics, tightening the dynamic accuracy cone. For specialized sniper chassis, it overrides the view with high-magnification variable scopes, thermal overlays, or night-vision filters.
*   **`WeaponSpecial`** (`WeaponSpecial | OnRelease WeaponSpecialRelease`)
    *   **Contextual Chassis Modification:** The universal "interact with your gun" input. Its function alters completely depending on the equipped weapon:
        *   *Heavy Weapons:* Deploys or retracts static stabilizing bipods/tripods.
        *   *Tactical Weapons:* Attaches or detaches screw-on silencers/suppressors.
        *   *Sidearms/PDWs:* Folds or unfolds the shoulder stock (folding a stock trades recoil stability for faster weapon draw and movement speed).
        *   *Utility Items:* Toggles integrated under-barrel accessories like high-intensity flashlights or visible laser sights.
*   **`WeaponSpecial 1`** (`WeaponSpecial 1 | OnRelease WeaponSpecialRelease 1`)
    *   **Secondary Weapon Systems:** Directly triggers auxiliary primary systems. Most commonly used to fire independent under-barrel weapon attachments, such as integrated 40mm grenade launchers, masterkey underslung shotguns, or pneumatic stakes.
*   **`SwitchWeaponMode`** (`SwitchWeaponMode | OnRelease WeaponModeRelease`)
    *   **Selective Fire Regulator:** Cycles the weapon's fire selector switch. Moves through Safe, Semi-Automatic, 3-Round Burst, or Full-Automatic profiles. Each setting dynamically restructures the weapon's rate of fire, base damage, and per-shot recoil progression.
*   **`DualSelect`** (`DualSelect`)
    *   **Akimbo Toggle:** Dictates dual-wielding posture. When a duplicate sidearm or submachine gun is present in the player's inventory, this key toggles between maintaining a single accurate weapon (allowing ADS) or splitting into a dual-wield stance for massive close-range volume of fire.

---

## 2. Player Movement Systems

Movement inputs interact directly with weapon handling variables like sway, momentum, and accuracy.

*   **Sprint** (`Mutate BStartSprint | OnRelease Mutate BStopSprint`)
    *   **High-Velocity Dash:** Boosts forward horizontal movement velocity at the cost of a continuously draining stamina pool. 
    *   **Weapon Penalty:** Sprinting instantly forces the weapon into a lowered "high-ready" animation state, completely disabling the ability to fire or aim down sights until the sprint ceases and the weapon reset delay clears.
*   **Crouch / Prone** (`Duck` / `Prone`)
    *   **Stance-Based Stabilization:** Progressively lowers the player's physical hitbox. Crouching significantly stabilizes vertical recoil and subdues passive weapon sway. Dropping into prone yields maximum stability (crucial for heavy anti-materiel rifles) at the cost of near-total immobilization.
*   **Dodge / Evasion** (`Double Tap Movement Direction`)
    *   **Kinetic Redirection:** Fast, directional leaps executed by double-tapping a movement key. It functions as an emergency tool to clear incoming projectiles, though it incurs a severe, instantaneous crosshair expansion penalty.
*   **Slide** (`Crouch during Sprint`)
    *   **Momentum Transition:** Converts forward sprint velocity into a low-profile slide. This allows players to pass under tight cover or move aggressively through chokepoints while maintaining a tighter accuracy spread than a standard dodge.

---

## 3. Gameplay Systems & Mechanical Loops

These interconnected loops turn standard shooter interactions into highly systemic tactical encounters.

*   **Dynamic Inventory Weight (Encumbrance)**
    *   Every weapon features an active weight value. Carrying heavier firearms (like rocket launchers or heavy machine guns) degrades base movement velocity, increases sprint stamina drainage, and slows weapon swap/draw speeds.
*   **Stamina Pool Interaction**
    *   Stamina is a shared resource consumed by sprinting, jumping, dodging, and sliding. When completely depleted, the player cannot execute evasion maneuvers, their movement speed drops, and passive weapon sway amplifies dramatically to simulate physical exhaustion.
*   **Dynamic Crosshair and Weapon Sway**
    *   Crosshairs do not remain static. Accuracy scales dynamically based on physical posture (Standing, Crouching, Prone), movement velocity, recent recoil accumulation, and eye fatigue during prolonged scope usage.
*   **Active Recoil & Physics-Driven Penetration**
    *   Recoil applies a distinct physical kick to the player's camera alongside procedural weapon-model climb. Projectiles carry ballistic values that allow them to penetrate thin surfaces (wood, drywall, sheet metal) or ricochet off angled hard armor plates depending on the caliber used.
