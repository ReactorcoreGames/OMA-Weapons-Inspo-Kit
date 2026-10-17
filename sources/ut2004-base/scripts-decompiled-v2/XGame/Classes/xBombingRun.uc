class xBombingRun extends TeamGame
	config
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var globalconfig bool bBallDrainsTransloc;
var localized string BRPropText;
var localized string BRPropText2;
var localized string BRDescText;
var localized string BRDescText2;
var transient int TeamSpawnCount[2];
var xBombFlag Bomb;
var Sound NewRoundSound;
var float OldScore;
var(LoadingHints) private localized array<localized string> BRHints;

static function array<string> GetAllLoadHints(optional bool bThisClassOnly)
{
	local int i;
	local array<string> Hints;

	// End:0x25
	if(!bThisClassOnly || default.BRHints.Length == 0)
	{
		Hints = super.GetAllLoadHints();
	}
	i = 0;
	J0x2C:

	// End:0x5E [Loop If]
	if(i < default.BRHints.Length)
	{
		Hints[Hints.Length] = default.BRHints[i];
		i++;
		// [Loop Continue]
		goto J0x2C;
	}
	return Hints;
	//return;	
}

function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x75
	foreach DynamicActors(Class'XGame.xBombFlag', Bomb)
	{
		BombingRunTeamAI(Teams[0].AI).Bomb = Bomb;
		BombingRunTeamAI(Teams[1].AI).Bomb = Bomb;
		Bomb.bBallDrainsTransloc = bBallDrainsTransloc;		
	}	
	SetTeamBases();
	//return;	
}

function bool NearGoal(Controller C)
{
	return VSize(C.Pawn.Location - BombingRunTeamAI(Teams[C.PlayerReplicationInfo.Team.TeamIndex].AI).EnemyBase.Location) < float(1000);
	//return;	
}

static function PrecacheGameAnnouncements(AnnouncerVoice V, bool bRewardSounds)
{
	super.PrecacheGameAnnouncements(V, bRewardSounds);
	// End:0xA8
	if(!bRewardSounds)
	{
		V.PrecacheSound('NewRoundIn');
		V.PrecacheSound('BallReset');
		V.PrecacheSound('Red_Pass_Fumbled');
		V.PrecacheSound('Blue_Pass_Fumbled');
		V.PrecacheSound('Red_Team_on_Offence');
		V.PrecacheSound('Blue_Team_on_Offence');
		V.PrecacheSound('Last_Second_Save');
	}
	//return;	
}

simulated function UpdateAnnouncements()
{
	//return;	
}

static function int OrderToIndex(int Order)
{
	// End:0x0F
	if(Order == 2)
	{
		return 14;
	}
	return Order;
	//return;	
}

function GetServerDetails(out ServerResponseLine ServerState)
{
	super.GetServerDetails(ServerState);
	AddServerDetail(ServerState, "BallDrainsTranslocator", string(bBallDrainsTransloc));
	//return;	
}

static function PrecacheGameTextures(LevelInfo MyLevel)
{
	Class'XGame.xTeamGame'.static.PrecacheGameTextures(MyLevel);
	MyLevel.AddPrecacheMaterial(Texture'WeaponSkins.Skins.BallLauncherTex0');
	MyLevel.AddPrecacheMaterial(Texture'WeaponSkins.Skins.BallLauncherEnergy');
	MyLevel.AddPrecacheMaterial(Texture'WeaponSkins.Skins.BallLauncherLine');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.RedMarker_t');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.BlueMarker_t');
	MyLevel.AddPrecacheMaterial(Texture'XGameShaders.BRShaders.BombIconBLUE');
	MyLevel.AddPrecacheMaterial(Texture'XGameShaders.BRShaders.BombIconRED');
	MyLevel.AddPrecacheMaterial(Texture'XGameShaders.BRShaders.BombIconYELLOW');
	MyLevel.AddPrecacheMaterial(Texture'XGameShaders.BRShaders.BRBall');
	MyLevel.AddPrecacheMaterial(Texture'XGameTextures.BombDeliveryTex');
	//return;	
}

static function PrecacheGameStaticMeshes(LevelInfo MyLevel)
{
	Class'XGame.xDeathMatch'.static.PrecacheGameStaticMeshes(MyLevel);
	MyLevel.AddPrecacheStaticMesh(StaticMesh'XGame_rc.BombSpawnMesh');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'XGame_rc.BombEffectMesh');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'E_Pickups.BombBall.FullBomb');
	//return;	
}

function SetTeamBases()
{
	local xBombDelivery B;

	// End:0x34
	foreach AllActors(Class'XGame.xBombDelivery', B)
	{
		Teams[B.Team].HomeBase = B;		
	}	
	//return;	
}

function GameObject GetGameObject(name GameObjectName)
{
	assert((Bomb != none) && Bomb.IsA(GameObjectName));
	// End:0x3B
	if(Bomb.IsA(GameObjectName))
	{
		return Bomb;
	}
	return super(UnrealMPGameInfo).GetGameObject(GameObjectName);
	//return;	
}

function Logout(Controller Exiting)
{
	// End:0x55
	if(xBombFlag(Exiting.PlayerReplicationInfo.HasFlag) != none)
	{
		xBombFlag(Exiting.PlayerReplicationInfo.HasFlag).Drop(vect(0.0000000, 0.0000000, 0.0000000));
	}
	super(DeathMatch).Logout(Exiting);
	//return;	
}

function DiscardInventory(Pawn Other)
{
	// End:0x0D
	if(Other == none)
	{
		return;
	}
	// End:0x7B
	if((Other.PlayerReplicationInfo != none) && Other.PlayerReplicationInfo.HasFlag != none)
	{
		xBombFlag(Other.PlayerReplicationInfo.HasFlag).Drop(0.5000000 * Other.Velocity);
	}
	super(GameInfo).DiscardInventory(Other);
	//return;	
}

function ScoreGameObject(Controller C, GameObject GO)
{
	super(UnrealMPGameInfo).ScoreGameObject(C, GO);
	// End:0x39
	if(GO.IsA('xBombFlag'))
	{
		ScoreBomb(C, xBombFlag(GO));
	}
	//return;	
}

function ScoreBomb(Controller Scorer, xBombFlag theFlag)
{
	local bool ThrowingScore;
	local int i;
	local float ppp, numtouch, maxpoints, maxper;
	local Controller C;

	Bomb = theFlag;
	// End:0x27
	if(ResetCountDown > 0)
	{
		theFlag.SendHome();
		return;
	}
	// End:0x88
	foreach __NFUN_325__(Class'Engine.Controller', C)
	{
		// End:0x87
		if((C.Pawn != none) && C.Pawn.IsA('RedeemerWarhead'))
		{
			C.Pawn.Fire(0.0000000);
		}		
	}	
	// End:0xAE
	if(Scorer.PlayerReplicationInfo.HasFlag == none)
	{
		ThrowingScore = true;
	}
	// End:0xF9
	if((Scorer.Pawn != none) && Scorer.Pawn.Weapon.IsA('BallLauncher'))
	{
		Scorer.ClientSwitchToBestWeapon();
	}
	theFlag.Instigator = none;
	IncrementGoalsScored(Scorer.PlayerReplicationInfo);
	OldScore = Scorer.PlayerReplicationInfo.Team.Score;
	// End:0x241
	if(ThrowingScore)
	{
		Scorer.PlayerReplicationInfo.Team.Score += 3.0000000;
		Scorer.PlayerReplicationInfo.Team.NetUpdateTime = Level.TimeSeconds - float(1);
		TeamScoreEvent(Scorer.PlayerReplicationInfo.Team.TeamIndex, 3.0000000, "ball_tossed");
		Scorer.PlayerReplicationInfo.Score += float(2);
		maxpoints = 10.0000000;
		maxper = 2.0000000;
		ScoreEvent(Scorer.PlayerReplicationInfo, 5.0000000, "ball_thrown_final");		
	}
	else
	{
		Scorer.PlayerReplicationInfo.Team.Score += 7.0000000;
		Scorer.PlayerReplicationInfo.Team.NetUpdateTime = Level.TimeSeconds - float(1);
		TeamScoreEvent(Scorer.PlayerReplicationInfo.Team.TeamIndex, 7.0000000, "ball_carried");
		Scorer.PlayerReplicationInfo.Score += float(5);
		maxpoints = 20.0000000;
		maxper = 5.0000000;
		ScoreEvent(Scorer.PlayerReplicationInfo, 5.0000000, "ball_cap_final");
	}
	Scorer.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
	numtouch = 0.0000000;
	i = 0;
	J0x36E:

	// End:0x401 [Loop If]
	if(i < theFlag.Assists.Length)
	{
		// End:0x3F7
		if((theFlag.Assists[i] != none) && theFlag.Assists[i].PlayerReplicationInfo.Team == Scorer.PlayerReplicationInfo.Team)
		{
			numtouch = numtouch + 1.0000000;
		}
		i++;
		// [Loop Continue]
		goto J0x36E;
	}
	ppp = maxpoints / numtouch;
	// End:0x42D
	if(ppp < 1.0000000)
	{
		ppp = 1.0000000;
	}
	// End:0x447
	if(ppp > maxper)
	{
		ppp = maxper;
	}
	i = 0;
	J0x44E:

	// End:0x53B [Loop If]
	if(i < theFlag.Assists.Length)
	{
		// End:0x531
		if((theFlag.Assists[i] != none) && theFlag.Assists[i].PlayerReplicationInfo.Team == Scorer.PlayerReplicationInfo.Team)
		{
			ScoreEvent(theFlag.Assists[i].PlayerReplicationInfo, ppp, "ball_score_assist");
			theFlag.Assists[i].PlayerReplicationInfo.Score += float(int(ppp));
		}
		i++;
		// [Loop Continue]
		goto J0x44E;
	}
	Scorer.AwardAdrenaline(ADR_Goal);
	BroadcastLocalizedMessage(Class'XGame.xBombMessage', 0, Scorer.PlayerReplicationInfo, none, none);
	AnnounceScore(Scorer.PlayerReplicationInfo.Team.TeamIndex);
	// End:0x60B
	if((bOverTime || GoalScore != 0) && Teams[Scorer.PlayerReplicationInfo.Team.TeamIndex].Score >= float(GoalScore))
	{
		EndGame(Scorer.PlayerReplicationInfo, "teamscorelimit");		
	}
	else
	{
		// End:0x633
		if(bOverTime)
		{
			EndGame(Scorer.PlayerReplicationInfo, "timelimit");
		}
	}
	ResetCountDown = ResetTimeDelay + 1;
	// End:0x65C
	if(bGameEnded)
	{
		theFlag.Score();		
	}
	else
	{
		theFlag.SendHomeDisabled(float(ResetTimeDelay));
	}
	//return;	
}

function AnnounceScore(int ScoringTeam)
{
	local PlayerController C;
	local name ScoreSound;
	local int OtherTeam;

	// End:0x15
	if(ScoringTeam == 1)
	{
		OtherTeam = 0;		
	}
	else
	{
		OtherTeam = 1;
	}
	// End:0x8F
	if(OldScore <= Teams[OtherTeam].Score)
	{
		// End:0x7B
		if(Teams[ScoringTeam].Score > Teams[OtherTeam].Score)
		{
			ScoreSound = TakeLeadName[ScoringTeam];			
		}
		else
		{
			ScoreSound = CaptureSoundName[ScoringTeam];
		}		
	}
	else
	{
		// End:0xC7
		if(OldScore <= (Teams[OtherTeam].Score + float(3)))
		{
			ScoreSound = IncreaseLeadName[ScoringTeam];			
		}
		else
		{
			ScoreSound = CaptureSoundName[ScoringTeam];
		}
	}
	// End:0x100
	foreach __NFUN_325__(Class'Engine.PlayerController', C)
	{
		C.PlayStatusAnnouncement(ScoreSound, 1, true);		
	}	
	//return;	
}

function Actor FindSpecGoalFor(PlayerReplicationInfo PRI, int TeamIndex)
{
	local xPlayer PC;
	local Controller C;
	local xBombFlag B;

	PC = xPlayer(PRI.Owner);
	// End:0x26
	if(PC == none)
	{
		return none;
	}
	// End:0x7A
	foreach __NFUN_325__(Class'Engine.Controller', C)
	{
		// End:0x79
		if((C.PlayerReplicationInfo != none) && C.PlayerReplicationInfo.HasFlag != none)
		{			
			return C.Pawn;
		}		
	}	
	// End:0x93
	foreach AllActors(Class'XGame.xBombFlag', B)
	{		
		return B;		
	}	
	return none;
	//return;	
}

static function FillPlayInfo(PlayInfo Pi)
{
	super.FillPlayInfo(Pi);
	Pi.AddSetting(default.RulesGroup, "bBallDrainsTransloc", default.BRPropText2, 40, 0, "Check",,,, true);
	//return;	
}

static event string GetDescriptionText(string PropName)
{
	switch(PropName)
	{
		// End:0x25
		case "bBallDrainsTransloc":
			return default.BRDescText2;
		// End:0xFFFF
		default:
			return super.GetDescriptionText(PropName);
			break;
	}
	//return;	
}

function int BallCarrierMessage()
{
	return 15;
	//return;	
}

event SetGrammar()
{
	LoadSRGrammar("BR");
	//return;	
}

state MatchInProgress
{
	function Timer()
	{
		local Controller C;
		local PlayerController PC;
		local Projectile proj;
		local Inventory Inv;

		super.Timer();
		// End:0x4D6
		if(ResetCountDown > 0)
		{
			ResetCountDown--;
			// End:0x86
			if(ResetCountDown < 3)
			{
				// End:0x85
				foreach __NFUN_325__(Class'Engine.Controller', C)
				{
					// End:0x84
					if((C.Pawn != none) && C.Pawn.IsA('RedeemerWarhead'))
					{
						C.Pawn.Fire(1.0000000);
					}					
				}				
			}
			// End:0xBE
			if(ResetCountDown == 8)
			{
				// End:0xBA
				foreach __NFUN_325__(Class'Engine.PlayerController', PC)
				{
					PC.PlayStatusAnnouncement('NewRoundIn', 1, true);					
				}								
			}
			else
			{
				// End:0xED
				if((ResetCountDown > 1) && ResetCountDown < 7)
				{
					BroadcastLocalizedMessage(Class'UnrealGame.TimerMessage', ResetCountDown - 1);					
				}
				else
				{
					// End:0x4D3
					if(ResetCountDown == 1)
					{
						Teams[0].AI.ClearEnemies();
						Teams[1].AI.ClearEnemies();
						// End:0x49E
						foreach __NFUN_325__(Class'Engine.Controller', C)
						{
							// End:0x49D
							if((C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator)
							{
								C.StartSpot = FindPlayerStart(C, byte(C.PlayerReplicationInfo.Team.TeamIndex));
								// End:0x205
								if(C.StartSpot != none)
								{
									C.SetLocation(C.StartSpot.Location);
									C.SetRotation(C.StartSpot.Rotation);
								}
								// End:0x44C
								if(C.Pawn != none)
								{
									// End:0x2ED
									if(xPawn(C.Pawn) != none)
									{
										// End:0x28B
										if(xPawn(C.Pawn).CurrentCombo != none)
										{
											C.Adrenaline = 0.0000000;
											xPawn(C.Pawn).CurrentCombo.Destroy();
										}
										// End:0x2ED
										if(xPawn(C.Pawn).UDamageTimer != none)
										{
											xPawn(C.Pawn).UDamageTimer.Destroy();
											xPawn(C.Pawn).DisableUDamage();
										}
									}
									C.Pawn.Health = Max(C.Pawn.Health, int(C.Pawn.HealthMax));
									SetPlayerDefaults(C.Pawn);
									C.Pawn.SetLocation(C.StartSpot.Location);
									C.Pawn.SetRotation(C.StartSpot.Rotation);
									C.Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
									C.Pawn.PlayTeleportEffect(false, true);
									Inv = C.Pawn.Inventory;
									J0x3FF:

									// End:0x44C [Loop If]
									if(Inv != none)
									{
										// End:0x435
										if(Inv.IsA('Translauncher'))
										{
											Weapon(Inv).GiveAmmo(0, none, false);
										}
										Inv = Inv.Inventory;
										// [Loop Continue]
										goto J0x3FF;
									}
								}
								// End:0x49D
								if(C.StartSpot != none)
								{
									C.ClientSetLocation(C.StartSpot.Location, C.StartSpot.Rotation);
								}
							}							
						}						
						// End:0x4BC
						foreach DynamicActors(Class'Engine.Projectile', proj)
						{
							proj.Destroy();							
						}						
						Bomb.SendHome();
						ResetCountDown = 0;
					}
				}
			}			
		}
		else
		{
			// End:0x4F6
			if(Bomb == none)
			{
				// End:0x4F5
				foreach DynamicActors(Class'XGame.xBombFlag', Bomb)
				{
					// End:0x4F5
					break;					
				}				
			}
			// End:0x528
			if(Bomb != none)
			{
				GameReplicationInfo.FlagPos = Bomb.Position().Location;
			}
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	bBallDrainsTransloc=true
	BRPropText="Delay ball contact"
	BRPropText2="BallLauncher drains Translocator"
	BRDescText="If checked, a player must wait a few seconds after throwing the ball before picking it up again."
	BRDescText2="If checked, a player must wait a few seconds after throwing the ball before being able to translocate (or until someone else catches or picks up the ball)."
	BRHints[0]="You can use %BASEPATH 0% to see the path to the Red Team base and %BASEPATH 1% to see the path to the Blue Team base."
	BRHints[1]="Firing the translocator sends out your translocator beacon.  Pressing %FIRE% again returns the beacon, while pressing %A:TFIRE% teleports you instantly to the beacon's location (if you fit)."
	BRHints[2]="While carrying the ball, you can target teammates by pressing %ALTFIRE%.  Pressing %FIRE% will pass the ball to the targeted teammate."
	BRHints[3]="Pressing %SWITCHWEAPON 10% after tossing the Translocator allows you to view from its internal camera."
	BRHints[4]="Pressing %FIRE% while your %ALTFIRE% is still held down after teleporting with the translocator will switch you back to your previous weapon."
	bScoreTeamKills=false
	bSpawnInTeamArea=true
	TeamAIType[0]=Class'UnrealGame.BombingRunTeamAI'
	TeamAIType[1]=Class'UnrealGame.BombingRunTeamAI'
	bAllowTrans=true
	bDefaultTranslocator=true
	bMustHaveMultiplePlayers=false
	DefaultEnemyRosterClass="xGame.xTeamRoster"
	ADR_Kill=2.0000000
	HUDType="XInterface.HudCBombingRun"
	MapListType="XInterface.MapListBombingRun"
	MapPrefix="BR"
	BeaconName="BR"
	ResetTimeDelay=11
	GoalScore=15
	DeathMessageClass=Class'XGame.xDeathMessage'
	OtherMesgGroup="BombingRun"
	GameName="Bombing Run"
	Description="Each level has a ball that starts in the middle of the playing field.  Your team scores by getting the ball through the enemy team's hoop.  You score 7 points for jumping through the hoop while holding the ball, and 3 points for tossing the ball through the hoop.  The ball can be passed to teammates, and is dropped if the player carrying it is killed."
	ScreenShotName="UT2004Thumbnails.BRShots"
	DecoTextName="XGame.BombingRun"
	Acronym="BR"
}
