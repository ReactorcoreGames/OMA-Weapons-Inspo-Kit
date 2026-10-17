class UnrealTeamInfo extends TeamInfo
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() RosterEntry DefaultRosterEntry;
var() export editinline array<export editinline RosterEntry> Roster;
var() Class<UnrealPawn> AllowedTeamMembers[256];
var() byte TeamAlliance;
var int DesiredTeamSize;
var TeamAI AI;
var Color HudTeamColor;
var string TeamSymbolName;
var array<string> RosterNames;
var float CurrentObjectiveProgress;
var int LastObjectiveTime;
var int ObjectivesDisabledCount;

function Reset()
{
	super(Actor).Reset();
	// End:0x33
	if(!UnrealMPGameInfo(Level.Game).bTeamScoreRounds)
	{
		Score = 0.0000000;
	}
	//return;	
}

function int OverrideInitialBots(int N, UnrealTeamInfo t)
{
	return N;
	//return;	
}

function bool AllBotsSpawned()
{
	return false;
	//return;	
}

function Initialize(int TeamBots)
{
	//return;	
}

function FillPlayerTeam(GameProfile G)
{
	//return;	
}

simulated function Class<Pawn> NextLoadOut(Class<Pawn> CurrentLoadout)
{
	local int i;
	local Class<Pawn> Result;

	Result = AllowedTeamMembers[0];
	i = 0;
	J0x14:

	// End:0x87 [Loop If]
	if(i < (256 - 1))
	{
		// End:0x69
		if(AllowedTeamMembers[i] == CurrentLoadout)
		{
			// End:0x63
			if(AllowedTeamMembers[i + 1] != none)
			{
				Result = AllowedTeamMembers[i + 1];
			}
			// [Explicit Break]
			goto J0x87;
			// [Explicit Continue]
			goto J0x7D;
		}
		// End:0x7D
		if(AllowedTeamMembers[i] == none)
		{
			// [Explicit Break]
			goto J0x87;
		}
		J0x7D:

		i++;
		// [Loop Continue]
		goto J0x14;
	}
	J0x87:

	return Result;
	//return;	
}

function bool NeedsBotMoreThan(UnrealTeamInfo t)
{
	return (DesiredTeamSize - Size) > (t.DesiredTeamSize - t.Size);
	//return;	
}

function RosterEntry ChooseBotClass(optional string botname)
{
	// End:0x13
	if(botname == "")
	{
		return GetNextBot();
	}
	return GetNamedBot(botname);
	//return;	
}

function RosterEntry GetRandomPlayer()
{
	//return;	
}

function bool AlreadyExistsEntry(string CharacterName, bool bNoRecursion)
{
	return false;
	//return;	
}

function AddRandomPlayer()
{
	local int j;

	j = Roster.Length;
	Roster.Length = Roster.Length + 1;
	Roster[j] = GetRandomPlayer();
	Roster[j].PrecacheRosterFor(self);
	//return;	
}

function AddNamedBot(string botname)
{
	local int j;

	j = Roster.Length;
	Roster.Length = Roster.Length + 1;
	Roster[j] = GetNamedBot(botname);
	Roster[j].PrecacheRosterFor(self);
	//return;	
}

function RosterEntry GetNextBot()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x5E [Loop If]
	if(i < Roster.Length)
	{
		// End:0x54
		if(!Roster[i].bTaken)
		{
			Roster[i].bTaken = true;
			return Roster[i];
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = Roster.Length;
	Roster.Length = Roster.Length + 1;
	Roster[i] = GetRandomPlayer();
	Roster[i].bTaken = true;
	return Roster[i];
	//return;	
}

function RosterEntry GetNamedBot(string botname)
{
	return GetNextBot();
	//return;	
}

function bool AddToTeam(Controller Other)
{
	local bool bResult;

	bResult = super.AddToTeam(Other);
	// End:0x60
	if((bResult && Other.PawnClass != none) && !BelongsOnTeam(Other.PawnClass))
	{
		Other.PawnClass = DefaultPlayerClass;
	}
	return bResult;
	//return;	
}

function bool BelongsOnTeam(Class<Pawn> PawnClass)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x37 [Loop If]
	if(i < 256)
	{
		// End:0x2D
		if(PawnClass == AllowedTeamMembers[i])
		{
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return false;
	//return;	
}

function SetBotOrders(Bot NewBot, RosterEntry R)
{
	// End:0x24
	if(AI != none)
	{
		AI.SetBotOrders(NewBot, R);
	}
	//return;	
}

function RemoveFromTeam(Controller Other)
{
	super.RemoveFromTeam(Other);
	// End:0x2A
	if(AI != none)
	{
		AI.RemoveFromTeam(Other);
	}
	//return;	
}

defaultproperties
{
	DesiredTeamSize=8
	HudTeamColor=(R=255,G=255,B=255,A=255)
}
