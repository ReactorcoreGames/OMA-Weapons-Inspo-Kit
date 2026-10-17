class xDoubleDom extends TeamGame
	config
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const DDPROPNUM = 2;

var() config int TimeToScore;
var() config int TimeDisabled;
var xDomPoint xDomPoints[2];
var int ScoreCountDown;
var transient int DisabledCountDown;
var() Sound ControlSounds[2];
var() Sound ScoreSounds[2];
var() Sound AvertedSounds[4];
var() name ControlSoundNames[2];
var() name ScoreSoundNames[2];
var() name AvertedSoundNames[4];
var Sound NewRoundSound;
var localized string DDomPropsDisplayText[2];
var localized string DDomPropDescText[2];

static function PrecacheGameTextures(LevelInfo MyLevel)
{
	Class'XGame.xTeamGame'.static.PrecacheGameTextures(MyLevel);
	MyLevel.AddPrecacheMaterial(Texture'XGameTextures.SuperPickups.DOMpointGREY');
	MyLevel.AddPrecacheMaterial(Texture'XGameTextures.SuperPickups.DOMpointLINESg');
	MyLevel.AddPrecacheMaterial(Texture'XGameTextures.SuperPickups.DOMPointABg');
	MyLevel.AddPrecacheMaterial(Texture'XGameTextures.SuperPickups.DOMPointABr');
	MyLevel.AddPrecacheMaterial(Texture'XGameTextures.SuperPickups.DOMpointLINESr');
	MyLevel.AddPrecacheMaterial(Texture'XGameTextures.SuperPickups.DOMpointRED');
	MyLevel.AddPrecacheMaterial(Texture'XGameTextures.SuperPickups.RedScreenA');
	MyLevel.AddPrecacheMaterial(Texture'XGameTextures.SuperPickups.DOMPointABb');
	MyLevel.AddPrecacheMaterial(Texture'XGameTextures.SuperPickups.DOMpointLINESb');
	MyLevel.AddPrecacheMaterial(Texture'XGameTextures.SuperPickups.DOMpointBLUE');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.RedMarker_t');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.BlueMarker_t');
	//return;	
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
	super.PrecacheGameAnnouncements(V, bRewardSounds);
	// End:0xB5
	if(!bRewardSounds)
	{
		V.PrecacheSound(default.ControlSoundNames[0]);
		V.PrecacheSound(default.ControlSoundNames[1]);
		V.PrecacheSound(default.ScoreSoundNames[0]);
		V.PrecacheSound(default.ScoreSoundNames[1]);
		V.PrecacheSound(default.AvertedSoundNames[1]);
		V.PrecacheSound(default.AvertedSoundNames[3]);
		V.PrecacheSound('NewRoundIn');
	}
	//return;	
}

simulated function UpdateAnnouncements()
{
	//return;	
}

function int GetStatus(PlayerController Sender, Bot B)
{
	local name BotOrders;

	BotOrders = B.GetOrders();
	// End:0x5C
	if(B.Pawn == none)
	{
		// End:0x59
		if((BotOrders == 'Defend') && B.Squad.Size == 1)
		{
			return 0;
		}		
	}
	else
	{
		// End:0x139
		if((((B.Enemy == none) && B.Squad.SquadObjective != none) && int(B.Squad.SquadObjective.DefenderTeamIndex) == B.Squad.Team.TeamIndex) && B.LineOfSightTo(B.Squad.SquadObjective))
		{
			// End:0x133
			if(int(DominationPoint(B.Squad.SquadObjective).PrimaryTeam) == 0)
			{
				return 16;				
			}
			else
			{
				return 17;
			}			
		}
		else
		{
			return super.GetStatus(Sender, B);
		}
	}
	//return;	
}

static function int OrderToIndex(int Order)
{
	// End:0x0E
	if(Order == 0)
	{
		return 12;
	}
	// End:0x1D
	if(Order == 2)
	{
		return 13;
	}
	return Order;
	//return;	
}

static function PrecacheGameStaticMeshes(LevelInfo MyLevel)
{
	Class'XGame.xDeathMatch'.static.PrecacheGameStaticMeshes(MyLevel);
	MyLevel.AddPrecacheStaticMesh(StaticMesh'XGame_rc.DomRing');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'XGame_rc.DomAMesh');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'XGame_rc.DomBMesh');
	//return;	
}

function PostBeginPlay()
{
	local NavigationPoint N;
	local int i;

	super.PostBeginPlay();
	i = 0;
	N = Level.NavigationPointList;
	J0x21:

	// End:0x9D [Loop If]
	if(N != none)
	{
		// End:0x86
		if(N.IsA('xDomPoint'))
		{
			xDomPoints[i] = xDomPoint(N);
			xDomPoints[i].__ResetCount__Delegate = ResetCount;
			i++;
			// End:0x86
			if(i == 2)
			{
				// [Explicit Break]
				goto J0x9D;
			}
		}
		N = N.nextNavigationPoint;
		// [Loop Continue]
		goto J0x21;
	}
	J0x9D:

	// End:0xEA
	if(i != 2)
	{
		Log("xDoubleDom: Level has wrong number of Domination Points!", 'Error');
	}
	//return;	
}

function ClearControl(Controller Other)
{
	local Controller P;
	local PlayerController Player;
	local Pawn pick;

	// End:0x3B
	if((PlayerController(Other) == none) || Other.PlayerReplicationInfo.Team.TeamIndex == 255)
	{
		return;
	}
	// End:0x73
	if((xDomPoints[0].ControllingPawn != Other) && xDomPoints[1].ControllingPawn != Other)
	{
		return;
	}
	P = Level.ControllerList;
	J0x87:

	// End:0x121 [Loop If]
	if(P != none)
	{
		Player = PlayerController(P);
		// End:0x10A
		if(((Player != none) && Player != Other) && Player.PlayerReplicationInfo.Team == Other.PlayerReplicationInfo.Team)
		{
			pick = Player.Pawn;
			// [Explicit Break]
			goto J0x121;
		}
		P = P.nextController;
		// [Loop Continue]
		goto J0x87;
	}
	J0x121:

	// End:0x162
	if(xDomPoints[0].ControllingPawn == Other)
	{
		xDomPoints[0].ControllingPawn = pick;
		xDomPoints[0].UpdateStatus();
	}
	// End:0x1A3
	if(xDomPoints[1].ControllingPawn == Other)
	{
		xDomPoints[1].ControllingPawn = pick;
		xDomPoints[1].UpdateStatus();
	}
	//return;	
}

function Logout(Controller Exiting)
{
	ClearControl(Exiting);
	super(DeathMatch).Logout(Exiting);
	//return;	
}

function ResetCount()
{
	local name Aversion;
	local Controller TeamMate;

	// End:0x15D
	if(ScoreCountDown < TimeToScore)
	{
		Aversion = AvertedSoundNames[1];
		// End:0x71
		if((TimeToScore - ScoreCountDown) > (TimeToScore / 2))
		{
			// End:0x60
			if((TimeToScore - ScoreCountDown) >= (TimeToScore - 1))
			{
				Aversion = AvertedSoundNames[3];				
			}
			else
			{
				Aversion = AvertedSoundNames[2];
			}			
		}
		else
		{
			// End:0xF7
			if((TimeToScore - ScoreCountDown) < 2)
			{
				TeamMate = Level.ControllerList;
				J0x98:

				// End:0xEA [Loop If]
				if(TeamMate != none)
				{
					// End:0xD3
					if(TeamMate.IsA('PlayerController'))
					{
						PlayerController(TeamMate).PlayAnnouncement(Sound'GameSounds.DDAverted', 2, true);
					}
					TeamMate = TeamMate.nextController;
					// [Loop Continue]
					goto J0x98;
				}
				ScoreCountDown = TimeToScore;
				return;
			}
		}
		TeamMate = Level.ControllerList;
		J0x10B:

		// End:0x15D [Loop If]
		if(TeamMate != none)
		{
			// End:0x146
			if(TeamMate.IsA('PlayerController'))
			{
				PlayerController(TeamMate).PlayStatusAnnouncement(Aversion, 2, true);
			}
			TeamMate = TeamMate.nextController;
			// [Loop Continue]
			goto J0x10B;
		}
	}
	ScoreCountDown = TimeToScore;
	//return;	
}

function bool CriticalPlayer(Controller Other)
{
	// End:0x72
	if((VSize(Other.Pawn.Location - xDomPoints[0].Location) <= float(1024)) || VSize(Other.Pawn.Location - xDomPoints[1].Location) <= float(1024))
	{
		return true;
	}
	return super.CriticalPlayer(Other);
	//return;	
}

function Killed(Controller Killer, Controller Killed, Pawn KilledPawn, Class<DamageType> DamageType)
{
	// End:0xA4
	if((((((Killer != none) && Killer.bIsPlayer) && Killed.bIsPlayer) && Killer.PlayerReplicationInfo.Team != Killed.PlayerReplicationInfo.Team) && xPawn(Killer.Pawn) != none) && DisabledCountDown > 0)
	{
		Killer.AwardAdrenaline(ADR_MinorBonus);
	}
	super(DeathMatch).Killed(Killer, Killed, KilledPawn, DamageType);
	//return;	
}

function GetServerDetails(out ServerResponseLine ServerState)
{
	super.GetServerDetails(ServerState);
	AddServerDetail(ServerState, "TimeToScore", string(TimeToScore));
	AddServerDetail(ServerState, "TimeDisabled", string(TimeDisabled));
	//return;	
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	local int i;

	super.FillPlayInfo(PlayInfo);
	PlayInfo.AddSetting("Game", "TimeToScore", default.DDomPropsDisplayText[i++], 40, 1, "Text", "3;0:60",,, true);
	PlayInfo.AddSetting("Game", "TimeDisabled", default.DDomPropsDisplayText[i++], 40, 1, "Text", "3;0:60",,, true);
	//return;	
}

static event string GetDescriptionText(string PropName)
{
	switch(PropName)
	{
		// End:0x1F
		case "TimeToScore":
			return default.DDomPropDescText[0];
		// End:0x38
		case "TImeDisabled":
			return default.DDomPropDescText[1];
		// End:0xFFFF
		default:
			return super.GetDescriptionText(PropName);
			break;
	}
	//return;	
}

function Actor FindSpecGoalFor(PlayerReplicationInfo PRI, int TeamIndex)
{
	local xPlayer PC;
	local xDOMLetter Dom[2], D;

	PC = xPlayer(PRI.Owner);
	// End:0x26
	if(PC == none)
	{
		return none;
	}
	// End:0x64
	foreach AllActors(Class'XGame.xDOMLetter', D)
	{
		// End:0x56
		if(xDomA(D) != none)
		{
			Dom[0] = D;
			// End:0x63
			continue;
		}
		Dom[1] = D;		
	}	
	// End:0xB9
	if(VSize(PC.Location - Dom[0].Location) < VSize(PC.Location - Dom[1].Location))
	{
		return Dom[1];		
	}
	else
	{
		return Dom[0];
	}
	return none;
	//return;	
}

event SetGrammar()
{
	LoadSRGrammar("DOM");
	//return;	
}

event Destroyed()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x48 [Loop If]
	if(i < 2)
	{
		// End:0x3E
		if(xDomPoints[i] != none)
		{
			xDomPoints[i].__ResetCount__Delegate = None;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	super(GameInfo).Destroyed();
	//return;	
}

state MatchInProgress
{
	function Timer()
	{
		local PlayerController TeamMate;
		local int i;

		super.Timer();
		// End:0x2F
		if((bGameEnded || xDomPoints[0] == none) || xDomPoints[1] == none)
		{
			return;
		}
		// End:0xD1
		if(DisabledCountDown > 0)
		{
			DisabledCountDown--;
			// End:0x79
			if(DisabledCountDown == 7)
			{
				// End:0x75
				foreach __NFUN_325__(Class'Engine.PlayerController', TeamMate)
				{
					TeamMate.PlayStatusAnnouncement('NewRoundIn', 1, true);					
				}								
			}
			else
			{
				// End:0xA2
				if((DisabledCountDown > 0) && DisabledCountDown < 6)
				{
					BroadcastLocalizedMessage(Class'UnrealGame.TimerMessage', DisabledCountDown);
				}
			}
			// End:0xD1
			if(DisabledCountDown == 0)
			{
				xDomPoints[0].ResetPoint(true);
				xDomPoints[1].ResetPoint(true);
			}
		}
		// End:0x110
		if((xDomPoints[0].ControllingTeam != xDomPoints[1].ControllingTeam) || xDomPoints[0].ControllingTeam == none)
		{
			return;
		}
		// End:0x162
		if(ScoreCountDown == TimeToScore)
		{
			// End:0x161
			foreach __NFUN_325__(Class'Engine.PlayerController', TeamMate)
			{
				TeamMate.PlayStatusAnnouncement(ControlSoundNames[xDomPoints[0].ControllingTeam.TeamIndex], 1, true);				
			}			
		}
		// End:0x18B
		if((ScoreCountDown > 0) && ScoreCountDown < 9)
		{
			BroadcastLocalizedMessage(Class'UnrealGame.TimerMessage', ScoreCountDown);
		}
		// End:0x19F
		if(ScoreCountDown > 0)
		{
			ScoreCountDown--;
			return;
		}
		// End:0x203
		foreach __NFUN_325__(Class'Engine.PlayerController', TeamMate)
		{
			TeamMate.PlayStatusAnnouncement(ScoreSoundNames[xDomPoints[0].ControllingTeam.TeamIndex], 1, true);
			TeamMate.ClientPlaySound(Class'UnrealGame.CTFMessage'.default.Riffs[Rand(3)]);			
		}		
		xDomPoints[0].ControllingTeam.Score += 1.0000000;
		xDomPoints[0].ControllingTeam.NetUpdateTime = Level.TimeSeconds - float(1);
		TeamScoreEvent(xDomPoints[0].ControllingTeam.TeamIndex, 1.0000000, "dom_teamscore");
		// End:0x38C
		if((xDomPoints[0].ControllingPawn != none) && xDomPoints[0].ControllingPawn.Controller != none)
		{
			xDomPoints[0].ControllingPawn.Controller.PlayerReplicationInfo.Score += 5.0000000;
			xDomPoints[0].ControllingPawn.Controller.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
			xDomPoints[0].ControllingPawn.Controller.AwardAdrenaline(ADR_Goal);
			ScoreEvent(xDomPoints[0].ControllingPawn.Controller.PlayerReplicationInfo, 5.0000000, "dom_score");
		}
		// End:0x494
		if((xDomPoints[1].ControllingPawn != none) && xDomPoints[1].ControllingPawn.Controller != none)
		{
			xDomPoints[1].ControllingPawn.Controller.PlayerReplicationInfo.Score += 5.0000000;
			xDomPoints[1].ControllingPawn.Controller.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
			xDomPoints[1].ControllingPawn.Controller.AwardAdrenaline(ADR_Goal);
			ScoreEvent(xDomPoints[1].ControllingPawn.Controller.PlayerReplicationInfo, 5.0000000, "dom_score");
		}
		ScoreCountDown = TimeToScore;
		DisabledCountDown = TimeDisabled;
		xDomPoints[0].ResetPoint(false);
		xDomPoints[1].ResetPoint(false);
		// End:0x52D
		if(GoalScore > 0)
		{
			i = 0;
			J0x4E0:

			// End:0x52D [Loop If]
			if(i < 2)
			{
				// End:0x523
				if(Teams[i].Score >= float(GoalScore))
				{
					EndGame(none, "teamscorelimit");
				}
				i++;
				// [Loop Continue]
				goto J0x4E0;
			}
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	TimeToScore=10
	TimeDisabled=10
	ScoreCountDown=10
	ControlSoundNames[0]="red_team_dominating"
	ControlSoundNames[1]="blue_team_dominating"
	ScoreSoundNames[0]="Red_Team_Scores"
	ScoreSoundNames[1]="Blue_Team_Scores"
	AvertedSoundNames[1]="Narrowly_Averted"
	AvertedSoundNames[2]="Narrowly_Averted"
	AvertedSoundNames[3]="Last_Second_Save"
	DDomPropsDisplayText[0]="Time To Score"
	DDomPropsDisplayText[1]="Time Disabled"
	DDomPropDescText[0]="Specifies how long domination points must be held to score a point."
	DDomPropDescText[1]="Specifies how long domination points are disabled after a point is scored."
	bScoreTeamKills=false
	bSpawnInTeamArea=true
	TeamAIType[0]=Class'UnrealGame.DOMTeamAI'
	TeamAIType[1]=Class'UnrealGame.DOMTeamAI'
	bMustHaveMultiplePlayers=false
	DefaultEnemyRosterClass="xGame.xTeamRoster"
	ADR_Kill=2.0000000
	HUDType="XInterface.HudCDoubleDomination"
	MapListType="XInterface.MapListDoubleDomination"
	MapPrefix="DOM"
	BeaconName="DOM"
	GoalScore=3
	DeathMessageClass=Class'XGame.xDeathMessage'
	OtherMesgGroup="DoubleDom"
	GameName="Double Domination"
	Description="Your team scores by capturing and holding both Control Points for ten seconds.  Control Points are captured by touching them.  After scoring, the Control Points reset to neutral."
	ScreenShotName="UT2004Thumbnails.DOMShots"
	DecoTextName="XGame.DoubleDom"
	Acronym="DOM2"
}
