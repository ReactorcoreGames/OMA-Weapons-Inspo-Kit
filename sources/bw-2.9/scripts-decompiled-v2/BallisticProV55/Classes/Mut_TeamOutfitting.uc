class Mut_TeamOutfitting extends Mut_Ballistic
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const NUM_GROUPS = 10;

struct dummypos
{
	var array<byte> Positions;
};

var() globalconfig string LoadOut[5];
var() globalconfig int Layout[5];
var() globalconfig int Camo[5];
var array<ClientTeamOutfittingInterface> COIPond;
var PlayerController PCPendingCOI;
var() globalconfig array<string> RedLoadoutGroup0;
var() globalconfig array<string> RedLoadoutGroup1;
var() globalconfig array<string> RedLoadoutGroup2;
var() globalconfig array<string> RedLoadoutGroup3;
var() globalconfig array<string> RedLoadoutGroup4;
var() globalconfig array<string> RedLoadoutGroup5;
var() globalconfig array<string> RedLoadoutGroup6;
var() globalconfig array<string> BlueLoadoutGroup0;
var() globalconfig array<string> BlueLoadoutGroup1;
var() globalconfig array<string> BlueLoadoutGroup2;
var() globalconfig array<string> BlueLoadoutGroup3;
var() globalconfig array<string> BlueLoadoutGroup4;
var() globalconfig array<string> BlueLoadoutGroup5;
var() globalconfig array<string> BlueLoadoutGroup6;
var() globalconfig bool bAllowAllWeaponry;
var() dummypos DummyGroups[10];
var Class<Weapon> NetLoadout0;
var Class<Weapon> NetLoadout1;
var Class<Weapon> NetLoadout2;
var Class<Weapon> NetLoadout3;
var Class<Weapon> NetLoadout4;
var Class<Weapon> NetLoadout5;
var Class<Weapon> NetLoadoutWeapons[255];
var byte NetRedLoadoutGroups;

function BeginPlay()
{
	local byte i, j, k;
	local Class<BC_GameStyle> game_style;
	local WeaponList_Killstreak streaks;

	super.BeginPlay();
	i = 0;
	J0x0E:

	// End:0xCD [Loop If]
	if(int(i) < (10 / 2))
	{
		j = 0;
		J0x28:

		// End:0xC3 [Loop If]
		if(int(j) < 2)
		{
			k = 0;
			J0x3E:

			// End:0xB9 [Loop If]
			if(int(k) < GetGroup(i, j).Length)
			{
				// End:0xAF
				if(Right(GetGroup(i, j)[int(k)], 5) ~= "Dummy")
				{
					DummyGroups[int(i)].Positions[DummyGroups[int(i)].Positions.Length] = k;
				}
				k++;
				// [Loop Continue]
				goto J0x3E;
			}
			j++;
			// [Loop Continue]
			goto J0x28;
		}
		i++;
		// [Loop Continue]
		goto J0x0E;
	}
	game_style = Class'BCoreProV55.BallisticGameStyles'.static.GetReplicatedStyle();
	Log("Loading killstreak weapon list from " $ game_style.default.StyleName);
	streaks = new (none, game_style.default.StyleName) Class'BallisticProV55.WeaponList_Killstreak';
	RedLoadoutGroup5.Length = streaks.Streak1s.Length;
	RedLoadoutGroup6.Length = streaks.Streak2s.Length;
	BlueLoadoutGroup5.Length = streaks.Streak1s.Length;
	BlueLoadoutGroup6.Length = streaks.Streak2s.Length;
	i = 0;
	J0x196:

	// End:0x203 [Loop If]
	if(int(i) < streaks.Streak1s.Length)
	{
		RedLoadoutGroup5[int(i)] = streaks.Streak1s[int(i)];
		BlueLoadoutGroup5[int(i)] = streaks.Streak1s[int(i)];
		++i;
		// [Loop Continue]
		goto J0x196;
	}
	i = 0;
	J0x20B:

	// End:0x278 [Loop If]
	if(int(i) < streaks.Streak2s.Length)
	{
		RedLoadoutGroup6[int(i)] = streaks.Streak2s[int(i)];
		BlueLoadoutGroup6[int(i)] = streaks.Streak2s[int(i)];
		++i;
		// [Loop Continue]
		goto J0x20B;
	}
	//return;	
}

simulated function string GetGroupItem(byte GroupNum, int ItemNum, byte InTeam)
{
	// End:0x91
	if(int(InTeam) == 1)
	{
		switch(GroupNum)
		{
			// End:0x25
			case 0:
				return BlueLoadoutGroup0[ItemNum];
			// End:0x36
			case 1:
				return BlueLoadoutGroup1[ItemNum];
			// End:0x47
			case 2:
				return BlueLoadoutGroup2[ItemNum];
			// End:0x58
			case 3:
				return BlueLoadoutGroup3[ItemNum];
			// End:0x69
			case 4:
				return BlueLoadoutGroup4[ItemNum];
			// End:0x7A
			case 3:
				return BlueLoadoutGroup5[ItemNum];
			// End:0x8B
			case 4:
				return BlueLoadoutGroup6[ItemNum];
			// End:0xFFFF
			default:
				// End:0x112
				break;
				break;
		}
	}
	switch(GroupNum)
	{
		// End:0xA9
		case 0:
			return RedLoadoutGroup0[ItemNum];
		// End:0xBA
		case 1:
			return RedLoadoutGroup1[ItemNum];
		// End:0xCB
		case 2:
			return RedLoadoutGroup2[ItemNum];
		// End:0xDC
		case 3:
			return RedLoadoutGroup3[ItemNum];
		// End:0xED
		case 4:
			return RedLoadoutGroup4[ItemNum];
		// End:0xFE
		case 3:
			return RedLoadoutGroup5[ItemNum];
		// End:0x10F
		case 4:
			return RedLoadoutGroup6[ItemNum];
		// End:0xFFFF
		default:
			//return;
			break;
	}	
}

simulated function array<string> GetGroup(byte GroupNum, byte InTeam)
{
	// End:0x67
	if(int(InTeam) == 1)
	{
		switch(GroupNum)
		{
			// End:0x1F
			case 0:
				return BlueLoadoutGroup0;
			// End:0x2A
			case 1:
				return BlueLoadoutGroup1;
			// End:0x35
			case 2:
				return BlueLoadoutGroup2;
			// End:0x40
			case 3:
				return BlueLoadoutGroup3;
			// End:0x4B
			case 4:
				return BlueLoadoutGroup4;
			// End:0x56
			case 5:
				return BlueLoadoutGroup5;
			// End:0x61
			case 6:
				return BlueLoadoutGroup6;
			// End:0xFFFF
			default:
				// End:0xBE
				break;
				break;
		}
	}
	switch(GroupNum)
	{
		// End:0x79
		case 0:
			return RedLoadoutGroup0;
		// End:0x84
		case 1:
			return RedLoadoutGroup1;
		// End:0x8F
		case 2:
			return RedLoadoutGroup2;
		// End:0x9A
		case 3:
			return RedLoadoutGroup3;
		// End:0xA5
		case 4:
			return RedLoadoutGroup4;
		// End:0xB0
		case 5:
			return RedLoadoutGroup5;
		// End:0xBB
		case 6:
			return RedLoadoutGroup6;
		// End:0xFFFF
		default:
			//return;
			break;
	}	
}

static function array<string> SGetGroup(byte GroupNum, byte InTeam)
{
	// End:0x67
	if(int(InTeam) == 1)
	{
		switch(GroupNum)
		{
			// End:0x1F
			case 0:
				return default.BlueLoadoutGroup0;
			// End:0x2A
			case 1:
				return default.BlueLoadoutGroup1;
			// End:0x35
			case 2:
				return default.BlueLoadoutGroup2;
			// End:0x40
			case 3:
				return default.BlueLoadoutGroup3;
			// End:0x4B
			case 4:
				return default.BlueLoadoutGroup4;
			// End:0x56
			case 5:
				return default.BlueLoadoutGroup5;
			// End:0x61
			case 6:
				return default.BlueLoadoutGroup6;
			// End:0xFFFF
			default:
				// End:0xBE
				break;
				break;
		}
	}
	switch(GroupNum)
	{
		// End:0x79
		case 0:
			return default.RedLoadoutGroup0;
		// End:0x84
		case 1:
			return default.RedLoadoutGroup1;
		// End:0x8F
		case 2:
			return default.RedLoadoutGroup2;
		// End:0x9A
		case 3:
			return default.RedLoadoutGroup3;
		// End:0xA5
		case 4:
			return default.RedLoadoutGroup4;
		// End:0xB0
		case 5:
			return default.RedLoadoutGroup5;
		// End:0xBB
		case 6:
			return default.RedLoadoutGroup6;
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
	// End:0x22A
	if((Other.Controller != none) && Bot(Other.Controller) != none)
	{
		i = 0;
		J0x6A:

		// End:0xCC [Loop If]
		if(i < 5)
		{
			Stuff[i] = GetGroup(byte(i), byte(Other.GetTeamNum()))[Rand(GetGroup(byte(i), byte(Other.GetTeamNum())).Length)];
			i++;
			// [Loop Continue]
			goto J0x6A;
		}
		ChangeLoadOut(Other, Stuff);
		i = 2;
		J0xE4:

		// End:0x227 [Loop If]
		if(i < 5)
		{
			// End:0x134
			if(Stuff[i] == "")
			{
				// End:0x118
				if(i == 0)
				{
					i = 4;					
				}
				else
				{
					// End:0x12A
					if(i == 3)
					{
						// [Explicit Break]
						goto J0x227;						
					}
					else
					{
						i--;
					}
				}				
			}
			else
			{
				// End:0x17B
				if(Right(Stuff[i], 5) ~= "Dummy")
				{
					Stuff[i] = GetGroup(byte(i), byte(Other.GetTeamNum()))[0];
				}
				W = Class<Weapon>(DynamicLoadObject(Stuff[i], Class'Core.Class'));
				// End:0x1D9
				if(W == none)
				{
					// End:0x1BD
					if(i == 0)
					{
						i = 4;						
					}
					else
					{
						// End:0x1CF
						if(i == 3)
						{
							// [Explicit Break]
							goto J0x227;							
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
					// End:0x203
					if(i == 0)
					{
						i = 4;						
					}
					else
					{
						// End:0x215
						if(i == 3)
						{
							// [Explicit Break]
							goto J0x227;							
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
			goto J0xE4;
		}
		J0x227:
		
	}
	else
	{
		// End:0x2B8
		if((Other.Controller != none) && PlayerController(Other.Controller) != none)
		{
			i = 0;
			J0x260:

			// End:0x2B8 [Loop If]
			if(i < COIPond.Length)
			{
				// End:0x2AE
				if(COIPond[i].PC == Other.Controller)
				{
					COIPond[i].ClientStartLoadout();
					return;
				}
				i++;
				// [Loop Continue]
				goto J0x260;
			}
		}
	}
	//return;	
}

function Mutate(string MutateString, PlayerController Sender)
{
	local int i;

	// End:0xAA
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
		COIPond[i] = Spawn(Class'BallisticProV55.ClientTeamOutfittingInterface', Sender);
		COIPond[i].Initialize(self, Sender);
	}
	super.Mutate(MutateString, Sender);
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

	// End:0x31F [Loop If]
	if(int(i) < 5)
	{
		// End:0x22E
		if((GetItemName(Stuff[int(i)])) ~= "RandomWeaponDummy")
		{
			j = 0;
			J0x8D:

			// End:0x22E [Loop If]
			if(int(j) < 10)
			{
				k = byte(Rand(GetGroup(i, byte(Other.GetTeamNum())).Length - DummyGroups[int(i) + (Other.GetTeamNum() * (10 / 2))].Positions.Length));
				M = 0;
				J0xF8:

				// End:0x150 [Loop If]
				if(int(M) < DummyGroups[int(i)].Positions.Length)
				{
					// End:0x146
					if(int(k) == int(DummyGroups[int(i)].Positions[int(M)]))
					{
						k++;
					}
					M++;
					// [Loop Continue]
					goto J0xF8;
				}
				Stuff[int(i)] = GetGroup(i, byte(Other.GetTeamNum()))[int(k)];
				bMatch = false;
				M = 0;
				J0x192:

				// End:0x1D9 [Loop If]
				if(int(M) < int(i))
				{
					// End:0x1CF
					if(Stuff[int(i)] ~= Stuff[int(M)])
					{
						bMatch = true;
						// [Explicit Break]
						goto J0x1D9;
					}
					M++;
					// [Loop Continue]
					goto J0x192;
				}
				J0x1D9:

				// End:0x1EA
				if(!bMatch)
				{
					// [Explicit Break]
					goto J0x22E;
					// [Explicit Continue]
					goto J0x224;
				}
				// End:0x224
				if(int(j) == 9)
				{
					Stuff[int(i)] = GetGroup(i, byte(Other.GetTeamNum()))[0];
				}
				J0x224:

				j++;
				// [Loop Continue]
				goto J0x8D;
			}
		}
		J0x22E:

		j = 0;
		J0x236:

		// End:0x2A2 [Loop If]
		if(int(j) < GetGroup(i, byte(Other.GetTeamNum())).Length)
		{
			// End:0x298
			if(GetGroup(i, byte(Other.GetTeamNum()))[int(j)] ~= Stuff[int(i)])
			{
				// [Explicit Break]
				goto J0x2A2;
			}
			j++;
			// [Loop Continue]
			goto J0x236;
		}
		J0x2A2:

		// End:0x315
		if(int(j) >= GetGroup(i, byte(Other.GetTeamNum())).Length)
		{
			Stuff[int(i)] = GetGroup(i, byte(Other.GetTeamNum()))[Rand(GetGroup(i, byte(Other.GetTeamNum())).Length)];
		}
		i++;
		// [Loop Continue]
		goto J0x4C;
	}
	ChangeLoadOut(Other, Stuff, OldStuff);
	// End:0x37E
	if(xPawn(Other) != none)
	{
		xPawn(Other).RequiredEquipment[0] = Stuff[1];
		xPawn(Other).RequiredEquipment[1] = Stuff[0];
	}
	i = 2;
	J0x386:

	// End:0x476 [Loop If]
	if(int(i) < 5)
	{
		// End:0x436
		if(Stuff[int(i)] != "")
		{
			W = Class<Weapon>(DynamicLoadObject(Stuff[int(i)], Class'Core.Class'));
			// End:0x40C
			if(W == none)
			{
				Log("Could not load outfitted weapon " $ Stuff[int(i)]);				
			}
			else
			{
				SpawnWeaponLayout(W, Other, Layouts[int(i)], Camos[int(i)]);
			}
		}
		// End:0x44E
		if(int(i) == 0)
		{
			i = 4;			
		}
		else
		{
			// End:0x462
			if(int(i) == 3)
			{
				// [Explicit Break]
				goto J0x476;				
			}
			else
			{
				i--;
			}
		}
		i += byte(0);
		// [Loop Continue]
		goto J0x386;
	}
	J0x476:

	//return;	
}

static function Weapon SpawnWeapon(Class<Weapon> NewClass, Pawn P)
{
	local Weapon newWeapon;

	// End:0xFF
	if((NewClass != none) && P != none)
	{
		newWeapon = Weapon(P.FindInventoryType(NewClass));
		// End:0xF0
		if((newWeapon == none) || BallisticHandgun(newWeapon) != none)
		{
			newWeapon = P.Spawn(NewClass,,, P.Location);
			// End:0x9A
			if(newWeapon != none)
			{
				newWeapon.GiveTo(P);
			}
			// End:0xE7
			if((P.Weapon == none) && P.PendingWeapon == none)
			{
				P.PendingWeapon = newWeapon;
				P.ChangedWeapon();
			}
			return newWeapon;			
		}
		else
		{
			newWeapon.MaxOutAmmo();
		}
	}
	return none;
	//return;	
}

static function Weapon SpawnWeaponLayout(Class<Weapon> NewClass, Pawn P, int LayoutIndex, int CamoIndex)
{
	local Weapon newWeapon;

	// End:0x145
	if((NewClass != none) && P != none)
	{
		newWeapon = Weapon(P.FindInventoryType(NewClass));
		// End:0x136
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
			// End:0x12D
			if((P.Weapon == none) && P.PendingWeapon == none)
			{
				P.PendingWeapon = newWeapon;
				P.ChangedWeapon();
			}
			return newWeapon;			
		}
		else
		{
			newWeapon.MaxOutAmmo();
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
	COIPond[COIPond.Length] = Spawn(Class'BallisticProV55.ClientTeamOutfittingInterface', PCPendingCOI);
	COIPond[COIPond.Length - 1].Initialize(self, PCPendingCOI);
	PCPendingCOI = none;
	//return;	
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	local int i, j, k;

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
			// End:0x167
			if(((Weapon(Other) != none) && !Weapon(Other).bNoInstagibReplace) && Translauncher(Other) == none)
			{
				i = 0;
				J0xCE:

				// End:0x162 [Loop If]
				if(i < 8)
				{
					j = 0;
					J0xE1:

					// End:0x158 [Loop If]
					if(j < 2)
					{
						k = 0;
						J0xF4:

						// End:0x14E [Loop If]
						if(k < GetGroup(byte(i), byte(j)).Length)
						{
							// End:0x144
							if(GetGroup(byte(i), byte(j))[k] ~= string(Other.Class))
							{
								return true;
							}
							k++;
							// [Loop Continue]
							goto J0xF4;
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
				// End:0x192
				if((WeaponPickup(Other) != none) && Other.Owner == none)
				{
					return false;					
				}
				else
				{
					// End:0x1F1
					if((Ammo(Other) != none) && IP_AmmoPack(Other) == none)
					{
						// End:0x1EC
						if(Pickup(Other).myMarker != none)
						{
							Pickup(Other).myMarker.bBlocked = true;
						}
						return false;						
					}
					else
					{
						// End:0x268
						if(WeaponLocker(Other) != none)
						{
							// End:0x265
							if(!SpawnNewItem(-1, Other, Class'BallisticProV55.IP_AmmoPack'))
							{
								// End:0x253
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
							// End:0x297
							if(xWeaponBase(Other) != none)
							{
								// End:0x294
								if(!SpawnNewItem(-1, Other, Class'BallisticProV55.IP_AmmoPack'))
								{
									return false;
								}								
							}
							else
							{
								// End:0x323
								if(xPickUpBase(Other) != none)
								{
									Other.bHidden = true;
									// End:0x2F0
									if(xPickUpBase(Other).myMarker != none)
									{
										xPickUpBase(Other).myMarker.bBlocked = true;
									}
									// End:0x323
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

function bool MutatorIsAllowed()
{
	return Level.Game.bTeamGame;
	//return;	
}

defaultproperties
{
	LoadOut[0]="BallisticProV55.X3Knife"
	LoadOut[1]="BallisticProV55.M806Pistol"
	LoadOut[2]="BallisticProV55.M763Shotgun"
	LoadOut[3]="BallisticProV55.M50AssaultRifle"
	LoadOut[4]="BallisticProV55.NRP57Grenade"
	RedLoadoutGroup0[0]="BallisticProV55.X3Knife"
	RedLoadoutGroup0[1]="BallisticProV55.X4Knife"
	RedLoadoutGroup0[2]="BallisticProV55.A909SkrithBlades"
	RedLoadoutGroup0[3]="BallisticProV55.EKS43Katana"
	RedLoadoutGroup1[0]="BallisticProV55.A42SkrithPistol"
	RedLoadoutGroup1[1]="BallisticProV55.AM67Pistol"
	RedLoadoutGroup1[2]="BallisticProV55.BOGPPistol"
	RedLoadoutGroup1[3]="BallisticProV55.D49Revolver"
	RedLoadoutGroup1[4]="BallisticProV55.M806Pistol"
	RedLoadoutGroup1[5]="BallisticProV55.MD24Pistol"
	RedLoadoutGroup1[6]="BallisticProV55.MRT6Shotgun"
	RedLoadoutGroup1[7]="BallisticProV55.RS8Pistol"
	RedLoadoutGroup1[8]="BallisticProV55.leMatRevolver"
	RedLoadoutGroup2[0]="BallisticProV55.A500Reptile"
	RedLoadoutGroup2[1]="BallisticProV55.A73SkrithRifle"
	RedLoadoutGroup2[2]="BallisticProV55.E23PlasmaRifle"
	RedLoadoutGroup2[3]="BallisticProV55.Fifty9MachinePistol"
	RedLoadoutGroup2[4]="BallisticProV55.G5Bazooka"
	RedLoadoutGroup2[5]="BallisticProV55.GRS9Pistol"
	RedLoadoutGroup2[6]="BallisticProV55.HVCMk9LightningGun"
	RedLoadoutGroup2[7]="BallisticProV55.M290Shotgun"
	RedLoadoutGroup2[8]="BallisticProV55.M353Machinegun"
	RedLoadoutGroup2[9]="BallisticProV55.M46AssaultRifle"
	RedLoadoutGroup2[10]="BallisticProV55.M50AssaultRifle"
	RedLoadoutGroup2[11]="BallisticProV55.M75Railgun"
	RedLoadoutGroup2[12]="BallisticProV55.M763Shotgun"
	RedLoadoutGroup2[13]="BallisticProV55.M925Machinegun"
	RedLoadoutGroup2[14]="BallisticProV55.MACWeapon"
	RedLoadoutGroup2[15]="BallisticProV55.MRS138Shotgun"
	RedLoadoutGroup2[16]="BallisticProV55.MRocketLauncher"
	RedLoadoutGroup2[17]="BallisticProV55.MarlinRifle"
	RedLoadoutGroup2[18]="BallisticProV55.R78Rifle"
	RedLoadoutGroup2[19]="BallisticProV55.RSDarkStar"
	RedLoadoutGroup2[20]="BallisticProV55.RSNovaStaff"
	RedLoadoutGroup2[21]="BallisticProV55.RX22AFlamer"
	RedLoadoutGroup2[22]="BallisticProV55.SARAssaultRifle"
	RedLoadoutGroup2[23]="BallisticProV55.SRS900Rifle"
	RedLoadoutGroup2[24]="BallisticProV55.XK2SubMachinegun"
	RedLoadoutGroup2[25]="BallisticProV55.XMK5SubMachinegun"
	RedLoadoutGroup2[26]="BallisticProV55.XMV850Minigun"
	RedLoadoutGroup2[27]="BallisticProV55.XRS10SubMachinegun"
	RedLoadoutGroup3[0]="BallisticProV55.A500Reptile"
	RedLoadoutGroup3[1]="BallisticProV55.A73SkrithRifle"
	RedLoadoutGroup3[2]="BallisticProV55.E23PlasmaRifle"
	RedLoadoutGroup3[3]="BallisticProV55.Fifty9MachinePistol"
	RedLoadoutGroup3[4]="BallisticProV55.G5Bazooka"
	RedLoadoutGroup3[5]="BallisticProV55.GRS9Pistol"
	RedLoadoutGroup3[6]="BallisticProV55.HVCMk9LightningGun"
	RedLoadoutGroup3[7]="BallisticProV55.M290Shotgun"
	RedLoadoutGroup3[8]="BallisticProV55.M353Machinegun"
	RedLoadoutGroup3[9]="BallisticProV55.M46AssaultRifle"
	RedLoadoutGroup3[10]="BallisticProV55.M50AssaultRifle"
	RedLoadoutGroup3[11]="BallisticProV55.M75Railgun"
	RedLoadoutGroup3[12]="BallisticProV55.M763Shotgun"
	RedLoadoutGroup3[13]="BallisticProV55.M925Machinegun"
	RedLoadoutGroup3[14]="BallisticProV55.MACWeapon"
	RedLoadoutGroup3[15]="BallisticProV55.MRS138Shotgun"
	RedLoadoutGroup3[16]="BallisticProV55.MRocketLauncher"
	RedLoadoutGroup3[17]="BallisticProV55.MarlinRifle"
	RedLoadoutGroup3[18]="BallisticProV55.R78Rifle"
	RedLoadoutGroup3[19]="BallisticProV55.RSDarkStar"
	RedLoadoutGroup3[20]="BallisticProV55.RSNovaStaff"
	RedLoadoutGroup3[21]="BallisticProV55.RX22AFlamer"
	RedLoadoutGroup3[22]="BallisticProV55.SARAssaultRifle"
	RedLoadoutGroup3[23]="BallisticProV55.SRS900Rifle"
	RedLoadoutGroup3[24]="BallisticProV55.XK2SubMachinegun"
	RedLoadoutGroup3[25]="BallisticProV55.XMK5SubMachinegun"
	RedLoadoutGroup3[26]="BallisticProV55.XMV850Minigun"
	RedLoadoutGroup3[27]="BallisticProV55.XRS10SubMachinegun"
	RedLoadoutGroup4[0]="BallisticProV55.FP7Grenade"
	RedLoadoutGroup4[1]=""
	RedLoadoutGroup4[2]="BallisticProV55.FP9Explosive"
	RedLoadoutGroup4[3]="BallisticProV55.M58Grenade"
	RedLoadoutGroup4[4]="BallisticProV55.NRP57Grenade"
	RedLoadoutGroup4[5]="BallisticProV55.SandbagLayer"
	RedLoadoutGroup4[6]="BallisticProV55.T10Grenade"
	BlueLoadoutGroup0[0]="BallisticProV55.X3Knife"
	BlueLoadoutGroup0[1]="BallisticProV55.X4Knife"
	BlueLoadoutGroup0[2]="BallisticProV55.A909SkrithBlades"
	BlueLoadoutGroup0[3]="BallisticProV55.EKS43Katana"
	BlueLoadoutGroup1[0]="BallisticProV55.A42SkrithPistol"
	BlueLoadoutGroup1[1]="BallisticProV55.AM67Pistol"
	BlueLoadoutGroup1[2]="BallisticProV55.BOGPPistol"
	BlueLoadoutGroup1[3]="BallisticProV55.D49Revolver"
	BlueLoadoutGroup1[4]="BallisticProV55.M806Pistol"
	BlueLoadoutGroup1[5]="BallisticProV55.MD24Pistol"
	BlueLoadoutGroup1[6]="BallisticProV55.MRT6Shotgun"
	BlueLoadoutGroup1[7]="BallisticProV55.RS8Pistol"
	BlueLoadoutGroup1[8]="BallisticProV55.leMatRevolver"
	BlueLoadoutGroup2[0]="BallisticProV55.A500Reptile"
	BlueLoadoutGroup2[1]="BallisticProV55.A73SkrithRifle"
	BlueLoadoutGroup2[2]="BallisticProV55.E23PlasmaRifle"
	BlueLoadoutGroup2[3]="BallisticProV55.Fifty9MachinePistol"
	BlueLoadoutGroup2[4]="BallisticProV55.G5Bazooka"
	BlueLoadoutGroup2[5]="BallisticProV55.GRS9Pistol"
	BlueLoadoutGroup2[6]="BallisticProV55.HVCMk9LightningGun"
	BlueLoadoutGroup2[7]="BallisticProV55.M290Shotgun"
	BlueLoadoutGroup2[8]="BallisticProV55.M353Machinegun"
	BlueLoadoutGroup2[9]="BallisticProV55.M46AssaultRifle"
	BlueLoadoutGroup2[10]="BallisticProV55.M50AssaultRifle"
	BlueLoadoutGroup2[11]="BallisticProV55.M75Railgun"
	BlueLoadoutGroup2[12]="BallisticProV55.M763Shotgun"
	BlueLoadoutGroup2[13]="BallisticProV55.M925Machinegun"
	BlueLoadoutGroup2[14]="BallisticProV55.MACWeapon"
	BlueLoadoutGroup2[15]="BallisticProV55.MRS138Shotgun"
	BlueLoadoutGroup2[16]="BallisticProV55.MRocketLauncher"
	BlueLoadoutGroup2[17]="BallisticProV55.MarlinRifle"
	BlueLoadoutGroup2[18]="BallisticProV55.R78Rifle"
	BlueLoadoutGroup2[19]="BallisticProV55.RSDarkStar"
	BlueLoadoutGroup2[20]="BallisticProV55.RSNovaStaff"
	BlueLoadoutGroup2[21]="BallisticProV55.RX22AFlamer"
	BlueLoadoutGroup2[22]="BallisticProV55.SARAssaultRifle"
	BlueLoadoutGroup2[23]="BallisticProV55.SRS900Rifle"
	BlueLoadoutGroup2[24]="BallisticProV55.XK2SubMachinegun"
	BlueLoadoutGroup2[25]="BallisticProV55.XMK5SubMachinegun"
	BlueLoadoutGroup2[26]="BallisticProV55.XMV850Minigun"
	BlueLoadoutGroup2[27]="BallisticProV55.XRS10SubMachinegun"
	BlueLoadoutGroup3[0]="BallisticProV55.A500Reptile"
	BlueLoadoutGroup3[1]="BallisticProV55.A73SkrithRifle"
	BlueLoadoutGroup3[2]="BallisticProV55.E23PlasmaRifle"
	BlueLoadoutGroup3[3]="BallisticProV55.Fifty9MachinePistol"
	BlueLoadoutGroup3[4]="BallisticProV55.G5Bazooka"
	BlueLoadoutGroup3[5]="BallisticProV55.GRS9Pistol"
	BlueLoadoutGroup3[6]="BallisticProV55.HVCMk9LightningGun"
	BlueLoadoutGroup3[7]="BallisticProV55.M290Shotgun"
	BlueLoadoutGroup3[8]="BallisticProV55.M353Machinegun"
	BlueLoadoutGroup3[9]="BallisticProV55.M46AssaultRifle"
	BlueLoadoutGroup3[10]="BallisticProV55.M50AssaultRifle"
	BlueLoadoutGroup3[11]="BallisticProV55.M75Railgun"
	BlueLoadoutGroup3[12]="BallisticProV55.M763Shotgun"
	BlueLoadoutGroup3[13]="BallisticProV55.M925Machinegun"
	BlueLoadoutGroup3[14]="BallisticProV55.MACWeapon"
	BlueLoadoutGroup3[15]="BallisticProV55.MRS138Shotgun"
	BlueLoadoutGroup3[16]="BallisticProV55.MRocketLauncher"
	BlueLoadoutGroup3[17]="BallisticProV55.MarlinRifle"
	BlueLoadoutGroup3[18]="BallisticProV55.R78Rifle"
	BlueLoadoutGroup3[19]="BallisticProV55.RSDarkStar"
	BlueLoadoutGroup3[20]="BallisticProV55.RSNovaStaff"
	BlueLoadoutGroup3[21]="BallisticProV55.RX22AFlamer"
	BlueLoadoutGroup3[22]="BallisticProV55.SARAssaultRifle"
	BlueLoadoutGroup3[23]="BallisticProV55.SRS900Rifle"
	BlueLoadoutGroup3[24]="BallisticProV55.XK2SubMachinegun"
	BlueLoadoutGroup3[25]="BallisticProV55.XMK5SubMachinegun"
	BlueLoadoutGroup3[26]="BallisticProV55.XMV850Minigun"
	BlueLoadoutGroup3[27]="BallisticProV55.XRS10SubMachinegun"
	BlueLoadoutGroup4[0]="BallisticProV55.FP7Grenade"
	BlueLoadoutGroup4[1]=""
	BlueLoadoutGroup4[2]="BallisticProV55.FP9Explosive"
	BlueLoadoutGroup4[3]="BallisticProV55.M58Grenade"
	BlueLoadoutGroup4[4]="BallisticProV55.NRP57Grenade"
	BlueLoadoutGroup4[5]="BallisticProV55.SandbagLayer"
	BlueLoadoutGroup4[6]="BallisticProV55.T10Grenade"
	bHideLockers=true
	FriendlyName="BallisticPro: Team Loadout"
	Description="Team-based Ballistic Loadout."
}
