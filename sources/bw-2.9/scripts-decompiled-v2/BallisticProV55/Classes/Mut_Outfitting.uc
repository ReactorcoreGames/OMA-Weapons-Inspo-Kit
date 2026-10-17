class Mut_Outfitting extends Mut_Ballistic
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const NUM_GROUPS = 5;

struct dummypos
{
	var array<byte> Positions;
};

var() globalconfig string LoadOut[5];
var() globalconfig int Layout[5];
var() globalconfig int Camo[5];
var() globalconfig bool bDebugMode;
var array<ClientOutfittingInterface> COIPond;
var PlayerController PCPendingCOI;
var() globalconfig array<string> LoadoutGroup0;
var() globalconfig array<string> LoadoutGroup1;
var() globalconfig array<string> LoadoutGroup2;
var() globalconfig array<string> LoadoutGroup3;
var() globalconfig array<string> LoadoutGroup4;
var() globalconfig array<string> LoadoutGroup5;
var() globalconfig array<string> LoadoutGroup6;
var() dummypos DummyGroups[5];
var Class<Weapon> NetLoadout0;
var Class<Weapon> NetLoadout1;
var Class<Weapon> NetLoadout2;
var Class<Weapon> NetLoadout3;
var Class<Weapon> NetLoadout4;
var Class<Weapon> NetLoadout5;
var Class<Weapon> NetLoadout6;
var Class<Weapon> NetLoadoutWeapons[255];
var byte NetLoadoutGroups;

simulated function PreBeginPlay()
{
	local byte i, j;
	local Class<BC_GameStyle> game_style;
	local WeaponList_Killstreak streaks;

	super.PreBeginPlay();
	// End:0xAF
	if(int(Role) == int(ROLE_Authority))
	{
		i = 0;
		J0x1E:

		// End:0xAF [Loop If]
		if(int(i) < 5)
		{
			j = 0;
			J0x34:

			// End:0xA5 [Loop If]
			if(int(j) < GetGroup(i).Length)
			{
				// End:0x9B
				if(Right(GetGroup(i)[int(j)], 5) ~= "Dummy")
				{
					DummyGroups[int(i)].Positions[DummyGroups[int(i)].Positions.Length] = j;
				}
				j++;
				// [Loop Continue]
				goto J0x34;
			}
			i++;
			// [Loop Continue]
			goto J0x1E;
		}
	}
	game_style = Class'BCoreProV55.BallisticGameStyles'.static.GetReplicatedStyle();
	Log("Loading killstreak weapon list from " $ game_style.default.StyleName);
	streaks = new (none, game_style.default.StyleName) Class'BallisticProV55.WeaponList_Killstreak';
	LoadoutGroup5.Length = streaks.Streak1s.Length;
	LoadoutGroup6.Length = streaks.Streak2s.Length;
	i = 0;
	J0x14C:

	// End:0x195 [Loop If]
	if(int(i) < streaks.Streak1s.Length)
	{
		LoadoutGroup5[int(i)] = streaks.Streak1s[int(i)];
		++i;
		// [Loop Continue]
		goto J0x14C;
	}
	i = 0;
	J0x19D:

	// End:0x1E6 [Loop If]
	if(int(i) < streaks.Streak2s.Length)
	{
		LoadoutGroup6[int(i)] = streaks.Streak2s[int(i)];
		++i;
		// [Loop Continue]
		goto J0x19D;
	}
	//return;	
}

simulated function string GetGroupItem(byte GroupNum, int ItemNum)
{
	switch(GroupNum)
	{
		// End:0x18
		case 0:
			return LoadoutGroup0[ItemNum];
		// End:0x29
		case 1:
			return LoadoutGroup1[ItemNum];
		// End:0x3A
		case 2:
			return LoadoutGroup2[ItemNum];
		// End:0x4B
		case 3:
			return LoadoutGroup3[ItemNum];
		// End:0x5C
		case 4:
			return LoadoutGroup4[ItemNum];
		// End:0x6D
		case 5:
			return LoadoutGroup5[ItemNum];
		// End:0x7E
		case 6:
			return LoadoutGroup6[ItemNum];
		// End:0xFFFF
		default:
			//return;
			break;
	}	
}

simulated function array<string> GetGroup(byte GroupNum)
{
	switch(GroupNum)
	{
		// End:0x12
		case 0:
			return LoadoutGroup0;
		// End:0x1D
		case 1:
			return LoadoutGroup1;
		// End:0x28
		case 2:
			return LoadoutGroup2;
		// End:0x33
		case 3:
			return LoadoutGroup3;
		// End:0x3E
		case 4:
			return LoadoutGroup4;
		// End:0x49
		case 5:
			return LoadoutGroup5;
		// End:0x54
		case 6:
			return LoadoutGroup6;
		// End:0xFFFF
		default:
			//return;
			break;
	}	
}

static function array<string> SGetGroup(byte GroupNum)
{
	switch(GroupNum)
	{
		// End:0x12
		case 0:
			return default.LoadoutGroup0;
		// End:0x1D
		case 1:
			return default.LoadoutGroup1;
		// End:0x28
		case 2:
			return default.LoadoutGroup2;
		// End:0x33
		case 3:
			return default.LoadoutGroup3;
		// End:0x3E
		case 4:
			return default.LoadoutGroup4;
		// End:0x49
		case 5:
			return default.LoadoutGroup5;
		// End:0x54
		case 6:
			return default.LoadoutGroup6;
		// End:0xFFFF
		default:
			//return;
			break;
	}	
}

function ModifyPlayer(Pawn Other)
{
	local int i;
	local Class<Weapon> W;
	local string Stuff[5];

	super.ModifyPlayer(Other);
	// End:0x34
	if(Other.LastStartTime > (Level.TimeSeconds + float(2)))
	{
		return;
	}
	// End:0x1F7
	if((Other.Controller != none) && Bot(Other.Controller) != none)
	{
		i = 0;
		J0x6A:

		// End:0xAA [Loop If]
		if(i < 5)
		{
			Stuff[i] = GetGroup(byte(i))[Rand(GetGroup(byte(i)).Length)];
			i++;
			// [Loop Continue]
			goto J0x6A;
		}
		ChangeLoadOut(Other, Stuff);
		i = 2;
		J0xC2:

		// End:0x1F4 [Loop If]
		if(i < 5)
		{
			// End:0x112
			if(Stuff[i] == "")
			{
				// End:0xF6
				if(i == 0)
				{
					i = 4;					
				}
				else
				{
					// End:0x108
					if(i == 3)
					{
						// [Explicit Break]
						goto J0x1F4;						
					}
					else
					{
						i--;
					}
				}				
			}
			else
			{
				// End:0x148
				if(Right(Stuff[i], 5) ~= "Dummy")
				{
					Stuff[i] = GetGroup(byte(i))[0];
				}
				W = Class<Weapon>(DynamicLoadObject(Stuff[i], Class'Core.Class'));
				// End:0x1A6
				if(W == none)
				{
					// End:0x18A
					if(i == 0)
					{
						i = 4;						
					}
					else
					{
						// End:0x19C
						if(i == 3)
						{
							// [Explicit Break]
							goto J0x1F4;							
						}
						else
						{
							i--;
						}
					}					
				}
				else
				{
					SpawnWeaponLayout(W, Other, 255, 255);
					// End:0x1D0
					if(i == 0)
					{
						i = 4;						
					}
					else
					{
						// End:0x1E2
						if(i == 3)
						{
							// [Explicit Break]
							goto J0x1F4;							
						}
						else
						{
							i--;
						}
					}
				}
			}
			i += 0;
			// [Loop Continue]
			goto J0xC2;
		}
		J0x1F4:
		
	}
	else
	{
		// End:0x285
		if((Other.Controller != none) && PlayerController(Other.Controller) != none)
		{
			i = 0;
			J0x22D:

			// End:0x285 [Loop If]
			if(i < COIPond.Length)
			{
				// End:0x27B
				if(COIPond[i].PC == Other.Controller)
				{
					COIPond[i].ClientStartLoadout();
					return;
				}
				i++;
				// [Loop Continue]
				goto J0x22D;
			}
		}
	}
	//return;	
}

function Mutate(string MutateString, PlayerController Sender)
{
	local int i, Count;
	local array<string> split_string;

	// End:0xAD
	if((MutateString ~= "Loadout") && Sender != none)
	{
		i = 0;
		J0x27:

		// End:0x76 [Loop If]
		if(i < COIPond.Length)
		{
			// End:0x6C
			if(COIPond[i].PC == Sender)
			{
				COIPond[i].ClientOpenLoadoutMenu();
				return;
			}
			i++;
			// [Loop Continue]
			goto J0x27;
		}
		COIPond[i] = Spawn(Class'BallisticProV55.ClientOutfittingInterface', Sender);
		COIPond[i].Initialize(self, Sender);		
	}
	else
	{
		Count = Split(MutateString, " ", split_string);
		// End:0xEC
		if(split_string[0] ~= "AddWeapon")
		{
			AddWeapon(Sender, split_string);			
		}
		else
		{
			// End:0x116
			if(split_string[0] ~= "RemoveWeapon")
			{
				RemoveWeapon(Sender, split_string);
			}
		}
	}
	super.Mutate(MutateString, Sender);
	//return;	
}

function AddWeapon(PlayerController Sender, array<string> split_string)
{
	local int i, loadout_group;
	local array<string> Weapons;
	local WeaponInfo WI;

	// End:0x7F
	if((int(Level.NetMode) != int(NM_Standalone)) && !Sender.PlayerReplicationInfo.bAdmin)
	{
		Sender.ClientMessage("Mutate AddWeapon: Administrator permissions required");
		return;
	}
	// End:0xF2
	if(split_string.Length != 3)
	{
		Sender.ClientMessage("Mutate AddWeapon: Usage: mutate addweapon <loadout_group_index> <weapon_class_name>");
		return;
	}
	WI = Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(split_string[2]);
	// End:0x168
	if(!WI.ClassName ~= split_string[2])
	{
		Sender.ClientMessage("Mutate AddWeapon: Weapon not found:" @ split_string[2]);
		return;
	}
	loadout_group = int(split_string[1]);
	// End:0x1C6
	if(loadout_group >= 5)
	{
		Sender.ClientMessage("Mutate AddWeapon: Invalid loadout group" @ string(loadout_group));
		return;
	}
	Weapons = SGetGroup(byte(loadout_group));
	i = 0;
	J0x1E0:

	// End:0x26F [Loop If]
	if(i < Weapons.Length)
	{
		// End:0x265
		if(Weapons[i] ~= WI.ClassName)
		{
			Sender.ClientMessage((("Mutate AddWeapon: Loadout group" @ string(loadout_group)) @ "already contains") @ WI.ClassName);
			return;
		}
		++i;
		// [Loop Continue]
		goto J0x1E0;
	}
	Weapons[Weapons.Length] = split_string[2];
	switch(loadout_group)
	{
		// End:0x2A6
		case 0:
			Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup0 = Weapons;
			// End:0x318
			break;
		// End:0x2C1
		case 1:
			Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup1 = Weapons;
			// End:0x318
			break;
		// End:0x2DD
		case 2:
			Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup2 = Weapons;
			// End:0x318
			break;
		// End:0x2F9
		case 3:
			Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup3 = Weapons;
			// End:0x318
			break;
		// End:0x315
		case 4:
			Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup4 = Weapons;
			// End:0x318
			break;
		// End:0xFFFF
		default:
			break;
	}
	Sender.ClientMessage((("Mutate AddWeapon: Success - added" @ WI.ClassName) @ "to loadout group") @ string(loadout_group));
	Class'BallisticProV55.Mut_Outfitting'.static.StaticSaveConfig();
	//return;	
}

function RemoveWeapon(PlayerController Sender, array<string> split_string)
{
	local bool success;
	local int i, loadout_group;
	local array<string> Weapons;

	success = false;
	// End:0x8A
	if((int(Level.NetMode) != int(NM_Standalone)) && !Sender.PlayerReplicationInfo.bAdmin)
	{
		Sender.ClientMessage("Mutate RemoveWeapon: Administrator permissions required");
		return;
	}
	// End:0x103
	if(split_string.Length != 3)
	{
		Sender.ClientMessage("Mutate RemoveWeapon: Usage: mutate removeweapon <loadout_group_index> <weapon_class_name>");
		return;
	}
	loadout_group = int(split_string[1]);
	// End:0x164
	if(loadout_group >= 5)
	{
		Sender.ClientMessage("Mutate RemoveWeapon: Invalid loadout group" @ string(loadout_group));
		return;
	}
	Weapons = SGetGroup(byte(loadout_group));
	i = 0;
	J0x17E:

	// End:0x1CB [Loop If]
	if(i < Weapons.Length)
	{
		// End:0x1C1
		if(Weapons[i] ~= split_string[2])
		{
			Weapons.Remove(i, 1);
			--i;
			success = true;
		}
		++i;
		// [Loop Continue]
		goto J0x17E;
	}
	// End:0x2DA
	if(success)
	{
		switch(loadout_group)
		{
			// End:0x1F6
			case 0:
				Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup0 = Weapons;
				// End:0x268
				break;
			// End:0x211
			case 1:
				Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup1 = Weapons;
				// End:0x268
				break;
			// End:0x22D
			case 2:
				Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup2 = Weapons;
				// End:0x268
				break;
			// End:0x249
			case 3:
				Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup3 = Weapons;
				// End:0x268
				break;
			// End:0x265
			case 4:
				Class'BallisticProV55.Mut_Outfitting'.default.LoadoutGroup4 = Weapons;
				// End:0x268
				break;
			// End:0xFFFF
			default:
				break;
		}
		Class'BallisticProV55.Mut_Outfitting'.static.StaticSaveConfig();
		Sender.ClientMessage((("Mutate RemoveWeapon: Success - removed" @ split_string[2]) @ "from loadout group") @ string(loadout_group));		
	}
	else
	{
		Sender.ClientMessage((("Mutate RemoveWeapon:" @ split_string[2]) @ "not found in loadout group") @ string(loadout_group));
	}
	//return;	
}

function ChangeLoadOut(Pawn P, out string Stuff[5], optional string OldStuff[5])
{
	local Inventory Inv;
	local int Count, i, j;
	local array<Inventory> BadInv;

	Inv = P.Inventory;
	J0x14:

	// End:0x12A [Loop If]
	if((Inv != none) && Count < 1000)
	{
		// End:0x10C
		if((Weapon(Inv) != none) && Translauncher(Inv) == none)
		{
			i = 0;
			J0x59:

			// End:0x10C [Loop If]
			if(i < 5)
			{
				// End:0x102
				if(OldStuff[i] ~= string(Inv.Class))
				{
					j = 0;
					J0x8C:

					// End:0xD3 [Loop If]
					if(j < 5)
					{
						// End:0xC9
						if(Stuff[j] ~= string(Inv.Class))
						{
							Stuff[j] = "";
							// [Explicit Break]
							goto J0xD3;
						}
						j++;
						// [Loop Continue]
						goto J0x8C;
					}
					J0xD3:

					// End:0xF1
					if(j >= 5)
					{
						BadInv[BadInv.Length] = Inv;
					}
					OldStuff[i] = "";
					// [Explicit Break]
					goto J0x10C;
				}
				i++;
				// [Loop Continue]
				goto J0x59;
			}
		}
		J0x10C:

		Count++;
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x14;
	}
	J0x12A:

	// End:0x15C [Loop If]
	if(BadInv.Length > 0)
	{
		// End:0x151
		if(BadInv[0] != none)
		{
			BadInv[0].Destroy();
		}
		BadInv.Remove(0, 1);
		// [Loop Continue]
		goto J0x12A;
	}
	//return;	
}

function OutfitPlayer(Pawn Other, string Stuff[5], optional string OldStuff[5], optional int Layouts[5], optional int Camos[5])
{
	local byte i, j, k, M;
	local bool bMatch;
	local Class<Weapon> W;

	// End:0x44
	if((Vehicle(Other) != none) && Vehicle(Other).Driver != none)
	{
		Other = Vehicle(Other).Driver;
	}
	i = 0;
	J0x4C:

	// End:0x27E [Loop If]
	if(int(i) < 5)
	{
		// End:0x1E2
		if((GetItemName(Stuff[int(i)])) ~= "RandomWeaponDummy")
		{
			j = 0;
			J0x8D:

			// End:0x1E2 [Loop If]
			if(int(j) < 10)
			{
				k = byte(Rand(GetGroup(i).Length - DummyGroups[int(i)].Positions.Length));
				M = 0;
				J0xCE:

				// End:0x126 [Loop If]
				if(int(M) < DummyGroups[int(i)].Positions.Length)
				{
					// End:0x11C
					if(int(k) == int(DummyGroups[int(i)].Positions[int(M)]))
					{
						k++;
					}
					M++;
					// [Loop Continue]
					goto J0xCE;
				}
				Stuff[int(i)] = GetGroup(i)[int(k)];
				bMatch = false;
				M = 0;
				J0x157:

				// End:0x19E [Loop If]
				if(int(M) < int(i))
				{
					// End:0x194
					if(Stuff[int(i)] ~= Stuff[int(M)])
					{
						bMatch = true;
						// [Explicit Break]
						goto J0x19E;
					}
					M++;
					// [Loop Continue]
					goto J0x157;
				}
				J0x19E:

				// End:0x1AF
				if(!bMatch)
				{
					// [Explicit Break]
					goto J0x1E2;
					// [Explicit Continue]
					goto J0x1D8;
				}
				// End:0x1D8
				if(int(j) == 9)
				{
					Stuff[int(i)] = GetGroup(i)[0];
				}
				J0x1D8:

				j++;
				// [Loop Continue]
				goto J0x8D;
			}
		}
		J0x1E2:

		j = 0;
		J0x1EA:

		// End:0x234 [Loop If]
		if(int(j) < GetGroup(i).Length)
		{
			// End:0x22A
			if(GetGroup(i)[int(j)] ~= Stuff[int(i)])
			{
				// [Explicit Break]
				goto J0x234;
			}
			j++;
			// [Loop Continue]
			goto J0x1EA;
		}
		J0x234:

		// End:0x274
		if(int(j) >= GetGroup(i).Length)
		{
			Stuff[int(i)] = GetGroup(i)[Rand(GetGroup(i).Length)];
		}
		i++;
		// [Loop Continue]
		goto J0x4C;
	}
	ChangeLoadOut(Other, Stuff, OldStuff);
	// End:0x2DD
	if(xPawn(Other) != none)
	{
		xPawn(Other).RequiredEquipment[0] = Stuff[1];
		xPawn(Other).RequiredEquipment[1] = Stuff[0];
	}
	i = 2;
	J0x2E5:

	// End:0x3D5 [Loop If]
	if(int(i) < 5)
	{
		// End:0x395
		if(Stuff[int(i)] != "")
		{
			W = Class<Weapon>(DynamicLoadObject(Stuff[int(i)], Class'Core.Class'));
			// End:0x36B
			if(W == none)
			{
				Log("Could not load outfitted weapon " $ Stuff[int(i)]);				
			}
			else
			{
				SpawnWeaponLayout(W, Other, Layouts[int(i)], Camos[int(i)]);
			}
		}
		// End:0x3AD
		if(int(i) == 0)
		{
			i = 4;			
		}
		else
		{
			// End:0x3C1
			if(int(i) == 3)
			{
				// [Explicit Break]
				goto J0x3D5;				
			}
			else
			{
				i--;
			}
		}
		i += byte(0);
		// [Loop Continue]
		goto J0x2E5;
	}
	J0x3D5:

	//return;	
}

static function Weapon SpawnWeapon(Class<Weapon> NewClass, Pawn P)
{
	local Weapon newWeapon;

	// End:0x1D2
	if((NewClass != none) && P != none)
	{
		newWeapon = Weapon(P.FindInventoryType(NewClass));
		// End:0x10B
		if((newWeapon == none) || BallisticHandgun(newWeapon) != none)
		{
			newWeapon = P.Spawn(NewClass,,, P.Location);
			// End:0x9A
			if(newWeapon != none)
			{
				newWeapon.GiveTo(P);
			}
			// End:0x102
			if(((Bot(P.Controller) != none) && P.Weapon == none) && P.PendingWeapon == none)
			{
				P.PendingWeapon = newWeapon;
				P.ChangedWeapon();
			}
			return newWeapon;			
		}
		else
		{
			newWeapon.AddAmmo(NewClass.default.AmmoClass[0].default.InitialAmount, 0);
			newWeapon.AddAmmo(NewClass.default.AmmoClass[1].default.InitialAmount, 1);
			// End:0x1D2
			if(BallisticWeapon(newWeapon) != none)
			{
				BallisticWeapon(newWeapon).MagAmmo = BallisticWeapon(newWeapon).default.MagAmmo;
				BallisticWeapon(newWeapon).bNeedReload = false;
				// End:0x1D2
				if(!P.IsLocallyControlled())
				{
					BallisticWeapon(newWeapon).ClientWeaponReloaded();
				}
			}
		}
	}
	return none;
	//return;	
}

static function Weapon SpawnWeaponLayout(Class<Weapon> NewClass, Pawn P, int LayoutIndex, int CamoIndex)
{
	local Weapon newWeapon;

	// End:0x218
	if((NewClass != none) && P != none)
	{
		newWeapon = Weapon(P.FindInventoryType(NewClass));
		// End:0x151
		if((newWeapon == none) || BallisticHandgun(newWeapon) != none)
		{
			newWeapon = P.Spawn(NewClass,,, P.Location);
			// End:0xE0
			if(newWeapon != none)
			{
				// End:0xCC
				if(BallisticWeapon(newWeapon) != none)
				{
					BallisticWeapon(newWeapon).GenerateLayout(byte(LayoutIndex));
					BallisticWeapon(newWeapon).GenerateCamo(byte(CamoIndex));
				}
				newWeapon.GiveTo(P);
			}
			// End:0x148
			if(((Bot(P.Controller) != none) && P.Weapon == none) && P.PendingWeapon == none)
			{
				P.PendingWeapon = newWeapon;
				P.ChangedWeapon();
			}
			return newWeapon;			
		}
		else
		{
			newWeapon.AddAmmo(NewClass.default.AmmoClass[0].default.InitialAmount, 0);
			newWeapon.AddAmmo(NewClass.default.AmmoClass[1].default.InitialAmount, 1);
			// End:0x218
			if(BallisticWeapon(newWeapon) != none)
			{
				BallisticWeapon(newWeapon).MagAmmo = BallisticWeapon(newWeapon).default.MagAmmo;
				BallisticWeapon(newWeapon).bNeedReload = false;
				// End:0x218
				if(!P.IsLocallyControlled())
				{
					BallisticWeapon(newWeapon).ClientWeaponReloaded();
				}
			}
		}
	}
	return none;
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

simulated event Timer()
{
	super.Timer();
	// End:0x13
	if(PCPendingCOI == none)
	{
		return;
	}
	COIPond[COIPond.Length] = Spawn(Class'BallisticProV55.ClientOutfittingInterface', PCPendingCOI);
	COIPond[COIPond.Length - 1].Initialize(self, PCPendingCOI);
	PCPendingCOI = none;
	//return;	
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	local int i, j;

	bSuperRelevant = 0;
	// End:0x45
	if(PlayerController(Other) != none)
	{
		// End:0x29
		if(PCPendingCOI != none)
		{
			Timer();
		}
		SetTimer(0.1000000, false);
		PCPendingCOI = PlayerController(Other);		
	}
	else
	{
		// End:0x8A
		if(xPawn(Other) != none)
		{
			xPawn(Other).RequiredEquipment[0] = "";
			xPawn(Other).RequiredEquipment[1] = "";
			return true;			
		}
		else
		{
			// End:0x13C
			if(((Weapon(Other) != none) && !Weapon(Other).bNoInstagibReplace) && Translauncher(Other) == none)
			{
				i = 0;
				J0xCE:

				// End:0x137 [Loop If]
				if(i < 7)
				{
					j = 0;
					J0xE1:

					// End:0x12D [Loop If]
					if(j < GetGroup(byte(i)).Length)
					{
						// End:0x123
						if(GetGroup(byte(i))[j] ~= string(Other.Class))
						{
							return true;
						}
						j++;
						// [Loop Continue]
						goto J0xE1;
					}
					i++;
					// [Loop Continue]
					goto J0xCE;
				}
				return false;				
			}
			else
			{
				// End:0x167
				if((WeaponPickup(Other) != none) && Other.Owner == none)
				{
					return false;					
				}
				else
				{
					// End:0x1AD
					if((Ammo(Other) != none) && IP_AmmoPack(Other) == none)
					{
						Pickup(Other).myMarker.bBlocked = true;
						return false;						
					}
					else
					{
						// End:0x20B
						if(WeaponLocker(Other) != none)
						{
							// End:0x208
							if(!SpawnNewItem(-1, Other, Class'BallisticProV55.IP_AmmoPack'))
							{
								WeaponLocker(Other).myMarker.bBlocked = true;
								Other.GotoState('Disabled');
								return false;
							}							
						}
						else
						{
							// End:0x23A
							if(xWeaponBase(Other) != none)
							{
								// End:0x237
								if(!SpawnNewItem(-1, Other, Class'BallisticProV55.IP_AmmoPack'))
								{
									return false;
								}								
							}
							else
							{
								// End:0x2C6
								if(xPickUpBase(Other) != none)
								{
									Other.bHidden = true;
									// End:0x293
									if(xPickUpBase(Other).myMarker != none)
									{
										xPickUpBase(Other).myMarker.bBlocked = true;
									}
									// End:0x2C6
									if(xPickUpBase(Other).myEmitter != none)
									{
										xPickUpBase(Other).myEmitter.Destroy();
									}
								}
							}
						}
					}
				}
			}
		}
	}
	return super.CheckReplacement(Other, bSuperRelevant);
	//return;	
}

defaultproperties
{
	LoadOut[0]="BallisticProV55.X3Knife"
	LoadOut[1]="BallisticProV55.M806Pistol"
	LoadOut[2]="BallisticProV55.M763Shotgun"
	LoadOut[3]="BallisticProV55.M50AssaultRifle"
	LoadOut[4]="BallisticProV55.NRP57Grenade"
	LoadoutGroup0[0]="BallisticProV55.X3Knife"
	LoadoutGroup0[1]="BallisticProV55.X4Knife"
	LoadoutGroup0[2]="BallisticProV55.A909SkrithBlades"
	LoadoutGroup0[3]="BallisticProV55.EKS43Katana"
	LoadoutGroup1[0]="BallisticProV55.A42SkrithPistol"
	LoadoutGroup1[1]="BallisticProV55.AM67Pistol"
	LoadoutGroup1[2]="BallisticProV55.BOGPPistol"
	LoadoutGroup1[3]="BallisticProV55.D49Revolver"
	LoadoutGroup1[4]="BallisticProV55.M806Pistol"
	LoadoutGroup1[5]="BallisticProV55.MD24Pistol"
	LoadoutGroup1[6]="BallisticProV55.MRT6Shotgun"
	LoadoutGroup1[7]="BallisticProV55.RS8Pistol"
	LoadoutGroup1[8]="BallisticProV55.leMatRevolver"
	LoadoutGroup2[0]="BallisticProV55.A500Reptile"
	LoadoutGroup2[1]="BallisticProV55.A73SkrithRifle"
	LoadoutGroup2[2]="BallisticProV55.E23PlasmaRifle"
	LoadoutGroup2[3]="BallisticProV55.Fifty9MachinePistol"
	LoadoutGroup2[4]="BallisticProV55.G5Bazooka"
	LoadoutGroup2[5]="BallisticProV55.GRS9Pistol"
	LoadoutGroup2[6]="BallisticProV55.HVCMk9LightningGun"
	LoadoutGroup2[7]="BallisticProV55.M290Shotgun"
	LoadoutGroup2[8]="BallisticProV55.M353Machinegun"
	LoadoutGroup2[9]="BallisticProV55.M46AssaultRifle"
	LoadoutGroup2[10]="BallisticProV55.M50AssaultRifle"
	LoadoutGroup2[11]="BallisticProV55.M75Railgun"
	LoadoutGroup2[12]="BallisticProV55.M763Shotgun"
	LoadoutGroup2[13]="BallisticProV55.M925Machinegun"
	LoadoutGroup2[14]="BallisticProV55.MACWeapon"
	LoadoutGroup2[15]="BallisticProV55.MRS138Shotgun"
	LoadoutGroup2[16]="BallisticProV55.MRocketLauncher"
	LoadoutGroup2[17]="BallisticProV55.MarlinRifle"
	LoadoutGroup2[18]="BallisticProV55.R78Rifle"
	LoadoutGroup2[19]="BallisticProV55.RSDarkStar"
	LoadoutGroup2[20]="BallisticProV55.RSNovaStaff"
	LoadoutGroup2[21]="BallisticProV55.RX22AFlamer"
	LoadoutGroup2[22]="BallisticProV55.SARAssaultRifle"
	LoadoutGroup2[23]="BallisticProV55.SRS900Rifle"
	LoadoutGroup2[24]="BallisticProV55.XK2SubMachinegun"
	LoadoutGroup2[25]="BallisticProV55.XMK5SubMachinegun"
	LoadoutGroup2[26]="BallisticProV55.XMV850Minigun"
	LoadoutGroup2[27]="BallisticProV55.XRS10SubMachinegun"
	LoadoutGroup3[0]="BallisticProV55.A500Reptile"
	LoadoutGroup3[1]="BallisticProV55.A73SkrithRifle"
	LoadoutGroup3[2]="BallisticProV55.E23PlasmaRifle"
	LoadoutGroup3[3]="BallisticProV55.Fifty9MachinePistol"
	LoadoutGroup3[4]="BallisticProV55.G5Bazooka"
	LoadoutGroup3[5]="BallisticProV55.GRS9Pistol"
	LoadoutGroup3[6]="BallisticProV55.HVCMk9LightningGun"
	LoadoutGroup3[7]="BallisticProV55.M290Shotgun"
	LoadoutGroup3[8]="BallisticProV55.M353Machinegun"
	LoadoutGroup3[9]="BallisticProV55.M46AssaultRifle"
	LoadoutGroup3[10]="BallisticProV55.M50AssaultRifle"
	LoadoutGroup3[11]="BallisticProV55.M75Railgun"
	LoadoutGroup3[12]="BallisticProV55.M763Shotgun"
	LoadoutGroup3[13]="BallisticProV55.M925Machinegun"
	LoadoutGroup3[14]="BallisticProV55.MACWeapon"
	LoadoutGroup3[15]="BallisticProV55.MRS138Shotgun"
	LoadoutGroup3[16]="BallisticProV55.MRocketLauncher"
	LoadoutGroup3[17]="BallisticProV55.MarlinRifle"
	LoadoutGroup3[18]="BallisticProV55.R78Rifle"
	LoadoutGroup3[19]="BallisticProV55.RSDarkStar"
	LoadoutGroup3[20]="BallisticProV55.RSNovaStaff"
	LoadoutGroup3[21]="BallisticProV55.RX22AFlamer"
	LoadoutGroup3[22]="BallisticProV55.SARAssaultRifle"
	LoadoutGroup3[23]="BallisticProV55.SRS900Rifle"
	LoadoutGroup3[24]="BallisticProV55.XK2SubMachinegun"
	LoadoutGroup3[25]="BallisticProV55.XMK5SubMachinegun"
	LoadoutGroup3[26]="BallisticProV55.XMV850Minigun"
	LoadoutGroup3[27]="BallisticProV55.XRS10SubMachinegun"
	LoadoutGroup4[0]="BallisticProV55.FP7Grenade"
	LoadoutGroup4[1]=""
	LoadoutGroup4[2]="BallisticProV55.FP9Explosive"
	LoadoutGroup4[3]="BallisticProV55.M58Grenade"
	LoadoutGroup4[4]="BallisticProV55.NRP57Grenade"
	LoadoutGroup4[5]="BallisticProV55.SandbagLayer"
	LoadoutGroup4[6]="BallisticProV55.T10Grenade"
	bHideLockers=true
	FriendlyName="BallisticPro: Loadout"
	Description="Play Ballistic Weapons, but instead of picking up weapons, you can choose five to start with, Melee, Sidearm, Primary, Secondary and Grenade. Ammo Packs replace weapon pickups and extra weapons can be taken from your enemies.||http://www.runestorm.com"
}
