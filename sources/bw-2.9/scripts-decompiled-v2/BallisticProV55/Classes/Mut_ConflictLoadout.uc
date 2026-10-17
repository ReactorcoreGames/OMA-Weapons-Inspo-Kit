class Mut_ConflictLoadout extends Mut_Ballistic
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const MAIN_SECTION_INDEX = 0;
const SUB_SECTION_INDEX = 1;

var() array<Entry> ConflictWeapons;
var() byte LoadoutOption;
var() config bool bSeparateAssaultList;
var protected int MaxInventorySize;
var protected int MaxSlots[2];
var array<string> LoadoutOptionText;
var array<LORequirements> FullRequirementsList;

function PreBeginPlay()
{
	local int i;
	local Class<BC_GameStyle> game_style;
	local WeaponList_ConflictLoadout List;
	local string loader_string;

	super.PreBeginPlay();
	game_style = Class'BCoreProV55.BallisticGameStyles'.static.GetReplicatedStyle();
	MaxSlots[0] = game_style.default.ConflictWeaponSlots;
	MaxSlots[1] = game_style.default.ConflictEquipmentSlots;
	MaxInventorySize = MaxSlots[0] + MaxSlots[1];
	loader_string = game_style.default.StyleName;
	// End:0xA7
	if(bSeparateAssaultList && ASGameInfo(Level.Game) != none)
	{
		loader_string $= "Assault";
	}
	Log("Loading Conflict Loadout weapon list from " $ loader_string);
	List = new (none, loader_string) Class'BallisticProV55.WeaponList_ConflictLoadout';
	ConflictWeapons.Length = List.ConflictWeapons.Length;
	i = 0;
	J0x10C:

	// End:0x14F [Loop If]
	if(i < List.ConflictWeapons.Length)
	{
		ConflictWeapons[i] = List.ConflictWeapons[i];
		++i;
		// [Loop Continue]
		goto J0x10C;
	}
	LoadoutOption = List.LoadoutOption;
	//return;	
}

function PostBeginPlay()
{
	local int i, j;
	local GameRules G;

	super.PostBeginPlay();
	// End:0x84
	if(int(LoadoutOption) == 1)
	{
		G = Spawn(Class'BallisticProV55.Rules_SpLoadout');
		// End:0x5E
		if(Level.Game.GameRulesModifiers == none)
		{
			Level.Game.GameRulesModifiers = G;			
		}
		else
		{
			Level.Game.GameRulesModifiers.AddGameRules(G);
		}
	}
	i = 0;
	J0x8B:

	// End:0x1B6 [Loop If]
	if(i < ConflictWeapons.Length)
	{
		j = 0;
		J0xA2:

		// End:0x118 [Loop If]
		if(j < Class'BallisticProV55.Mut_Loadout'.default.items.Length)
		{
			// End:0x10E
			if(Class'BallisticProV55.Mut_Loadout'.default.items[j].ItemName ~= ConflictWeapons[i].ClassName)
			{
				FullRequirementsList[i] = Class'BallisticProV55.Mut_Loadout'.default.items[j].Requirements;
			}
			j++;
			// [Loop Continue]
			goto J0xA2;
		}
		// End:0x15B
		if(j >= Class'BallisticProV55.Mut_Loadout'.default.items.Length)
		{
			FullRequirementsList.Length = i + 1;
			SetDefaultRequirements(ConflictWeapons[i].ClassName, i);
		}
		// End:0x1AC
		if(ConflictWeapons[i].bBlue)
		{
			// End:0x199
			if(ConflictWeapons[i].bRed)
			{
				FullRequirementsList[i].InTeam = 2;
				// [Explicit Continue]
				goto J0x1AC;
			}
			FullRequirementsList[i].InTeam = 1;
		}
		J0x1AC:

		i++;
		// [Loop Continue]
		goto J0x8B;
	}
	FullRequirementsList.Length = ConflictWeapons.Length;
	i = 0;
	J0x1CA:

	// End:0x2C4 [Loop If]
	if(i < FullRequirementsList.Length)
	{
		FullRequirementsList[i].MatchTime *= Class'BallisticProV55.Mut_LoadoutConfig'.default.TimeScale;
		FullRequirementsList[i].Frags *= Class'BallisticProV55.Mut_LoadoutConfig'.default.FragScale;
		FullRequirementsList[i].Efficiency *= Class'BallisticProV55.Mut_LoadoutConfig'.default.EffyScale;
		FullRequirementsList[i].DamageRate *= Class'BallisticProV55.Mut_LoadoutConfig'.default.DmRtScale;
		FullRequirementsList[i].ShotgunEff *= Class'BallisticProV55.Mut_LoadoutConfig'.default.SgEfScale;
		FullRequirementsList[i].SniperEff *= Class'BallisticProV55.Mut_LoadoutConfig'.default.SrEfScale;
		FullRequirementsList[i].HazardEff *= Class'BallisticProV55.Mut_LoadoutConfig'.default.HzEfScale;
		i++;
		// [Loop Continue]
		goto J0x1CA;
	}
	//return;	
}

function bool SetDefaultRequirements(string ClassName, int Index)
{
	local Class<BallisticWeapon> BW;
	local string S;
	local array<string> RS;

	BW = Class<BallisticWeapon>(DynamicLoadObject(ClassName, Class'Core.Class'));
	// End:0x28
	if(BW == none)
	{
		return false;
	}
	S = BW.static.StaticGetSpecialInfo('EvoDefs');
	// End:0x50
	if(S == "")
	{
		return false;
	}
	Split(S, ";", RS);
	switch(RS.Length - 1)
	{
		// End:0x8A
		case 6:
			FullRequirementsList[Index].HazardEff = float(RS[6]);
		// End:0xAA
		case 5:
			FullRequirementsList[Index].ShotgunEff = float(RS[5]);
		// End:0xCA
		case 4:
			FullRequirementsList[Index].SniperEff = float(RS[4]);
		// End:0xEA
		case 3:
			FullRequirementsList[Index].DamageRate = float(RS[3]);
		// End:0x10A
		case 2:
			FullRequirementsList[Index].Efficiency = float(RS[2]);
		// End:0x128
		case 1:
			FullRequirementsList[Index].Frags = float(RS[1]);
		// End:0x146
		case 0:
			FullRequirementsList[Index].MatchTime = float(RS[0]);
		// End:0xFFFF
		default:
			return true;
			break;
	}
	//return;	
}

static function int GetItemSize(Class<Inventory> Item)
{
	// End:0x12
	if(Class<BallisticWeapon>(Item) == none)
	{
		return 1;
	}
	return int(Class<BallisticWeapon>(Item).static.GetParams().default.Layouts[0].InventorySize);
	//return;	
}

static function int GetSectionIndex(Class<Inventory> Item)
{
	// End:0x12
	if(Class<BallisticWeapon>(Item) == none)
	{
		return 1;
	}
	// End:0x2D
	if(Class'BCoreProV55.BallisticGameStyles'.static.GetReplicatedStyle() == Class'BCoreProV55.GameStyle_Classic')
	{
		return 0;
	}
	switch(Class<BallisticWeapon>(Item).default.InventoryGroup)
	{
		// End:0x47
		case 0:
		// End:0x4C
		case 1:
		// End:0x53
		case 11:
			return 1;
		// End:0xFFFF
		default:
			return 0;
			break;
	}
	//return;	
}

function ModifyPlayer(Pawn Other)
{
	local int i, Size, SectionIndex, SpaceUsed[2], CamoIndex, LayoutIndex;

	local float BonusAmmo;
	local Inventory Inv;
	local Weapon W;
	local Class<Inventory> InventoryClass;
	local ConflictLoadoutLRI CLRI;
	local string S;
	local Class<ConflictItem> ItemClass;

	super.ModifyPlayer(Other);
	// End:0x33
	if(Other.LastStartTime > (Level.TimeSeconds + float(1)))
	{
		return;
	}
	CLRI = ConflictLoadoutLRI(GetBPRI(Other.PlayerReplicationInfo));
	// End:0x5F
	if(CLRI == none)
	{
		return;
	}
	// End:0x88
	if(Other.PlayerReplicationInfo.bBot)
	{
		EquipBot(Other);		
	}
	else
	{
		CLRI.Validate(CLRI.LoadOut, CLRI.Layouts, CLRI.Camos);
		// End:0x109
		if(CLRI.LoadOut.Length == 0)
		{
			S = GetFallbackWeapon(CLRI);
			// End:0x109
			if(S != "")
			{
				CLRI.LoadOut[0] = S;
			}
		}
	}
	CLRI.AppliedItems.Length = 0;
	// End:0x446
	if(xPawn(Other) != none)
	{
		i = 0;
		J0x131:

		// End:0x446 [Loop If]
		if(i < Max(CLRI.LoadOut.Length, 2))
		{
			// End:0x186
			if(i >= CLRI.LoadOut.Length)
			{
				xPawn(Other).RequiredEquipment[i] = "";
				// [Explicit Continue]
				goto J0x43C;
			}
			InventoryClass = Level.Game.BaseMutator.GetInventoryClass(CLRI.LoadOut[i]);
			// End:0x333
			if(InventoryClass != none)
			{
				SectionIndex = GetSectionIndex(InventoryClass);
				Size = GetItemSize(InventoryClass);
				// End:0x213
				if((SpaceUsed[SectionIndex] + Size) > MaxSlots[SectionIndex])
				{
					// [Explicit Continue]
					goto J0x43C;
				}
				// End:0x30E
				if(Class<BallisticWeapon>(InventoryClass) != none)
				{
					// End:0x275
					if((i < CLRI.Layouts.Length) && CLRI.Layouts[i] != "")
					{
						LayoutIndex = int(CLRI.Layouts[i]);
					}
					// End:0x2C7
					if((i < CLRI.Camos.Length) && CLRI.Camos[i] != "")
					{
						CamoIndex = int(CLRI.Camos[i]);
					}
					SpawnConflictWeapon(Class<BallisticWeapon>(InventoryClass), Other, 255, i == CLRI.InitialWeaponIndex, LayoutIndex, CamoIndex);
					LayoutIndex = 0;
					CamoIndex = 0;					
				}
				else
				{
					SpawnInventoryItem(InventoryClass, Other);
				}
				SpaceUsed[SectionIndex] += Size;
				// [Explicit Continue]
				goto J0x43C;
			}
			ItemClass = Class<ConflictItem>(DynamicLoadObject(CLRI.LoadOut[i], Class'Core.Class'));
			// End:0x43C
			if(ItemClass != none)
			{
				SectionIndex = 1;
				Size = ItemClass.default.Size / 5;
				// End:0x3AC
				if((SpaceUsed[SectionIndex] + Size) > MaxSlots[SectionIndex])
				{
					// [Explicit Continue]
					goto J0x43C;
				}
				CLRI.AppliedItems[CLRI.AppliedItems.Length] = ItemClass;
				// End:0x413
				if(ItemClass.default.bBonusAmmo)
				{
					// End:0x3FE
					if(ItemClass.static.AddAmmoBonus(Other, BonusAmmo))
					{
					}
					SpaceUsed[SectionIndex] += Size;
					// [Explicit Continue]
					goto J0x43C;
				}
				// End:0x43C
				if(ItemClass.static.ApplyItem(Other))
				{
					SpaceUsed[SectionIndex] += Size;
				}
			}
			J0x43C:

			i++;
			// [Loop Continue]
			goto J0x131;
		}
	}
	// End:0x5A5
	if(SpaceUsed[0] < MaxSlots[0])
	{
		Inv = Other.Inventory;
		J0x46D:

		// End:0x4A2 [Loop If]
		if(Inv != none)
		{
			// End:0x48B
			if(Weapon(Inv) != none)
			{
				// [Explicit Break]
				goto J0x4A2;
			}
			Inv = Inv.Inventory;
			// [Loop Continue]
			goto J0x46D;
		}
		J0x4A2:

		// End:0x5A5
		if(Inv == none)
		{
			S = GetFallbackWeapon(CLRI);
			InventoryClass = Level.Game.BaseMutator.GetInventoryClass(S);
			// End:0x5A5
			if(InventoryClass != none)
			{
				Inv = Spawn(InventoryClass);
				// End:0x5A5
				if(Inv != none)
				{
					Inv.GiveTo(Other);
					// End:0x586
					if(((Weapon(Inv) != none) && Other.PendingWeapon == none) && Other.Weapon == none)
					{
						Other.PendingWeapon = Weapon(Inv);
						Other.ChangedWeapon();
					}
					// End:0x5A5
					if(Inv != none)
					{
						Inv.PickupFunction(Other);
					}
				}
			}
		}
	}
	Inv = Other.Inventory;
	J0x5B9:

	// End:0x6A6 [Loop If]
	if(Inv != none)
	{
		W = Weapon(Inv);
		// End:0x68F
		if((W != none) && BonusAmmo > float(0))
		{
			SpawnAmmo(W.default.FireModeClass[0].default.AmmoClass, Other, BonusAmmo);
			// End:0x68F
			if((W.default.FireModeClass[1] != none) && W.default.FireModeClass[0].default.AmmoClass != W.default.FireModeClass[1].default.AmmoClass)
			{
				SpawnAmmo(W.default.FireModeClass[1].default.AmmoClass, Other, BonusAmmo);
			}
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x5B9;
	}
	i = 0;
	J0x6AD:

	// End:0x6F3 [Loop If]
	if(i < CLRI.AppliedItems.Length)
	{
		CLRI.AppliedItems[i].static.PostApply(Other);
		i++;
		// [Loop Continue]
		goto J0x6AD;
	}
	//return;	
}

function SpawnInventoryItem(Class<Inventory> InvClass, Pawn Other)
{
	local Inventory Inv;

	Inv = Other.Spawn(InvClass,,, Other.Location);
	// End:0x5A
	if(Inv != none)
	{
		Inv.GiveTo(Other);
		Inv.PickupFunction(Other);
	}
	//return;	
}

function SpawnConflictWeapon(Class<Weapon> WepClass, Pawn Other, int net_inventory_group, bool set_as_initial_weapon, int LayoutIndex, int CamoIndex)
{
	local Weapon newWeapon;
	local byte GameStyleIndex;

	GameStyleIndex = Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle;
	newWeapon = Weapon(Other.FindInventoryType(WepClass));
	// End:0x1CC
	if((newWeapon == none) || (BallisticHandgun(newWeapon) != none) && !BallisticHandgun(newWeapon).default.ParamsClasses[int(GameStyleIndex)].default.Layouts[LayoutIndex].bDualBlocked)
	{
		newWeapon = Other.Spawn(WepClass,,, Other.Location);
		// End:0x1C9
		if(newWeapon != none)
		{
			// End:0x139
			if(BallisticWeapon(newWeapon) != none)
			{
				BallisticWeapon(newWeapon).NetInventoryGroup = net_inventory_group;
				BallisticWeapon(newWeapon).bServerDeferInitialSwitch = !set_as_initial_weapon;
				BallisticWeapon(newWeapon).GenerateLayout(byte(LayoutIndex));
				BallisticWeapon(newWeapon).GenerateCamo(byte(CamoIndex));
			}
			newWeapon.GiveTo(Other);
			newWeapon.PickupFunction(Other);
			// End:0x1C9
			if(((Bot(Other.Controller) != none) && Other.PendingWeapon == none) && Other.Weapon == none)
			{
				Other.PendingWeapon = newWeapon;
				Other.ChangedWeapon();
			}
		}		
	}
	else
	{
		newWeapon.AddAmmo(WepClass.default.FireModeClass[0].default.AmmoClass.default.InitialAmount, 0);
		newWeapon.AddAmmo(WepClass.default.FireModeClass[1].default.AmmoClass.default.InitialAmount, 1);
	}
	//return;	
}

function EquipBot(Pawn P)
{
	local int i, j, Size, SpaceUsed;
	local ConflictLoadoutLRI CLRI;
	local array<string> Potentials;
	local string ClassName;
	local Class<Weapon> W;
	local bool bAddedMiscs;
	local Class<ConflictItem> CI;
	local array<float> BandWidth;
	local float BandTotal, BandRand, BandLoc;

	CLRI = ConflictLoadoutLRI(GetBPRI(P.PlayerReplicationInfo));
	// End:0x2C
	if(CLRI == none)
	{
		return;
	}
	i = 0;
	J0x33:

	// End:0x1C4 [Loop If]
	if(i < ConflictWeapons.Length)
	{
		// End:0x73
		if((P.GetTeamNum() == 0) && !ConflictWeapons[i].bRed)
		{
			// [Explicit Continue]
			goto J0x1BA;
		}
		// End:0xA3
		if((P.GetTeamNum() > 0) && !ConflictWeapons[i].bBlue)
		{
			// [Explicit Continue]
			goto J0x1BA;
		}
		// End:0xCC
		if(Class<Weapon>(DynamicLoadObject(ConflictWeapons[i].ClassName, Class'Core.Class')) == none)
		{
			// [Explicit Continue]
			goto J0x1BA;
		}
		// End:0x1BA
		if(CLRI.WeaponRequirementsOk(FullRequirementsList[i]))
		{
			Potentials[Potentials.Length] = ConflictWeapons[i].ClassName;
			// End:0x1BA
			if(int(LoadoutOption) == 1)
			{
				BandWidth[Potentials.Length - 1] = 3.0000000;
				// End:0x163
				if(FullRequirementsList[i].MatchTime > float(0))
				{
					BandWidth[Potentials.Length - 1] += Sqrt(FullRequirementsList[i].MatchTime);
				}
				// End:0x1A4
				if(FullRequirementsList[i].Frags > float(0))
				{
					BandWidth[Potentials.Length - 1] += (Sqrt(FullRequirementsList[i].Frags) * float(3));
				}
				BandTotal += BandWidth[Potentials.Length - 1];
			}
		}
		J0x1BA:

		i++;
		// [Loop Continue]
		goto J0x33;
	}
	CLRI.LoadOut.Length = 0;
	i = 0;
	J0x1DC:

	// End:0x4AA [Loop If]
	if((i < MaxInventorySize) && SpaceUsed < MaxInventorySize)
	{
		// End:0x27C
		if(int(LoadoutOption) == 1)
		{
			BandRand = FRand() * BandTotal;
			BandLoc = 0.0000000;
			j = 0;
			J0x22A:

			// End:0x279 [Loop If]
			if(j < BandWidth.Length)
			{
				BandLoc += BandWidth[j];
				// End:0x26F
				if(BandRand < BandLoc)
				{
					ClassName = Potentials[j];
					// [Explicit Break]
					goto J0x279;
				}
				j++;
				// [Loop Continue]
				goto J0x22A;
			}
			J0x279:
			
		}
		else
		{
			ClassName = Potentials[Rand(Potentials.Length)];
		}
		W = Class<Weapon>(DynamicLoadObject(ClassName, Class'Core.Class'));
		// End:0x34C
		if(W == none)
		{
			// End:0x349
			if(bAddedMiscs)
			{
				CI = Class<ConflictItem>(DynamicLoadObject(ClassName, Class'Core.Class'));
				// End:0x2E8
				if(CI == none)
				{
					// [Explicit Continue]
					goto J0x4A0;
				}
				Size = CI.default.Size / 5;
				// End:0x319
				if((Size + SpaceUsed) > MaxInventorySize)
				{
					// [Explicit Continue]
					goto J0x4A0;
				}
				CLRI.LoadOut[CLRI.LoadOut.Length] = ClassName;
				SpaceUsed += Size;
			}
			// [Explicit Continue]
			goto J0x4A0;
		}
		// End:0x3FE
		if(!bAddedMiscs)
		{
			j = 0;
			J0x35E:

			// End:0x3F6 [Loop If]
			if(j < ConflictWeapons.Length)
			{
				// End:0x397
				if(Class<ConflictItem>(DynamicLoadObject(ConflictWeapons[j].ClassName, Class'Core.Class')) == none)
				{
					// [Explicit Continue]
					goto J0x3EC;
				}
				Potentials[Potentials.Length] = ConflictWeapons[j].ClassName;
				// End:0x3EC
				if(int(LoadoutOption) == 1)
				{
					BandWidth[Potentials.Length - 1] = 3.0000000;
					BandTotal += BandWidth[Potentials.Length - 1];
				}
				J0x3EC:

				j++;
				// [Loop Continue]
				goto J0x35E;
			}
			bAddedMiscs = true;
		}
		Size = GetItemSize(W);
		// End:0x428
		if((Size + SpaceUsed) > MaxInventorySize)
		{
			// [Explicit Continue]
			goto J0x4A0;
		}
		CLRI.LoadOut[CLRI.LoadOut.Length] = ClassName;
		CLRI.Layouts[CLRI.LoadOut.Length] = "255";
		CLRI.Camos[CLRI.LoadOut.Length] = "255";
		SpaceUsed += Size;
		J0x4A0:

		i++;
		// [Loop Continue]
		goto J0x1DC;
	}
	//return;	
}

function Class<Weapon> MyDefaultWeapon()
{
	return none;
	//return;	
}

function Class<Inventory> GetInventoryClass(string InventoryClassName)
{
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

function string GetFallbackWeapon(ConflictLoadoutLRI CLRI)
{
	return "BallisticProV55.SARAssaultRifle";
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
			BPRI = Spawn(Class'BallisticProV55.ConflictLoadoutLRI', Other.Owner);
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
			// End:0x27F
			if(xPawn(Other) != none)
			{
				xPawn(Other).RequiredEquipment[0] = "";
				xPawn(Other).RequiredEquipment[1] = "";
				return true;				
			}
			else
			{
				// End:0x2AA
				if((WeaponPickup(Other) != none) && Other.Owner == none)
				{
					return false;					
				}
				else
				{
					// End:0x309
					if((Ammo(Other) != none) && IP_AmmoPack(Other) == none)
					{
						// End:0x304
						if(Pickup(Other).myMarker != none)
						{
							Pickup(Other).myMarker.bBlocked = true;
						}
						return false;						
					}
					else
					{
						// End:0x380
						if(WeaponLocker(Other) != none)
						{
							// End:0x37D
							if(!SpawnNewItem(-1, Other, Class'BallisticProV55.IP_AmmoPack'))
							{
								// End:0x36B
								if(WeaponLocker(Other).myMarker != none)
								{
									WeaponLocker(Other).myMarker.bBlocked = true;
								}
								Other.GotoState('Disabled');
								return false;
							}							
						}
						else
						{
							// End:0x3AF
							if(xWeaponBase(Other) != none)
							{
								// End:0x3AC
								if(!SpawnNewItem(-1, Other, Class'BallisticProV55.IP_AmmoPack'))
								{
									return false;
								}								
							}
							else
							{
								// End:0x43E
								if(xPickUpBase(Other) != none)
								{
									Other.bHidden = true;
									// End:0x408
									if(xPickUpBase(Other).myMarker != none)
									{
										xPickUpBase(Other).myMarker.bBlocked = true;
									}
									// End:0x43B
									if(xPickUpBase(Other).myEmitter != none)
									{
										xPickUpBase(Other).myEmitter.Destroy();
									}									
								}
								else
								{
									// End:0x48A
									if(((JumpSpot(Other) != none) && BallisticRep != none) && !BallisticRep.bAllowDodging)
									{
										JumpSpot(Other).bDodgeUp = false;										
									}
									else
									{
										i = 0;
										J0x491:

										// End:0xA78 [Loop If]
										if(i < Replacements.Length)
										{
											// End:0x4BB
											if(Replacements[i].NewItems.Length == 0)
											{
												// [Explicit Continue]
												goto J0xA6E;
											}
											// End:0x556
											if(Weapon(Other) != none)
											{
												// End:0x553
												if(((GetInventoryFor(Replacements[i].OldItem)) == Weapon(Other).Class) && !Replacements[i].bSuper || !bLeaveSuper)
												{
													SwapWeapon(Other, GetInventoryFor(Replacements[i].NewItems[Rand(Replacements[i].NewItems.Length)]));
												}
												// [Explicit Continue]
												goto J0xA6E;
											}
											// End:0x65B
											if((((xWeaponBase(Other) != none) && xWeaponBase(Other).WeaponType != none) && xWeaponBase(Other).WeaponType == (GetInventoryFor(Replacements[i].OldItem))) && !Replacements[i].bSuper || !bLeaveSuper)
											{
												// End:0x641
												if(Replacements[i].bUseBase)
												{
													NewItem = GetNewItem(i);
													xWeaponBase(Other).WeaponType = Class<Weapon>(GetInventoryFor(NewItem));
													xWeaponBase(Other).PowerUp = GetPickupFor(NewItem);													
												}
												else
												{
													// End:0x658
													if(!SpawnNewItem(i, Other))
													{
														return false;
													}
												}
												// [Explicit Continue]
												goto J0xA6E;
											}
											// End:0x753
											if(WildcardBase(Other) != none)
											{
												j = 0;
												J0x672:

												// End:0x750 [Loop If]
												if(j < 8)
												{
													// End:0x746
													if((((WildcardBase(Other).PickupClasses[j] != none) && WildcardBase(Other).PickupClasses[j] == (GetPickupFor(Replacements[i].OldItem))) && !Replacements[i].bSuper || !bLeaveSuper) && Class<TournamentPickUp>(GetPickupFor(GetNewItem(i))) != none)
													{
														WildcardBase(Other).PickupClasses[j] = Class<TournamentPickUp>(GetPickupFor(GetNewItem(i)));
													}
													j++;
													// [Loop Continue]
													goto J0x672;
												}
												// [Explicit Continue]
												goto J0xA6E;
											}
											// End:0x829
											if((((xPickUpBase(Other) != none) && xPickUpBase(Other).PowerUp != none) && xPickUpBase(Other).PowerUp == (GetPickupFor(Replacements[i].OldItem))) && !Replacements[i].bSuper || !bLeaveSuper)
											{
												// End:0x80F
												if(Replacements[i].bUseBase)
												{
													xPickUpBase(Other).PowerUp = GetPickupFor(GetNewItem(i));													
												}
												else
												{
													// End:0x826
													if(!SpawnNewItem(i, Other))
													{
														return false;
													}
												}
												// [Explicit Continue]
												goto J0xA6E;
											}
											// End:0x9F4
											if((WeaponLocker(Other) != none) && !Replacements[i].bSuper || !bLeaveSuper)
											{
												j = 0;
												J0x865:

												// End:0x9F1 [Loop If]
												if(j < WeaponLocker(Other).Weapons.Length)
												{
													// End:0x9E7
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
													goto J0x865;
												}
												// [Explicit Continue]
												goto J0xA6E;
											}
											// End:0xA6E
											if(((Pickup(Other) != none) && Pickup(Other).Class == (GetPickupFor(Replacements[i].OldItem))) && !Replacements[i].bSuper || !bLeaveSuper)
											{
												AddPickupSwap(Pickup(Other), i);
											}
											J0xA6E:

											i++;
											// [Loop Continue]
											goto J0x491;
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	return true;
	//return;	
}

defaultproperties
{
	LoadoutOptionText[0]="Standard"
	LoadoutOptionText[1]="Evolution"
	LoadoutOptionText[2]="Purchasing (NOT IMPLEMENTED)"
	bHideLockers=true
	ConfigMenuClassName="BallisticProV55.ConfigMenu_Inventory"
	FriendlyName="BallisticPro: Conflict Loadout"
	Description="Play Ballistic Weapons with an expanded loadout system supporting Evolution configuration and inventory space."
}
