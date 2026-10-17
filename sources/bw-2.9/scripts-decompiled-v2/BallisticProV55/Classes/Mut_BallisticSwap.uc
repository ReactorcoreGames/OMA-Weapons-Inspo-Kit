class Mut_BallisticSwap extends Mut_Ballistic
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const NumWeapons = 17;
const NumAmmos = 14;

struct WeaponSwap
{
	var() config bool bRandom;
	var() config Class<Weapon> Old;
	var() config array<string> NewClassNames;
	var array< Class<Weapon> > NewClasses;
	var() byte CurrentIndex;
	var() bool bSuper;
};

struct AmmoSwap
{
	var() config bool bIndependant;
	var() config Class<Ammunition> Old;
	var array< Class<Pickup> > NewClasses;
	var() byte CurrentIndex;
};

var() config WeaponSwap Swaps[17];
var() config AmmoSwap AmmoSwaps[14];
var() config int NadeReplacePercent;
var() config array< Class<BallisticWeaponPickup> > GrenadePickupClasses;
var bool bLockersSetup;
var() config float PickupChangeTime;
var() config float LockerChangeTime;
var() config bool bLockersChange;

static function int GetNumWeapons()
{
	return 17;
	//return;	
}

static function Class<Weapon> GetOldWeaponClass(int i)
{
	return default.Swaps[i].Old;
	//return;	
}

static function array<string> GetNewWeapons(int i, optional out byte bRandom)
{
	bRandom = byte(default.Swaps[i].bRandom);
	return default.Swaps[i].NewClassNames;
	//return;	
}

static function SetNewWeapons(int i, array<string> NewWeaps, optional bool bRandom)
{
	default.Swaps[i].NewClassNames = NewWeaps;
	default.Swaps[i].bRandom = bRandom;
	//return;	
}

simulated function PreBeginPlay()
{
	local int i, j, k;

	super.PreBeginPlay();
	// End:0x18
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	PickupChangeTime = FMax(5.0000000, PickupChangeTime);
	PickupChangeTime = Level.TimeSeconds + default.PickupChangeTime;
	LockerChangeTime = Level.TimeSeconds + default.LockerChangeTime;
	i = 0;
	J0x67:

	// End:0x1AB [Loop If]
	if(i < 17)
	{
		Swaps[i].CurrentIndex = byte(Rand(Swaps[i].NewClassNames.Length));
		Swaps[i].NewClasses.Length = Swaps[i].NewClassNames.Length;
		j = 0;
		J0xC3:

		// End:0x1A1 [Loop If]
		if(j < Swaps[i].NewClassNames.Length)
		{
			// End:0x197
			if(Swaps[i].NewClassNames[j] != "")
			{
				Swaps[i].NewClasses[j] = Class<Weapon>(DynamicLoadObject(Swaps[i].NewClassNames[j], Class'Core.Class'));
				// End:0x197
				if(Swaps[i].NewClasses[j] == none)
				{
					Log("Error: Failed to load weapon class for " $ Swaps[i].NewClassNames[j]);
				}
			}
			j++;
			// [Loop Continue]
			goto J0xC3;
		}
		i++;
		// [Loop Continue]
		goto J0x67;
	}
	i = 0;
	J0x1B2:

	// End:0x3CD [Loop If]
	if(i < 14)
	{
		j = 0;
		J0x1C5:

		// End:0x3C3 [Loop If]
		if(j < 17)
		{
			// End:0x3B9
			if((Swaps[j].Old.default.FireModeClass[0].default.AmmoClass == AmmoSwaps[i].Old) || Swaps[j].Old.default.FireModeClass[1].default.AmmoClass == AmmoSwaps[i].Old)
			{
				AmmoSwaps[i].CurrentIndex = Swaps[j].CurrentIndex;
				AmmoSwaps[i].bIndependant = Swaps[j].bRandom;
				AmmoSwaps[i].NewClasses.Length = Swaps[j].NewClasses.Length;
				k = 0;
				J0x2B3:

				// End:0x3B9 [Loop If]
				if(k < Swaps[j].NewClasses.Length)
				{
					// End:0x365
					if((Class<BallisticWeapon>(Swaps[j].NewClasses[k]) != none) && Class<BallisticWeapon>(Swaps[j].NewClasses[k]).static.RecommendAmmoPickup(-1) != none)
					{
						AmmoSwaps[i].NewClasses[k] = Class<BallisticWeapon>(Swaps[j].NewClasses[k]).static.RecommendAmmoPickup(-1);
						// [Explicit Continue]
						goto J0x3AF;
					}
					AmmoSwaps[i].NewClasses[k] = Swaps[j].NewClasses[k].default.FireModeClass[0].default.AmmoClass.default.PickupClass;
					J0x3AF:

					k++;
					// [Loop Continue]
					goto J0x2B3;
				}
			}
			j++;
			// [Loop Continue]
			goto J0x1C5;
		}
		i++;
		// [Loop Continue]
		goto J0x1B2;
	}
	//return;	
}

function ItemPickedUp(Pickup Other)
{
	local Class<Weapon> Weap;

	// End:0x12
	if(BallisticWeaponPickup(Other) == none)
	{
		return;
	}
	// End:0x13D
	if(((BallisticWeaponPickup(Other) != none) && !BallisticWeaponPickup(Other).bDropped) && BallisticWeaponPickup(Other).LastPickedUpBy != none)
	{
		Weap = Class<Weapon>(BallisticWeaponPickup(Other).InventoryType);
		// End:0x13D
		if(Weap != none)
		{
			SpawnAmmo(Weap.default.FireModeClass[0].default.AmmoClass, BallisticWeaponPickup(Other).LastPickedUpBy);
			// End:0x13D
			if((Weap.default.FireModeClass[1].default.AmmoClass != none) && Weap.default.FireModeClass[0].default.AmmoClass != Weap.default.FireModeClass[1].default.AmmoClass)
			{
				SpawnAmmo(Weap.default.FireModeClass[1].default.AmmoClass, BallisticWeaponPickup(Other).LastPickedUpBy);
			}
		}
	}
	//return;	
}

function WeaponPickupChange(Pickup Other)
{
	local BallisticWeaponPickup WP;

	// End:0x11F
	if(BallisticWeaponPickup(Other) != none)
	{
		WP = BallisticWeaponPickup(Other);
		// End:0x4D
		if((WP.ReplacementsIndex >= 17) || WP.ReplacementsIndex < 0)
		{
			return;
		}
		// End:0xC5
		if(Swaps[WP.ReplacementsIndex].bRandom)
		{
			SwapPickup(WP, Swaps[WP.ReplacementsIndex].NewClasses[static.Rand(Swaps[WP.ReplacementsIndex].NewClasses.Length)].default.PickupClass, WP.ReplacementsIndex);			
		}
		else
		{
			SwapPickup(WP, Swaps[WP.ReplacementsIndex].NewClasses[int(Swaps[WP.ReplacementsIndex].CurrentIndex)].default.PickupClass, WP.ReplacementsIndex);
		}		
	}
	else
	{
		return;
	}
	// End:0x138
	if(Other != none)
	{
		Other.Destroy();
	}
	//return;	
}

function AmmoPickupChange(Pickup Other)
{
	local BallisticWeaponPickup WP;
	local BallisticAmmoPickup AP;
	local Class<Pickup> NewPickup;
	local int ReplacementsIndex;

	// End:0xE2
	if(BallisticWeaponPickup(Other) != none)
	{
		WP = BallisticWeaponPickup(Other);
		WP.ChangeTime = 0.0000000;
		ReplacementsIndex = WP.ReplacementsIndex;
		// End:0xA4
		if(AmmoSwaps[WP.ReplacementsIndex].bIndependant)
		{
			NewPickup = AmmoSwaps[WP.ReplacementsIndex].NewClasses[Rand(AmmoSwaps[WP.ReplacementsIndex].NewClasses.Length)];			
		}
		else
		{
			NewPickup = AmmoSwaps[WP.ReplacementsIndex].NewClasses[int(AmmoSwaps[WP.ReplacementsIndex].CurrentIndex)];
		}		
	}
	else
	{
		// End:0x1F6
		if(BallisticAmmoPickup(Other) != none)
		{
			AP = BallisticAmmoPickup(Other);
			AP.ChangeTime = 0.0000000;
			ReplacementsIndex = AP.ReplacementsIndex;
			// End:0x15C
			if((NadeReplacePercent > 0) && Rand(100) < NadeReplacePercent)
			{
				NewPickup = GrenadePickupClasses[Rand(GrenadePickupClasses.Length)];				
			}
			else
			{
				// End:0x1B8
				if(AmmoSwaps[AP.ReplacementsIndex].bIndependant)
				{
					NewPickup = AmmoSwaps[AP.ReplacementsIndex].NewClasses[Rand(AmmoSwaps[AP.ReplacementsIndex].NewClasses.Length)];					
				}
				else
				{
					NewPickup = AmmoSwaps[AP.ReplacementsIndex].NewClasses[int(AmmoSwaps[AP.ReplacementsIndex].CurrentIndex)];
				}
			}			
		}
		else
		{
			return;
		}
	}
	// End:0x216
	if((NewPickup == none) || NewPickup == Class'BCoreProV55.BallisticAmmoPickup')
	{
		return;
	}
	// End:0x24A
	if(!SwapPickup(Other, NewPickup, ReplacementsIndex, true) && Other != none)
	{
		Other.Destroy();
	}
	//return;	
}

function bool SwapPickup(Actor Other, Class<Pickup> NewItem, int Index, optional bool bIsAmmo, optional out Pickup A)
{
	local Rotator ItemRot;
	local Vector ItemLoc;
	local bool bOldCW;

	// End:0x2D
	if(NewItem == none)
	{
		Log("SwapPickup: NewItem is None!");
		return true;
	}
	ItemRot = PickupAlign(Other, ItemLoc, NewItem);
	// End:0x82
	if((Class<BallisticWeaponPickup>(NewItem) != none) && Class<BallisticWeaponPickup>(NewItem).default.bOnSide)
	{
		ItemRot.Roll += 16384;
	}
	bOldCW = NewItem.default.bCollideWorld;
	NewItem.default.bCollideWorld = false;
	A = Spawn(NewItem,,, ItemLoc, ItemRot);
	// End:0xFD
	if(A == none)
	{
		Log((("Couldn't spawn " $ string(NewItem)) $ " at ") $ string(Other));
		return true;
	}
	NewItem.default.bCollideWorld = bOldCW;
	A.bCollideWorld = bOldCW;
	// End:0x15E
	if(bBrightPickups && int(Level.NetMode) == int(NM_Standalone))
	{
		A.AmbientGlow = 128;
	}
	// End:0x248
	if(BallisticWeaponPickup(A) != none)
	{
		// End:0x193
		if(bIsAmmo)
		{
			BallisticWeaponPickup(A).__OnItemChange__Delegate = AmmoPickupChange;			
		}
		else
		{
			BallisticWeaponPickup(A).__OnItemChange__Delegate = WeaponPickupChange;
		}
		BallisticWeaponPickup(A).__OnItemPickedUp__Delegate = ItemPickedUp;
		BallisticWeaponPickup(A).ReplacementsIndex = Index;
		// End:0x245
		if((BallisticWeaponPickup(Other) != none) && BallisticWeaponPickup(Other).IsInState('Sleeping'))
		{
			BallisticWeaponPickup(A).PassedRespawnTime = BallisticWeaponPickup(Other).LatentFloat;
			BallisticWeaponPickup(A).GotoState('Sleeping');
		}		
	}
	else
	{
		// End:0x2A3
		if(BallisticAmmoPickup(A) != none)
		{
			BallisticAmmoPickup(A).__OnItemChange__Delegate = AmmoPickupChange;
			BallisticAmmoPickup(A).__OnItemPickedUp__Delegate = ItemPickedUp;
			BallisticAmmoPickup(A).ReplacementsIndex = Index;
		}
	}
	// End:0x37E
	if(Pickup(Other) != none)
	{
		// End:0x30E
		if((Pickup(Other).PickUpBase != none) && WildcardBase(Pickup(Other).PickUpBase) != none)
		{
			A.PickUpBase = Pickup(Other).PickUpBase;
		}
		// End:0x37B
		if(Pickup(Other).myMarker != none)
		{
			A.myMarker = Pickup(Other).myMarker;
			A.myMarker.markedItem = A;
			Pickup(Other).myMarker = none;
		}		
	}
	else
	{
		// End:0x4B0
		if(xPickUpBase(Other) != none)
		{
			// End:0x3B3
			if(xWeaponBase(Other) != none)
			{
				xWeaponBase(Other).WeaponType = none;
			}
			xPickUpBase(Other).PowerUp = none;
			Other.bHidden = true;
			A.Event = xPickUpBase(Other).Event;
			// End:0x4AE
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

function SpawnBonusPickup(Pickup Other)
{
	local Vector S, V, HitLoc, HitNorm, E;

	local Actor t;
	local Rotator R;
	local Class<Pickup> NewItem;
	local Pickup NewPickup;

	// End:0x0E
	if(FRand() > 0.1000000)
	{
		return;
	}
	// End:0x4C
	if(Swaps[1].bRandom)
	{
		NewItem = Swaps[1].NewClasses[static.Rand(Swaps[1].NewClasses.Length)].default.PickupClass;		
	}
	else
	{
		NewItem = Swaps[1].NewClasses[int(Swaps[1].CurrentIndex)].default.PickupClass;
	}
	V = VRand() * float(128);
	V.Z = 0.0000000;
	S = Other.Location;
	S.Z += (NewItem.default.CollisionHeight - Other.CollisionHeight);
	E.X = NewItem.default.CollisionRadius;
	E.Y = NewItem.default.CollisionRadius;
	E.Z = NewItem.default.CollisionHeight;
	t = Trace(HitLoc, HitNorm, S + V, S, false, E);
	// End:0x164
	if(t == none)
	{
		HitLoc = S + V;
	}
	R.Yaw = Rand(65536);
	NewPickup = Spawn(NewItem,,, HitLoc, R);
	// End:0x1E7
	if(BallisticWeaponPickup(NewPickup) != none)
	{
		BallisticWeaponPickup(NewPickup).__OnItemChange__Delegate = WeaponPickupChange;
		BallisticWeaponPickup(NewPickup).__OnItemPickedUp__Delegate = ItemPickedUp;
		BallisticWeaponPickup(NewPickup).ReplacementsIndex = 1;
	}
	//return;	
}

function AddStartingAmmo(Pawn Other)
{
	local Inventory Inv;

	Inv = Other.Inventory;
	J0x14:

	// End:0xFF [Loop If]
	if(Inv != none)
	{
		// End:0xE8
		if(Weapon(Inv) != none)
		{
			SpawnAmmo(Weapon(Inv).default.FireModeClass[0].default.AmmoClass, Other);
			// End:0xE8
			if((Weapon(Inv).default.FireModeClass[1].default.AmmoClass != none) && Weapon(Inv).default.FireModeClass[0].default.AmmoClass != Weapon(Inv).default.FireModeClass[1].default.AmmoClass)
			{
				SpawnAmmo(Weapon(Inv).default.FireModeClass[1].default.AmmoClass, Other);
			}
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x14;
	}
	//return;	
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	local int i, j;

	bSuperRelevant = 0;
	// End:0x16B
	if(xPawn(Other) != none)
	{
		i = 0;
		J0x1F:

		// End:0x166 [Loop If]
		if(i < 17)
		{
			j = 0;
			J0x32:

			// End:0x15C [Loop If]
			if(j < 16)
			{
				// End:0x152
				if(((xPawn(Other).RequiredEquipment[j] != "") && xPawn(Other).RequiredEquipment[j] ~= string(Swaps[i].Old)) && !bLeaveSuper || !Swaps[i].bSuper)
				{
					// End:0x115
					if(bRandomDefaultWeapons || Swaps[i].bRandom)
					{
						xPawn(Other).RequiredEquipment[j] = Swaps[i].NewClassNames[Rand(Swaps[i].NewClassNames.Length)];
						// [Explicit Continue]
						goto J0x152;
					}
					xPawn(Other).RequiredEquipment[j] = Swaps[i].NewClassNames[int(Swaps[i].CurrentIndex)];
				}
				J0x152:

				j++;
				// [Loop Continue]
				goto J0x32;
			}
			i++;
			// [Loop Continue]
			goto J0x1F;
		}
		return true;		
	}
	else
	{
		// End:0x25E
		if(Weapon(Other) != none)
		{
			i = 0;
			J0x182:

			// End:0x259 [Loop If]
			if(i < 17)
			{
				// End:0x24F
				if((Weapon(Other).Class == Swaps[i].Old) && !bLeaveSuper || !Swaps[i].bSuper)
				{
					// End:0x221
					if(Swaps[i].bRandom)
					{
						SwapWeapon(Other, Swaps[i].NewClasses[Rand(Swaps[i].NewClasses.Length)]);
						// [Explicit Continue]
						goto J0x24F;
					}
					SwapWeapon(Other, Swaps[i].NewClasses[int(Swaps[i].CurrentIndex)]);
				}
				J0x24F:

				i++;
				// [Loop Continue]
				goto J0x182;
			}
			return true;			
		}
		else
		{
			// End:0x3F7
			if((xWeaponBase(Other) != none) && xWeaponBase(Other).WeaponType != none)
			{
				i = 0;
				J0x290:

				// End:0x3AC [Loop If]
				if(i < 17)
				{
					// End:0x3A2
					if(xWeaponBase(Other).WeaponType == Swaps[i].Old)
					{
						// End:0x2E5
						if(bLeaveSuper && Swaps[i].bSuper)
						{
							return true;
						}
						xWeaponBase(Other).WeaponType = none;
						xWeaponBase(Other).bHidden = true;
						// End:0x365
						if(Swaps[i].bRandom)
						{
							return SwapPickup(Other, Swaps[i].NewClasses[static.Rand(Swaps[i].NewClasses.Length)].default.PickupClass, i);
							// [Explicit Continue]
							goto J0x3A2;
						}
						return SwapPickup(Other, Swaps[i].NewClasses[int(Swaps[i].CurrentIndex)].default.PickupClass, i);
					}
					J0x3A2:

					i++;
					// [Loop Continue]
					goto J0x290;
				}
				// End:0x3F2
				if(bKillRogueWeaponPickups)
				{
					return SwapPickup(Other, Swaps[Rand(17)].NewClasses[static.Rand(Swaps[i].NewClasses.Length)].default.PickupClass, i);
				}
				return true;				
			}
			else
			{
				// End:0x635
				if(Ammo(Other) != none)
				{
					i = 0;
					J0x40E:

					// End:0x630 [Loop If]
					if(i < 14)
					{
						// End:0x626
						if((Ammo(Other).InventoryType == AmmoSwaps[i].Old) && AmmoSwaps[i].NewClasses.Length > 0)
						{
							// End:0x484
							if((i == 0) || i == 13)
							{
								SpawnBonusPickup(Ammo(Other));
							}
							// End:0x561
							if(AmmoSwaps[i].bIndependant)
							{
								j = Rand(AmmoSwaps[i].NewClasses.Length);
								// End:0x518
								if(AmmoSwaps[i].NewClasses[j] == none)
								{
									j = 0;
									J0x4D4:

									// End:0x518 [Loop If]
									if(j < AmmoSwaps[i].NewClasses.Length)
									{
										// End:0x50E
										if(AmmoSwaps[i].NewClasses[j] != none)
										{
											// [Explicit Break]
											goto J0x518;
										}
										j++;
										// [Loop Continue]
										goto J0x4D4;
									}
								}
								J0x518:

								// End:0x536
								if(AmmoSwaps[i].NewClasses[j] == none)
								{
									return false;
								}
								return SwapPickup(Other, AmmoSwaps[i].NewClasses[j], i, true);
								// [Explicit Continue]
								goto J0x626;
							}
							j = int(AmmoSwaps[i].CurrentIndex);
							// End:0x5E0
							if(AmmoSwaps[i].NewClasses[j] == none)
							{
								j = 0;
								J0x59C:

								// End:0x5E0 [Loop If]
								if(j < AmmoSwaps[i].NewClasses.Length)
								{
									// End:0x5D6
									if(AmmoSwaps[i].NewClasses[j] != none)
									{
										// [Explicit Break]
										goto J0x5E0;
									}
									j++;
									// [Loop Continue]
									goto J0x59C;
								}
							}
							J0x5E0:

							// End:0x5FE
							if(AmmoSwaps[i].NewClasses[j] == none)
							{
								return false;
							}
							return SwapPickup(Other, AmmoSwaps[i].NewClasses[j], i, true);
						}
						J0x626:

						i++;
						// [Loop Continue]
						goto J0x40E;
					}
					return true;					
				}
				else
				{
					// End:0x770
					if(((WeaponPickup(Other) != none) && Other.Owner == none) && !WeaponPickup(Other).bDropped)
					{
						i = 0;
						J0x67D:

						// End:0x76E [Loop If]
						if(i < 17)
						{
							// End:0x764
							if(WeaponPickup(Other).InventoryType == Swaps[i].Old)
							{
								// End:0x6D2
								if(bLeaveSuper && Swaps[i].bSuper)
								{
									return true;
								}
								// End:0x727
								if(Swaps[i].bRandom)
								{
									return SwapPickup(Other, Swaps[i].NewClasses[static.Rand(Swaps[i].NewClasses.Length)].default.PickupClass, i);
									// [Explicit Continue]
									goto J0x764;
								}
								return SwapPickup(Other, Swaps[i].NewClasses[int(Swaps[i].CurrentIndex)].default.PickupClass, i);
							}
							J0x764:

							i++;
							// [Loop Continue]
							goto J0x67D;
						}
						return true;
					}
				}
			}
		}
	}
	return super.CheckReplacement(Other, bSuperRelevant);
	//return;	
}

function DoSomeShit()
{
	local int i, j;
	local BallisticWeaponPickup WP;
	local BallisticAmmoPickup AP;

	i = 0;
	J0x07:

	// End:0x43 [Loop If]
	if(i < 17)
	{
		Swaps[i].CurrentIndex = byte(Rand(Swaps[i].NewClassNames.Length));
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0x4A:

	// End:0x112 [Loop If]
	if(i < 14)
	{
		j = 0;
		J0x5D:

		// End:0x108 [Loop If]
		if(j < 17)
		{
			// End:0xFE
			if((Swaps[j].Old.default.FireModeClass[0].default.AmmoClass == AmmoSwaps[i].Old) || Swaps[j].Old.default.FireModeClass[1].default.AmmoClass == AmmoSwaps[i].Old)
			{
				AmmoSwaps[i].CurrentIndex = Swaps[j].CurrentIndex;
			}
			j++;
			// [Loop Continue]
			goto J0x5D;
		}
		i++;
		// [Loop Continue]
		goto J0x4A;
	}
	// End:0x14F
	foreach DynamicActors(Class'BCoreProV55.BallisticWeaponPickup', WP)
	{
		// End:0x14E
		if(WP.ReplacementsIndex > -1)
		{
			WP.ChangeTime = 0.1000000;
		}		
	}	
	// End:0x18D
	foreach DynamicActors(Class'BCoreProV55.BallisticAmmoPickup', AP)
	{
		// End:0x18C
		if(AP.ReplacementsIndex > -1)
		{
			AP.ChangeTime = 0.1000000;
		}		
	}	
	//return;	
}

function SwapLockers()
{
	local int i, j, k;
	local WeaponLocker L;
	local LockerWeapon LW;
	local Class<UTWeaponPickup> NP;
	local array<WeaponLocker> Lockers;

	// End:0x18
	if(!bLockersChange && bLockersSetup)
	{
		return;
	}
	// End:0x291
	foreach AllActors(Class'XWeapons.WeaponLocker', L)
	{
		j = 0;
		J0x2F:

		// End:0x27E [Loop If]
		if(j < L.Weapons.Length)
		{
			// End:0x178
			if(!bLockersSetup)
			{
				i = 0;
				J0x5A:

				// End:0x175 [Loop If]
				if(i < 17)
				{
					// End:0x16B
					if((L.Weapons[j].WeaponClass != none) && L.Weapons[j].WeaponClass == (GetInventoryFor(Swaps[i].Old)))
					{
						L.Weapons[j].WeaponClass = Swaps[i].NewClasses[Rand(Swaps[i].NewClasses.Length)];
						// End:0x168
						if(L.Weapons[j].WeaponClass != none)
						{
							L.Weapons[j].ExtraAmmo = L.Weapons[j].WeaponClass.default.FireModeClass[0].default.AmmoClass.default.InitialAmount;
						}
						// [Explicit Break]
						goto J0x175;
					}
					i++;
					// [Loop Continue]
					goto J0x5A;
				}
				J0x175:

				// [Explicit Continue]
				goto J0x274;
			}
			// End:0x274
			if(L.Weapons[j].WeaponClass != none)
			{
				k = Max(0, int(L.Weapons[j].WeaponClass.default.InventoryGroup) - 1);
				L.Weapons[j].WeaponClass = Swaps[k].NewClasses[Rand(Swaps[k].NewClasses.Length)];
				// End:0x274
				if(L.Weapons[j].WeaponClass != none)
				{
					L.Weapons[j].ExtraAmmo = L.Weapons[j].WeaponClass.default.FireModeClass[0].default.AmmoClass.default.InitialAmount;
				}
			}
			J0x274:

			j++;
			// [Loop Continue]
			goto J0x2F;
		}
		Lockers[Lockers.Length] = L;		
	}	
	// End:0x7A5
	foreach AllActors(Class'XWeapons.LockerWeapon', LW)
	{
		i = 0;
		J0x2A9:

		// End:0x2FE [Loop If]
		if(i < Lockers.Length)
		{
			// End:0x2F4
			if(Lockers[i].Location == LW.Location)
			{
				L = Lockers[i];
				// [Explicit Break]
				goto J0x2FE;
			}
			i++;
			// [Loop Continue]
			goto J0x2A9;
		}
		J0x2FE:

		// End:0x7A4
		if(L != none)
		{
			j = 0;
			J0x310:

			// End:0x7A4 [Loop If]
			if(j < LW.Emitters.Length)
			{
				// End:0x36A
				if(j >= L.Weapons.Length)
				{
					MeshEmitter(LW.Emitters[j]).Disabled = true;					
				}
				else
				{
					MeshEmitter(LW.Emitters[j]).Disabled = false;
				}
				// End:0x3D2
				if(j < L.Weapons.Length)
				{
					NP = Class<UTWeaponPickup>(GetPickupFor(L.Weapons[j].WeaponClass));
				}
				// End:0x79A
				if((NP != none) && MeshEmitter(LW.Emitters[j]).StaticMesh != NP.default.StaticMesh)
				{
					// End:0x45D
					if(Class<BallisticWeaponPickup>(NP) != none)
					{
						MeshEmitter(LW.Emitters[j]).StaticMesh = Class<BallisticWeaponPickup>(NP).default.LowPolyStaticMesh;						
					}
					else
					{
						MeshEmitter(LW.Emitters[j]).StaticMesh = NP.default.StaticMesh;
					}
					MeshEmitter(LW.Emitters[j]).StartSpinRange.X.Min = NP.default.StandUp.X;
					MeshEmitter(LW.Emitters[j]).StartSpinRange.X.Max = NP.default.StandUp.X;
					MeshEmitter(LW.Emitters[j]).StartSpinRange.Y.Min = NP.default.StandUp.Y;
					MeshEmitter(LW.Emitters[j]).StartSpinRange.Y.Max = NP.default.StandUp.Y;
					MeshEmitter(LW.Emitters[j]).StartSpinRange.Z.Min = NP.default.StandUp.Z;
					MeshEmitter(LW.Emitters[j]).StartSpinRange.Z.Max = NP.default.StandUp.Z;
					MeshEmitter(LW.Emitters[j]).StartSizeRange.X.Min = 0.9000000 * NP.default.DrawScale;
					MeshEmitter(LW.Emitters[j]).StartSizeRange.X.Max = 0.9000000 * NP.default.DrawScale;
					MeshEmitter(LW.Emitters[j]).StartSizeRange.Y.Min = 0.9000000 * NP.default.DrawScale;
					MeshEmitter(LW.Emitters[j]).StartSizeRange.Y.Max = 0.9000000 * NP.default.DrawScale;
					MeshEmitter(LW.Emitters[j]).StartSizeRange.Z.Min = 0.9000000 * NP.default.DrawScale;
					MeshEmitter(LW.Emitters[j]).StartSizeRange.Z.Max = 0.9000000 * NP.default.DrawScale;
				}
				j++;
				// [Loop Continue]
				goto J0x310;
			}
		}		
	}	
	//return;	
}

event Tick(float dt)
{
	super.Tick(dt);
	// End:0x4F
	if(bPickupsChange && Level.TimeSeconds >= PickupChangeTime)
	{
		DoSomeShit();
		PickupChangeTime = Level.TimeSeconds + default.PickupChangeTime;
	}
	// End:0x81
	if(!bLockersSetup && Level.TimeSeconds > float(5))
	{
		SwapLockers();
		bLockersSetup = true;
	}
	// End:0xC5
	if(bLockersChange && Level.TimeSeconds >= LockerChangeTime)
	{
		SwapLockers();
		LockerChangeTime = Level.TimeSeconds + default.LockerChangeTime;
	}
	//return;	
}

defaultproperties
{
	Swaps[0]=(bRandom=false,Old=Class'XWeapons.ShieldGun',NewClassNames=("BallisticProV55.X3Knife","BallisticProV55.X4Knife","BallisticProV55.A909SkrithBlades","BallisticProV55.EKS43Katana"),NewClasses=none,CurrentIndex=0,bSuper=false)
	Swaps[1]=(bRandom=false,Old=Class'XWeapons.AssaultRifle',NewClassNames=("BallisticProV55.A42SkrithPistol","BallisticProV55.AM67Pistol","BallisticProV55.BOGPPistol","BallisticProV55.D49Revolver","BallisticProV55.M806Pistol","BallisticProV55.MD24Pistol","BallisticProV55.MRT6Shotgun","BallisticProV55.RS8Pistol","BallisticProV55.leMatRevolver"),NewClasses=none,CurrentIndex=0,bSuper=false)
	Swaps[2]=(bRandom=false,Old=Class'XWeapons.BioRifle',NewClassNames=("BallisticProV55.XK2SubMachinegun","BallisticProV55.Fifty9MachinePistol","BallisticProV55.XRS10SubmachineGun","BallisticProV55.XMK5SubMachinegun"),NewClasses=none,CurrentIndex=0,bSuper=false)
	Swaps[3]=(bRandom=false,Old=Class'XWeapons.ShockRifle',NewClassNames=("BallisticProV55.M50AssaultRifle","BallisticProV55.SARAssaultRifle","BallisticProV55.M46AssaultRifle"),NewClasses=none,CurrentIndex=0,bSuper=false)
	Swaps[4]=(bRandom=false,Old=Class'XWeapons.LinkGun',NewClassNames=("BallisticProV55.A73SkrithRifle","BallisticProV55.E23PlasmaRifle"),NewClasses=none,CurrentIndex=0,bSuper=false)
	Swaps[5]=(bRandom=false,Old=Class'XWeapons.Minigun',NewClassNames=("BallisticProV55.M353Machinegun","BallisticProV55.M925Machinegun","BallisticProV55.XMV850Minigun"),NewClasses=none,CurrentIndex=0,bSuper=false)
	Swaps[6]=(bRandom=false,Old=Class'XWeapons.FlakCannon',NewClassNames=("BallisticProV55.M763Shotgun","BallisticProV55.M290Shotgun","BallisticProV55.MRS138Shotgun","BallisticProV55.A500Reptile"),NewClasses=none,CurrentIndex=0,bSuper=false)
	Swaps[7]=(bRandom=false,Old=Class'XWeapons.RocketLauncher',NewClassNames=("BallisticProV55.G5Bazooka","BallisticProV55.RX22AFlamer","BallisticProV55.MACWeapon","BallisticProV55.MRocketLauncher"),NewClasses=none,CurrentIndex=0,bSuper=false)
	Swaps[8]=(bRandom=false,Old=Class'XWeapons.SniperRifle',NewClassNames=("BallisticProV55.M75Railgun"),NewClasses=none,CurrentIndex=0,bSuper=false)
	Swaps[9]=(bRandom=false,Old=Class'XWeapons.Painter',NewClassNames=("BallisticProV55.RSDarkStar","BallisticProV55.RSNovaStaff","BWBPAirstrikesPro.TargetDesignator"),NewClasses=none,CurrentIndex=0,bSuper=true)
	Swaps[10]=(bRandom=false,Old=Class'XWeapons.Redeemer',NewClassNames=("BallisticProV55.HVCMk9LightningGun"),NewClasses=none,CurrentIndex=0,bSuper=true)
	Swaps[11]=(bRandom=false,Old=Class'UTClassic.ClassicSniperRifle',NewClassNames=("BallisticProV55.R78Rifle","BallisticProV55.R9RangerRifle","BallisticProV55.MarlinRifle","BallisticProV55.SRS900Rifle"),NewClasses=none,CurrentIndex=0,bSuper=false)
	Swaps[12]=(bRandom=false,Old=Class'Onslaught.ONSAVRiL',NewClassNames=("BallisticProV55.G5Bazooka","BallisticProV55.MACWeapon"),NewClasses=none,CurrentIndex=0,bSuper=false)
	Swaps[13]=(bRandom=false,Old=Class'Onslaught.ONSGrenadeLauncher',NewClassNames=("BallisticProV55.NRP57Grenade"),NewClasses=none,CurrentIndex=0,bSuper=false)
	Swaps[14]=(bRandom=false,Old=Class'Onslaught.ONSMineLayer',NewClassNames=("BallisticProV55.BX5Mine"),NewClasses=none,CurrentIndex=0,bSuper=false)
	Swaps[15]=(bRandom=false,Old=Class'OnslaughtFull.ONSPainter',NewClassNames=("BallisticProV55.R78Rifle"),NewClasses=none,CurrentIndex=0,bSuper=true)
	Swaps[16]=(bRandom=false,Old=Class'XWeapons.SuperShockRifle',NewClassNames=("BallisticProV55.HVCMk9LightningGun"),NewClasses=none,CurrentIndex=0,bSuper=true)
	AmmoSwaps[0]=(bIndependant=false,Old=Class'XWeapons.AssaultAmmo',NewClasses=none,CurrentIndex=0)
	AmmoSwaps[1]=(bIndependant=false,Old=Class'XWeapons.BioAmmo',NewClasses=none,CurrentIndex=0)
	AmmoSwaps[2]=(bIndependant=false,Old=Class'XWeapons.ShockAmmo',NewClasses=none,CurrentIndex=0)
	AmmoSwaps[3]=(bIndependant=false,Old=Class'XWeapons.LinkAmmo',NewClasses=none,CurrentIndex=0)
	AmmoSwaps[4]=(bIndependant=false,Old=Class'XWeapons.MinigunAmmo',NewClasses=none,CurrentIndex=0)
	AmmoSwaps[5]=(bIndependant=false,Old=Class'XWeapons.FlakAmmo',NewClasses=none,CurrentIndex=0)
	AmmoSwaps[6]=(bIndependant=false,Old=Class'XWeapons.RocketAmmo',NewClasses=none,CurrentIndex=0)
	AmmoSwaps[7]=(bIndependant=false,Old=Class'XWeapons.SniperAmmo',NewClasses=none,CurrentIndex=0)
	AmmoSwaps[8]=(bIndependant=false,Old=Class'UTClassic.ClassicSniperAmmo',NewClasses=none,CurrentIndex=0)
	AmmoSwaps[9]=(bIndependant=false,Old=Class'Onslaught.ONSAVRiLAmmo',NewClasses=none,CurrentIndex=0)
	AmmoSwaps[10]=(bIndependant=false,Old=Class'Onslaught.ONSGrenadeAmmo',NewClasses=none,CurrentIndex=0)
	AmmoSwaps[11]=(bIndependant=false,Old=Class'Onslaught.ONSGrenadeAmmo',NewClasses=none,CurrentIndex=0)
	AmmoSwaps[12]=(bIndependant=false,Old=Class'Onslaught.ONSMineAmmo',NewClasses=none,CurrentIndex=0)
	AmmoSwaps[13]=(bIndependant=false,Old=Class'XWeapons.GrenadeAmmo',NewClasses=none,CurrentIndex=0)
	NadeReplacePercent=15
	GrenadePickupClasses[0]=Class'BallisticProV55.FP7Pickup'
	GrenadePickupClasses[1]=Class'BallisticProV55.NRP57Pickup'
	GrenadePickupClasses[2]=Class'BallisticProV55.T10Pickup'
	GrenadePickupClasses[3]=Class'BallisticProV55.BX5Pickup'
	GrenadePickupClasses[4]=Class'BallisticProV55.FP9Pickup'
	PickupChangeTime=60.0000000
	LockerChangeTime=90.0000000
	bLockersChange=true
	FriendlyName="BallisticPro: Swap"
	Description="Applies Ballistic Weapons mod. Replaces the original weapons with the Ballistic weapons and implements all the new features and options including: reloading, recoil, inaccuracy, improved damage, iron sights, firing modes, new effects, new sounds, new items, altered player movement, etc... All options are accesible through the 'configure mutator' menu and the swapping lists can be used to change which weapons are spawned and how...||Pro changes: Support for variable walking and crouching speeds, run anims for walking, BX5 universal lights, and random replacement of standard ammo pickups with grenades.||http://www.runestorm.com"
}
