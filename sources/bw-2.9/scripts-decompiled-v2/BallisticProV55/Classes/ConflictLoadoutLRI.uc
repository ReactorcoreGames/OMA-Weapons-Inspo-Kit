class ConflictLoadoutLRI extends BallisticPlayerReplicationInfo
	exportstructs
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum ELoadoutUpdateMode
{
	LUM_Immediate,                  // 0
	LUM_Delayed                     // 1
};

struct InventoryEntry
{
	var string ClassName;
	var string ItemName;
	var byte InventoryGroup;
	var byte InventorySize;
	var byte Teams;
};

struct SkillInfo
{
	var() int ElapsedTime;
	var() float DamageRate;
	var() float SniperEff;
	var() float ShotgunEff;
	var() float HazardEff;
};

var ConflictLoadoutLRI.ELoadoutUpdateMode LoadoutUpdateMode;
var int ListenRetryCount;
var Mut_ConflictLoadout LoadoutMut;
var bool bInventoryInitialized;
var bool bPendingLoadout;
var array<string> PendingLoadout;
var array<string> PendingLayouts;
var int InitialWeaponIndex;
var int PendingInitialWeaponIndex;
var array<string> LoadOut;
var array<string> Layouts;
var array<string> Camos;
var array<InventoryEntry> FullInventoryList;
var array<LORequirements> RequirementsList;
var array< Class<ConflictItem> > AppliedItems;
var int PlayerDamage;
var float SniperKills;
var float ShotgunKills;
var float HazardKills;
var int DeathsHoldingSniper;
var int DeathsHoldingShotgun;
var int DeathsHoldingHazard;
var SkillInfo MySkillInfo;
var byte LoadoutOption;
var bool bHasList;
var bool bHasSkillInfo;
var Controller MyController;
var float LastLoadoutTime;
var float ChangeInterval;
var localized string MenuName;
var localized string MenuHelp;
var private editconst bool bMenuModified;
var private editconst bool bMenuAdd;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		MyController;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		ClientPurge, ClientReceiveEnd, 
		ClientReceiveWeaponReq, GiveClientSkillInfo;

	// Pos:0x01A
	reliable if(int(Role) < int(ROLE_Authority))
		RequestFullList, RequestSkillInfo, 
		ServerSetInventory;

	// Pos:0x027
	reliable if((int(Role) == int(ROLE_Authority)) && bNetDirty)
		LoadoutOption;
}

simulated function ClientPurge(bool bPurgeActors)
{
	local Actor A;

	// End:0x12
	if(int(Role) == int(ROLE_Authority))
	{
		return;
	}
	// End:0xA6
	foreach AllActors(Class'Engine.Actor', A)
	{
		// End:0xA5
		if((!bPurgeActors && A.IsA('Pawn')) || ((bPurgeActors && !A.IsA('Controller')) && !A.IsA('ReplicationInfo')) && !A.IsA('GameInfo'))
		{
			A.Reset();
		}		
	}	
	//return;	
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

	super.PostNetBeginPlay();
	bMenuAdd = true;
	// End:0xCB
	if(int(Role) == int(ROLE_Authority))
	{
		M = Level.Game.BaseMutator;
		J0x3B:

		// End:0x91 [Loop If]
		if(M != none)
		{
			// End:0x7A
			if(Mut_ConflictLoadout(M) != none)
			{
				LoadoutMut = Mut_ConflictLoadout(M);
				LoadoutOption = LoadoutMut.LoadoutOption;
			}
			M = M.NextMutator;
			// [Loop Continue]
			goto J0x3B;
		}
		// End:0xCB
		if((MyController != none) && int(Level.NetMode) != int(NM_DedicatedServer))
		{
			LoadOut = Class'BallisticProV55.ConflictLoadoutConfig'.default.SavedInventory;
		}
	}
	switch(Level.NetMode)
	{
		// End:0xE0
		case NM_Standalone:
		// End:0xE5
		case NM_Client:
		// End:0xF6
		case NM_ListenServer:
			SetTimer(0.5000000, true);
			// End:0x101
			break;
		// End:0xFE
		case NM_DedicatedServer:
			// End:0x101
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

simulated function Timer()
{
	// End:0x5D
	if(((PlayerController(MyController) != none) && PlayerController(MyController).PlayerReplicationInfo != none) && Viewport(PlayerController(MyController).Player) != none)
	{
		SendSavedInventory();
		SetTimer(0.0000000, false);		
	}
	else
	{
		// End:0x91
		if(int(Level.NetMode) == int(NM_ListenServer))
		{
			ListenRetryCount--;
			// End:0x91
			if(ListenRetryCount == 0)
			{
				SetTimer(0.0000000, false);
			}
		}
	}
	//return;	
}

simulated function OnInventoryUpdated()
{
	SendSavedInventory();
	//return;	
}

simulated function SendSavedInventory()
{
	local string S, ls, cs;
	local int i;

	S = Class'BallisticProV55.ConflictLoadoutConfig'.static.BuildSavedInventoryString();
	ls = Class'BallisticProV55.ConflictLoadoutConfig'.static.BuildSavedLayoutString();
	cs = Class'BallisticProV55.ConflictLoadoutConfig'.static.BuildSavedCamoString();
	i = Class'BallisticProV55.ConflictLoadoutConfig'.static.GetSavedInitialWeaponIndex();
	ServerSetInventory(S, ls, cs, i);
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

	// End:0x19
	if(AIController(MyController) != none)
	{
		Disable('Tick');
		return;
	}
	Menu = UT2K4PlayerLoginMenu(GUIController(PlayerController(MyController).Player.GUIController).FindPersistentMenuByName(UnrealPlayer(MyController).LoginMenuClass));
	// End:0xAD
	if(Menu != none)
	{
		Panel = Menu.c_Main.InsertTab(0, MenuName, string(Class'BallisticProV55.MidGameTab_Conflict'),, MenuHelp);
		bMenuModified = true;
		Disable('Tick');
	}
	//return;	
}

function UpdateSkillInfo()
{
	// End:0x43
	if(Game_BWConflict(Level.Game) != none)
	{
		MySkillInfo.ElapsedTime = Game_BWConflict(Level.Game).TotalMatchTime;		
	}
	else
	{
		// End:0x81
		if(int(Role) == int(ROLE_Authority))
		{
			MySkillInfo.ElapsedTime = Level.Game.GameReplicationInfo.ElapsedTime;			
		}
		else
		{
			MySkillInfo.ElapsedTime = PlayerController(MyController).GameReplicationInfo.ElapsedTime;
		}
	}
	// End:0x10C
	if(MyController.PlayerReplicationInfo.Deaths == float(0))
	{
		MySkillInfo.SniperEff = SniperKills * float(2);
		MySkillInfo.ShotgunEff = ShotgunKills * float(2);
		MySkillInfo.HazardEff = HazardKills * float(2);		
	}
	else
	{
		MySkillInfo.SniperEff = SniperKills / ((float(DeathsHoldingSniper + 1) / 1.3000000) + (MyController.PlayerReplicationInfo.Deaths / 4.0000000));
		MySkillInfo.ShotgunEff = ShotgunKills / ((float(DeathsHoldingShotgun + 1) / 1.3000000) + (MyController.PlayerReplicationInfo.Deaths / 4.0000000));
		MySkillInfo.HazardEff = HazardKills / ((float(DeathsHoldingHazard + 1) / 1.3000000) + (MyController.PlayerReplicationInfo.Deaths / 4.0000000));
	}
	// End:0x205
	if(MyController.PlayerReplicationInfo.Kills == 0)
	{
		MySkillInfo.DamageRate = 0.0000000;		
	}
	else
	{
		MySkillInfo.DamageRate = float(PlayerDamage) / float(MyController.PlayerReplicationInfo.Kills);
	}
	//return;	
}

function RequestSkillInfo()
{
	UpdateSkillInfo();
	GiveClientSkillInfo(MySkillInfo);
	//return;	
}

simulated function GiveClientSkillInfo(SkillInfo SI)
{
	MySkillInfo = SI;
	bHasSkillInfo = true;
	//return;	
}

function RequestFullList()
{
	local int i;
	local byte Teams;

	i = 0;
	J0x07:

	// End:0xEB [Loop If]
	if(i < LoadoutMut.ConflictWeapons.Length)
	{
		// End:0x63
		if(!LoadoutMut.ConflictWeapons[i].bRed && !LoadoutMut.ConflictWeapons[i].bBlue)
		{
			// [Explicit Continue]
			goto J0xE1;
		}
		Teams = byte(int(LoadoutMut.ConflictWeapons[i].bRed) + (int(LoadoutMut.ConflictWeapons[i].bBlue) * 2));
		ClientReceiveWeaponReq(LoadoutMut.ConflictWeapons[i].ClassName, Teams, LoadoutMut.FullRequirementsList[i]);
		J0xE1:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	ClientReceiveEnd();
	//return;	
}

simulated function ClientReceiveWeaponReq(string ClassString, byte Teams, LORequirements Requirements)
{
	local InventoryEntry Entry;

	Entry.ClassName = ClassString;
	Entry.Teams = Teams;
	FullInventoryList[FullInventoryList.Length] = Entry;
	RequirementsList[RequirementsList.Length] = Requirements;
	//return;	
}

simulated function ClientReceiveEnd()
{
	bHasList = true;
	SortList();
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

static final function InventoryEntry GenerateFromWeaponInfo(WeaponInfo WI)
{
	local InventoryEntry IE;

	IE.ClassName = WI.ClassName;
	IE.ItemName = WI.ItemName;
	IE.InventoryGroup = byte(WI.InventoryGroup);
	IE.InventorySize = WI.InventorySize;
	return IE;
	//return;	
}

simulated function SortList()
{
	local int i, j;
	local WeaponInfo WI;
	local InventoryEntry Current;
	local array<InventoryEntry> Sorted;
	local array<LORequirements> SortedReq;
	local LORequirements CurrentReq;
	local int CurrentGroup, SortedGroup;

	i = 0;
	J0x07:

	// End:0x25E [Loop If]
	if(i < FullInventoryList.Length)
	{
		// End:0xA1
		if(!LoadWIFromCache(FullInventoryList[i].ClassName, WI))
		{
			Log(("ConflictLoadoutLRI: Couldn't load " $ FullInventoryList[i].ClassName) $ " from cache.");
			FullInventoryList.Remove(i, 1);
			RequirementsList.Remove(i, 1);
			--i;
			// [Explicit Continue]
			goto J0x254;
		}
		Current = GenerateFromWeaponInfo(WI);
		Current.Teams = FullInventoryList[i].Teams;
		CurrentReq = RequirementsList[i];
		// End:0x111
		if(Sorted.Length == 0)
		{
			Sorted[Sorted.Length] = Current;
			SortedReq[SortedReq.Length] = CurrentReq;
			// [Explicit Continue]
			goto J0x254;
		}
		CurrentGroup = int(Current.InventoryGroup);
		// End:0x136
		if(CurrentGroup == 0)
		{
			CurrentGroup = 10;
		}
		j = 0;
		J0x13D:

		// End:0x21A [Loop If]
		if(j < Sorted.Length)
		{
			SortedGroup = int(Sorted[j].InventoryGroup);
			// End:0x178
			if(SortedGroup == 0)
			{
				SortedGroup = 10;
			}
			// End:0x18A
			if(CurrentGroup < SortedGroup)
			{
				// [Explicit Break]
				goto J0x21A;
			}
			// End:0x19C
			if(CurrentGroup > SortedGroup)
			{
				// [Explicit Continue]
				goto J0x210;
			}
			// End:0x1C2
			if(int(Current.InventorySize) < int(Sorted[j].InventorySize))
			{
				// [Explicit Break]
				goto J0x21A;
			}
			// End:0x1E8
			if(int(Current.InventorySize) > int(Sorted[j].InventorySize))
			{
				// [Explicit Continue]
				goto J0x210;
			}
			// End:0x210
			if(StrCmp(Current.ItemName, Sorted[j].ItemName, 6, true) <= 0)
			{
				// [Explicit Break]
				goto J0x21A;
			}
			J0x210:

			++j;
			// [Loop Continue]
			goto J0x13D;
		}
		J0x21A:

		Sorted.Insert(j, 1);
		Sorted[j] = Current;
		SortedReq.Insert(j, 1);
		SortedReq[j] = CurrentReq;
		J0x254:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0x265:

	// End:0x2AD [Loop If]
	if(i < Sorted.Length)
	{
		FullInventoryList[i] = Sorted[i];
		RequirementsList[i] = SortedReq[i];
		++i;
		// [Loop Continue]
		goto J0x265;
	}
	Class'BCoreProV55.BC_WeaponInfoCache'.static.EndSession();
	//return;	
}

function SetDelayedMode()
{
	LoadoutUpdateMode = 1;
	//return;	
}

function SetImmediateMode()
{
	// End:0x0F
	if(bPendingLoadout)
	{
		UpdatePendingLoadout();
	}
	LoadoutUpdateMode = 0;
	//return;	
}

function UpdateInitialWeaponIndex()
{
	// End:0x16
	if(LoadOut.Length == 0)
	{
		InitialWeaponIndex = 0;		
	}
	else
	{
		InitialWeaponIndex = Min(InitialWeaponIndex, LoadOut.Length - 1);
	}
	//return;	
}

function ServerSetInventory(string ClassesString, string LayoutsString, string CamosString, int initial_wep_index)
{
	// End:0x53
	if(!bInventoryInitialized)
	{
		bInventoryInitialized = true;
		Split(ClassesString, "|", LoadOut);
		Split(LayoutsString, "|", Layouts);
		Split(CamosString, "|", Camos);
		InitialWeaponIndex = initial_wep_index;
		UpdateInventory();
		return;
	}
	switch(LoadoutUpdateMode)
	{
		// End:0xA0
		case 0:
			Split(ClassesString, "|", LoadOut);
			Split(LayoutsString, "|", Layouts);
			Split(CamosString, "|", Camos);
			InitialWeaponIndex = initial_wep_index;
			UpdateInventory();
			// End:0xEB
			break;
		// End:0xE8
		case 1:
			Split(ClassesString, "|", PendingLoadout);
			Split(LayoutsString, "|", PendingLayouts);
			Split(CamosString, "|", Camos);
			PendingInitialWeaponIndex = initial_wep_index;
			bPendingLoadout = true;
			// End:0xEB
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

function UpdatePendingLoadout()
{
	// End:0x1F
	if((int(LoadoutUpdateMode) == int(0)) || !bPendingLoadout)
	{
		return;
	}
	LoadOut = PendingLoadout;
	Layouts = PendingLayouts;
	InitialWeaponIndex = PendingInitialWeaponIndex;
	bPendingLoadout = false;
	UpdateInventory();
	//return;	
}

function UpdateInventory()
{
	local string S;

	Validate(LoadOut, Layouts, Camos);
	// End:0x50
	if(LoadOut.Length == 0)
	{
		S = LoadoutMut.GetFallbackWeapon(self);
		// End:0x50
		if(S != "")
		{
			LoadOut[0] = S;
		}
	}
	UpdateInitialWeaponIndex();
	//return;	
}

simulated function Validate(out array<string> ClassNames, out array<string> LayoutIndices, out array<string> CamoIndices)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x62 [Loop If]
	if(i < ClassNames.Length)
	{
		// End:0x58
		if(!ValidateWeapon(ClassNames[i]))
		{
			ClassNames.Remove(i, 1);
			LayoutIndices.Remove(i, 1);
			CamoIndices.Remove(i, 1);
			i--;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function bool ValidateWeapon(string WeaponName)
{
	local int i;

	// End:0x9C
	if(int(Role) == int(ROLE_Authority))
	{
		i = 0;
		J0x17:

		// End:0x99 [Loop If]
		if(i < LoadoutMut.ConflictWeapons.Length)
		{
			// End:0x8F
			if(LoadoutMut.ConflictWeapons[i].ClassName ~= WeaponName)
			{
				// End:0x74
				if(!TeamAllowed(LoadoutMut.ConflictWeapons[i]))
				{
					return false;
				}
				return WeaponRequirementsOk(LoadoutMut.FullRequirementsList[i]);
			}
			i++;
			// [Loop Continue]
			goto J0x17;
		}		
	}
	else
	{
		i = 0;
		J0xA3:

		// End:0xE9 [Loop If]
		if(i < FullInventoryList.Length)
		{
			// End:0xDF
			if(FullInventoryList[i].ClassName ~= WeaponName)
			{
				return WeaponRequirementsOk(RequirementsList[i]);
			}
			i++;
			// [Loop Continue]
			goto J0xA3;
		}
	}
	return false;
	//return;	
}

final simulated function int GetTeamFlags()
{
	local int team_index;
	local ASGameReplicationInfo AS_GRI;

	// End:0x2F
	if(MyController == none)
	{
		Log("GETTEAM_INDEX - NO CONTROLLER!");
		return 0;
	}
	// End:0x4F
	if(MyController.PlayerReplicationInfo.Team == none)
	{
		return 3;
	}
	team_index = MyController.PlayerReplicationInfo.Team.TeamIndex;
	// End:0xCC
	if(PlayerController(MyController) != none)
	{
		AS_GRI = ASGameReplicationInfo(PlayerController(MyController).GameReplicationInfo);
		// End:0xCC
		if(AS_GRI != none)
		{
			team_index = int(AS_GRI.IsDefender(byte(team_index)));
		}
	}
	return team_index + 1;
	//return;	
}

final simulated function bool CanUseWeaponAtIndex(int Index)
{
	local int team_flags;

	team_flags = GetTeamFlags();
	return (int(FullInventoryList[Index].Teams) & GetTeamFlags()) > 0;
	//return;	
}

simulated function bool TeamAllowed(Entry Weapon)
{
	local int team_flags;

	team_flags = GetTeamFlags();
	switch(team_flags)
	{
		// End:0x23
		case 1:
			return Weapon.bRed;
		// End:0x34
		case 2:
			return Weapon.bBlue;
		// End:0x55
		case 3:
			return Weapon.bRed || Weapon.bBlue;
		// End:0xFFFF
		default:
			return false;
			break;
	}
	//return;	
}

simulated function bool WeaponRequirementsOk(LORequirements Requirements)
{
	// End:0x29
	if(MyController == none)
	{
		Log("WEPREQS - NO CONTROLLER!");
		return false;
	}
	// End:0x48
	if((int(LoadoutOption) == 0) || int(LoadoutOption) == 2)
	{
		return true;
	}
	// End:0x70
	if(MyController.PlayerReplicationInfo.Score < Requirements.Frags)
	{
		return false;
	}
	// End:0x2DE
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0xB3
		if(float(Level.Game.GameReplicationInfo.ElapsedTime) < Requirements.MatchTime)
		{
			return false;
		}
		// End:0x158
		if(MyController.PlayerReplicationInfo.Deaths == float(0))
		{
			// End:0x101
			if((MyController.PlayerReplicationInfo.Score / 0.1000000) < Requirements.Efficiency)
			{
				return false;
			}
			// End:0x11D
			if((SniperKills * float(2)) < Requirements.SniperEff)
			{
				return false;
			}
			// End:0x139
			if((ShotgunKills * float(2)) < Requirements.ShotgunEff)
			{
				return false;
			}
			// End:0x155
			if((HazardKills * float(2)) < Requirements.HazardEff)
			{
				return false;
			}			
		}
		else
		{
			// End:0x199
			if((MyController.PlayerReplicationInfo.Score / MyController.PlayerReplicationInfo.Deaths) < Requirements.Efficiency)
			{
				return false;
			}
			// End:0x1E2
			if((SniperKills / ((float(DeathsHoldingSniper + 1) / 1.3000000) + (MyController.PlayerReplicationInfo.Deaths / 4.0000000))) < Requirements.SniperEff)
			{
				return false;
			}
			// End:0x22B
			if((ShotgunKills / ((float(DeathsHoldingShotgun + 1) / 1.3000000) + (MyController.PlayerReplicationInfo.Deaths / 4.0000000))) < Requirements.ShotgunEff)
			{
				return false;
			}
			// End:0x274
			if((HazardKills / ((float(DeathsHoldingHazard + 1) / 1.3000000) + (MyController.PlayerReplicationInfo.Deaths / 4.0000000))) < Requirements.HazardEff)
			{
				return false;
			}
		}
		// End:0x2A8
		if(MyController.PlayerReplicationInfo.Kills == 0)
		{
			// End:0x2A5
			if(float(0) < Requirements.DamageRate)
			{
				return false;
			}			
		}
		else
		{
			// End:0x2DB
			if((float(PlayerDamage) / float(MyController.PlayerReplicationInfo.Kills)) < Requirements.DamageRate)
			{
				return false;
			}
		}		
	}
	else
	{
		// End:0x2FB
		if(float(MySkillInfo.ElapsedTime) < Requirements.MatchTime)
		{
			return false;
		}
		// End:0x34C
		if(MyController.PlayerReplicationInfo.Deaths == float(0))
		{
			// End:0x349
			if((MyController.PlayerReplicationInfo.Score / 0.1000000) < Requirements.Efficiency)
			{
				return false;
			}			
		}
		else
		{
			// End:0x38D
			if((MyController.PlayerReplicationInfo.Score / MyController.PlayerReplicationInfo.Deaths) < Requirements.Efficiency)
			{
				return false;
			}
		}
		// End:0x3A8
		if(MySkillInfo.SniperEff < Requirements.SniperEff)
		{
			return false;
		}
		// End:0x3C3
		if(MySkillInfo.ShotgunEff < Requirements.ShotgunEff)
		{
			return false;
		}
		// End:0x3DE
		if(MySkillInfo.HazardEff < Requirements.HazardEff)
		{
			return false;
		}
		// End:0x3F9
		if(MySkillInfo.DamageRate < Requirements.DamageRate)
		{
			return false;
		}
	}
	return true;
	//return;	
}

defaultproperties
{
	ListenRetryCount=10
	LoadOut[0]="BallisticProV55.M50AssaultRifle"
	LoadOut[1]="BallisticProV55.MRS138Shotgun"
	LoadOut[2]="BallisticProV55.MD24Pistol"
	LoadOut[3]="BallisticProV55.MD24Pistol"
	LoadOut[4]="BallisticProV55.X4Knife"
	LoadOut[5]="BallisticProV55.NRP57Grenade"
	Layouts[0]="0"
	Layouts[1]="0"
	Layouts[2]="0"
	Layouts[3]="0"
	Layouts[4]="0"
	Layouts[5]="0"
	Camos[0]="0"
	Camos[1]="0"
	Camos[2]="0"
	Camos[3]="0"
	Camos[4]="0"
	Camos[5]="0"
	ChangeInterval=60.0000000
	MenuName="Gear"
	MenuHelp="Choose your starting equipment here."
	bOnlyRelevantToOwner=true
	bAlwaysTick=true
}
