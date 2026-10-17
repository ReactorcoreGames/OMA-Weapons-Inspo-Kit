class Controller extends Actor
	abstract
	native
	nativereplication
	config(User)
	notplaceable;

const LATENT_MOVETOWARD = 503;

var Pawn Pawn;
var const int PlayerNum;
var float SightCounter;
var float FovAngle;
var globalconfig float Handedness;
var bool bIsPlayer;
var bool bGodMode;
var const bool bLOSflag;
var bool bAdvancedTactics;
var bool bCanOpenDoors;
var bool bCanDoSpecial;
var bool bAdjusting;
var bool bPreparingMove;
var bool bControlAnimations;
var bool bEnemyInfoValid;
var bool bNotifyApex;
var bool bUsePlayerHearing;
var bool bJumpOverWall;
var bool bEnemyAcquired;
var bool bSoaking;
var bool bHuntPlayer;
var bool bAllowedToTranslocate;
var bool bAllowedToImpactJump;
var bool bAdrenalineEnabled;
var bool bNotifyFallingHitWall;
var bool bSlowerZAcquire;
var bool bInDodgeMove;
var bool bVehicleTransition;
var bool bForceStrafe;
var bool bNotifyPostLanded;
var input byte bRun;
var input byte bDuck;
var input byte bFire;
var input byte bAltFire;
var input byte bVoiceTalk;
var Vector AdjustLoc;
var const Controller nextController;
var float Stimulus;
var float MoveTimer;
var Actor MoveTarget;
var Vector Destination;
var Vector FocalPoint;
var Actor Focus;
var float FocusLead;
var Mover PendingMover;
var Actor GoalList[4];
var NavigationPoint home;
var float MinHitWall;
var float RespawnPredictionTime;
var float DodgeToGoalPct;
var int AcquisitionYawRate;
var float DodgeLandZ;
var Vehicle LastBlockingVehicle;
var Pawn Enemy;
var Actor Target;
var Vector LastSeenPos;
var Vector LastSeeingPos;
var float LastSeenTime;
var string VoiceType;
var float OldMessageTime;
var Actor RouteCache[16];
var ReachSpec CurrentPath;
var ReachSpec NextRoutePath;
var Vector CurrentPathDir;
var Actor RouteGoal;
var float RouteDist;
var float LastRouteFind;
var Vector DirectionHint;
var() Class<PlayerReplicationInfo> PlayerReplicationInfoClass;
var PlayerReplicationInfo PlayerReplicationInfo;
var Class<Pawn> PawnClass;
var Class<Pawn> PreviousPawnClass;
var float GroundPitchTime;
var Vector ViewX;
var Vector ViewY;
var Vector ViewZ;
var NavigationPoint StartSpot;
var Vector MonitorStartLoc;
var Pawn MonitoredPawn;
var float MonitorMaxDistSq;
var AvoidMarker FearSpots[10];
var float WarningDelay;
var Projectile WarningProjectile;
var Pawn ShotTarget;
var const Actor LastFailedReach;
var const float FailedReachTime;
var const Vector FailedReachLocation;
var float Adrenaline;
var float AdrenalineMax;
var Class<Weapon> LastPawnWeapon;
var float SPCTimeStamp;

replication
{
	// Pos:0x078
	unreliable if(int(Role) < int(ROLE_Authority))
		SendVoiceMessage, SetPawnClass;

	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		Pawn, PlayerReplicationInfo;

	// Pos:0x018
	reliable if((bNetDirty && int(Role) == int(ROLE_Authority)) && bNetOwner)
		Adrenaline, PawnClass, 
		bAdrenalineEnabled;

	// Pos:0x03B
	reliable if(int(RemoteRole) == int(ROLE_AutonomousProxy))
		ClientDying, ClientGameEnded, 
		ClientRoundEnded, ClientSetLocation, 
		ClientSetRotation, ClientSetWeapon, 
		ClientSwitchToBestWeapon;

	// Pos:0x048
	reliable if((!bDemoRecording || bClientDemoRecording && bClientDemoNetFunc) && int(Role) == int(ROLE_Authority))
		ClientVoiceMessage;

	// Pos:0x085
	reliable if(int(Role) < int(ROLE_Authority))
		ServerReStartPlayer;
}

// Export UController::execMoveTo(FFrame&, void* const)
native(500) final latent function MoveTo(Vector NewDestination, optional Actor ViewFocus, optional bool bShouldWalk);

// Export UController::execMoveToward(FFrame&, void* const)
native(502) final latent function MoveToward(Actor NewTarget, optional Actor ViewFocus, optional float DestinationOffset, optional bool bUseStrafing, optional bool bShouldWalk);

// Export UController::execFinishRotation(FFrame&, void* const)
native(508) final latent function FinishRotation();

// Export UController::execLineOfSightTo(FFrame&, void* const)
native(514) final function bool LineOfSightTo(Actor Other);

// Export UController::execCanSee(FFrame&, void* const)
native(533) final function bool CanSee(Pawn Other);

// Export UController::execFindPathTo(FFrame&, void* const)
native(518) final function Actor FindPathTo(Vector aPoint);

// Export UController::execFindPathToward(FFrame&, void* const)
native(517) final function Actor FindPathToward(Actor anActor, optional bool bWeightDetours);

// Export UController::execFindPathToIntercept(FFrame&, void* const)
native final function Actor FindPathToIntercept(Pawn P, Actor RouteGoal, optional bool bWeightDetours);

// Export UController::execFindPathTowardNearest(FFrame&, void* const)
native final function Actor FindPathTowardNearest(Class<NavigationPoint> GoalClass, optional bool bWeightDetours);

// Export UController::execFindRandomDest(FFrame&, void* const)
native(525) final function NavigationPoint FindRandomDest();

// Export UController::execEAdjustJump(FFrame&, void* const)
native(523) final function Vector EAdjustJump(float BaseZ, float XYSpeed);

// Export UController::execpointReachable(FFrame&, void* const)
native(521) final function bool pointReachable(Vector aPoint);

// Export UController::execactorReachable(FFrame&, void* const)
native(520) final function bool actorReachable(Actor anActor);

// Export UController::execPickWallAdjust(FFrame&, void* const)
native(526) final function bool PickWallAdjust(Vector HitNormal);

// Export UController::execWaitForLanding(FFrame&, void* const)
native(527) final latent function WaitForLanding();

// Export UController::execFindBestInventoryPath(FFrame&, void* const)
native(540) final function Actor FindBestInventoryPath(out float MinWeight);

// Export UController::execFindBestSuperPickup(FFrame&, void* const)
native final function Actor FindBestSuperPickup(float MaxDist);

// Export UController::execAddController(FFrame&, void* const)
native(529) final function AddController();

// Export UController::execRemoveController(FFrame&, void* const)
native(530) final function RemoveController();

// Export UController::execPickTarget(FFrame&, void* const)
native(531) final function Pawn PickTarget(out float bestAim, out float BestDist, Vector FireDir, Vector projStart, float MaxRange);

// Export UController::execPickAnyTarget(FFrame&, void* const)
native(534) final function Actor PickAnyTarget(out float bestAim, out float BestDist, Vector FireDir, Vector projStart);

// Export UController::execInLatentExecution(FFrame&, void* const)
native final function bool InLatentExecution(int LatentActionNumber);

// Export UController::execStopWaiting(FFrame&, void* const)
native function StopWaiting();

// Export UController::execEndClimbLadder(FFrame&, void* const)
native function EndClimbLadder();

// Export UController::execCanMakePathTo(FFrame&, void* const)
native final function bool CanMakePathTo(Actor A);

event MayFall()
{
	//return;	
}

event MayDodgeToMoveTarget()
{
	//return;	
}

event MissedDodge()
{
	//return;	
}

function PendingStasis()
{
	bStasis = true;
	Pawn = none;
	//return;	
}

function AwardAdrenaline(float Amount)
{
	// End:0x2E
	if(bAdrenalineEnabled)
	{
		Adrenaline += Amount;
		Adrenaline = float(Clamp(int(Adrenaline), 0, int(AdrenalineMax)));
	}
	//return;	
}

function bool NeedsAdrenaline()
{
	return ((Pawn != none) && !Pawn.InCurrentCombo()) && Adrenaline < AdrenalineMax;
	//return;	
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	local string DebugString;

	// End:0x22
	if(Pawn == none)
	{
		super.DisplayDebug(Canvas, YL, YPos);
		return;
	}
	Canvas.SetDrawColor(byte(255), 0, 0);
	Canvas.DrawText((((("CONTROLLER " $ (GetItemName(string(self)))) $ " Pawn ") $ (GetItemName(string(Pawn)))) $ " viewpitch ") $ string(Rotation.Pitch));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	// End:0x119
	if(Enemy != none)
	{
		Canvas.DrawText((((("     STATE: " $ string(GetStateName())) $ " Timer: ") $ string(TimerCounter)) $ " Enemy ") $ Enemy.GetHumanReadableName(), false);		
	}
	else
	{
		Canvas.DrawText(((("     STATE: " $ string(GetStateName())) $ " Timer: ") $ string(TimerCounter)) $ " NO Enemy ", false);
	}
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	// End:0x1C1
	if(MonitoredPawn != none)
	{
		DebugString $= ("     MonitoredPawn: " @ MonitoredPawn.GetHumanReadableName());		
	}
	else
	{
		DebugString $= "     MonitoredPawn: None";
	}
	// End:0x21B
	if(Target != none)
	{
		DebugString $= ("     Target: " @ Target.GetHumanReadableName());		
	}
	else
	{
		DebugString $= "     Target: None";
	}
	Canvas.DrawText(DebugString);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	// End:0x2A7
	if(PlayerReplicationInfo == none)
	{
		Canvas.DrawText("     NO PLAYERREPLICATIONINFO", false);		
	}
	else
	{
		PlayerReplicationInfo.DisplayDebug(Canvas, YL, YPos);
	}
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	//return;	
}

simulated function string GetHumanReadableName()
{
	// End:0x1A
	if(PlayerReplicationInfo != none)
	{
		return PlayerReplicationInfo.PlayerName;
	}
	return GetItemName(string(self));
	//return;	
}

simulated function Rotator GetViewRotation()
{
	return Rotation;
	//return;	
}

function Reset()
{
	super.Reset();
	Enemy = none;
	LastSeenTime = 0.0000000;
	StartSpot = none;
	Adrenaline = 0.0000000;
	bAdjusting = false;
	bPreparingMove = false;
	bJumpOverWall = false;
	bEnemyAcquired = false;
	bHuntPlayer = false;
	bInDodgeMove = false;
	MoveTimer = -1.0000000;
	MoveTarget = none;
	PendingMover = none;
	CurrentPath = none;
	RouteGoal = none;
	MonitoredPawn = none;
	WarningProjectile = none;
	//return;	
}

function bool AvoidCertainDeath()
{
	return false;
	//return;	
}

function ClientSetLocation(Vector NewLocation, Rotator NewRotation)
{
	SetRotation(NewRotation);
	// End:0x8B
	if((Rotation.Pitch > RotationRate.Pitch) && Rotation.Pitch < (65536 - RotationRate.Pitch))
	{
		// End:0x6F
		if(Rotation.Pitch < 32768)
		{
			NewRotation.Pitch = RotationRate.Pitch;			
		}
		else
		{
			NewRotation.Pitch = 65536 - RotationRate.Pitch;
		}
	}
	// End:0xC4
	if(Pawn != none)
	{
		NewRotation.Roll = 0;
		Pawn.SetRotation(NewRotation);
		Pawn.SetLocation(NewLocation);
	}
	//return;	
}

function ClientSetRotation(Rotator NewRotation)
{
	SetRotation(NewRotation);
	// End:0x3C
	if(Pawn != none)
	{
		NewRotation.Pitch = 0;
		NewRotation.Roll = 0;
		Pawn.SetRotation(NewRotation);
	}
	//return;	
}

function ClientDying(Class<DamageType> DamageType, Vector HitLocation)
{
	// End:0x34
	if(Pawn != none)
	{
		Pawn.PlayDying(DamageType, HitLocation);
		Pawn.GotoState('Dying');
	}
	//return;	
}

event AIHearSound(Actor Actor, int Id, Sound S, Vector SoundLocation, Vector Parameters, bool Attenuate)
{
	//return;	
}

event SoakStop(string problem)
{
	//return;	
}

function Possess(Pawn aPawn)
{
	aPawn.PossessedBy(self);
	Pawn = aPawn;
	// End:0xA0
	if(PlayerReplicationInfo != none)
	{
		// End:0x81
		if((Vehicle(Pawn) != none) && Vehicle(Pawn).Driver != none)
		{
			PlayerReplicationInfo.bIsFemale = Vehicle(Pawn).Driver.bIsFemale;			
		}
		else
		{
			PlayerReplicationInfo.bIsFemale = Pawn.bIsFemale;
		}
	}
	FocalPoint = Pawn.Location + (float(512) * Vector(Pawn.Rotation));
	Restart();
	//return;	
}

function UnPossess()
{
	// End:0x1A
	if(Pawn != none)
	{
		Pawn.UnPossessed();
	}
	Pawn = none;
	//return;	
}

function WasKilledBy(Controller Other)
{
	//return;	
}

function Class<Weapon> GetLastWeapon()
{
	// End:0x27
	if((Pawn == none) || Pawn.Weapon == none)
	{
		return LastPawnWeapon;
	}
	return Pawn.Weapon.Class;
	//return;	
}

function PawnDied(Pawn P)
{
	// End:0x11
	if(Pawn != P)
	{
		return;
	}
	// End:0x36
	if(bPendingDelete)
	{
		// End:0x34
		if(Pawn != none)
		{
			Pawn.UnPossessed();
		}
		return;
	}
	// End:0x7E
	if(Pawn != none)
	{
		// End:0x5E
		if(Pawn.InCurrentCombo())
		{
			Adrenaline = 0.0000000;
		}
		SetLocation(Pawn.Location);
		Pawn.UnPossessed();
	}
	Pawn = none;
	PendingMover = none;
	// End:0xBB
	if(bIsPlayer)
	{
		// End:0xB8
		if(!IsInState('GameEnded') && !IsInState('RoundEnded'))
		{
			GotoState('Dead');
		}		
	}
	else
	{
		Destroy();
	}
	//return;	
}

function Restart()
{
	Enemy = none;
	//return;	
}

event LongFall()
{
	//return;	
}

event bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
{
	//return;	
}

event bool NotifyHeadVolumeChange(PhysicsVolume NewVolume)
{
	//return;	
}

event bool NotifyLanded(Vector HitNormal)
{
	//return;	
}

event NotifyPostLanded()
{
	//return;	
}

event bool NotifyHitWall(Vector HitNormal, Actor Wall)
{
	//return;	
}

event NotifyFallingHitWall(Vector HitNormal, Actor Wall)
{
	//return;	
}

event bool NotifyBump(Actor Other)
{
	//return;	
}

event NotifyHitMover(Vector HitNormal, Mover Wall)
{
	//return;	
}

event NotifyJumpApex()
{
	//return;	
}

event NotifyMissedJump()
{
	//return;	
}

function SetDoubleJump()
{
	//return;	
}

function NotifyAddInventory(Inventory NewItem)
{
	//return;	
}

function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, Class<DamageType> DamageType, Vector Momentum)
{
	// End:0x2E
	if((instigatedBy != none) && instigatedBy != Pawn)
	{
		damageAttitudeTo(instigatedBy, float(Damage));
	}
	//return;	
}

function SetFall()
{
	//return;	
}

function PawnIsInPain(PhysicsVolume PainVolume)
{
	//return;	
}

event PreBeginPlay()
{
	AddController();
	super.PreBeginPlay();
	// End:0x14
	if(bDeleteMe)
	{
		return;
	}
	SightCounter = 0.2000000 * FRand();
	//return;	
}

event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x67
	if((!bDeleteMe && bIsPlayer) && int(Level.NetMode) != int(NM_Client))
	{
		PlayerReplicationInfo = Spawn(PlayerReplicationInfoClass, self,, vect(0.0000000, 0.0000000, 0.0000000), rot(0, 0, 0));
		InitPlayerReplicationInfo();
	}
	//return;	
}

function InitPlayerReplicationInfo()
{
	// End:0x32
	if(PlayerReplicationInfo.PlayerName == "")
	{
		PlayerReplicationInfo.SetPlayerName(Class'Engine.GameInfo'.default.DefaultPlayerName);
	}
	PlayerReplicationInfo.bNoTeam = !Level.Game.bTeamGame;
	//return;	
}

simulated function int GetTeamNum()
{
	// End:0x24
	if((PlayerReplicationInfo == none) || PlayerReplicationInfo.Team == none)
	{
		return 255;
	}
	return PlayerReplicationInfo.Team.TeamIndex;
	//return;	
}

function bool SameTeamAs(Controller C)
{
	// End:0x0D
	if(C == none)
	{
		return false;
	}
	return Level.Game.IsOnTeam(C, GetTeamNum());
	//return;	
}

function HandlePickup(Pickup pick)
{
	// End:0x6D
	if(MoveTarget == pick)
	{
		// End:0x62
		if(pick.myMarker != none)
		{
			MoveTarget = pick.myMarker;
			Pawn.Anchor = pick.myMarker;
			MoveTimer = 0.5000000;			
		}
		else
		{
			MoveTimer = -1.0000000;
		}
	}
	//return;	
}

simulated event Destroyed()
{
	// End:0x18
	if(int(Role) < int(ROLE_Authority))
	{
		super.Destroyed();
		return;
	}
	RemoveController();
	// End:0x53
	if(bIsPlayer && Level.Game != none)
	{
		Level.Game.Logout(self);
	}
	// End:0xAD
	if(PlayerReplicationInfo != none)
	{
		// End:0xA1
		if(!PlayerReplicationInfo.bOnlySpectator && PlayerReplicationInfo.Team != none)
		{
			PlayerReplicationInfo.Team.RemoveFromTeam(self);
		}
		PlayerReplicationInfo.Destroy();
	}
	super.Destroyed();
	//return;	
}

event bool AllowDetourTo(NavigationPoint N)
{
	return true;
	//return;	
}

function AdjustView(float DeltaTime)
{
	local PlayerController C;

	// End:0x2C
	foreach __NFUN_325__(Class'Engine.PlayerController', C)
	{
		// End:0x2B
		if(C.ViewTarget == Pawn)
		{			
			return;
		}		
	}	
	Pawn.bUpdateEyeheight = false;
	Pawn.EyeHeight = Pawn.BaseEyeHeight;
	//return;	
}

function bool WantsSmoothedView()
{
	return ((Pawn != none) && (int(Pawn.Physics) == int(1)) || int(Pawn.Physics) == int(9)) && !Pawn.bJustLanded;
	//return;	
}

function GameHasEnded()
{
	// End:0x1C
	if(Pawn != none)
	{
		Pawn.bNoWeaponFiring = true;
	}
	GotoState('GameEnded');
	//return;	
}

function ClientGameEnded()
{
	GotoState('GameEnded');
	//return;	
}

function RoundHasEnded()
{
	// End:0x1C
	if(Pawn != none)
	{
		Pawn.bNoWeaponFiring = true;
	}
	GotoState('RoundEnded');
	//return;	
}

function ClientRoundEnded()
{
	GotoState('RoundEnded');
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	//return;	
}

function int GetFacingDirection()
{
	return 0;
	//return;	
}

function byte GetMessageIndex(name PhraseName)
{
	return 0;
	//return;	
}

function SendMessage(PlayerReplicationInfo Recipient, name messagetype, byte MessageID, float Wait, name BroadcastType)
{
	SendVoiceMessage(PlayerReplicationInfo, Recipient, messagetype, MessageID, BroadcastType);
	//return;	
}

function bool AllowVoiceMessage(name messagetype)
{
	// End:0x23
	if((Level.TimeSeconds - OldMessageTime) < float(10))
	{
		return false;		
	}
	else
	{
		OldMessageTime = Level.TimeSeconds;
	}
	return true;
	//return;	
}

function SendVoiceMessage(PlayerReplicationInfo Sender, PlayerReplicationInfo Recipient, name messagetype, byte MessageID, name BroadcastType)
{
	local Controller P;

	// End:0x2D
	if(((Recipient == none) || AIController(self) == none) && !AllowVoiceMessage(messagetype))
	{
		return;
	}
	// End:0x25A
	foreach __NFUN_325__(Class'Engine.Controller', P)
	{
		// End:0x55
		if(P.PlayerReplicationInfo == none)
		{
			continue;			
		}
		// End:0x209
		if(PlayerController(P) != none)
		{
			// End:0x111
			if((P.PlayerReplicationInfo == Sender) || (P.PlayerReplicationInfo == Recipient) && (Level.Game.BroadcastHandler == none) || Level.Game.BroadcastHandler.AcceptBroadcastSpeech(PlayerController(P), Sender))
			{
				P.ClientVoiceMessage(Sender, Recipient, messagetype, MessageID);				
			}
			else
			{
				// End:0x206
				if((Recipient == none) || int(Level.NetMode) == int(NM_Standalone))
				{
					// End:0x206
					if(((BroadcastType == 'Global') || !Level.Game.bTeamGame) || Sender.Team == P.PlayerReplicationInfo.Team)
					{
						// End:0x206
						if((Level.Game.BroadcastHandler == none) || Level.Game.BroadcastHandler.AcceptBroadcastSpeech(PlayerController(P), Sender))
						{
							P.ClientVoiceMessage(Sender, Recipient, messagetype, MessageID);
						}
					}
				}
			}
			// End:0x259
			continue;
		}
		// End:0x259
		if((messagetype == 'Order') && (Recipient == none) || Recipient == P.PlayerReplicationInfo)
		{
			P.BotVoiceMessage(messagetype, MessageID, self);
		}		
	}	
	//return;	
}

function ClientVoiceMessage(PlayerReplicationInfo Sender, PlayerReplicationInfo Recipient, name messagetype, byte MessageID)
{
	//return;	
}

function BotVoiceMessage(name messagetype, byte MessageID, Controller Sender)
{
	//return;	
}

function bool WouldReactToNoise(float Loudness, Actor NoiseMaker)
{
	return false;
	//return;	
}

function bool WouldReactToSeeing(Pawn Seen)
{
	return false;
	//return;	
}

function Vector AdjustToss(float TSpeed, Vector Start, Vector End, bool bNormalize)
{
	local Vector Dest2D, Result, Vel2D;
	local float Dist2D;

	// End:0xEA
	if(Start.Z > (End.Z + float(64)))
	{
		Dest2D = End;
		Dest2D.Z = Start.Z;
		Dist2D = VSize(Dest2D - Start);
		TSpeed *= (Dist2D / VSize(End - Start));
		Result = SuggestFallVelocity(Dest2D, Start, TSpeed, TSpeed);
		Vel2D = Result;
		Vel2D.Z = 0.0000000;
		Result.Z = Result.Z + (((End.Z - Start.Z) * VSize(Vel2D)) / Dist2D);		
	}
	else
	{
		Result = SuggestFallVelocity(End, Start, TSpeed, TSpeed);
	}
	// End:0x125
	if(bNormalize)
	{
		return TSpeed * Normal(Result);		
	}
	else
	{
		return Result;
	}
	//return;	
}

event PrepareForMove(NavigationPoint Goal, ReachSpec Path)
{
	//return;	
}

function WaitForMover(Mover M)
{
	//return;	
}

function MoverFinished()
{
	//return;	
}

function UnderLift(Mover M)
{
	//return;	
}

function FearThisSpot(AvoidMarker aSpot)
{
	local int i;

	// End:0x0D
	if(Pawn == none)
	{
		return;
	}
	// End:0x1C
	if(!LineOfSightTo(aSpot))
	{
		return;
	}
	i = 0;
	J0x23:

	// End:0x5D [Loop If]
	if(i < 10)
	{
		// End:0x53
		if(FearSpots[i] == none)
		{
			FearSpots[i] = aSpot;
			return;
		}
		i++;
		// [Loop Continue]
		goto J0x23;
	}
	i = 0;
	J0x64:

	// End:0xD8 [Loop If]
	if(i < 10)
	{
		// End:0xCE
		if(VSize(Pawn.Location - FearSpots[i].Location) > VSize(Pawn.Location - aSpot.Location))
		{
			FearSpots[i] = aSpot;
			return;
		}
		i++;
		// [Loop Continue]
		goto J0x64;
	}
	//return;	
}

event float Desireability(Pickup P)
{
	return P.BotDesireability(Pawn);
	//return;	
}

event float SuperDesireability(Pickup P)
{
	return P.BotDesireability(Pawn);
	//return;	
}

event SetupSpecialPathAbilities()
{
	//return;	
}

event HearNoise(float Loudness, Actor NoiseMaker)
{
	//return;	
}

event SeePlayer(Pawn Seen)
{
	//return;	
}

event SeeMonster(Pawn Seen)
{
	//return;	
}

event EnemyNotVisible()
{
	//return;	
}

function DamageShake(int Damage)
{
	//return;	
}

function ShakeView(Vector shRotMag, Vector shRotRate, float shRotTime, Vector shOffsetMag, Vector shOffsetRate, float shOffsetTime)
{
	//return;	
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn Other)
{
	// End:0x16
	if(Enemy == Other)
	{
		Enemy = none;
	}
	//return;	
}

function damageAttitudeTo(Pawn Other, float Damage)
{
	//return;	
}

function float AdjustDesireFor(Pickup P)
{
	//return;	
}

function bool FireWeaponAt(Actor A)
{
	//return;	
}

function StopFiring()
{
	// End:0x1A
	if(Pawn != none)
	{
		Pawn.StopWeaponFiring();
	}
	bFire = 0;
	bAltFire = 0;
	//return;	
}

simulated function float RateWeapon(Weapon W)
{
	return float(W.default.Priority);
	//return;	
}

function float WeaponPreference(Weapon W)
{
	return 0.0000000;
	//return;	
}

function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int aimerror)
{
	return Rotation;
	//return;	
}

function InstantWarnTarget(Actor Target, FireProperties FiredAmmunition, Vector FireDir)
{
	local float Dist;

	// End:0xD3
	if((FiredAmmunition.bInstantHit && Pawn(Target) != none) && Pawn(Target).Controller != none)
	{
		Dist = VSize(Pawn.Location - Target.Location);
		// End:0x94
		if(VSize((FireDir * Dist) - Target.Location) < Target.CollisionRadius)
		{
			return;
		}
		// End:0xD1
		if(FRand() < FiredAmmunition.WarnTargetPct)
		{
			Pawn(Target).Controller.ReceiveWarning(Pawn, -1.0000000, FireDir);
		}
		return;
	}
	//return;	
}

event ReceiveWarning(Pawn shooter, float projSpeed, Vector FireDir)
{
	//return;	
}

function ReceiveProjectileWarning(Projectile proj)
{
	// End:0x3D
	if(WarningProjectile == none)
	{
		ReceiveWarning(proj.Instigator, proj.Speed, Normal(proj.Velocity));
	}
	//return;	
}

event DelayedWarning()
{
	//return;	
}

exec function SwitchToBestWeapon()
{
	local float rating;

	// End:0x23
	if((Pawn == none) || Pawn.Inventory == none)
	{
		return;
	}
	// End:0xB8
	if((Pawn.PendingWeapon == none) || AIController(self) != none)
	{
		Pawn.PendingWeapon = Pawn.Inventory.RecommendWeapon(rating);
		// End:0xA2
		if(Pawn.PendingWeapon == Pawn.Weapon)
		{
			Pawn.PendingWeapon = none;
		}
		// End:0xB8
		if(Pawn.PendingWeapon == none)
		{
			return;
		}
	}
	StopFiring();
	// End:0xE4
	if(Pawn.Weapon == none)
	{
		Pawn.ChangedWeapon();		
	}
	else
	{
		// End:0x11D
		if(Pawn.Weapon != Pawn.PendingWeapon)
		{
			Pawn.Weapon.PutDown();
		}
	}
	//return;	
}

function ClientSwitchToBestWeapon()
{
	SwitchToBestWeapon();
	//return;	
}

function ClientSetWeapon(Class<Weapon> WeaponClass)
{
	local Inventory Inv;
	local int Count;

	Inv = Pawn.Inventory;
	J0x14:

	// End:0xFB [Loop If]
	if(Inv != none)
	{
		Count++;
		// End:0x37
		if(Count > 1000)
		{
			return;
		}
		// End:0x55
		if(!ClassIsChildOf(Inv.Class, WeaponClass))
		{			
		}
		else
		{
			// End:0x94
			if(Pawn.Weapon == none)
			{
				Pawn.PendingWeapon = Weapon(Inv);
				Pawn.ChangedWeapon();				
			}
			else
			{
				// End:0xE2
				if(Pawn.Weapon != Weapon(Inv))
				{
					Pawn.PendingWeapon = Weapon(Inv);
					Pawn.Weapon.PutDown();
				}
			}
			return;
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x14;
	}
	//return;	
}

function SetPawnClass(string inClass, string InCharacter)
{
	local Class<Pawn> pClass;

	// End:0x1A
	if(SPCTimeStamp > Level.TimeSeconds)
	{
		return;
	}
	SPCTimeStamp = Level.TimeSeconds + 10.0000000;
	// End:0x5D
	if(inClass != "")
	{
		pClass = Class<Pawn>(DynamicLoadObject(inClass, Class'Core.Class', true));
	}
	// End:0x73
	if(pClass != none)
	{
		PawnClass = pClass;
	}
	//return;	
}

function SetPawnFemale()
{
	//return;	
}

function bool CheckFutureSight(float DeltaTime)
{
	return true;
	//return;	
}

function ChangedWeapon()
{
	// End:0x31
	if(Pawn.Weapon != none)
	{
		LastPawnWeapon = Pawn.Weapon.Class;
	}
	//return;	
}

function ServerReStartPlayer()
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_Client))
	{
		return;
	}
	// End:0x2C
	if(Pawn != none)
	{
		ServerGivePawn();
	}
	//return;	
}

function ServerGivePawn()
{
	//return;	
}

event MonitoredPawnAlert()
{
	//return;	
}

function StartMonitoring(Pawn P, float MaxDist)
{
	MonitoredPawn = P;
	MonitorStartLoc = P.Location;
	MonitorMaxDistSq = MaxDist * MaxDist;
	//return;	
}

function bool AutoTaunt()
{
	return false;
	//return;	
}

function bool DontReuseTaunt(int t)
{
	return false;
	//return;	
}

function string ParseChatPercVar(string Cmd)
{
	// End:0x26
	if(Cmd ~= "%A")
	{
		return string(int(Adrenaline)) @ "Adrenaline";
	}
	// End:0x5E
	if((Pawn != none) && Cmd ~= "%S")
	{
		return string(int(Pawn.ShieldStrength)) @ "Shield";
	}
	return Cmd;
	//return;	
}

state Dead
{
	ignores KilledBy;

	function PawnDied(Pawn P)
	{
		// End:0x36
		if(int(Level.NetMode) != int(NM_Client))
		{
			Warn(string(self) $ " Pawndied while dead");
		}
		//return;		
	}

	function ServerReStartPlayer()
	{
		// End:0x1B
		if(int(Level.NetMode) == int(NM_Client))
		{
			return;
		}
		Level.Game.RestartPlayer(self);
		//return;		
	}
	stop;	
}

state GameEnded
{
	ignores ReceiveWarning, TakeDamage, KilledBy;

	function BeginState()
	{
		// End:0x72
		if(Pawn != none)
		{
			// End:0x37
			if(Pawn.Weapon != none)
			{
				Pawn.Weapon.HolderDied();
			}
			Pawn.SimAnim.AnimRate = 0;
			Pawn.TurnOff();
			Pawn.UnPossessed();
			Pawn = none;
		}
		// End:0x80
		if(!bIsPlayer)
		{
			Destroy();
		}
		//return;		
	}
	stop;	
}

state RoundEnded
{
	ignores ReceiveWarning, TakeDamage, KilledBy;

	function BeginState()
	{
		// End:0x72
		if(Pawn != none)
		{
			// End:0x37
			if(Pawn.Weapon != none)
			{
				Pawn.Weapon.HolderDied();
			}
			Pawn.SimAnim.AnimRate = 0;
			Pawn.TurnOff();
			Pawn.UnPossessed();
			Pawn = none;
		}
		// End:0x80
		if(!bIsPlayer)
		{
			Destroy();
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	FovAngle=90.0000000
	bAdrenalineEnabled=true
	bSlowerZAcquire=true
	MinHitWall=-1.0000000
	AcquisitionYawRate=20000
	PlayerReplicationInfoClass=Class'Engine.PlayerReplicationInfo'
	AdrenalineMax=100.0000000
	bHidden=true
	bOnlyRelevantToOwner=true
	RemoteRole=0
	RotationRate=(Pitch=3072,Yaw=30000,Roll=2048)
	bHiddenEd=true
}
