class ClientTeamOutfittingInterface extends Actor
	config(BallisticProV55)
	notplaceable;

var Mut_TeamOutfitting mut;
var PlayerController PC;
var float LastLoadoutTime;
var() config float ChangeInterval;
var array<string> RedGroup0;
var array<string> RedGroup1;
var array<string> RedGroup2;
var array<string> RedGroup3;
var array<string> RedGroup4;
var array<string> BlueGroup0;
var array<string> BlueGroup1;
var array<string> BlueGroup2;
var array<string> BlueGroup3;
var array<string> BlueGroup4;
var bool bWeaponsReady;
var string LastLoadout[5];

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerLoadoutChanged, ServerSetLoadout;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		ClientOpenLoadoutMenu, ClientStartLoadout, 
		ReceiveWeapon;

	// Pos:0x01A
	reliable if(int(Role) == int(ROLE_Authority))
		PC;
}

simulated function array<string> GetGroupForTeam(byte GroupNum, byte Team)
{
	// End:0x4E
	if(int(Team) == 1)
	{
		switch(GroupNum)
		{
			// End:0x1F
			case 0:
				return BlueGroup0;
			// End:0x2A
			case 1:
				return BlueGroup1;
			// End:0x35
			case 2:
				return BlueGroup2;
			// End:0x40
			case 3:
				return BlueGroup3;
			// End:0x4B
			case 4:
				return BlueGroup4;
			// End:0xFFFF
			default:
				break;
			}
	}
	else
	{
		switch(GroupNum)
		{
			// End:0x60
			case 0:
				return RedGroup0;
			// End:0x6B
			case 1:
				return RedGroup1;
			// End:0x76
			case 2:
				return RedGroup2;
			// End:0x81
			case 3:
				return RedGroup3;
			// End:0x8C
			case 4:
				return RedGroup4;
			// End:0xFFFF
			default:
				//return;
				break;
		}		
	}
}

simulated function array<string> GetGroup(byte GroupNum)
{
	return GetGroupForTeam(GroupNum, byte(PC.GetTeamNum()));
	//return;	
}

simulated function string GetGroupItemForTeam(byte GroupNum, byte TeamNum, int ItemNum)
{
	// End:0x6F
	if(int(TeamNum) == 1)
	{
		switch(GroupNum)
		{
			// End:0x25
			case 0:
				return BlueGroup0[ItemNum];
			// End:0x36
			case 1:
				return BlueGroup1[ItemNum];
			// End:0x47
			case 2:
				return BlueGroup2[ItemNum];
			// End:0x58
			case 3:
				return BlueGroup3[ItemNum];
			// End:0x69
			case 4:
				return BlueGroup4[ItemNum];
			// End:0xFFFF
			default:
				// End:0xCE
				break;
				break;
		}
	}
	switch(GroupNum)
	{
		// End:0x87
		case 0:
			return RedGroup0[ItemNum];
		// End:0x98
		case 1:
			return RedGroup1[ItemNum];
		// End:0xA9
		case 2:
			return RedGroup2[ItemNum];
		// End:0xBA
		case 3:
			return RedGroup3[ItemNum];
		// End:0xCB
		case 4:
			return RedGroup4[ItemNum];
		// End:0xFFFF
		default:
			//return;
			break;
	}	
}

simulated function SetGroupItemForTeam(string str, byte GroupNum, byte TeamNum, int ItemNum)
{
	// End:0x97
	if(int(TeamNum) == 1)
	{
		switch(GroupNum)
		{
			// End:0x2D
			case 0:
				BlueGroup0[ItemNum] = str;
				// End:0x94
				break;
			// End:0x46
			case 1:
				BlueGroup1[ItemNum] = str;
				// End:0x94
				break;
			// End:0x5F
			case 2:
				BlueGroup2[ItemNum] = str;
				// End:0x94
				break;
			// End:0x78
			case 3:
				BlueGroup3[ItemNum] = str;
				// End:0x94
				break;
			// End:0x91
			case 4:
				BlueGroup4[ItemNum] = str;
				// End:0x94
				break;
			// End:0xFFFF
			default:
				break;
		}		
	}
	else
	{
		switch(GroupNum)
		{
			// End:0xB7
			case 0:
				RedGroup0[ItemNum] = str;
				// End:0x11E
				break;
			// End:0xD0
			case 1:
				RedGroup1[ItemNum] = str;
				// End:0x11E
				break;
			// End:0xE9
			case 2:
				RedGroup2[ItemNum] = str;
				// End:0x11E
				break;
			// End:0x102
			case 3:
				RedGroup3[ItemNum] = str;
				// End:0x11E
				break;
			// End:0x11B
			case 4:
				RedGroup4[ItemNum] = str;
				// End:0x11E
				break;
			// End:0xFFFF
			default:
				break;
		}
	}
	//return;	
}

simulated function PushWeaponFromMutator(string str, byte GroupNum, byte TeamNum)
{
	// End:0xFB
	if(int(TeamNum) == 1)
	{
		switch(GroupNum)
		{
			// End:0x41
			case 0:
				BlueGroup0.Length = BlueGroup0.Length + 1;
				BlueGroup0[BlueGroup0.Length - 1] = str;
				// End:0xF8
				break;
			// End:0x6E
			case 1:
				BlueGroup1.Length = BlueGroup1.Length + 1;
				BlueGroup1[BlueGroup1.Length - 1] = str;
				// End:0xF8
				break;
			// End:0x9B
			case 2:
				BlueGroup2.Length = BlueGroup2.Length + 1;
				BlueGroup2[BlueGroup2.Length - 1] = str;
				// End:0xF8
				break;
			// End:0xC8
			case 3:
				BlueGroup3.Length = BlueGroup3.Length + 1;
				BlueGroup3[BlueGroup3.Length - 1] = str;
				// End:0xF8
				break;
			// End:0xF5
			case 4:
				BlueGroup4.Length = BlueGroup4.Length + 1;
				BlueGroup4[BlueGroup4.Length - 1] = str;
				// End:0xF8
				break;
			// End:0xFFFF
			default:
				break;
		}		
	}
	else
	{
		switch(GroupNum)
		{
			// End:0x12F
			case 0:
				RedGroup0.Length = RedGroup0.Length + 1;
				RedGroup0[RedGroup0.Length - 1] = str;
				// End:0x1E6
				break;
			// End:0x15C
			case 1:
				RedGroup1.Length = RedGroup1.Length + 1;
				RedGroup1[RedGroup1.Length - 1] = str;
				// End:0x1E6
				break;
			// End:0x189
			case 2:
				RedGroup2.Length = RedGroup2.Length + 1;
				RedGroup2[RedGroup2.Length - 1] = str;
				// End:0x1E6
				break;
			// End:0x1B6
			case 3:
				RedGroup3.Length = RedGroup3.Length + 1;
				RedGroup3[RedGroup3.Length - 1] = str;
				// End:0x1E6
				break;
			// End:0x1E3
			case 4:
				RedGroup4.Length = RedGroup4.Length + 1;
				RedGroup4[RedGroup4.Length - 1] = str;
				// End:0x1E6
				break;
			// End:0xFFFF
			default:
				break;
		}
	}
	//return;	
}

simulated function string GetGroupItem(byte GroupNum, int ItemNum)
{
	return GetGroupItemForTeam(GroupNum, byte(PC.GetTeamNum()), ItemNum);
	//return;	
}

simulated function int GroupLengthForTeam(byte GroupNum, byte Team)
{
	// End:0x53
	if(int(Team) == 1)
	{
		switch(GroupNum)
		{
			// End:0x20
			case 0:
				return BlueGroup0.Length;
			// End:0x2C
			case 1:
				return BlueGroup1.Length;
			// End:0x38
			case 2:
				return BlueGroup2.Length;
			// End:0x44
			case 3:
				return BlueGroup3.Length;
			// End:0x50
			case 4:
				return BlueGroup4.Length;
			// End:0xFFFF
			default:
				break;
			}
	}
	else
	{
		switch(GroupNum)
		{
			// End:0x66
			case 0:
				return RedGroup0.Length;
			// End:0x72
			case 1:
				return RedGroup1.Length;
			// End:0x7E
			case 2:
				return RedGroup2.Length;
			// End:0x8A
			case 3:
				return RedGroup3.Length;
			// End:0x96
			case 4:
				return RedGroup4.Length;
			// End:0xFFFF
			default:
				return -1;
				break;
		}
		//return;		
	}
}

simulated function int GroupLength(byte GroupNum)
{
	return GroupLengthForTeam(GroupNum, byte(PC.GetTeamNum()));
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

function FillWeapons()
{
	local int Team, group_index, wep_index;

	Team = 0;
	J0x07:

	// End:0xA9 [Loop If]
	if(Team < 2)
	{
		group_index = 0;
		J0x1A:

		// End:0x9F [Loop If]
		if(group_index < 5)
		{
			wep_index = 0;
			J0x2D:

			// End:0x95 [Loop If]
			if(wep_index < mut.GetGroup(byte(group_index), byte(Team)).Length)
			{
				PushWeaponFromMutator(mut.GetGroupItem(byte(group_index), wep_index, byte(Team)), byte(group_index), byte(Team));
				++wep_index;
				// [Loop Continue]
				goto J0x2D;
			}
			++group_index;
			// [Loop Continue]
			goto J0x1A;
		}
		++Team;
		// [Loop Continue]
		goto J0x07;
	}
	Team = 0;
	J0xB0:

	// End:0x112 [Loop If]
	if(Team < 2)
	{
		group_index = 0;
		J0xC3:

		// End:0x108 [Loop If]
		if(group_index < 5)
		{
			wep_index = 0;
			J0xD6:

			// End:0xFE [Loop If]
			if(wep_index < (GroupLengthForTeam(byte(group_index), byte(Team))))
			{
				++wep_index;
				// [Loop Continue]
				goto J0xD6;
			}
			++group_index;
			// [Loop Continue]
			goto J0xC3;
		}
		++Team;
		// [Loop Continue]
		goto J0xB0;
	}
	//return;	
}

function SendWeapons()
{
	local int i, j;
	local array<string> Weaps;
	local array<byte> RedBoxes, BlueBoxes;

	i = 0;
	J0x07:

	// End:0xC1 [Loop If]
	if(i < mut.RedLoadoutGroup0.Length)
	{
		// End:0x3E
		if(mut.RedLoadoutGroup0[i] == "")
		{
			// [Explicit Continue]
			goto J0xB7;
		}
		// End:0x78
		if(IsInList(Weaps, mut.RedLoadoutGroup0[i], j))
		{
			RedBoxes[j] += byte(1);
			// [Explicit Continue]
			goto J0xB7;
		}
		Weaps[Weaps.Length] = mut.RedLoadoutGroup0[i];
		RedBoxes[RedBoxes.Length] = 1;
		BlueBoxes[BlueBoxes.Length] = 0;
		J0xB7:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0xC8:

	// End:0x183 [Loop If]
	if(i < mut.RedLoadoutGroup1.Length)
	{
		// End:0xFF
		if(mut.RedLoadoutGroup1[i] == "")
		{
			// [Explicit Continue]
			goto J0x179;
		}
		// End:0x13A
		if(IsInList(Weaps, mut.RedLoadoutGroup1[i], j))
		{
			RedBoxes[j] += byte(2);
			// [Explicit Continue]
			goto J0x179;
		}
		Weaps[Weaps.Length] = mut.RedLoadoutGroup1[i];
		RedBoxes[RedBoxes.Length] = 2;
		BlueBoxes[BlueBoxes.Length] = 0;
		J0x179:

		i++;
		// [Loop Continue]
		goto J0xC8;
	}
	i = 0;
	J0x18A:

	// End:0x245 [Loop If]
	if(i < mut.RedLoadoutGroup2.Length)
	{
		// End:0x1C1
		if(mut.RedLoadoutGroup2[i] == "")
		{
			// [Explicit Continue]
			goto J0x23B;
		}
		// End:0x1FC
		if(IsInList(Weaps, mut.RedLoadoutGroup2[i], j))
		{
			RedBoxes[j] += byte(4);
			// [Explicit Continue]
			goto J0x23B;
		}
		Weaps[Weaps.Length] = mut.RedLoadoutGroup2[i];
		RedBoxes[RedBoxes.Length] = 4;
		BlueBoxes[BlueBoxes.Length] = 0;
		J0x23B:

		i++;
		// [Loop Continue]
		goto J0x18A;
	}
	i = 0;
	J0x24C:

	// End:0x307 [Loop If]
	if(i < mut.RedLoadoutGroup3.Length)
	{
		// End:0x283
		if(mut.RedLoadoutGroup3[i] == "")
		{
			// [Explicit Continue]
			goto J0x2FD;
		}
		// End:0x2BE
		if(IsInList(Weaps, mut.RedLoadoutGroup3[i], j))
		{
			RedBoxes[j] += byte(8);
			// [Explicit Continue]
			goto J0x2FD;
		}
		Weaps[Weaps.Length] = mut.RedLoadoutGroup3[i];
		RedBoxes[RedBoxes.Length] = 8;
		BlueBoxes[BlueBoxes.Length] = 0;
		J0x2FD:

		i++;
		// [Loop Continue]
		goto J0x24C;
	}
	i = 0;
	J0x30E:

	// End:0x3C9 [Loop If]
	if(i < mut.RedLoadoutGroup4.Length)
	{
		// End:0x345
		if(mut.RedLoadoutGroup4[i] == "")
		{
			// [Explicit Continue]
			goto J0x3BF;
		}
		// End:0x380
		if(IsInList(Weaps, mut.RedLoadoutGroup4[i], j))
		{
			RedBoxes[j] += byte(16);
			// [Explicit Continue]
			goto J0x3BF;
		}
		Weaps[Weaps.Length] = mut.RedLoadoutGroup4[i];
		RedBoxes[RedBoxes.Length] = 16;
		BlueBoxes[BlueBoxes.Length] = 0;
		J0x3BF:

		i++;
		// [Loop Continue]
		goto J0x30E;
	}
	i = 0;
	J0x3D0:

	// End:0x48A [Loop If]
	if(i < mut.BlueLoadoutGroup0.Length)
	{
		// End:0x407
		if(mut.BlueLoadoutGroup0[i] == "")
		{
			// [Explicit Continue]
			goto J0x480;
		}
		// End:0x441
		if(IsInList(Weaps, mut.BlueLoadoutGroup0[i], j))
		{
			BlueBoxes[j] += byte(1);
			// [Explicit Continue]
			goto J0x480;
		}
		Weaps[Weaps.Length] = mut.BlueLoadoutGroup0[i];
		BlueBoxes[BlueBoxes.Length] = 1;
		RedBoxes[RedBoxes.Length] = 0;
		J0x480:

		i++;
		// [Loop Continue]
		goto J0x3D0;
	}
	i = 0;
	J0x491:

	// End:0x54C [Loop If]
	if(i < mut.BlueLoadoutGroup1.Length)
	{
		// End:0x4C8
		if(mut.BlueLoadoutGroup1[i] == "")
		{
			// [Explicit Continue]
			goto J0x542;
		}
		// End:0x503
		if(IsInList(Weaps, mut.BlueLoadoutGroup1[i], j))
		{
			BlueBoxes[j] += byte(2);
			// [Explicit Continue]
			goto J0x542;
		}
		Weaps[Weaps.Length] = mut.BlueLoadoutGroup1[i];
		BlueBoxes[BlueBoxes.Length] = 2;
		RedBoxes[RedBoxes.Length] = 0;
		J0x542:

		i++;
		// [Loop Continue]
		goto J0x491;
	}
	i = 0;
	J0x553:

	// End:0x60E [Loop If]
	if(i < mut.BlueLoadoutGroup2.Length)
	{
		// End:0x58A
		if(mut.BlueLoadoutGroup2[i] == "")
		{
			// [Explicit Continue]
			goto J0x604;
		}
		// End:0x5C5
		if(IsInList(Weaps, mut.BlueLoadoutGroup2[i], j))
		{
			BlueBoxes[j] += byte(4);
			// [Explicit Continue]
			goto J0x604;
		}
		Weaps[Weaps.Length] = mut.BlueLoadoutGroup2[i];
		BlueBoxes[BlueBoxes.Length] = 4;
		RedBoxes[RedBoxes.Length] = 0;
		J0x604:

		i++;
		// [Loop Continue]
		goto J0x553;
	}
	i = 0;
	J0x615:

	// End:0x6D0 [Loop If]
	if(i < mut.BlueLoadoutGroup3.Length)
	{
		// End:0x64C
		if(mut.BlueLoadoutGroup3[i] == "")
		{
			// [Explicit Continue]
			goto J0x6C6;
		}
		// End:0x687
		if(IsInList(Weaps, mut.BlueLoadoutGroup3[i], j))
		{
			BlueBoxes[j] += byte(8);
			// [Explicit Continue]
			goto J0x6C6;
		}
		Weaps[Weaps.Length] = mut.BlueLoadoutGroup3[i];
		BlueBoxes[BlueBoxes.Length] = 8;
		RedBoxes[RedBoxes.Length] = 0;
		J0x6C6:

		i++;
		// [Loop Continue]
		goto J0x615;
	}
	i = 0;
	J0x6D7:

	// End:0x792 [Loop If]
	if(i < mut.BlueLoadoutGroup4.Length)
	{
		// End:0x70E
		if(mut.BlueLoadoutGroup4[i] == "")
		{
			// [Explicit Continue]
			goto J0x788;
		}
		// End:0x749
		if(IsInList(Weaps, mut.BlueLoadoutGroup4[i], j))
		{
			BlueBoxes[j] += byte(16);
			// [Explicit Continue]
			goto J0x788;
		}
		Weaps[Weaps.Length] = mut.BlueLoadoutGroup4[i];
		BlueBoxes[BlueBoxes.Length] = 16;
		RedBoxes[RedBoxes.Length] = 0;
		J0x788:

		i++;
		// [Loop Continue]
		goto J0x6D7;
	}
	i = 0;
	J0x799:

	// End:0x7DD [Loop If]
	if(i < (Weaps.Length - 1))
	{
		ReceiveWeapon(Weaps[i], RedBoxes[i], BlueBoxes[i]);
		i++;
		// [Loop Continue]
		goto J0x799;
	}
	ReceiveWeapon(Weaps[Weaps.Length - 1], RedBoxes[Weaps.Length - 1], BlueBoxes[Weaps.Length - 1], true);
	//return;	
}

simulated function ReceiveWeapon(string WeaponName, byte RedBoxes, byte BlueBoxes, optional bool bTerminate)
{
	// End:0x22
	if((int(RedBoxes) & 1) > 0)
	{
		RedGroup0[RedGroup0.Length] = WeaponName;
	}
	// End:0x45
	if((int(RedBoxes) & 2) > 0)
	{
		RedGroup1[RedGroup1.Length] = WeaponName;
	}
	// End:0x68
	if((int(RedBoxes) & 4) > 0)
	{
		RedGroup2[RedGroup2.Length] = WeaponName;
	}
	// End:0x8B
	if((int(RedBoxes) & 8) > 0)
	{
		RedGroup3[RedGroup3.Length] = WeaponName;
	}
	// End:0xAE
	if((int(RedBoxes) & 16) > 0)
	{
		RedGroup4[RedGroup4.Length] = WeaponName;
	}
	// End:0xD0
	if((int(BlueBoxes) & 1) > 0)
	{
		BlueGroup0[BlueGroup0.Length] = WeaponName;
	}
	// End:0xF3
	if((int(BlueBoxes) & 2) > 0)
	{
		BlueGroup1[BlueGroup1.Length] = WeaponName;
	}
	// End:0x116
	if((int(BlueBoxes) & 4) > 0)
	{
		BlueGroup2[BlueGroup2.Length] = WeaponName;
	}
	// End:0x139
	if((int(BlueBoxes) & 8) > 0)
	{
		BlueGroup3[BlueGroup3.Length] = WeaponName;
	}
	// End:0x15C
	if((int(BlueBoxes) & 16) > 0)
	{
		BlueGroup4[BlueGroup4.Length] = WeaponName;
	}
	// End:0x173
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
	local int Team, group_index;

	Team = 0;
	J0x07:

	// End:0x4E [Loop If]
	if(Team < 2)
	{
		group_index = 0;
		J0x1A:

		// End:0x44 [Loop If]
		if(group_index < 5)
		{
			SortList(byte(group_index), byte(Team));
			++group_index;
			// [Loop Continue]
			goto J0x1A;
		}
		++Team;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function SortList(byte group_index, byte Team)
{
	local int i, j;
	local WeaponInfo WI;
	local array<WeaponInfo> SortedWIs;
	local int wiGroup, existingGroup;

	i = 0;
	J0x07:

	// End:0x1E3 [Loop If]
	if(i < GetGroupForTeam(group_index, Team).Length)
	{
		// End:0x181
		if(LoadWIFromCache(GetGroupItemForTeam(group_index, Team, i), WI))
		{
			// End:0x66
			if(SortedWIs.Length == 0)
			{
				SortedWIs[SortedWIs.Length] = WI;				
			}
			else
			{
				wiGroup = WI.InventoryGroup;
				// End:0x89
				if(wiGroup == 0)
				{
					wiGroup = 10;
				}
				j = 0;
				J0x90:

				// End:0x17E [Loop If]
				if(j < SortedWIs.Length)
				{
					existingGroup = SortedWIs[j].InventoryGroup;
					// End:0xC9
					if(existingGroup == 0)
					{
						existingGroup = 10;
					}
					// End:0xF8
					if(wiGroup < existingGroup)
					{
						SortedWIs.Insert(j, 1);
						SortedWIs[j] = WI;
						// [Explicit Break]
						goto J0x17E;
					}
					// End:0x14C
					if(wiGroup == existingGroup)
					{
						// End:0x14C
						if(StrCmp(WI.ItemName, SortedWIs[j].ItemName, 6, true) <= 0)
						{
							SortedWIs.Insert(j, 1);
							SortedWIs[j] = WI;
							// [Explicit Break]
							goto J0x17E;
						}
					}
					// End:0x174
					if(j == (SortedWIs.Length - 1))
					{
						SortedWIs[SortedWIs.Length] = WI;
						// [Explicit Break]
						goto J0x17E;
					}
					++j;
					// [Loop Continue]
					goto J0x90;
				}
			}
			J0x17E:

			// [Explicit Continue]
			goto J0x1D9;
		}
		Log(("ClientTeamOutfittingInterface: Failed to load " $ (GetGroupItemForTeam(group_index, Team, i))) $ " from cache");
		J0x1D9:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0x1EA:

	// End:0x229 [Loop If]
	if(i < SortedWIs.Length)
	{
		SetGroupItemForTeam(SortedWIs[i].ClassName, group_index, Team, i);
		++i;
		// [Loop Continue]
		goto J0x1EA;
	}
	//return;	
}

function Initialize(Mut_TeamOutfitting Mo, PlayerController P)
{
	mut = Mo;
	PC = P;
	bWeaponsReady = true;
	// End:0x5B
	if((int(Level.NetMode) != int(NM_Standalone)) && Viewport(P.Player) == none)
	{
		SendWeapons();		
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
	PC.ClientOpenMenu("BallisticProV55.BallisticTeamOutfittingMenu");
	// End:0xB1
	if(PC.Player.GUIController != none)
	{
		BallisticTeamOutfittingMenu(GUIController(PC.Player.GUIController).ActivePage).SetupCOI(self);
	}
	//return;	
}

event Timer()
{
	// End:0x0E
	if(PC == none)
	{
		Destroy();
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
	ServerSetLoadout(Class'BallisticProV55.Mut_TeamOutfitting'.default.LoadOut[0], Class'BallisticProV55.Mut_TeamOutfitting'.default.LoadOut[1], Class'BallisticProV55.Mut_TeamOutfitting'.default.LoadOut[2], Class'BallisticProV55.Mut_TeamOutfitting'.default.LoadOut[3], Class'BallisticProV55.Mut_TeamOutfitting'.default.LoadOut[4], Class'BallisticProV55.Mut_TeamOutfitting'.default.Layout[0], Class'BallisticProV55.Mut_TeamOutfitting'.default.Layout[1], Class'BallisticProV55.Mut_TeamOutfitting'.default.Layout[2], Class'BallisticProV55.Mut_TeamOutfitting'.default.Layout[3], Class'BallisticProV55.Mut_TeamOutfitting'.default.Layout[4], Class'BallisticProV55.Mut_TeamOutfitting'.default.Camo[0], Class'BallisticProV55.Mut_TeamOutfitting'.default.Camo[1], Class'BallisticProV55.Mut_TeamOutfitting'.default.Camo[2], Class'BallisticProV55.Mut_TeamOutfitting'.default.Camo[3], Class'BallisticProV55.Mut_TeamOutfitting'.default.Camo[4]);
	//return;	
}

function ServerSetLoadout(string Stuff0, string Stuff1, string Stuff2, string Stuff3, string Stuff4, int L0, int l1, int l2, int L3, int L4, int C0, int c1, int C2, int C3, int C4)
{
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
	LastLoadout[0] = Stuff[0];
	LastLoadout[1] = Stuff[1];
	LastLoadout[2] = Stuff[2];
	LastLoadout[3] = Stuff[3];
	LastLoadout[4] = Stuff[4];
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
}
