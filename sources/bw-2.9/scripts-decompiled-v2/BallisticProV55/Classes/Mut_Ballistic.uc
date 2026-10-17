class Mut_Ballistic extends Mutator
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct ItemSwitch
{
	var() string OldItemName;
	var Class<Actor> OldItem;
	var() bool bUseBase;
	var() bool bSuper;
	var() array<string> NewItemNames;
	var array< Class<Actor> > NewItems;
};

struct DoomedItem
{
	var() Actor OldItem;
	var() Class<Actor> NewClass;
	var() Pawn Instigator;
};

struct PickupSwap
{
	var() Pickup Old;
	var() int NewIndex;
};

var BallisticReplicationInfo BallisticRep;
var() array<ItemSwitch> Replacements;
var() Sound UDamageSnd;
var array<DoomedItem> DoomedItems;
var array<PickupSwap> PickupSwaps;
var globalconfig bool bLogCheckReplacement;
var globalconfig bool bPreloadMeshes;
var globalconfig bool bUseItemizer;
var globalconfig string ItemGroup;
var globalconfig bool bLeaveSuper;
var globalconfig bool bBrightPickups;
var globalconfig bool bSpawnUniqueItems;
var globalconfig bool bPickupsChange;
var globalconfig bool bRandomDefaultWeapons;
var globalconfig string CamUpdateRate;
var globalconfig bool bKillRogueWeaponPickups;
var globalconfig bool bForceBallisticPawn;
var localized string LeaveSuperDisplayText;
var localized string LeaveSuperDescText;
var localized string BrightPickDisplayText;
var localized string BrightPickDescText;
var localized string DarkSkinsDisplayText;
var localized string DarkSkinsDescText;
var localized string PChangeDisplayText;
var localized string PChangeDescText;
var localized string UniqueDisplayText;
var localized string UniqueDescText;
var localized string RandDefDisplayText;
var localized string RandDefDescText;
var localized string ItemizerDescText;
var localized string ItemizerDisplayText;
var localized string GroupDisplayText;
var localized string GroupDescText;
var() bool DMMode;
var() bool bHideLockers;
var bool bLWsInitialized;
var() localized array<localized string> CamRateOptions;
var bool bSpawnedIA;
var bool bDoItemize;
var array<BCSprintControl> Sprinters;
var int CRCount;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientModifyPlayer;
}

simulated function PreBeginPlay()
{
	// End:0x3C
	if(int(Role) == int(ROLE_Authority))
	{
		BallisticRep = Spawn(Class'BCoreProV55.BallisticReplicationInfo');
		Class'BCoreProV55.BallisticGameStyles'.static.GetLocalStyle().InitializeReplicationInfo(BallisticRep);
	}
	// End:0x89
	if(BallisticRep.default.bHealthRegeneration)
	{
		Level.Game.AddMutator("BallisticProV55.Mut_Regeneration", false);
	}
	// End:0xDC
	if(BallisticRep.default.bShieldRegeneration)
	{
		Level.Game.AddMutator("BallisticProV55.Mut_ShieldRegeneration", false);
	}
	// End:0x124
	if(bPreloadMeshes)
	{
		Level.Game.AddMutator("BallisticProV55.Mut_BallisticPreLoad", false);
	}
	// End:0x16F
	if(BallisticRep.default.bKillstreaks)
	{
		Level.Game.AddMutator("BallisticProV55.Mut_Killstreak", false);
	}
	// End:0x1B9
	if((BallisticRep.default.HealthKillReward > 0) || BallisticRep.default.ShieldKillReward > 0)
	{
		Level.Game.AddGameModifier(Spawn(Class'BallisticProV55.Rules_KillRewards'));
	}
	// End:0x1F5
	if(Invasion(Level.Game) != none)
	{
		Level.Game.AddGameModifier(Spawn(Class'BallisticProV55.Rules_Invasion'));		
	}
	else
	{
		Level.Game.AddGameModifier(Spawn(Class'BallisticProV55.Rules_Ballistic'));
	}
	// End:0x280
	if((Level.Game.DefaultPlayerClassName ~= "XGame.xPawn") || bForceBallisticPawn)
	{
		Level.Game.DefaultPlayerClassName = "BallisticProV55.BallisticPawn";
	}
	// End:0x2E4
	if(Level.Game.PlayerControllerClassName ~= "XGame.xPlayer")
	{
		Level.Game.PlayerControllerClassName = "BallisticProV55.BallisticPlayer";
	}
	LoadItemClasses();
	super.PreBeginPlay();
	//return;	
}

simulated function BeginPlay()
{
	local WeaponLocker W;
	local int i, j;

	// End:0xC7
	foreach AllActors(Class'XWeapons.WeaponLocker', W)
	{
		i = 0;
		J0x17:

		// End:0xC6 [Loop If]
		if(i < Replacements.Length)
		{
			j = 0;
			J0x2E:

			// End:0xBC [Loop If]
			if(j < W.Weapons.Length)
			{
				// End:0xB2
				if(W.Weapons[j].WeaponClass == (GetInventoryFor(Replacements[i].OldItem)))
				{
					W.Weapons[j].WeaponClass = Class<Weapon>(GetInventoryFor(Replacements[i].NewItems[0]));
				}
				j++;
				// [Loop Continue]
				goto J0x2E;
			}
			i++;
			// [Loop Continue]
			goto J0x17;
		}		
	}	
	SetTimer(0.0500000, false);
	super(Actor).BeginPlay();
	//return;	
}

function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	// End:0x29
	if(bUseItemizer && int(Role) == int(ROLE_Authority))
	{
		bDoItemize = true;
	}
	//return;	
}

function Class<Actor> GetNewItem(int Index, optional bool bNoUnique, optional Class<Actor> OldItem)
{
	local array<int> Ranks;
	local Pickup P;
	local Inventory Inv;
	local int i;
	local array< Class<Actor> > LowestItems;

	// End:0x2B
	if((Replacements.Length <= Index) || Replacements[Index].NewItems.Length < 1)
	{
		return none;
	}
	// End:0x32A
	if((!bNoUnique && bSpawnUniqueItems) && Replacements[Index].NewItems.Length > 1)
	{
		// End:0xE0
		foreach DynamicActors(Class'Engine.Pickup', P)
		{
			i = 0;
			J0x71:

			// End:0xDF [Loop If]
			if(i < Replacements[Index].NewItems.Length)
			{
				// End:0xD5
				if((GetPickupFor(Replacements[Index].NewItems[i])) == P.Class)
				{
					Ranks[i] = Ranks[i] + 1;
				}
				i++;
				// [Loop Continue]
				goto J0x71;
			}			
		}		
		// End:0x167
		foreach DynamicActors(Class'Engine.Inventory', Inv)
		{
			i = 0;
			J0xF8:

			// End:0x166 [Loop If]
			if(i < Replacements[Index].NewItems.Length)
			{
				// End:0x15C
				if((GetInventoryFor(Replacements[Index].NewItems[i])) == Inv.Class)
				{
					Ranks[i] = Ranks[i] + 1;
				}
				i++;
				// [Loop Continue]
				goto J0xF8;
			}			
		}		
		// End:0x1E5
		if(OldItem != none)
		{
			i = 0;
			J0x17A:

			// End:0x1E5 [Loop If]
			if(i < Replacements[Index].NewItems.Length)
			{
				// End:0x1DB
				if((GetPickupFor(Replacements[Index].NewItems[i])) == (GetPickupFor(OldItem)))
				{
					Ranks[i] = Ranks[i] + 1;
				}
				i++;
				// [Loop Continue]
				goto J0x17A;
			}
		}
		// End:0x216
		if(Ranks.Length < 1)
		{
			return Replacements[Index].NewItems[Rand(Replacements[Index].NewItems.Length)];
		}
		// End:0x24D
		if(Ranks.Length < Replacements[Index].NewItems.Length)
		{
			Ranks.Length = Replacements[Index].NewItems.Length;			
		}
		else
		{
			Ranks.Length = Replacements[Index].NewItems.Length;
			i = 0;
			J0x26C:

			// End:0x2B8 [Loop If]
			if(i < Ranks.Length)
			{
				// End:0x2AE
				if(Ranks[Ranks.Length - 1] > Ranks[i])
				{
					Ranks.Remove(Ranks.Length - 1, 1);					
				}
				else
				{
					i++;
				}
				// [Loop Continue]
				goto J0x26C;
			}
		}
		i = 0;
		J0x2BF:

		// End:0x31B [Loop If]
		if(i < Ranks.Length)
		{
			// End:0x311
			if(Ranks[i] == Ranks[Ranks.Length - 1])
			{
				LowestItems[LowestItems.Length] = Replacements[Index].NewItems[i];
			}
			i++;
			// [Loop Continue]
			goto J0x2BF;
		}
		return LowestItems[Rand(LowestItems.Length)];
	}
	return Replacements[Index].NewItems[Rand(Replacements[Index].NewItems.Length)];
	//return;	
}

function ModifyPlayer(Pawn Other)
{
	local Class<Weapon> fw;
	local int i;
	local BallisticPawn BPawn;

	BPawn = BallisticPawn(Other);
	// End:0x4C
	if((xPawn(Other) != none) && (GetSprintControl(Other.Controller)) == none)
	{
		CreateSprintControl(xPawn(Other));
	}
	// End:0xFC
	if(!DMMode && BPawn == none)
	{
		ClientModifyPlayer(Other);
		Other.GroundSpeed = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerGroundSpeed;
		Other.WalkingPct = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerWalkSpeedFactor;
		Other.CrouchedPct = Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerCrouchSpeedFactor;
		Other.Visibility = 16;
		Other.default.Visibility = 16;
		Other.bCanWalkOffLedges = true;		
	}
	else
	{
		// End:0x1E8
		if(xPawn(Other) != none)
		{
			Other.SuperHealthMax = float(Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerSuperHealthMax);
			Other.HealthMax = float(Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerHealthMax);
			Other.Health = Class'BCoreProV55.BallisticReplicationInfo'.default.StartingHealth;
			xPawn(Other).ShieldStrengthMax = float(Class'BCoreProV55.BallisticReplicationInfo'.default.PlayerShieldMax);
			Other.AddShieldStrength(Class'BCoreProV55.BallisticReplicationInfo'.default.StartingShield);
			// End:0x1E8
			if(BPawn != none)
			{
				BPawn.BPRI = Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Other.Controller.PlayerReplicationInfo);
			}
		}
	}
	// End:0x216
	if(Other.Controller != none)
	{
		Other.Controller.bRun = 0;
	}
	xPlayerReplicationInfo(Other.PlayerReplicationInfo).bForceNoPlayerLights = true;
	// End:0x31D
	if((Other.Controller != none) && Bot(Other.Controller) != none)
	{
		// End:0x31D
		if(Bot(Other.Controller).FavoriteWeapon != none)
		{
			fw = Bot(Other.Controller).FavoriteWeapon;
			i = 0;
			J0x2AF:

			// End:0x31D [Loop If]
			if(i < Replacements.Length)
			{
				// End:0x313
				if((GetInventoryFor(Replacements[i].OldItem)) == fw)
				{
					Bot(Other.Controller).FavoriteWeapon = Class<Weapon>(GetInventoryFor(GetNewItem(i, true)));
				}
				i++;
				// [Loop Continue]
				goto J0x2AF;
			}
		}
	}
	AddStartingAmmo(Other);
	super.ModifyPlayer(Other);
	//return;	
}

function AddStartingAmmo(Pawn Other)
{
	local int i;
	local Ammunition Ammo;
	local Inventory Inv;

	Inv = Other.Inventory;
	J0x14:

	// End:0x16C [Loop If]
	if(Inv != none)
	{
		i = 0;
		J0x26:

		// End:0x155 [Loop If]
		if(i < Replacements[1].NewItems.Length)
		{
			// End:0x14B
			if((Weapon(Inv) != none) && Inv.Class == (GetInventoryFor(Replacements[1].NewItems[i])))
			{
				Ammo = Ammunition(Other.FindInventoryType(Class<Weapon>(static.GetInventoryFor(Replacements[1].NewItems[i])).default.FireModeClass[0].default.AmmoClass));
				// End:0x11E
				if(Ammo == none)
				{
					Ammo = Spawn(Class<Weapon>(static.GetInventoryFor(Replacements[1].NewItems[i])).default.FireModeClass[0].default.AmmoClass);
					Other.AddInventory(Ammo);
				}
				Ammo.AddAmmo(Ammo.InitialAmount);
				Ammo.GotoState('None');
			}
			i++;
			// [Loop Continue]
			goto J0x26;
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x14;
	}
	//return;	
}

simulated function ClientModifyPlayer(Pawn Other)
{
	local Pawn P;

	// End:0x0D
	if(Other == none)
	{
		return;
	}
	// End:0x3B
	if(Other.Controller != none)
	{
		Other.Controller.bRun = 0;
	}
	// End:0xB9
	foreach DynamicActors(Class'Engine.Pawn', P)
	{
		// End:0xB8
		if((xPawn(P) != none) && BallisticPawn(P) == none)
		{
			xPawn(P).FootstepVolume = 0.3500000;
			xPawn(P).UDamageSound = UDamageSnd;
			xPawn(P).TransientSoundVolume = 0.2000000;
		}		
	}	
	//return;	
}

function string GetInventoryClassOverride(string InventoryClassName)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x95 [Loop If]
	if(i < Replacements.Length)
	{
		// End:0x8B
		if(string(GetInventoryFor(Replacements[i].OldItem)) ~= InventoryClassName)
		{
			// End:0x6B
			if(bRandomDefaultWeapons || i == 0)
			{
				InventoryClassName = string(GetInventoryFor(GetNewItem(i)));
				// [Explicit Continue]
				goto J0x8B;
			}
			InventoryClassName = string(GetInventoryFor(Replacements[i].NewItems[0]));
		}
		J0x8B:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return super.GetInventoryClassOverride(InventoryClassName);
	//return;	
}

function Rotator PickupAlign(Actor Old, out Vector HitLoc, optional Class<Actor> Replacement)
{
	local Actor t;
	local Rotator R, Dir;
	local Vector HitNorm, X, Y, Z, Extent;

	// End:0x56
	if(Replacement != none)
	{
		Extent.X = Replacement.default.CollisionRadius;
		Extent.Y = Replacement.default.CollisionRadius;
		Extent.Z = Replacement.default.CollisionHeight;
	}
	t = Trace(HitLoc, HitNorm, Old.Location - vect(0.0000000, 0.0000000, 200.0000000), Old.Location + vect(0.0000000, 0.0000000, 40.0000000), false, Extent);
	// End:0xD7
	if(t == none)
	{
		HitLoc = Old.Location;
		return Old.Rotation;
	}
	// End:0xFA
	if(StaticMeshActor(t) != none)
	{
		HitLoc.Z += float(3);		
	}
	else
	{
		// End:0x11A
		if(TerrainInfo(t) != none)
		{
			HitLoc.Z += float(5);
		}
	}
	Dir = Rotator(HitNorm);
	Dir.Pitch -= 16384;
	R = Old.Rotation;
	R.Pitch = 0;
	R.Roll = 0;
	GetAxes(R, X, Y, Z);
	X = X >> Dir;
	Y = Y >> Dir;
	Z = Z >> Dir;
	Dir = OrthoRotation(X, Y, Z);
	return Dir;
	//return;	
}

static function Weapon SpawnWeapon(Class<Weapon> NewClass, Pawn P)
{
	local Weapon newWeapon;

	// End:0x80
	if(((NewClass != none) && P != none) && P.FindInventoryType(NewClass) == none)
	{
		newWeapon = P.Spawn(NewClass,,, P.Location);
		// End:0x7A
		if(newWeapon != none)
		{
			newWeapon.GiveTo(P);
		}
		return newWeapon;
	}
	return none;
	//return;	
}

static function SpawnAmmo(Class<Ammunition> NewClass, Pawn P, optional float Multiplier)
{
	local Ammunition Ammo;

	// End:0x1A
	if((P == none) || NewClass == none)
	{
		return;
	}
	Ammo = Ammunition(P.FindInventoryType(NewClass));
	// End:0x6F
	if(Ammo == none)
	{
		Ammo = P.Spawn(NewClass);
		P.AddInventory(Ammo);
	}
	// End:0x7C
	if(Ammo == none)
	{
		return;
	}
	// End:0xB4
	if(Multiplier > float(0))
	{
		Ammo.AddAmmo(int(float(Ammo.InitialAmount) * Multiplier));		
	}
	else
	{
		Ammo.AddAmmo(Ammo.InitialAmount);
	}
	Ammo.GotoState('None');
	//return;	
}

function ItemPickedUp(Pickup Other)
{
	local float ChangeTime;

	// End:0x0D
	if(!bPickupsChange)
	{
		return;
	}
	// End:0x48
	if(Level.Game.bWeaponStay && BallisticWeaponPickup(Other) != none)
	{
		ChangeTime = 10.0000000;		
	}
	else
	{
		ChangeTime = 0.1000000;
	}
	// End:0xD2
	if(((BallisticWeaponPickup(Other) != none) && BallisticWeaponPickup(Other).ReplacementsIndex > -1) && Replacements[BallisticWeaponPickup(Other).ReplacementsIndex].NewItems.Length > 1)
	{
		BallisticWeaponPickup(Other).ChangeTime = Level.TimeSeconds + ChangeTime;
	}
	// End:0x151
	if(((BallisticAmmoPickup(Other) != none) && BallisticAmmoPickup(Other).ReplacementsIndex > -1) && Replacements[BallisticAmmoPickup(Other).ReplacementsIndex].NewItems.Length > 1)
	{
		BallisticAmmoPickup(Other).ChangeTime = Level.TimeSeconds + ChangeTime;
	}
	//return;	
}

function ItemChange(Pickup Other)
{
	local Pickup NewPickup;

	// End:0x89
	if(BallisticWeaponPickup(Other) != none)
	{
		BallisticWeaponPickup(Other).ChangeTime = 0.0000000;
		SpawnNewItem(BallisticWeaponPickup(Other).ReplacementsIndex, Other,, NewPickup);
		// End:0x86
		if(!Level.Game.bWeaponStay && NewPickup != none)
		{
			NewPickup.StartSleeping();
		}		
	}
	else
	{
		// End:0x112
		if(BallisticAmmoPickup(Other) != none)
		{
			BallisticAmmoPickup(Other).ChangeTime = 0.0000000;
			SpawnNewItem(BallisticAmmoPickup(Other).ReplacementsIndex, Other,, NewPickup);
			// End:0x10F
			if(!Level.Game.bWeaponStay && NewPickup != none)
			{
				NewPickup.StartSleeping();
			}			
		}
		else
		{
			return;
		}
	}
	Other.Destroy();
	//return;	
}

simulated event Timer()
{
	local int i;

	// End:0x11
	if(!bLWsInitialized)
	{
		AdjustLockerWeapons();
	}
	// End:0x23
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	J0x23:

	// End:0xAE [Loop If]
	if(DoomedItems.Length > 0)
	{
		// End:0xA3
		if((DoomedItems[0].NewClass != none) && DoomedItems[0].Instigator != none)
		{
			SpawnWeapon(Class<Weapon>(GetInventoryFor(DoomedItems[0].NewClass)), DoomedItems[0].Instigator);
			// End:0xA3
			if(DoomedItems[0].OldItem != none)
			{
				DoomedItems[0].OldItem.Destroy();
			}
		}
		DoomedItems.Remove(0, 1);
		// [Loop Continue]
		goto J0x23;
	}
	i = 0;
	J0xB5:

	// End:0x127 [Loop If]
	if(i < PickupSwaps.Length)
	{
		// End:0x11D
		if(PickupSwaps[i].Old != none)
		{
			// End:0x11D
			if(!SpawnNewItem(PickupSwaps[i].NewIndex, PickupSwaps[i].Old))
			{
				PickupSwaps[i].Old.Destroy();
			}
		}
		i++;
		// [Loop Continue]
		goto J0xB5;
	}
	PickupSwaps.Length = 0;
	//return;	
}

function SwapWeapon(Actor OldItem, Class<Actor> NewItem)
{
	DoomedItems.Length = DoomedItems.Length + 1;
	DoomedItems[DoomedItems.Length - 1].OldItem = OldItem;
	DoomedItems[DoomedItems.Length - 1].NewClass = NewItem;
	DoomedItems[DoomedItems.Length - 1].Instigator = OldItem.Instigator;
	SetTimer(0.0500000, false);
	//return;	
}

function AddPickupSwap(Pickup Old, int NewIndex)
{
	// End:0x2C
	if(((Old == none) || NewIndex < 0) || NewIndex >= Replacements.Length)
	{
		return;
	}
	PickupSwaps.Length = PickupSwaps.Length + 1;
	PickupSwaps[PickupSwaps.Length - 1].Old = Old;
	PickupSwaps[PickupSwaps.Length - 1].NewIndex = NewIndex;
	SetTimer(0.0500000, false);
	//return;	
}

function PlayerChangedClass(Controller C)
{
	super.PlayerChangedClass(C);
	// End:0x6F
	if((Bot(C) != none) && ((C.PawnClass == none) || C.PawnClass == Class'XGame.xPawn') || bForceBallisticPawn)
	{
		Bot(C).PawnClass = Class'BallisticProV55.BallisticPawn';
	}
	//return;	
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	local int i, j;
	local float OMA, NMA;
	local Class<Actor> NewItem;
	local BallisticPlayerReplicationInfo BPRI;
	local LinkedReplicationInfo LPRI;

	bSuperRelevant = 0;
	// End:0x15C
	if(((Controller(Other) != none) && InStr(Caps(Level.Game.GameName), "FREON") == -1) && InStr(Caps(Level.Game.GameName), "ARENAMASTER") == -1)
	{
		// End:0xEB
		if((PlayerController(Other) != none) && ((Controller(Other).PawnClass == none) || Controller(Other).PawnClass == Class'XGame.xPawn') || bForceBallisticPawn)
		{
			PlayerController(Other).PawnClass = Class'BallisticProV55.BallisticPawn';			
		}
		else
		{
			// End:0x159
			if((Bot(Other) != none) && ((Controller(Other).PawnClass == none) || Controller(Other).PawnClass == Class'XGame.xPawn') || bForceBallisticPawn)
			{
				Bot(Other).PreviousPawnClass = Class'BallisticProV55.BallisticPawn';
			}
		}		
	}
	else
	{
		// End:0x23A
		if(PlayerReplicationInfo(Other) != none)
		{
			BPRI = Spawn(Class'BallisticProV55.BallisticPlayerReplicationInfo', Other.Owner);
			// End:0x21E
			if(PlayerReplicationInfo(Other).CustomReplicationInfo != none)
			{
				LPRI = PlayerReplicationInfo(Other).CustomReplicationInfo;
				PlayerReplicationInfo(Other).CustomReplicationInfo = BPRI;
				// End:0x207
				if(BPRI.NextReplicationInfo != none)
				{
					BPRI.NextReplicationInfo.NextReplicationInfo = LPRI;					
				}
				else
				{
					BPRI.NextReplicationInfo = LPRI;
				}				
			}
			else
			{
				PlayerReplicationInfo(Other).CustomReplicationInfo = BPRI;
			}			
		}
		else
		{
			// End:0x286
			if(((JumpSpot(Other) != none) && BallisticRep != none) && !BallisticRep.bAllowDodging)
			{
				JumpSpot(Other).bDodgeUp = false;				
			}
			else
			{
				// End:0x31B
				if(xPawn(Other) != none)
				{
					// End:0x2C7
					if(bRandomDefaultWeapons)
					{
						xPawn(Other).RequiredEquipment[0] = string(GetInventoryFor(GetNewItem(1)));						
					}
					else
					{
						xPawn(Other).RequiredEquipment[0] = string(GetInventoryFor(Replacements[1].NewItems[0]));
					}
					xPawn(Other).RequiredEquipment[1] = string(GetInventoryFor(GetNewItem(0)));					
				}
				else
				{
					// End:0x94D
					if((((((Weapon(Other) != none) || xWeaponBase(Other) != none) || WildcardBase(Other) != none) || xPickUpBase(Other) != none) || WeaponLocker(Other) != none) || Pickup(Other) != none)
					{
						i = 0;
						J0x38C:

						// End:0x94D [Loop If]
						if(i < Replacements.Length)
						{
							// End:0x437
							if(Weapon(Other) != none)
							{
								// End:0x434
								if(((GetInventoryFor(Replacements[i].OldItem)) == Weapon(Other).Class) && !Replacements[i].bSuper || !bLeaveSuper)
								{
									SwapWeapon(Other, GetInventoryFor(Replacements[i].NewItems[Rand(Replacements[i].NewItems.Length)]));
								}
								// [Explicit Continue]
								goto J0x943;
							}
							// End:0x536
							if((((xWeaponBase(Other) != none) && xWeaponBase(Other).WeaponType != none) && xWeaponBase(Other).WeaponType == (GetInventoryFor(Replacements[i].OldItem))) && !Replacements[i].bSuper || !bLeaveSuper)
							{
								// End:0x522
								if(Replacements[i].bUseBase)
								{
									NewItem = GetNewItem(i);
									xWeaponBase(Other).WeaponType = Class<Weapon>(GetInventoryFor(NewItem));
									xWeaponBase(Other).PowerUp = GetPickupFor(NewItem);									
								}
								else
								{
									return SpawnNewItem(i, Other);
								}
								// [Explicit Continue]
								goto J0x943;
							}
							// End:0x62E
							if(WildcardBase(Other) != none)
							{
								j = 0;
								J0x54D:

								// End:0x62B [Loop If]
								if(j < 8)
								{
									// End:0x621
									if((((WildcardBase(Other).PickupClasses[j] != none) && WildcardBase(Other).PickupClasses[j] == (GetPickupFor(Replacements[i].OldItem))) && !Replacements[i].bSuper || !bLeaveSuper) && Class<TournamentPickUp>(GetPickupFor(GetNewItem(i))) != none)
									{
										WildcardBase(Other).PickupClasses[j] = Class<TournamentPickUp>(GetPickupFor(GetNewItem(i)));
									}
									j++;
									// [Loop Continue]
									goto J0x54D;
								}
								// [Explicit Continue]
								goto J0x943;
							}
							// End:0x6FE
							if((((xPickUpBase(Other) != none) && xPickUpBase(Other).PowerUp != none) && xPickUpBase(Other).PowerUp == (GetPickupFor(Replacements[i].OldItem))) && !Replacements[i].bSuper || !bLeaveSuper)
							{
								// End:0x6EA
								if(Replacements[i].bUseBase)
								{
									xPickUpBase(Other).PowerUp = GetPickupFor(GetNewItem(i));									
								}
								else
								{
									return SpawnNewItem(i, Other);
								}
								// [Explicit Continue]
								goto J0x943;
							}
							// End:0x8C9
							if((WeaponLocker(Other) != none) && !Replacements[i].bSuper || !bLeaveSuper)
							{
								j = 0;
								J0x73A:

								// End:0x8C6 [Loop If]
								if(j < WeaponLocker(Other).Weapons.Length)
								{
									// End:0x8BC
									if(WeaponLocker(Other).Weapons[j].WeaponClass == (GetInventoryFor(Replacements[i].OldItem)))
									{
										NewItem = GetNewItem(i);
										OMA = float(WeaponLocker(Other).Weapons[j].WeaponClass.default.FireModeClass[0].default.AmmoClass.default.MaxAmmo);
										NMA = float(Class<Weapon>(static.GetInventoryFor(NewItem)).default.FireModeClass[0].default.AmmoClass.default.MaxAmmo);
										WeaponLocker(Other).Weapons[j].ExtraAmmo = int(NMA * (float(WeaponLocker(Other).Weapons[j].ExtraAmmo) / OMA));
										WeaponLocker(Other).Weapons[j].ExtraAmmo *= float(2);
										WeaponLocker(Other).Weapons[j].WeaponClass = Class<Weapon>(GetInventoryFor(NewItem));
									}
									j++;
									// [Loop Continue]
									goto J0x73A;
								}
								// [Explicit Continue]
								goto J0x943;
							}
							// End:0x943
							if(((Pickup(Other) != none) && Pickup(Other).Class == (GetPickupFor(Replacements[i].OldItem))) && !Replacements[i].bSuper || !bLeaveSuper)
							{
								AddPickupSwap(Pickup(Other), i);
							}
							J0x943:

							i++;
							// [Loop Continue]
							goto J0x38C;
						}
					}
				}
			}
		}
	}
	return true;
	//return;	
}

function bool SpawnNewItem(int Index, Actor Other, optional Class<Actor> NewItem, optional out Pickup A)
{
	local Rotator ItemRot;
	local Vector ItemLoc;

	// End:0xB6
	if(NewItem == none)
	{
		// End:0x39
		if((Index < 0) || Replacements[Index].bSuper && bLeaveSuper)
		{
			return true;
		}
		NewItem = GetNewItem(Index,, Other.Class);
		// End:0xB6
		if(NewItem == none)
		{
			Log(("Couldn't find new item for old " $ string(Replacements[Index].OldItem)) $ " in replacements list");
			return true;
		}
	}
	ItemRot = PickupAlign(Other, ItemLoc, GetPickupFor(NewItem));
	// End:0x11D
	if((Class<BallisticWeaponPickup>(GetPickupFor(NewItem)) != none) && Class<BallisticWeaponPickup>(static.GetPickupFor(NewItem)).default.bOnSide)
	{
		ItemRot.Roll += 16384;
	}
	A = Spawn(GetPickupFor(NewItem),,, ItemLoc, ItemRot);
	// End:0x14A
	if(A == none)
	{
		return true;
	}
	// End:0x17F
	if(bBrightPickups && int(Level.NetMode) == int(NM_Standalone))
	{
		A.AmbientGlow = 128;
	}
	// End:0x1DD
	if(BallisticWeaponPickup(A) != none)
	{
		BallisticWeaponPickup(A).__OnItemChange__Delegate = ItemChange;
		BallisticWeaponPickup(A).__OnItemPickedUp__Delegate = ItemPickedUp;
		BallisticWeaponPickup(A).ReplacementsIndex = Index;		
	}
	else
	{
		// End:0x238
		if(BallisticAmmoPickup(A) != none)
		{
			BallisticAmmoPickup(A).__OnItemChange__Delegate = ItemChange;
			BallisticAmmoPickup(A).__OnItemPickedUp__Delegate = ItemPickedUp;
			BallisticAmmoPickup(A).ReplacementsIndex = Index;
		}
	}
	// End:0x330
	if(Pickup(Other) != none)
	{
		// End:0x2C0
		if((Pickup(Other).PickUpBase != none) && WildcardBase(Pickup(Other).PickUpBase) != none)
		{
			A.PickUpBase = Pickup(Other).PickUpBase;
			A.PickUpBase.myPickUp = A;
		}
		// End:0x32D
		if(Pickup(Other).myMarker != none)
		{
			A.myMarker = Pickup(Other).myMarker;
			A.myMarker.markedItem = A;
			Pickup(Other).myMarker = none;
		}		
	}
	else
	{
		// End:0x462
		if(xPickUpBase(Other) != none)
		{
			// End:0x365
			if(xWeaponBase(Other) != none)
			{
				xWeaponBase(Other).WeaponType = none;
			}
			xPickUpBase(Other).PowerUp = none;
			Other.bHidden = true;
			A.Event = xPickUpBase(Other).Event;
			// End:0x460
			if(xPickUpBase(Other).myMarker != none)
			{
				A.myMarker = xPickUpBase(Other).myMarker;
				A.myMarker.myPickupBase = none;
				A.myMarker.markedItem = A;
				A.myMarker.ExtraCost = int(xPickUpBase(Other).ExtraPathCost);
				xPickUpBase(Other).myMarker = none;
			}
			return true;
		}
	}
	return false;
	//return;	
}

simulated event Tick(float dt)
{
	super(Actor).Tick(dt);
	// End:0x42
	if(bDoItemize)
	{
		bDoItemize = false;
		Class'BallisticProV55.ItemizerDB'.static.SpawnItems(Class'BallisticProV55.ItemizerDB'.static.GetMap(self), ItemGroup, self, true);
	}
	// End:0xBE
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && !bSpawnedIA) && Level.GetLocalPlayerController() != none)
	{
		Class'BallisticProV55.BallisticInteraction'.static.Launch(Level.GetLocalPlayerController());
		Spawn(Class'BallisticProV55.BWClientLockerHider').bHideLockers = bHideLockers;
		bSpawnedIA = true;
	}
	//return;	
}

simulated function LoadItemClasses()
{
	local int i, j;

	i = 0;
	J0x07:

	// End:0xF5 [Loop If]
	if(i < Replacements.Length)
	{
		// End:0xEB
		if(Replacements[i].OldItemName != "")
		{
			Replacements[i].OldItem = Class<Actor>(DynamicLoadObject(Replacements[i].OldItemName, Class'Core.Class'));
			// End:0xEB
			if(Replacements[i].OldItem == none)
			{
				Log(((("Mut_Balistic::LoadItemClasses: Bad old item class name " $ Replacements[i].OldItemName) $ " for Replacements[") $ string(i)) $ "]", 'Warning');
			}
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0xFC:

	// End:0x24A [Loop If]
	if(i < Replacements.Length)
	{
		// End:0x240
		if(Replacements[i].NewItemNames.Length > 0)
		{
			j = 0;
			J0x12A:

			// End:0x240 [Loop If]
			if(j < Replacements[i].NewItemNames.Length)
			{
				// End:0x236
				if(Replacements[i].NewItemNames[j] != "")
				{
					Replacements[i].NewItems[j] = Class<Actor>(DynamicLoadObject(Replacements[i].NewItemNames[j], Class'Core.Class'));
					// End:0x236
					if(Replacements[i].NewItems[j] == none)
					{
						Log(((("Mut_Balistic::LoadItemClasses: Bad new item class name " $ Replacements[i].NewItemNames[j]) $ " in Replacements[") $ string(i)) $ "]", 'Warning');
					}
				}
				j++;
				// [Loop Continue]
				goto J0x12A;
			}
		}
		i++;
		// [Loop Continue]
		goto J0xFC;
	}
	//return;	
}

simulated function AdjustLockerWeapons()
{
	local LockerWeapon L;
	local Class<UTWeaponPickup> NP;
	local int i, j;

	// End:0x0B
	if(bLWsInitialized)
	{
		return;
	}
	bLWsInitialized = true;
	// End:0x1E
	if(bHideLockers)
	{
		return;
	}
	// End:0x4C7
	foreach AllActors(Class'XWeapons.LockerWeapon', L)
	{
		i = 0;
		J0x35:

		// End:0x4C6 [Loop If]
		if(i < Replacements.Length)
		{
			// End:0x5F
			if(Replacements[i].NewItems.Length == 0)
			{
				// [Explicit Continue]
				goto J0x4BC;
			}
			j = 0;
			J0x66:

			// End:0x4BC [Loop If]
			if(j < L.Emitters.Length)
			{
				NP = Class<UTWeaponPickup>(GetPickupFor(Replacements[i].NewItems[0]));
				// End:0x4B2
				if((NP != none) && (MeshEmitter(L.Emitters[j]).StaticMesh == static.GetPickupFor(Replacements[i].OldItem).default.StaticMesh) || MeshEmitter(L.Emitters[j]).StaticMesh == NP.default.StaticMesh)
				{
					// End:0x175
					if(Class<BallisticWeaponPickup>(NP) != none)
					{
						MeshEmitter(L.Emitters[j]).StaticMesh = Class<BallisticWeaponPickup>(NP).default.LowPolyStaticMesh;						
					}
					else
					{
						MeshEmitter(L.Emitters[j]).StaticMesh = NP.default.StaticMesh;
					}
					MeshEmitter(L.Emitters[j]).StartSpinRange.X.Min = NP.default.StandUp.X;
					MeshEmitter(L.Emitters[j]).StartSpinRange.X.Max = NP.default.StandUp.X;
					MeshEmitter(L.Emitters[j]).StartSpinRange.Y.Min = NP.default.StandUp.Y;
					MeshEmitter(L.Emitters[j]).StartSpinRange.Y.Max = NP.default.StandUp.Y;
					MeshEmitter(L.Emitters[j]).StartSpinRange.Z.Min = NP.default.StandUp.Z;
					MeshEmitter(L.Emitters[j]).StartSpinRange.Z.Max = NP.default.StandUp.Z;
					MeshEmitter(L.Emitters[j]).StartSizeRange.X.Min = 0.9000000 * NP.default.DrawScale;
					MeshEmitter(L.Emitters[j]).StartSizeRange.X.Max = 0.9000000 * NP.default.DrawScale;
					MeshEmitter(L.Emitters[j]).StartSizeRange.Y.Min = 0.9000000 * NP.default.DrawScale;
					MeshEmitter(L.Emitters[j]).StartSizeRange.Y.Max = 0.9000000 * NP.default.DrawScale;
					MeshEmitter(L.Emitters[j]).StartSizeRange.Z.Min = 0.9000000 * NP.default.DrawScale;
					MeshEmitter(L.Emitters[j]).StartSizeRange.Z.Max = 0.9000000 * NP.default.DrawScale;
				}
				j++;
				// [Loop Continue]
				goto J0x66;
			}
			J0x4BC:

			i++;
			// [Loop Continue]
			goto J0x35;
		}		
	}	
	//return;	
}

function array< Class<Weapon> > GetAllWeaponClasses()
{
	local int i, j, k;
	local array< Class<Weapon> > Weaps;

	i = 0;
	J0x07:

	// End:0x119 [Loop If]
	if(i < Replacements.Length)
	{
		// End:0x10F
		if(Replacements[i].NewItems.Length > 0)
		{
			j = 0;
			J0x35:

			// End:0x10F [Loop If]
			if(j < Replacements[i].NewItems.Length)
			{
				// End:0x105
				if(Class<Weapon>(GetInventoryFor(Replacements[i].NewItems[j])) != none)
				{
					k = 0;
					J0x7E:

					// End:0xC7 [Loop If]
					if(k < Weaps.Length)
					{
						// End:0xBD
						if(Weaps[k] == (GetInventoryFor(Replacements[i].NewItems[j])))
						{
							// [Explicit Break]
							goto J0xC7;
						}
						k++;
						// [Loop Continue]
						goto J0x7E;
					}
					J0xC7:

					// End:0x105
					if(k >= Weaps.Length)
					{
						Weaps[Weaps.Length] = Class<Weapon>(GetInventoryFor(Replacements[i].NewItems[j]));
					}
				}
				j++;
				// [Loop Continue]
				goto J0x35;
			}
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return Weaps;
	//return;	
}

function CreateSprintControl(xPawn P)
{
	local BCSprintControl SC;

	SC = Spawn(Class'BCoreProV55.BCSprintControl', P);
	SC.GiveTo(P);
	Sprinters[Sprinters.Length] = SC;
	//return;	
}

function BCSprintControl GetSprintControl(Controller Sender)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x83 [Loop If]
	if(i < Sprinters.Length)
	{
		// End:0x79
		if(((Sprinters[i] != none) && Sprinters[i].Instigator != none) && Sprinters[i].Instigator.Controller == Sender)
		{
			return Sprinters[i];
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return none;
	//return;	
}

function Mutate(string MutateString, PlayerController Sender)
{
	local BCSprintControl SC;

	// End:0x5A
	if((MutateString ~= "BStartSprint") && Class'BCoreProV55.BallisticReplicationInfo'.default.bEnableSprint)
	{
		SC = GetSprintControl(Sender);
		// End:0x57
		if(SC != none)
		{
			SC.StartSprint();
		}		
	}
	else
	{
		// End:0xB0
		if((MutateString ~= "BStopSprint") && Class'BCoreProV55.BallisticReplicationInfo'.default.bEnableSprint)
		{
			SC = GetSprintControl(Sender);
			// End:0xB0
			if(SC != none)
			{
				SC.StopSprint();
			}
		}
	}
	super.Mutate(MutateString, Sender);
	//return;	
}

static function BallisticPlayerReplicationInfo GetBPRI(PlayerReplicationInfo PRI)
{
	local LinkedReplicationInfo LPRI;

	// End:0x27
	if(PRI.CustomReplicationInfo == none)
	{
		Log("No Custom PRI");
		return none;
	}
	// End:0x54
	if(BallisticPlayerReplicationInfo(PRI.CustomReplicationInfo) != none)
	{
		return BallisticPlayerReplicationInfo(PRI.CustomReplicationInfo);
	}
	LPRI = PRI.CustomReplicationInfo.NextReplicationInfo;
	J0x71:

	// End:0xFE [Loop If]
	if(LPRI != none)
	{
		// End:0x97
		if(BallisticPlayerReplicationInfo(LPRI) != none)
		{
			return BallisticPlayerReplicationInfo(LPRI);
		}
		// End:0xE7
		if(LPRI == LPRI.NextReplicationInfo)
		{
			Log("A LinkedReplicationInfo links to itself, aborting");
			// [Explicit Break]
			goto J0xFE;
		}
		LPRI = LPRI.NextReplicationInfo;
		// [Loop Continue]
		goto J0x71;
	}
	J0xFE:

	Log("Couldn't find a BPRI");
	return none;
	//return;	
}

static function Class<Inventory> GetInventoryFor(Class<Actor> A)
{
	// End:0x10
	if(A == none)
	{
		return none;		
	}
	else
	{
		// End:0x2E
		if(Class<Inventory>(A) != none)
		{
			return Class<Inventory>(A);			
		}
		else
		{
			// End:0x6D
			if((Class<Pickup>(A) != none) && Class<Pickup>(A).default.InventoryType != none)
			{
				return Class<Pickup>(A).default.InventoryType;
			}
		}
	}
	return none;
	//return;	
}

static function Class<Pickup> GetPickupFor(Class<Actor> A)
{
	// End:0x10
	if(A == none)
	{
		return none;		
	}
	else
	{
		// End:0x2E
		if(Class<Pickup>(A) != none)
		{
			return Class<Pickup>(A);			
		}
		else
		{
			// End:0x6D
			if((Class<Inventory>(A) != none) && Class<Inventory>(A).default.PickupClass != none)
			{
				return Class<Inventory>(A).default.PickupClass;
			}
		}
	}
	return none;
	//return;	
}

defaultproperties
{
	Replacements[0]=(OldItemName="XWeapons.ShieldGun",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.X3Pickup","BallisticProV55.A909Pickup","BallisticProV55.EKS43Pickup","BallisticProV55.X4Pickup"),NewItems=none)
	Replacements[1]=(OldItemName="XWeapons.AssaultRifle",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.M806Pickup","BallisticProV55.MRT6Pickup","BallisticProV55.A42Pickup","BallisticProV55.XK2Pickup","BallisticProV55.D49Pickup","BallisticProV55.AM67Pickup","BallisticProV55.Fifty9Pickup","BallisticProV55.RS8Pickup","BallisticProV55.XRS10Pickup","BallisticProV55.GRS9Pickup","BallisticProV55.leMatPickup","BallisticProV55.BOGPPickup","BallisticProV55.MD24Pickup","BallisticProV55.XMK5Pickup"),NewItems=none)
	Replacements[2]=(OldItemName="XWeapons.BioRiflePickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.NRP57Pickup","BallisticProV55.FP7Pickup","BallisticProV55.FP9Pickup","BallisticProV55.BX5Pickup","BallisticProV55.T10Pickup"),NewItems=none)
	Replacements[3]=(OldItemName="XWeapons.ShockRiflePickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.M50Pickup","BallisticProV55.XK2Pickup","BallisticProV55.SARPickup","BallisticProV55.SRS900Pickup","BallisticProV55.M46Pickup","BallisticProV55.XMK5Pickup"),NewItems=none)
	Replacements[4]=(OldItemName="XWeapons.LinkGunPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.A73Pickup","BallisticProV55.A42Pickup","BallisticProV55.HVCMk9Pickup","BallisticProV55.E23Pickup","BallisticProV55.RSDarkPickup","BallisticProV55.RSNovaPickup"),NewItems=none)
	Replacements[5]=(OldItemName="XWeapons.MinigunPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.M353Pickup","BallisticProV55.M925Pickup","BallisticProV55.XMV850Pickup"),NewItems=none)
	Replacements[6]=(OldItemName="XWeapons.FlakCannonPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.M763Pickup","BallisticProV55.M290Pickup","BallisticProV55.MRS138Pickup","BallisticProV55.A500Pickup"),NewItems=none)
	Replacements[7]=(OldItemName="XWeapons.RocketLauncherPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.G5Pickup","BallisticProV55.RX22APickup","BallisticProV55.MACPickup","BallisticProV55.MRLPickup"),NewItems=none)
	Replacements[8]=(OldItemName="XWeapons.SniperRiflePickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.R78Pickup","BallisticProV55.M75Pickup","BallisticProV55.R9Pickup","BallisticProV55.MarlinPickup"),NewItems=none)
	Replacements[9]=(OldItemName="XWeapons.PainterPickup",OldItem=none,bUseBase=false,bSuper=true,NewItemNames=("BallisticProV55.R78Pickup","BallisticProV55.M75Pickup","BallisticProV55.R9Pickup","BallisticProV55.MarlinPickup"),NewItems=none)
	Replacements[10]=(OldItemName="XWeapons.RedeemerPickup",OldItem=none,bUseBase=false,bSuper=true,NewItemNames=("BallisticProV55.M75Pickup","BallisticProV55.G5Pickup","BallisticProV55.RX22APickup","BallisticProV55.MACPickup","BallisticProV55.MRLPickup"),NewItems=none)
	Replacements[11]=(OldItemName="UTClassic.ClassicSniperRiflePickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.R78Pickup","BallisticProV55.M75Pickup","BallisticProV55.R9Pickup","BallisticProV55.MarlinPickup"),NewItems=none)
	Replacements[12]=(OldItemName="Onslaught.ONSAVRiLPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.G5Pickup","BallisticProV55.M75Pickup","BallisticProV55.MACPickup"),NewItems=none)
	Replacements[13]=(OldItemName="Onslaught.ONSGrenadePickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.NRP57Pickup","BallisticProV55.FP7Pickup","BallisticProV55.T10Pickup"),NewItems=none)
	Replacements[14]=(OldItemName="Onslaught.ONSMineLayerPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.FP9Pickup","BallisticProV55.BX5Pickup"),NewItems=none)
	Replacements[15]=(OldItemName="OnslaughtFull.ONSPainterPickup",OldItem=none,bUseBase=false,bSuper=true,NewItemNames=("BallisticProV55.R78Pickup","BallisticProV55.M75Pickup","BallisticProV55.R9Pickup","BallisticProV55.MarlinPickup"),NewItems=none)
	Replacements[16]=(OldItemName="XWeapons.AssaultAmmoPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.AP_M806Clip","BallisticProV55.AP_12GaugeClips","BallisticProV55.AP_XK2Clip","BallisticProV55.AP_6Magnum","BallisticProV55.AP_AM67Clip","BallisticProV55.AP_Fifty9Clip","BallisticProV55.AP_RS8Clip","BallisticProV55.AP_XRS10Clip","BallisticProV55.AP_GRS9Clip","BallisticProV55.AP_leMat","BallisticProV55.AP_BOGPGrenades","BallisticProV55.AP_MD24Clip","BallisticProV55.AP_XMK5Clip"),NewItems=none)
	Replacements[17]=(OldItemName="XWeapons.BioAmmoPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.NRP57Pickup","BallisticProV55.FP7Pickup","BallisticProV55.FP9Pickup","BallisticProV55.BX5Pickup","BallisticProV55.T10Pickup"),NewItems=none)
	Replacements[18]=(OldItemName="XWeapons.ShockAmmoPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.AP_556mmClip","BallisticProV55.AP_XK2Clip","BallisticProV55.AP_SARClip","BallisticProV55.AP_SRS900Clip","BallisticProV55.AP_M46Clip","BallisticProV55.AP_XMK5Clip"),NewItems=none)
	Replacements[19]=(OldItemName="XWeapons.LinkAmmoPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.AP_A73Clip","BallisticProV55.AP_HVCMk9Cell","BallisticProV55.AP_E23Clip","BallisticProV55.AP_DarkDiamond","BallisticProV55.AP_NovaCrystal"),NewItems=none)
	Replacements[20]=(OldItemName="XWeapons.MinigunAmmoPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.AP_M353Belt","BallisticProV55.AP_M925Belt","BallisticProV55.AP_XMV850Ammo"),NewItems=none)
	Replacements[21]=(OldItemName="XWeapons.FlakAmmoPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.AP_12GaugeBox","BallisticProV55.AP_MRS138Box","BallisticProV55.AP_A500Cells"),NewItems=none)
	Replacements[22]=(OldItemName="XWeapons.RocketAmmoPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.AP_G5Ammo","BallisticProV55.AP_FlamerGas","BallisticProV55.AP_MACShells","BallisticProV55.AP_MRLRockets"),NewItems=none)
	Replacements[23]=(OldItemName="XWeapons.SniperAmmoPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.AP_R78Clip","BallisticProV55.AP_M75Clip","BallisticProV55.AP_R9Clip","BallisticProV55.AP_MarlinAmmo"),NewItems=none)
	Replacements[24]=(OldItemName="UTClassic.ClassicSniperAmmoPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.AP_R78Clip","BallisticProV55.AP_M75Clip","BallisticProV55.AP_R9Clip","BallisticProV55.AP_MarlinAmmo"),NewItems=none)
	Replacements[25]=(OldItemName="Onslaught.ONSAVRiLAmmoPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.AP_G5Ammo","BallisticProV55.AP_M75Clip","BallisticProV55.AP_MACShells"),NewItems=none)
	Replacements[26]=(OldItemName="Onslaught.ONSGrenadeAmmoPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.NRP57Pickup","BallisticProV55.FP7Pickup","BallisticProV55.T10Pickup"),NewItems=none)
	Replacements[27]=(OldItemName="Onslaught.ONSMineAmmoPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.FP9Pickup","BallisticProV55.BX5Pickup"),NewItems=none)
	Replacements[28]=(OldItemName="XPickups.HealthPack",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_HealthKit"),NewItems=none)
	Replacements[29]=(OldItemName="XPickups.MiniHealthPack",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_Bandage"),NewItems=none)
	Replacements[30]=(OldItemName="XPickups.AdrenalinePickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_Adrenaline"),NewItems=none)
	Replacements[31]=(OldItemName="XPickups.UDamagePack",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_UDamage"),NewItems=none)
	Replacements[32]=(OldItemName="XPickups.SuperHealthPack",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_SuperHealthKit"),NewItems=none)
	Replacements[33]=(OldItemName="XPickups.SuperShieldPack",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_BigArmor"),NewItems=none)
	Replacements[34]=(OldItemName="XPickups.ShieldPack",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_SmallArmor"),NewItems=none)
	UDamageSnd=Sound'BW_Core_WeaponSound.Udamage.UDamageFire'
	bPreloadMeshes=true
	ItemGroup="Ballistic"
	bSpawnUniqueItems=true
	bPickupsChange=true
	bRandomDefaultWeapons=true
	CamUpdateRate="0"
	CamRateOptions[0]="No Update"
	CamRateOptions[1]="Slow 2 FPS"
	CamRateOptions[2]="Medium 5 FPS"
	CamRateOptions[3]="Fast 10 FPS"
	CamRateOptions[4]="Super 15 FPS"
	bAddToServerPackages=true
	ConfigMenuClassName="BallisticProV55.ConfigMenu_Rules"
	GroupName="Arena"
	FriendlyName="BallisticPro"
	Description="Replaces all the original weapons and items in the game with new, realistic Ballistic weapons and items. Adds reloading, fire modes, special weapon functions, real accuracy, realistic damage, special features like laser sights and tactical cameras, new effects and much much more...||http://www.runestorm.com"
	bNetTemporary=true
	bAlwaysRelevant=true
	RemoteRole=2
}
