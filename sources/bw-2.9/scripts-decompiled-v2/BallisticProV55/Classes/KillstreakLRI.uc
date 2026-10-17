class KillstreakLRI extends LinkedReplicationInfo
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const MAX_GROUPS = 2;

var int ListenRetryCount;
var Mut_Killstreak mut;
var Controller MyController;
var array<string> Streak1s;
var array<string> Streak2s;
var string Killstreaks[2];
var byte Layouts[2];
var byte Camos[2];
var bool bWeaponsReady;
var bool bPendingLoadoutSave;
var bool bClientAttemptedGetStreakList;
var Class<Weapon> LastStreaks[2];
var localized string MenuName;
var localized string MenuHelp;
var private editconst bool bMenuModified;
var private editconst bool bMenuAdd;
var byte RewardLevel;
var byte ActiveStreak;
var int InvKillScore;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerGetStreakList, ServerUpdateStreakChoices;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		ClientGetStreakChoices, ClientProcessWeapon, 
		ClientProcessWeaponEnd, LastStreaks;

	// Pos:0x01A
	reliable if((int(Role) == int(ROLE_Authority)) && bNetInitial)
		MyController;

	// Pos:0x032
	reliable if(int(Role) == int(ROLE_Authority))
		RewardLevel;
}

simulated function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	// End:0x26
	if(int(Role) == int(ROLE_Authority))
	{
		MyController = Controller(Owner);
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	local Mutator M;

	super(Actor).PostNetBeginPlay();
	bMenuAdd = true;
	// End:0x80
	if(int(Role) == int(ROLE_Authority))
	{
		M = Level.Game.BaseMutator;
		J0x3B:

		// End:0x80 [Loop If]
		if(M != none)
		{
			// End:0x69
			if(Mut_Killstreak(M) != none)
			{
				mut = Mut_Killstreak(M);
				// [Explicit Break]
				goto J0x80;
			}
			M = M.NextMutator;
			// [Loop Continue]
			goto J0x3B;
		}
	}
	J0x80:

	switch(Level.NetMode)
	{
		// End:0x95
		case NM_Standalone:
		// End:0xA3
		case NM_Client:
			ServerGetStreakList();
			// End:0xBF
			break;
		// End:0xB4
		case NM_ListenServer:
			SetTimer(0.5000000, true);
			// End:0xBF
			break;
		// End:0xBC
		case NM_DedicatedServer:
			// End:0xBF
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

simulated function Timer()
{
	// End:0x24
	if(int(Level.NetMode) != int(NM_ListenServer))
	{
		SetTimer(0.0000000, false);
		return;
	}
	// End:0x66
	if((PlayerController(MyController) != none) && Viewport(PlayerController(MyController).Player) != none)
	{
		ServerGetStreakList();
		SetTimer(0.0000000, false);		
	}
	else
	{
		// End:0x9A
		if(int(Level.NetMode) == int(NM_ListenServer))
		{
			ListenRetryCount--;
			// End:0x9A
			if(ListenRetryCount == 0)
			{
				SetTimer(0.0000000, false);
			}
		}
	}
	//return;	
}

simulated function Tick(float DeltaTime)
{
	// End:0x20
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Disable('Tick');
	}
	// End:0x3A
	if(!bMenuAdd || MyController == none)
	{
		return;
	}
	// End:0x66
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && !bMenuModified)
	{
		ModifyMenu();
	}
	// End:0x76
	if(bMenuModified)
	{
		Disable('Tick');
	}
	//return;	
}

private final simulated function ModifyMenu()
{
	local export editinline UT2K4PlayerLoginMenu Menu;
	local export editinline GUITabPanel Panel;
	local int Index;

	// End:0x19
	if(AIController(MyController) != none)
	{
		Disable('Tick');
		return;
	}
	Menu = UT2K4PlayerLoginMenu(GUIController(PlayerController(MyController).Player.GUIController).FindPersistentMenuByName(UnrealPlayer(MyController).LoginMenuClass));
	// End:0xF7
	if(Menu != none)
	{
		Index = Menu.c_Main.TabIndex("Gear");
		// End:0xAA
		if(Index == -1)
		{
			Index = 0;			
		}
		else
		{
			Index += 1;
		}
		Panel = Menu.c_Main.InsertTab(Index, MenuName, string(GetMenuClass()),, MenuHelp);
		bMenuModified = true;
		Disable('Tick');
	}
	//return;	
}

protected simulated function Class GetMenuClass()
{
	return Class'BallisticProV55.MidGameTab_Killstreaks';
	//return;	
}

function ServerGetStreakList()
{
	SendStreaks();
	//return;	
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
			return Streak1s;
		// End:0x42
		case 1:
			return Streak2s;
		// End:0xFFFF
		default:
			//return;
			break;
	}	
}

simulated function string GetGroupItem(byte GroupNum, int ItemNum)
{
	// End:0x2A
	if(int(Role) == int(ROLE_Authority))
	{
		return mut.GetGroupItem(GroupNum, ItemNum);
	}
	switch(GroupNum)
	{
		// End:0x42
		case 0:
			return Streak1s[ItemNum];
		// End:0x53
		case 1:
			return Streak2s[ItemNum];
		// End:0xFFFF
		default:
			//return;
			break;
	}	
}

simulated function int GroupLength(byte GroupNum)
{
	// End:0x47
	if(int(Role) == int(ROLE_Authority))
	{
		switch(GroupNum)
		{
			// End:0x2C
			case 0:
				return mut.Streak1s.Length;
			// End:0x41
			case 1:
				return mut.Streak2s.Length;
			// End:0xFFFF
			default:
				// End:0x69
				break;
				break;
		}
	}
	switch(GroupNum)
	{
		// End:0x5A
		case 0:
			return Streak1s.Length;
		// End:0x66
		case 1:
			return Streak2s.Length;
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

function SendStreaks()
{
	local int i, j;
	local array<string> Weaps;
	local array<byte> Boxes;

	// End:0x0B
	if(bClientAttemptedGetStreakList)
	{
		return;
	}
	bClientAttemptedGetStreakList = true;
	i = 0;
	J0x1A:

	// End:0x8B [Loop If]
	if(i < mut.Streak1s.Length)
	{
		// End:0x51
		if(mut.Streak1s[i] == "")
		{
			// [Explicit Continue]
			goto J0x81;
		}
		Weaps[Weaps.Length] = mut.Streak1s[i];
		Boxes[Boxes.Length] = 1;
		J0x81:

		i++;
		// [Loop Continue]
		goto J0x1A;
	}
	i = 0;
	J0x92:

	// End:0x13E [Loop If]
	if(i < mut.Streak2s.Length)
	{
		// End:0xC9
		if(mut.Streak2s[i] == "")
		{
			// [Explicit Continue]
			goto J0x134;
		}
		// End:0x104
		if(IsInList(Weaps, mut.Streak2s[i], j))
		{
			Boxes[j] += byte(2);
			// [Explicit Continue]
			goto J0x134;
		}
		Weaps[Weaps.Length] = mut.Streak2s[i];
		Boxes[Boxes.Length] = 2;
		J0x134:

		i++;
		// [Loop Continue]
		goto J0x92;
	}
	i = 0;
	J0x145:

	// End:0x17B [Loop If]
	if(i < Weaps.Length)
	{
		ClientProcessWeapon(Weaps[i], Boxes[i]);
		i++;
		// [Loop Continue]
		goto J0x145;
	}
	ClientProcessWeaponEnd();
	//return;	
}

simulated function ClientProcessWeapon(string WeaponName, byte Boxes)
{
	// End:0x22
	if((int(Boxes) & 1) > 0)
	{
		Streak1s[Streak1s.Length] = WeaponName;
	}
	// End:0x45
	if((int(Boxes) & 2) > 0)
	{
		Streak2s[Streak2s.Length] = WeaponName;
	}
	//return;	
}

simulated function ClientProcessWeaponEnd()
{
	bWeaponsReady = true;
	UpdateStreakChoices();
	//return;	
}

simulated function UpdateStreakChoices()
{
	ServerUpdateStreakChoices(Class'BallisticProV55.KillstreakConfig'.default.Killstreaks[0], Class'BallisticProV55.KillstreakConfig'.default.Killstreaks[1], Class'BallisticProV55.KillstreakConfig'.default.Layouts[0], Class'BallisticProV55.KillstreakConfig'.default.Layouts[1], Class'BallisticProV55.KillstreakConfig'.default.Camos[0], Class'BallisticProV55.KillstreakConfig'.default.Camos[1]);
	//return;	
}

simulated function ClientGetStreakChoices()
{
	UpdateStreakChoices();
	//return;	
}

function ServerUpdateStreakChoices(string Streak1, string Streak2, byte Layout1, byte Layout2, byte Camo1, byte Camo2)
{
	local int i;

	Killstreaks[0] = Streak1;
	Killstreaks[1] = Streak2;
	Layouts[0] = Layout1;
	Layouts[1] = Layout2;
	Camos[0] = Camo1;
	Camos[1] = Camo2;
	i = 0;
	J0x55:

	// End:0xC8 [Loop If]
	if(i < 2)
	{
		LastStreaks[i] = Class<Weapon>(DynamicLoadObject(Killstreaks[i], Class'Core.Class', true));
		// End:0xBE
		if(BallisticPlayer(MyController) != none)
		{
			BallisticPlayer(MyController).LastStreaks[i] = LastStreaks[i];
		}
		i++;
		// [Loop Continue]
		goto J0x55;
	}
	//return;	
}

defaultproperties
{
	ListenRetryCount=10
	MenuName="Killstreaks"
	MenuHelp="Choose your killstreak weapons here."
	bOnlyRelevantToOwner=true
	bAlwaysTick=true
}
