class Mut_Elimination extends Mutator
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct Replacement
{
	var() Class<Pickup> OldItem;
	var() Class<Pickup> NewItem;
};

struct PickupSwap
{
	var() Pickup Old;
	var() int NewIndex;
};

var() array<Replacement> Replacements;
var array<PickupSwap> PickupSwaps;
var Game_BWConflict Conflict;
var bool bSpawnedIA;

function PostBeginPlay()
{
	Conflict = Game_BWConflict(Level.Game);
	//return;	
}

simulated function BeginPlay()
{
	local xPickUpBase PB;
	local WeaponLocker W;

	// End:0x98
	if(int(Level.NetMode) == int(NM_Client))
	{
		// End:0x75
		foreach AllActors(Class'Engine.xPickUpBase', PB)
		{
			PB.bHidden = true;
			PB.SetDrawType(0);
			// End:0x74
			if(PB.myEmitter != none)
			{
				PB.myEmitter.Destroy();
			}			
		}		
		// End:0x97
		foreach AllActors(Class'XWeapons.WeaponLocker', W)
		{
			W.GotoState('Disabled');			
		}		
	}
	super(Actor).BeginPlay();
	//return;	
}

simulated event Timer()
{
	local int i;

	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	i = 0;
	J0x19:

	// End:0x8B [Loop If]
	if(i < PickupSwaps.Length)
	{
		// End:0x81
		if(PickupSwaps[i].Old != none)
		{
			// End:0x81
			if(!SpawnNewItem(PickupSwaps[i].NewIndex, PickupSwaps[i].Old))
			{
				PickupSwaps[i].Old.Destroy();
			}
		}
		i++;
		// [Loop Continue]
		goto J0x19;
	}
	PickupSwaps.Length = 0;
	//return;	
}

simulated event Tick(float dt)
{
	super(Actor).Tick(dt);
	// End:0x6E
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && !bSpawnedIA) && Level.GetLocalPlayerController() != none)
	{
		Class'BallisticProV55.BallisticInteraction'.static.Launch(Level.GetLocalPlayerController());
		bSpawnedIA = true;
	}
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

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	local int i;
	local BallisticPlayerReplicationInfo BPRI;
	local LinkedReplicationInfo LPRI;

	// End:0xDB
	if(PlayerReplicationInfo(Other) != none)
	{
		BPRI = Spawn(Class'BallisticProV55.ConflictLoadoutLRI', Other.Owner);
		// End:0xC2
		if(PlayerReplicationInfo(Other).CustomReplicationInfo != none)
		{
			LPRI = PlayerReplicationInfo(Other).CustomReplicationInfo;
			PlayerReplicationInfo(Other).CustomReplicationInfo = BPRI;
			// End:0xAB
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
	// End:0xE8
	if(Conflict == none)
	{
		return true;
	}
	// End:0x134
	if(WeaponLocker(Other) != none)
	{
		Other.GotoState('Disabled');
		// End:0x12F
		if(Conflict.bAmmoPacks)
		{
			SpawnNewItem(-1, Other, Class'BallisticProV55.IP_AmmoPack');
		}
		return false;		
	}
	else
	{
		// End:0x2CE
		if(Other.IsA('Pickup'))
		{
			// End:0x15E
			if(Other.IsA('AdrenalinePickup'))
			{
				return false;
			}
			// End:0x19B
			if(Other.IsA('WeaponPickup'))
			{
				// End:0x198
				if(!Conflict.bKeepWeapons)
				{
					return !Level.bStartup;
				}				
			}
			else
			{
				// End:0x212
				if(Other.IsA('Ammo'))
				{
					// End:0x1D5
					if(Conflict.bAmmoPacks && IP_AmmoPack(Other) != none)
					{
						return true;
					}
					// End:0x20F
					if(!Conflict.bKeepWeapons || Conflict.bAmmoPacks)
					{
						return !Level.bStartup;
					}					
				}
				else
				{
					// End:0x25C
					if(!Conflict.bKeepHealth && Other.IsA('TournamentPickUp') || Other.IsA('ArmorPickup'))
					{
						bSuperRelevant = 0;
						return false;
					}
					// End:0x2CE
					if(Conflict.bBallisticItems)
					{
						i = 0;
						J0x275:

						// End:0x2CE [Loop If]
						if(i < Replacements.Length)
						{
							// End:0x2C4
							if(Pickup(Other).Class == Replacements[i].OldItem)
							{
								AddPickupSwap(Pickup(Other), i);
								return true;
							}
							i++;
							// [Loop Continue]
							goto J0x275;
						}
					}
				}
			}
		}
	}
	// End:0x3CC
	if(Other.IsA('xPickUpBase'))
	{
		// End:0x360
		if(Other.IsA('xWeaponBase'))
		{
			// End:0x338
			if(Conflict.bAmmoPacks)
			{
				Other.bHidden = true;
				// End:0x335
				if(!SpawnNewItem(-1, Other, Class'BallisticProV55.IP_AmmoPack'))
				{
					return false;
				}				
			}
			else
			{
				// End:0x35D
				if(!Conflict.bKeepWeapons)
				{
					Other.bHidden = true;
				}
			}			
		}
		else
		{
			// End:0x3CC
			if(!Conflict.bKeepHealth || Conflict.bBallisticItems)
			{
				Other.bHidden = true;
				// End:0x3CC
				if(xPickUpBase(Other).myEmitter != none)
				{
					xPickUpBase(Other).myEmitter.Destroy();
				}
			}
		}
	}
	bSuperRelevant = 0;
	return true;
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

function bool SpawnNewItem(int Index, Actor Other, optional Class<Pickup> NewItem, optional out Pickup A)
{
	local Rotator ItemRot;
	local Vector ItemLoc;

	// End:0x8B
	if(NewItem == none)
	{
		// End:0x18
		if(Index < 0)
		{
			return true;
		}
		NewItem = Replacements[Index].NewItem;
		// End:0x8B
		if(NewItem == none)
		{
			Log(("Couldn't find new item for old " $ string(Replacements[Index].OldItem)) $ " in replacements list");
			return true;
		}
	}
	ItemRot = PickupAlign(Other, ItemLoc, NewItem);
	// End:0xE0
	if((Class<BallisticWeaponPickup>(NewItem) != none) && Class<BallisticWeaponPickup>(NewItem).default.bOnSide)
	{
		ItemRot.Roll += 16384;
	}
	A = Spawn(NewItem,,, ItemLoc, ItemRot);
	// End:0x107
	if(A == none)
	{
		return true;
	}
	// End:0x1EA
	if(Pickup(Other) != none)
	{
		// End:0x18F
		if((Pickup(Other).PickUpBase != none) && WildcardBase(Pickup(Other).PickUpBase) != none)
		{
			A.PickUpBase = Pickup(Other).PickUpBase;
			A.PickUpBase.myPickUp = A;
		}
		// End:0x1E7
		if(Pickup(Other).myMarker != none)
		{
			A.myMarker = Pickup(Other).myMarker;
			A.myMarker.markedItem = A;
		}		
	}
	else
	{
		// End:0x31C
		if(xPickUpBase(Other) != none)
		{
			// End:0x21F
			if(xWeaponBase(Other) != none)
			{
				xWeaponBase(Other).WeaponType = none;
			}
			xPickUpBase(Other).PowerUp = none;
			Other.bHidden = true;
			A.Event = xPickUpBase(Other).Event;
			// End:0x31A
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

defaultproperties
{
	Replacements[0]=(OldItem=Class'XPickups.HealthPack',NewItem=Class'BallisticProV55.IP_HealthKit')
	Replacements[1]=(OldItem=Class'XPickups.MiniHealthPack',NewItem=Class'BallisticProV55.IP_Bandage')
	Replacements[2]=(OldItem=Class'XPickups.AdrenalinePickup',NewItem=Class'BallisticProV55.IP_Adrenaline')
	Replacements[3]=(OldItem=Class'XPickups.UDamagePack',NewItem=Class'BallisticProV55.IP_UDamage')
	Replacements[4]=(OldItem=Class'XPickups.SuperHealthPack',NewItem=Class'BallisticProV55.IP_SuperHealthKit')
	Replacements[5]=(OldItem=Class'XPickups.SuperShieldPack',NewItem=Class'BallisticProV55.IP_BigArmor')
	Replacements[6]=(OldItem=Class'XPickups.ShieldPack',NewItem=Class'BallisticProV55.IP_SmallArmor')
	OutVal=Class'BallisticProV55.IP_SmallArmor'
}
