class ClientOutfittingInterface extends Actor
	config(BallisticProV55)
	notplaceable;

const NUM_GROUPS = 5;

var Mut_Outfitting mut;
var PlayerController PC;
var float LastLoadoutTime;
var() config float ChangeInterval;
var array<string> Group0;
var array<string> Group1;
var array<string> Group2;
var array<string> Group3;
var array<string> Group4;
var string KillstreakRewards[2];
var bool bWeaponsReady;
var bool bPendingLoadoutSave;
var string LastLoadout[5];
var Class<Weapon> LastLoadoutClasses[5];

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerLoadoutChanged, ServerSetLoadout;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		ClientOpenLoadoutMenu, ClientSaveLoadoutClasses, 
		ClientStartLoadout, LastLoadoutClasses, 
		ReceiveWeapon;

	// Pos:0x01A
	reliable if(int(Role) == int(ROLE_Authority))
		PC;
}

simulated function array<string> GetGroup(byte GroupNum)
{
	// End:0x25
	if(int(Role) == int(ROLE_Authority))
	{
		return mut.GetGroup(GroupNum);
	}
	switch(GroupNum)
	{
		// End:0x37
		case 0:
			return Group0;
		// End:0x42
		case 1:
			return Group1;
		// End:0x4D
		case 2:
			return Group2;
		// End:0x58
		case 3:
			return Group3;
		// End:0x63
		case 4:
			return Group4;
		// End:0xFFFF
		default:
			//return;
			break;
	}	
}

simulated function string GetGroupItem(byte GroupNum, int ItemNum)
{
	switch(GroupNum)
	{
		// End:0x18
		case 0:
			return Group0[ItemNum];
		// End:0x29
		case 1:
			return Group1[ItemNum];
		// End:0x3A
		case 2:
			return Group2[ItemNum];
		// End:0x4B
		case 3:
			return Group3[ItemNum];
		// End:0x5C
		case 4:
			return Group4[ItemNum];
		// End:0xFFFF
		default:
			//return;
			break;
	}	
}

simulated function SetGroupItem(string str, byte GroupNum, int ItemNum)
{
	switch(GroupNum)
	{
		// End:0x20
		case 0:
			Group0[ItemNum] = str;
			// End:0x87
			break;
		// End:0x39
		case 1:
			Group1[ItemNum] = str;
			// End:0x87
			break;
		// End:0x52
		case 2:
			Group2[ItemNum] = str;
			// End:0x87
			break;
		// End:0x6B
		case 3:
			Group3[ItemNum] = str;
			// End:0x87
			break;
		// End:0x84
		case 4:
			Group4[ItemNum] = str;
			// End:0x87
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

simulated function int GroupLength(byte GroupNum)
{
	switch(GroupNum)
	{
		// End:0x13
		case 0:
			return Group0.Length;
		// End:0x1F
		case 1:
			return Group1.Length;
		// End:0x2B
		case 2:
			return Group2.Length;
		// End:0x37
		case 3:
			return Group3.Length;
		// End:0x43
		case 4:
			return Group4.Length;
		// End:0xFFFF
		default:
			return -1;
			break;
	}
	//return;	
}

function bool IsInList(out array<string> List, string Test, optional out int Index)
{
	Index = 0;
	J0x07:

	// End:0x38 [Loop If]
	if(Index < List.Length)
	{
		// End:0x2E
		if(List[Index] == Test)
		{
			return true;
		}
		Index++;
		// [Loop Continue]
		goto J0x07;
	}
	return false;
	//return;	
}

simulated function PushWeaponFromMutator(string str, byte GroupNum)
{
	switch(GroupNum)
	{
		// End:0x34
		case 0:
			Group0.Length = Group0.Length + 1;
			Group0[Group0.Length - 1] = str;
			// End:0xEB
			break;
		// End:0x61
		case 1:
			Group1.Length = Group1.Length + 1;
			Group1[Group1.Length - 1] = str;
			// End:0xEB
			break;
		// End:0x8E
		case 2:
			Group2.Length = Group2.Length + 1;
			Group2[Group2.Length - 1] = str;
			// End:0xEB
			break;
		// End:0xBB
		case 3:
			Group3.Length = Group3.Length + 1;
			Group3[Group3.Length - 1] = str;
			// End:0xEB
			break;
		// End:0xE8
		case 4:
			Group4.Length = Group4.Length + 1;
			Group4[Group4.Length - 1] = str;
			// End:0xEB
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

function FillWeapons()
{
	local int group_index, wep_index;

	group_index = 0;
	J0x07:

	// End:0x77 [Loop If]
	if(group_index < 5)
	{
		wep_index = 0;
		J0x1A:

		// End:0x6D [Loop If]
		if(wep_index < mut.GetGroup(byte(group_index)).Length)
		{
			PushWeaponFromMutator(mut.GetGroupItem(byte(group_index), wep_index), byte(group_index));
			++wep_index;
			// [Loop Continue]
			goto J0x1A;
		}
		++group_index;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

function SendWeapons()
{
	local int i, j;
	local array<string> Weaps;
	local array<byte> Boxes;

	i = 0;
	J0x07:

	// End:0x78 [Loop If]
	if(i < mut.LoadoutGroup0.Length)
	{
		// End:0x3E
		if(mut.LoadoutGroup0[i] == "")
		{
			// [Explicit Continue]
			goto J0x6E;
		}
		Weaps[Weaps.Length] = mut.LoadoutGroup0[i];
		Boxes[Boxes.Length] = 1;
		J0x6E:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0x7F:

	// End:0x12B [Loop If]
	if(i < mut.LoadoutGroup1.Length)
	{
		// End:0xB6
		if(mut.LoadoutGroup1[i] == "")
		{
			// [Explicit Continue]
			goto J0x121;
		}
		// End:0xF1
		if(IsInList(Weaps, mut.LoadoutGroup1[i], j))
		{
			Boxes[j] += byte(2);
			// [Explicit Continue]
			goto J0x121;
		}
		Weaps[Weaps.Length] = mut.LoadoutGroup1[i];
		Boxes[Boxes.Length] = 2;
		J0x121:

		i++;
		// [Loop Continue]
		goto J0x7F;
	}
	i = 0;
	J0x132:

	// End:0x1DE [Loop If]
	if(i < mut.LoadoutGroup2.Length)
	{
		// End:0x169
		if(mut.LoadoutGroup2[i] == "")
		{
			// [Explicit Continue]
			goto J0x1D4;
		}
		// End:0x1A4
		if(IsInList(Weaps, mut.LoadoutGroup2[i], j))
		{
			Boxes[j] += byte(4);
			// [Explicit Continue]
			goto J0x1D4;
		}
		Weaps[Weaps.Length] = mut.LoadoutGroup2[i];
		Boxes[Boxes.Length] = 4;
		J0x1D4:

		i++;
		// [Loop Continue]
		goto J0x132;
	}
	i = 0;
	J0x1E5:

	// End:0x291 [Loop If]
	if(i < mut.LoadoutGroup3.Length)
	{
		// End:0x21C
		if(mut.LoadoutGroup3[i] == "")
		{
			// [Explicit Continue]
			goto J0x287;
		}
		// End:0x257
		if(IsInList(Weaps, mut.LoadoutGroup3[i], j))
		{
			Boxes[j] += byte(8);
			// [Explicit Continue]
			goto J0x287;
		}
		Weaps[Weaps.Length] = mut.LoadoutGroup3[i];
		Boxes[Boxes.Length] = 8;
		J0x287:

		i++;
		// [Loop Continue]
		goto J0x1E5;
	}
	i = 0;
	J0x298:

	// End:0x344 [Loop If]
	if(i < mut.LoadoutGroup4.Length)
	{
		// End:0x2CF
		if(mut.LoadoutGroup4[i] == "")
		{
			// [Explicit Continue]
			goto J0x33A;
		}
		// End:0x30A
		if(IsInList(Weaps, mut.LoadoutGroup4[i], j))
		{
			Boxes[j] += byte(16);
			// [Explicit Continue]
			goto J0x33A;
		}
		Weaps[Weaps.Length] = mut.LoadoutGroup4[i];
		Boxes[Boxes.Length] = 16;
		J0x33A:

		i++;
		// [Loop Continue]
		goto J0x298;
	}
	i = 0;
	J0x34B:

	// End:0x384 [Loop If]
	if(i < (Weaps.Length - 1))
	{
		ReceiveWeapon(Weaps[i], Boxes[i]);
		i++;
		// [Loop Continue]
		goto J0x34B;
	}
	ReceiveWeapon(Weaps[Weaps.Length - 1], Boxes[Weaps.Length - 1], true);
	//return;	
}

simulated function ReceiveWeapon(string WeaponName, byte Boxes, optional bool bTerminate)
{
	// End:0x22
	if((int(Boxes) & 1) > 0)
	{
		Group0[Group0.Length] = WeaponName;
	}
	// End:0x45
	if((int(Boxes) & 2) > 0)
	{
		Group1[Group1.Length] = WeaponName;
	}
	// End:0x68
	if((int(Boxes) & 4) > 0)
	{
		Group2[Group2.Length] = WeaponName;
	}
	// End:0x8B
	if((int(Boxes) & 8) > 0)
	{
		Group3[Group3.Length] = WeaponName;
	}
	// End:0xAE
	if((int(Boxes) & 16) > 0)
	{
		Group4[Group4.Length] = WeaponName;
	}
	// End:0xC5
	if(bTerminate)
	{
		SortLists();
		bWeaponsReady = true;
	}
	//return;	
}

simulated function bool LoadWIFromCache(string ClassStr, out WeaponInfo WepInfo)
{
	local int i;

	WepInfo = Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(ClassStr, i);
	// End:0x61
	if(i == -1)
	{
		Log("Error loading item for Conflict: " $ ClassStr, 'Warning');
		return false;
	}
	return true;
	//return;	
}

simulated function SortLists()
{
	local int group_index;

	group_index = 0;
	J0x07:

	// End:0x2A [Loop If]
	if(group_index < 5)
	{
		SortList(byte(group_index));
		++group_index;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function SortList(byte group_index)
{
	local int i, j;
	local WeaponInfo WI;
	local array<WeaponInfo> SortedWIs;
	local int wiGroup, existingGroup;

	i = 0;
	J0x07:

	// End:0x1D0 [Loop If]
	if(i < GetGroup(group_index).Length)
	{
		// End:0x177
		if(LoadWIFromCache(GetGroupItem(group_index, i), WI))
		{
			// End:0x5C
			if(SortedWIs.Length == 0)
			{
				SortedWIs[SortedWIs.Length] = WI;				
			}
			else
			{
				wiGroup = WI.InventoryGroup;
				// End:0x7F
				if(wiGroup == 0)
				{
					wiGroup = 10;
				}
				j = 0;
				J0x86:

				// End:0x174 [Loop If]
				if(j < SortedWIs.Length)
				{
					existingGroup = SortedWIs[j].InventoryGroup;
					// End:0xBF
					if(existingGroup == 0)
					{
						existingGroup = 10;
					}
					// End:0xEE
					if(wiGroup < existingGroup)
					{
						SortedWIs.Insert(j, 1);
						SortedWIs[j] = WI;
						// [Explicit Break]
						goto J0x174;
					}
					// End:0x142
					if(wiGroup == existingGroup)
					{
						// End:0x142
						if(StrCmp(WI.ItemName, SortedWIs[j].ItemName, 6, true) <= 0)
						{
							SortedWIs.Insert(j, 1);
							SortedWIs[j] = WI;
							// [Explicit Break]
							goto J0x174;
						}
					}
					// End:0x16A
					if(j == (SortedWIs.Length - 1))
					{
						SortedWIs[SortedWIs.Length] = WI;
						// [Explicit Break]
						goto J0x174;
					}
					++j;
					// [Loop Continue]
					goto J0x86;
				}
			}
			J0x174:

			// [Explicit Continue]
			goto J0x1C6;
		}
		Log(("ClientOutfittingInterface: Failed to load " $ (GetGroupItem(group_index, i))) $ " from cache");
		J0x1C6:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0x1D7:

	// End:0x211 [Loop If]
	if(i < SortedWIs.Length)
	{
		SetGroupItem(SortedWIs[i].ClassName, group_index, i);
		++i;
		// [Loop Continue]
		goto J0x1D7;
	}
	//return;	
}

function Initialize(Mut_Outfitting Mo, PlayerController P)
{
	mut = Mo;
	PC = P;
	bWeaponsReady = true;
	// End:0x59
	if(int(Level.NetMode) != int(NM_Standalone))
	{
		// End:0x56
		if(Viewport(P.Player) == none)
		{
			SendWeapons();
		}		
	}
	else
	{
		FillWeapons();
		SortLists();
	}
	ClientOpenLoadoutMenu();
	SetTimer(1.0000000, true);
	//return;	
}

simulated function ClientOpenLoadoutMenu()
{
	// End:0x23
	if((PC == none) || PC.Player == none)
	{
		return;
	}
	PC.ClientOpenMenu("BallisticProV55.BallisticOutfittingMenu");
	// End:0xAD
	if(PC.Player.GUIController != none)
	{
		BallisticOutfittingMenu(GUIController(PC.Player.GUIController).ActivePage).SetupCOI(self);
	}
	//return;	
}

simulated event Timer()
{
	local int i;

	// End:0x20
	if((PC == none) && int(Role) == int(ROLE_Authority))
	{
		Destroy();
	}
	// End:0x7E
	if(bPendingLoadoutSave)
	{
		bPendingLoadoutSave = false;
		i = 0;
		J0x38:

		// End:0x65 [Loop If]
		if(i < 5)
		{
			default.LastLoadoutClasses[i] = LastLoadoutClasses[i];
			i++;
			// [Loop Continue]
			goto J0x38;
		}
		// End:0x7E
		if(int(Role) == int(ROLE_Authority))
		{
			SetTimer(1.0000000, true);
		}
	}
	//return;	
}

event Destroyed()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x5C [Loop If]
	if(i < mut.COIPond.Length)
	{
		// End:0x52
		if(mut.COIPond[i] == self)
		{
			mut.COIPond.Remove(i, 1);
			// [Explicit Break]
			goto J0x5C;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	J0x5C:

	super.Destroyed();
	//return;	
}

simulated function LoadoutChanged(string Stuff[5])
{
	ServerLoadoutChanged(Stuff[0], Stuff[1], Stuff[2], Stuff[3], Stuff[4]);
	//return;	
}

function ServerLoadoutChanged(string Stuff0, string Stuff1, string Stuff2, string Stuff3, string Stuff4)
{
	local int i;

	// End:0x35
	if((PC.Pawn == none) || PC.Pawn.Health < 1)
	{
		return;
	}
	// End:0x1D4
	if(((((Level.TimeSeconds - PC.Pawn.SpawnTime) < (DeathMatch(Level.Game).SpawnProtectionTime * float(5))) || (Level.TimeSeconds - LastLoadoutTime) > ChangeInterval) || (Invasion(Level.Game) != none) && !Invasion(Level.Game).bWaveInProgress) || ((CTFGame(Level.Game) != none) && PC.GetTeamNum() < 2) && VSize(CTFTeamAI(CTFGame(Level.Game).Teams[PC.GetTeamNum()].AI).FriendlyFlag.HomeBase.Location - PC.Pawn.Location) < float(384))
	{
		ServerSetLoadout(Stuff0, Stuff1, Stuff2, Stuff3, Stuff4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		LastLoadoutTime = Level.TimeSeconds;		
	}
	else
	{
		// End:0x344
		if(ONSOnslaughtGame(Level.Game) != none)
		{
			i = 0;
			J0x1F4:

			// End:0x344 [Loop If]
			if(i < ONSOnslaughtGame(Level.Game).PowerCores.Length)
			{
				// End:0x33A
				if((ONSOnslaughtGame(Level.Game).PowerCores[i].bPoweredByRed && PC.GetTeamNum() == 0) || ONSOnslaughtGame(Level.Game).PowerCores[i].bPoweredByBlue && PC.GetTeamNum() == 1)
				{
					// End:0x33A
					if(VSize(ONSOnslaughtGame(Level.Game).PowerCores[i].Location - PC.Pawn.Location) < float(384))
					{
						ServerSetLoadout(Stuff0, Stuff1, Stuff2, Stuff3, Stuff4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
						LastLoadoutTime = Level.TimeSeconds;
						return;
					}
				}
				i++;
				// [Loop Continue]
				goto J0x1F4;
			}
		}
	}
	//return;	
}

simulated function ClientStartLoadout()
{
	ServerSetLoadout(Class'BallisticProV55.Mut_Outfitting'.default.LoadOut[0], Class'BallisticProV55.Mut_Outfitting'.default.LoadOut[1], Class'BallisticProV55.Mut_Outfitting'.default.LoadOut[2], Class'BallisticProV55.Mut_Outfitting'.default.LoadOut[3], Class'BallisticProV55.Mut_Outfitting'.default.LoadOut[4], Class'BallisticProV55.Mut_Outfitting'.default.Layout[0], Class'BallisticProV55.Mut_Outfitting'.default.Layout[1], Class'BallisticProV55.Mut_Outfitting'.default.Layout[2], Class'BallisticProV55.Mut_Outfitting'.default.Layout[3], Class'BallisticProV55.Mut_Outfitting'.default.Layout[4], Class'BallisticProV55.Mut_Outfitting'.default.Camo[0], Class'BallisticProV55.Mut_Outfitting'.default.Camo[1], Class'BallisticProV55.Mut_Outfitting'.default.Camo[2], Class'BallisticProV55.Mut_Outfitting'.default.Camo[3], Class'BallisticProV55.Mut_Outfitting'.default.Camo[4]);
	//return;	
}

simulated function ClientSaveLoadoutClasses()
{
	bPendingLoadoutSave = true;
	SetTimer(0.5000000, false);
	//return;	
}

function ServerSetLoadout(string Stuff0, string Stuff1, string Stuff2, string Stuff3, string Stuff4, int L0, int l1, int l2, int L3, int L4, int C0, int c1, int C2, int C3, int C4)
{
	local int i;
	local string Stuff[5];
	local int Layout[5], Camo[5];

	Stuff[0] = Stuff0;
	Stuff[1] = Stuff1;
	Stuff[2] = Stuff2;
	Stuff[3] = Stuff3;
	Stuff[4] = Stuff4;
	Layout[0] = L0;
	Layout[1] = l1;
	Layout[2] = l2;
	Layout[3] = L3;
	Layout[4] = L4;
	Camo[0] = C0;
	Camo[1] = c1;
	Camo[2] = C2;
	Camo[3] = C3;
	Camo[4] = C4;
	// End:0x111
	if(PC.Pawn != none)
	{
		mut.OutfitPlayer(PC.Pawn, Stuff, LastLoadout, Layout, Camo);
	}
	i = 0;
	J0x118:

	// End:0x1A2 [Loop If]
	if(i < 5)
	{
		LastLoadout[i] = Stuff[i];
		LastLoadoutClasses[i] = Class<Weapon>(DynamicLoadObject(Stuff[i], Class'Core.Class', true));
		// End:0x198
		if(BallisticPlayer(PC) != none)
		{
			BallisticPlayer(PC).LastLoadoutClasses[i] = LastLoadoutClasses[i];
		}
		i++;
		// [Loop Continue]
		goto J0x118;
	}
	ClientSaveLoadoutClasses();
	//return;	
}

defaultproperties
{
	ChangeInterval=60.0000000
	bHidden=true
	bOnlyRelevantToOwner=true
	bAlwaysRelevant=true
	bReplicateMovement=false
	bSkipActorPropertyReplication=true
	RemoteRole=2
	NetUpdateFrequency=2.0000000
}
