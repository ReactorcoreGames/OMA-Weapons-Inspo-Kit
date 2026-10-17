class Pawn extends Actor
	abstract
	native
	nativereplication
	config(User)
	exportstructs
	placeable;

struct HitFXData
{
	var() name Bone;
	var() Class<DamageType> damtype;
	var() bool bSever;
	var() Rotator rotDir;
};

var Controller Controller;
var float NetRelevancyTime;
var PlayerController LastRealViewer;
var Actor LastViewer;
var const float LastLocTime;
var bool bJustLanded;
var bool bLandRecovery;
var bool bUpAndOut;
var bool bIsWalking;
var bool bWarping;
var bool bWantsToCrouch;
var const bool bIsCrouched;
var const bool bTryToUncrouch;
var() bool bCanCrouch;
var bool bCrawler;
var const bool bReducedSpeed;
var bool bJumpCapable;
var bool bCanJump;
var bool bCanWalk;
var bool bCanSwim;
var bool bCanFly;
var bool bCanClimbLadders;
var bool bCanStrafe;
var bool bCanDoubleJump;
var bool bCanWallDodge;
var bool bAvoidLedges;
var bool bStopAtLedges;
var bool bNoJumpAdjust;
var bool bCountJumps;
var const bool bSimulateGravity;
var bool bUpdateEyeheight;
var bool bIgnoreForces;
var const bool bNoVelocityUpdate;
var bool bCanWalkOffLedges;
var bool bSteadyFiring;
var bool bCanBeBaseForPawns;
var bool bClientCollision;
var const bool bSimGravityDisabled;
var bool bDirectHitWall;
var bool bServerMoveSetPawnRot;
var bool bFlyingKarma;
var bool bDrawCorona;
var globalconfig bool bNoCoronas;
var bool bThumped;
var bool bInvulnerableBody;
var bool bIsFemale;
var bool bAutoActivate;
var bool bCanPickupInventory;
var bool bUpdatingDisplay;
var bool bAmbientCreature;
var(AI) bool bLOSHearing;
var(AI) bool bSameZoneHearing;
var(AI) bool bAdjacentZoneHearing;
var(AI) bool bMuffledHearing;
var(AI) bool bAroundCornerHearing;
var(AI) bool bDontPossess;
var bool bAutoFire;
var bool bRollToDesired;
var bool bIgnorePlayFiring;
var bool bStationary;
var bool bCachedRelevant;
var bool bUseCompressedPosition;
var globalconfig bool bWeaponBob;
var bool bHideRegularHUD;
var bool bSpecialHUD;
var bool bSpecialCrosshair;
var bool bSpecialCalcView;
var bool bNoTeamBeacon;
var bool bNoWeaponFiring;
var bool bIsTyping;
var bool bScriptPostRender;
var bool bCanUse;
var bool bSuperSize;
var bool bWaterStepup;
var byte FlashCount;
var byte Visibility;
var float DesiredSpeed;
var float MaxDesiredSpeed;
var(AI) name AIScriptTag;
var(AI) float HearingThreshold;
var(AI) float Alertness;
var(AI) float SightRadius;
var(AI) float PeripheralVision;
var() float SkillModifier;
var const float AvgPhysicsTime;
var float MeleeRange;
var float NavigationPointRange;
var NavigationPoint Anchor;
var const NavigationPoint LastAnchor;
var float FindAnchorFailedTime;
var float LastValidAnchorTime;
var float DestinationOffset;
var float NextPathRadius;
var Vector SerpentineDir;
var float SerpentineDist;
var float SerpentineTime;
var const float UncrouchTime;
var float SpawnTime;
var float GroundSpeed;
var float WaterSpeed;
var float AirSpeed;
var float LadderSpeed;
var float AccelRate;
var float JumpZ;
var float AirControl;
var float WalkingPct;
var float CrouchedPct;
var float MaxFallSpeed;
var Vector ConstantAcceleration;
var Vehicle DrivenVehicle;
var Vector ImpactVelocity;
var() int PitchUpLimit;
var() int PitchDownLimit;
var string OwnerName;
var travel Weapon Weapon;
var Weapon PendingWeapon;
var travel Powerups SelectedItem;
var float BaseEyeHeight;
var float EyeHeight;
var Vector Floor;
var float SplashTime;
var float CrouchHeight;
var float CrouchRadius;
var() float DrivingHeight;
var() float DrivingRadius;
var float OldZ;
var PhysicsVolume HeadVolume;
var float HealthMax;
var float SuperHealthMax;
var travel int Health;
var float BreathTime;
var float UnderWaterTime;
var float LastPainTime;
var Class<DamageType> ReducedDamageType;
var float HeadRadius;
var float HeadHeight;
var float HeadScale;
var bool bSetPCRotOnPossess;
var const Vector noise1spot;
var const float noise1time;
var const Pawn noise1other;
var const float noise1loudness;
var const Vector noise2spot;
var const float noise2time;
var const Pawn noise2other;
var const float noise2loudness;
var float LastPainSound;
var globalconfig float Bob;
var float LandBob;
var float AppliedBob;
var float bobtime;
var Vector WalkBob;
var float SoundDampening;
var float DamageScaling;
var globalconfig float AmbientSoundScaling;
var localized string MenuName;
var Projector Shadow;
var Class<Effects> BloodEffect;
var Class<Effects> LowGoreBlood;
var Class<AIController> ControllerClass;
var PlayerReplicationInfo PlayerReplicationInfo;
var LadderVolume OnLadder;
var name LandMovementState;
var name WaterMovementState;
var PlayerStart LastStartSpot;
var float LastStartTime;
var name AnimAction;
var Vector TakeHitLocation;
var Class<DamageType> HitDamageType;
var Vector TearOffMomentum;
var Actor.EPhysics OldPhysics;
var bool bPhysicsAnimUpdate;
var bool bWasCrouched;
var bool bWasWalking;
var bool bWasOnGround;
var bool bInitializeAnimation;
var bool bPlayedDeath;
var bool bIsIdle;
var bool bWaitForAnim;
var const bool bReverseRun;
var bool bDoTorsoTwist;
var const bool FootTurning;
var const bool FootStill;
var const byte ViewPitch;
var int SmoothViewPitch;
var int SmoothViewYaw;
var float OldRotYaw;
var Vector OldAcceleration;
var name MovementAnims[4];
var name TurnLeftAnim;
var name TurnRightAnim;
var(AnimTweaks) float BlendChangeTime;
var float MovementBlendStartTime;
var float ForwardStrafeBias;
var float BackwardStrafeBias;
var float DodgeSpeedFactor;
var float DodgeSpeedZ;
var const int OldAnimDir;
var const Vector OldVelocity;
var float IdleTime;
var name SwimAnims[4];
var name CrouchAnims[4];
var name WalkAnims[4];
var name AirAnims[4];
var name TakeoffAnims[4];
var name LandAnims[4];
var name DoubleJumpAnims[4];
var name DodgeAnims[4];
var name AirStillAnim;
var name TakeoffStillAnim;
var name CrouchTurnRightAnim;
var name CrouchTurnLeftAnim;
var name IdleCrouchAnim;
var name IdleSwimAnim;
var name IdleWeaponAnim;
var name IdleRestAnim;
var name IdleChatAnim;
var array<name> TauntAnims;
var localized string TauntAnimNames[16];
var const int FootRot;
var const int TurnDir;
var name RootBone;
var name HeadBone;
var name SpineBone1;
var name SpineBone2;
var(Shield) transient float ShieldStrength;
var() HitFXData HitFx[8];
var transient int HitFxTicker;
var transient CompressedPosition PawnPosition;
var Controller DelayedDamageInstigatorController;
var Controller LastHitBy;
var float MinFlySpeed;
var float MaxRotation;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		AnimAction, DrivenVehicle, 
		HeadScale, HitDamageType, 
		PlayerReplicationInfo, TakeHitLocation, 
		bIsCrouched, bIsTyping, 
		bIsWalking, bSimulateGravity, 
		bSpecialHUD;

	// Pos:0x018
	reliable if((bTearOff && bNetDirty) && int(Role) == int(ROLE_Authority))
		TearOffMomentum;

	// Pos:0x03B
	reliable if((bNetDirty && !bNetOwner) && int(Role) == int(ROLE_Authority))
		ViewPitch, bSteadyFiring;

	// Pos:0x060
	reliable if((bNetDirty && bNetOwner) && int(Role) == int(ROLE_Authority))
		AccelRate, AirControl, 
		AirSpeed, Controller, 
		GroundSpeed, JumpZ, 
		PitchDownLimit, PitchUpLimit, 
		SelectedItem, WaterSpeed, 
		bCanWallDodge;

	// Pos:0x083
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		Health;

	// Pos:0x09B
	reliable if((bNetDirty && bNetInitial) && int(Role) == int(ROLE_Authority))
		HealthMax;

	// Pos:0x0BE
	reliable if(!bNetOwner && int(Role) == int(ROLE_Authority))
		PawnPosition;

	// Pos:0x0D8
	reliable if(int(Role) == int(ROLE_Authority))
		HitFx, HitFxTicker, 
		ShieldStrength;

	// Pos:0x0E5
	reliable if(int(Role) < int(ROLE_Authority))
		NextItem, ServerChangedWeapon, 
		ServerNoTranslocator;
}

// Export UPawn::execAllInventory(FFrame&, void* const)
native(326) final iterator function AllInventory(Class<Inventory> baseClass, out Inventory Actor);

static function StaticPrecache(LevelInfo L)
{
	//return;	
}

// Export UPawn::execSetViewPitch(FFrame&, void* const)
native simulated function SetViewPitch(int NewPitch);

// Export UPawn::execSetTwistLook(FFrame&, void* const)
native simulated function SetTwistLook(int twist, int look);

// Export UPawn::execGet4WayDirection(FFrame&, void* const)
native simulated function int Get4WayDirection();

simulated event SetHeadScale(float NewScale)
{
	//return;	
}

simulated event PostRender2D(Canvas C, float ScreenLocX, float ScreenLocY)
{
	local PlayerController PC;

	PC = Level.GetLocalPlayerController();
	// End:0x5E
	if((PC != none) && PC.myHUD != none)
	{
		PC.myHUD.DrawCustomBeacon(C, self, ScreenLocX, ScreenLocY);
	}
	//return;	
}

// Export UPawn::execReachedDestination(FFrame&, void* const)
native function bool ReachedDestination(Actor Goal);

// Export UPawn::execForceCrouch(FFrame&, void* const)
native function ForceCrouch();

simulated function Weapon GetDemoRecordingWeapon()
{
	local Weapon Inv;

	// End:0x4F
	foreach __NFUN_326__(Class'Engine.Weapon', Inv)
	{
		// End:0x4E
		if(Inv.ThirdPersonActor != none)
		{
			Weapon = Inv;
			PendingWeapon = Weapon;
			Weapon.bSpectated = true;
			// End:0x4F
			break;
		}		
	}	
	return Weapon;
	//return;	
}

simulated function SetBaseEyeheight()
{
	// End:0x19
	if(!bIsCrouched)
	{
		BaseEyeHeight = default.BaseEyeHeight;		
	}
	else
	{
		BaseEyeHeight = FMin(0.8000000 * CrouchHeight, CrouchHeight - float(10));
	}
	EyeHeight = BaseEyeHeight;
	//return;	
}

function Pawn GetAimTarget()
{
	return self;
	//return;	
}

function DeactivateSpawnProtection()
{
	SpawnTime = -100000.0000000;
	//return;	
}

function Actor GetPathTo(Actor Dest)
{
	// End:0x16
	if(PlayerController(Controller) == none)
	{
		return Dest;
	}
	return PlayerController(Controller).GetPathTo(Dest);
	//return;	
}

function PlayerChangedTeam()
{
	Died(none, Class'Engine.DamageType', Location);
	//return;	
}

function Reset()
{
	// End:0x40
	if((Controller == none) || Controller.bIsPlayer)
	{
		// End:0x3A
		if(Controller != none)
		{
			Controller.PawnDied(self);
		}
		Destroy();		
	}
	else
	{
		super.Reset();
	}
	//return;	
}

function bool HasWeapon()
{
	return Weapon != none;
	//return;	
}

function ChooseFireAt(Actor A)
{
	Fire(0.0000000);
	//return;	
}

function bool StopWeaponFiring()
{
	// End:0x43
	if((Weapon != none) && Weapon.IsFiring())
	{
		Weapon.ServerStopFire(0);
		Weapon.ServerStopFire(1);
		return true;
	}
	return false;
	//return;	
}

simulated function Fire(optional float F)
{
	// End:0x1F
	if(Weapon != none)
	{
		Weapon.Fire(F);
	}
	//return;	
}

simulated function AltFire(optional float F)
{
	// End:0x1F
	if(Weapon != none)
	{
		Weapon.AltFire(F);
	}
	//return;	
}

function bool RecommendLongRangedAttack()
{
	// End:0x1B
	if(Weapon != none)
	{
		return Weapon.RecommendLongRangedAttack();
	}
	return false;
	//return;	
}

function bool CanAttack(Actor Other)
{
	// End:0x0D
	if(Weapon == none)
	{
		return false;
	}
	return Weapon.CanAttack(Other);
	//return;	
}

function bool TooCloseToAttack(Actor Other)
{
	return false;
	//return;	
}

function float RefireRate()
{
	// End:0x1B
	if(Weapon != none)
	{
		return Weapon.RefireRate();
	}
	return 0.0000000;
	//return;	
}

function bool IsFiring()
{
	// End:0x1B
	if(Weapon != none)
	{
		return Weapon.IsFiring();
	}
	return false;
	//return;	
}

function bool FireOnRelease()
{
	// End:0x1B
	if(Weapon != none)
	{
		return Weapon.FireOnRelease();
	}
	return false;
	//return;	
}

function bool NeedToTurn(Vector targ)
{
	local Vector LookDir, AimDir;

	LookDir = Vector(Rotation);
	LookDir.Z = 0.0000000;
	LookDir = Normal(LookDir);
	AimDir = targ - Location;
	AimDir.Z = 0.0000000;
	AimDir = Normal(AimDir);
	return (LookDir Dot AimDir) < 0.9300000;
	//return;	
}

function float ModifyThreat(float Current, Pawn Threat)
{
	return Current;
	//return;	
}

function DrawHUD(Canvas Canvas)
{
	//return;	
}

simulated function SpecialDrawCrosshair(Canvas C)
{
	//return;	
}

function bool SpecialCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
	//return;	
}

function bool SpectatorSpecialCalcView(PlayerController Viewer, out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
	//return;	
}

simulated function string GetHumanReadableName()
{
	// End:0x1A
	if(PlayerReplicationInfo != none)
	{
		return PlayerReplicationInfo.PlayerName;
	}
	return MenuName;
	//return;	
}

function PlayTeleportEffect(bool bOut, bool bSound)
{
	MakeNoise(1.0000000);
	//return;	
}

function HoldFlag(Actor FlagActor)
{
	//return;	
}

function DropFlag()
{
	//return;	
}

function bool PerformDodge(Actor.EDoubleClickDir DoubleClickMove, Vector Dir, Vector Cross)
{
	//return;	
}

function NotifyTeamChanged()
{
	//return;	
}

function PossessedBy(Controller C)
{
	Controller = C;
	NetPriority = 3.0000000;
	NetUpdateFrequency = 100.0000000;
	NetUpdateTime = Level.TimeSeconds - float(1);
	// End:0x76
	if(C.PlayerReplicationInfo != none)
	{
		PlayerReplicationInfo = C.PlayerReplicationInfo;
		OwnerName = PlayerReplicationInfo.PlayerName;
	}
	// End:0xCE
	if(C.IsA('PlayerController'))
	{
		// End:0xA4
		if(bSetPCRotOnPossess)
		{
			C.SetRotation(Rotation);
		}
		// End:0xC5
		if(int(Level.NetMode) != int(NM_Standalone))
		{
			RemoteRole = ROLE_AutonomousProxy;
		}
		BecomeViewTarget();		
	}
	else
	{
		RemoteRole = default.RemoteRole;
	}
	SetOwner(Controller);
	EyeHeight = BaseEyeHeight;
	ChangeAnimation();
	//return;	
}

function UnPossessed()
{
	NetUpdateTime = Level.TimeSeconds - float(1);
	// End:0x2F
	if(DrivenVehicle != none)
	{
		NetUpdateFrequency = 5.0000000;
	}
	PlayerReplicationInfo = none;
	SetOwner(none);
	Controller = none;
	//return;	
}

simulated function bool PointOfView()
{
	return false;
	//return;	
}

function BecomeViewTarget()
{
	bUpdateEyeheight = true;
	//return;	
}

function DropToGround()
{
	bCollideWorld = true;
	bInterpolating = false;
	// End:0x45
	if(Health > 0)
	{
		SetCollision(true, true);
		SetPhysics(2);
		AmbientSound = none;
		// End:0x45
		if(IsHumanControlled())
		{
			Controller.GotoState(LandMovementState);
		}
	}
	//return;	
}

function bool CanGrabLadder()
{
	return ((bCanClimbLadders && Controller != none) && int(Physics) != int(11)) && (int(Physics) != int(2)) || Abs(Velocity.Z) <= JumpZ;
	//return;	
}

event SetWalking(bool bNewIsWalking)
{
	// End:0x24
	if(bNewIsWalking != bIsWalking)
	{
		bIsWalking = bNewIsWalking;
		ChangeAnimation();
	}
	//return;	
}

simulated function bool CanSplash()
{
	// End:0x70
	if((((Level.TimeSeconds - SplashTime) > 0.1500000) && (int(Physics) == int(2)) || int(Physics) == int(4)) && Abs(Velocity.Z) > float(100))
	{
		SplashTime = Level.TimeSeconds;
		return true;
	}
	return false;
	//return;	
}

function EndClimbLadder(LadderVolume OldLadder)
{
	// End:0x1A
	if(Controller != none)
	{
		Controller.EndClimbLadder();
	}
	// End:0x2F
	if(int(Physics) == int(11))
	{
		SetPhysics(2);
	}
	//return;	
}

function ClimbLadder(LadderVolume L)
{
	OnLadder = L;
	SetRotation(OnLadder.WallDir);
	SetPhysics(11);
	// End:0x3A
	if(IsHumanControlled())
	{
		Controller.GotoState('PlayerClimbing');
	}
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	local string t;

	super.DisplayDebug(Canvas, YL, YPos);
	Canvas.SetDrawColor(byte(255), byte(255), byte(255));
	Canvas.DrawText((("Animation Action " $ string(AnimAction)) $ " Health ") $ string(Health));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawText((((("Anchor " $ string(Anchor)) $ " Serpentine Dist ") $ string(SerpentineDist)) $ " Time ") $ string(SerpentineTime));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	t = (((((("Floor " $ string(Floor)) $ " DesiredSpeed ") $ string(DesiredSpeed)) $ " Crouched ") $ string(bIsCrouched)) $ " Try to uncrouch ") $ string(UncrouchTime);
	// End:0x1AE
	if((OnLadder != none) || int(Physics) == int(11))
	{
		t = (t $ " on ladder ") $ string(OnLadder);
	}
	Canvas.DrawText(t);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawText((((("EyeHeight " $ string(EyeHeight)) $ " BaseEyeHeight ") $ string(BaseEyeHeight)) $ " Physics Anim ") $ string(bPhysicsAnimUpdate));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	// End:0x2C7
	if(Controller == none)
	{
		Canvas.SetDrawColor(byte(255), 0, 0);
		Canvas.DrawText("NO CONTROLLER");
		YPos += YL;
		Canvas.SetPos(4.0000000, YPos);		
	}
	else
	{
		// End:0x347
		if(Controller.PlayerReplicationInfo != none)
		{
			Canvas.SetDrawColor(byte(255), 0, 0);
			Canvas.DrawText("Owned by " $ Controller.PlayerReplicationInfo.PlayerName);
			YPos += YL;
			Canvas.SetPos(4.0000000, YPos);
		}
		Controller.DisplayDebug(Canvas, YL, YPos);
	}
	// End:0x3C6
	if(Weapon == none)
	{
		Canvas.SetDrawColor(0, byte(255), 0);
		Canvas.DrawText("NO WEAPON");
		YPos += YL;
		Canvas.SetPos(4.0000000, YPos);		
	}
	else
	{
		Weapon.DisplayDebug(Canvas, YL, YPos);
	}
	//return;	
}

simulated function Vector CalcDrawOffset(Inventory Inv)
{
	local Vector DrawOffset;

	// End:0x38
	if(Controller == none)
	{
		return (Inv.PlayerViewOffset >> Rotation) + (BaseEyeHeight * vect(0.0000000, 0.0000000, 1.0000000));
	}
	DrawOffset = (((0.9000000 / Weapon.DisplayFOV) * float(100)) * (ModifiedPlayerViewOffset(Inv))) >> (GetViewRotation());
	// End:0x8E
	if(!IsLocallyControlled())
	{
		DrawOffset.Z += BaseEyeHeight;		
	}
	else
	{
		DrawOffset.Z += EyeHeight;
		// End:0xC3
		if(bWeaponBob)
		{
			DrawOffset += (WeaponBob(Inv.BobDamping));
		}
		DrawOffset += (CameraShake());
	}
	return DrawOffset;
	//return;	
}

simulated function Vector CameraShake()
{
	local Vector X, Y, Z, shakevect;
	local PlayerController PC;

	PC = PlayerController(Controller);
	// End:0x21
	if(PC == none)
	{
		return shakevect;
	}
	GetAxes(PC.Rotation, X, Y, Z);
	shakevect = ((PC.ShakeOffset.X * X) + (PC.ShakeOffset.Y * Y)) + (PC.ShakeOffset.Z * Z);
	return shakevect;
	//return;	
}

simulated function Vector ModifiedPlayerViewOffset(Inventory Inv)
{
	return Inv.PlayerViewOffset;
	//return;	
}

simulated function Vector WeaponBob(float BobDamping)
{
	local Vector WBob;

	WBob = BobDamping * WalkBob;
	WBob.Z = (0.4500000 + (0.5500000 * BobDamping)) * WalkBob.Z;
	WBob.Z += LandBob;
	return WBob;
	//return;	
}

function CheckBob(float DeltaTime, Vector Y)
{
	local float Speed2D;

	// End:0x36
	if(!bWeaponBob || bJustLanded)
	{
		bobtime = 0.0000000;
		WalkBob = vect(0.0000000, 0.0000000, 0.0000000);
		return;
	}
	Bob = FClamp(Bob, -0.0100000, 0.0100000);
	// End:0x15F
	if(int(Physics) == int(1))
	{
		Speed2D = VSize(Velocity);
		// End:0x8E
		if(Speed2D < float(10))
		{
			bobtime += (0.2000000 * DeltaTime);			
		}
		else
		{
			bobtime += (DeltaTime * (0.3000000 + ((0.7000000 * Speed2D) / GroundSpeed)));
		}
		WalkBob = ((Y * Bob) * Speed2D) * Sin(8.0000000 * bobtime);
		AppliedBob = AppliedBob * (float(1) - FMin(1.0000000, 16.0000000 * DeltaTime));
		WalkBob.Z = AppliedBob;
		// End:0x15C
		if(Speed2D > float(10))
		{
			WalkBob.Z = WalkBob.Z + (((0.7500000 * Bob) * Speed2D) * Sin(16.0000000 * bobtime));
		}		
	}
	else
	{
		// End:0x212
		if(int(Physics) == int(3))
		{
			bobtime += DeltaTime;
			Speed2D = Sqrt((Velocity.X * Velocity.X) + (Velocity.Y * Velocity.Y));
			WalkBob = (((Y * Bob) * 0.5000000) * Speed2D) * Sin(4.0000000 * bobtime);
			WalkBob.Z = ((Bob * 1.5000000) * Speed2D) * Sin(8.0000000 * bobtime);			
		}
		else
		{
			bobtime = 0.0000000;
			WalkBob = WalkBob * (float(1) - FMin(1.0000000, 8.0000000 * DeltaTime));
		}
	}
	//return;	
}

simulated event StartDriving(Vehicle V)
{
	DrivenVehicle = V;
	NetUpdateTime = Level.TimeSeconds - float(1);
	AmbientSound = none;
	StopWeaponFiring();
	DeactivateSpawnProtection();
	ShouldCrouch(false);
	bIgnoreForces = true;
	Velocity = vect(0.0000000, 0.0000000, 0.0000000);
	Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
	bCanTeleport = false;
	// End:0xE2
	if(!V.bRemoteControlled || V.bHideRemoteDriver)
	{
		SetCollision(false, false, false);
		bCollideWorld = false;
		V.AttachDriver(self);
		// End:0xDA
		if(V.bDrawDriverInTP)
		{
			CullDistance = 5000.0000000;			
		}
		else
		{
			bHidden = true;
		}
	}
	bPhysicsAnimUpdate = false;
	bWaitForAnim = false;
	// End:0x170
	if(!V.bHideRemoteDriver && V.bDrawDriverInTP)
	{
		// End:0x142
		if(HasAnim(DrivenVehicle.DriveAnim))
		{
			LoopAnim(DrivenVehicle.DriveAnim);			
		}
		else
		{
			LoopAnim('Vehicle_Driving');
		}
		SetAnimFrame(0.5000000);
		SmoothViewYaw = Rotation.Yaw;
		SetTwistLook(0, 0);		
	}
	else
	{
		// End:0x18C
		if(!V.bRemoteControlled)
		{
			LoopAnim('Vehicle_Driving');
		}
	}
	//return;	
}

simulated event StopDriving(Vehicle V)
{
	// End:0x45
	if((int(Role) == int(ROLE_Authority)) && PlayerController(Controller) != none)
	{
		V.PlayerStartTime = Level.TimeSeconds + float(12);
	}
	CullDistance = default.CullDistance;
	NetUpdateTime = Level.TimeSeconds - float(1);
	// End:0xA2
	if((V != none) && V.Weapon != none)
	{
		V.Weapon.ImmediateStopFire();
	}
	// End:0xB4
	if(int(Physics) == int(13))
	{
		return;
	}
	DrivenVehicle = none;
	bIgnoreForces = false;
	bHardAttach = false;
	bWaitForAnim = false;
	bCanTeleport = true;
	bCollideWorld = true;
	PlayWaiting();
	// End:0x104
	if(V != none)
	{
		V.DetachDriver(self);
	}
	bPhysicsAnimUpdate = default.bPhysicsAnimUpdate;
	SetCollision(true, true);
	// End:0x199
	if((int(Role) == int(ROLE_Authority)) && Health > 0)
	{
		// End:0x199
		if(!V.bRemoteControlled || V.bHideRemoteDriver)
		{
			Acceleration = vect(0.0000000, 0.0000000, 24000.0000000);
			// End:0x188
			if(PhysicsVolume.bWaterVolume)
			{
				SetPhysics(3);				
			}
			else
			{
				SetPhysics(2);
			}
			SetBase(none);
			bHidden = false;
		}
	}
	bOwnerNoSee = default.bOwnerNoSee;
	// End:0x1C7
	if(Weapon != none)
	{
		PendingWeapon = none;
		Weapon.BringUp();
	}
	//return;	
}

simulated function bool FindValidTaunt(out name Sequence)
{
	return true;
	//return;	
}

simulated function bool CheckTauntValid(name Sequence)
{
	return FindValidTaunt(Sequence);
	//return;	
}

simulated function bool IsPlayerPawn()
{
	return (Controller != none) && Controller.bIsPlayer;
	//return;	
}

simulated function bool WasPlayerPawn()
{
	return false;
	//return;	
}

simulated function bool IsHumanControlled()
{
	return PlayerController(Controller) != none;
	//return;	
}

simulated function bool IsLocallyControlled()
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		return true;
	}
	// End:0x28
	if(Controller == none)
	{
		return false;
	}
	// End:0x3A
	if(PlayerController(Controller) == none)
	{
		return true;
	}
	return Viewport(PlayerController(Controller).Player) != none;
	//return;	
}

simulated function bool IsFirstPerson()
{
	local PlayerController PC;

	PC = PlayerController(Controller);
	return ((PC != none) && !PC.bBehindView) && Viewport(PC.Player) != none;
	//return;	
}

simulated function Rotator GetViewRotation()
{
	// End:0x11
	if(Controller == none)
	{
		return Rotation;
	}
	return Controller.GetViewRotation();
	//return;	
}

simulated function SetViewRotation(Rotator NewRotation)
{
	// End:0x1C
	if(Controller != none)
	{
		Controller.SetRotation(NewRotation);
	}
	//return;	
}

final function bool InGodMode()
{
	return (Controller != none) && Controller.bGodMode;
	//return;	
}

function bool NearMoveTarget()
{
	// End:0x23
	if((Controller == none) || Controller.MoveTarget == none)
	{
		return false;
	}
	return ReachedDestination(Controller.MoveTarget);
	//return;	
}

final simulated function bool PressingFire()
{
	return (Controller != none) && int(Controller.bFire) != 0;
	//return;	
}

final simulated function bool PressingAltFire()
{
	return (Controller != none) && int(Controller.bAltFire) != 0;
	//return;	
}

function Actor GetMoveTarget()
{
	// End:0x0D
	if(Controller == none)
	{
		return none;
	}
	return Controller.MoveTarget;
	//return;	
}

function SetMoveTarget(Actor NewTarget)
{
	// End:0x1F
	if(Controller != none)
	{
		Controller.MoveTarget = NewTarget;
	}
	//return;	
}

function bool LineOfSightTo(Actor Other)
{
	return (Controller != none) && Controller.LineOfSightTo(Other);
	//return;	
}

final simulated function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int aimerror)
{
	// End:0x11
	if(Controller == none)
	{
		return Rotation;
	}
	return Controller.AdjustAim(FiredAmmunition, projStart, aimerror);
	//return;	
}

function Actor ShootSpecial(Actor A)
{
	// End:0x23
	if(!Controller.bCanDoSpecial || Weapon == none)
	{
		return none;
	}
	SetRotation(Rotator(A.Location - Location));
	Controller.Focus = A;
	Controller.FireWeaponAt(A);
	return A;
	//return;	
}

function float AdjustedStrength()
{
	return 0.0000000;
	//return;	
}

function HandlePickup(Pickup pick)
{
	MakeNoise(0.2000000);
	// End:0x2A
	if(Controller != none)
	{
		Controller.HandlePickup(pick);		
	}
	else
	{
		// End:0x68
		if((DrivenVehicle != none) && DrivenVehicle.Controller != none)
		{
			DrivenVehicle.Controller.HandlePickup(pick);
		}
	}
	//return;	
}

function ReceiveLocalizedMessage(Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	// End:0x3D
	if(PlayerController(Controller) != none)
	{
		PlayerController(Controller).ReceiveLocalizedMessage(Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	}
	//return;	
}

event ClientMessage(coerce string S, optional name Type)
{
	// End:0x2E
	if(PlayerController(Controller) != none)
	{
		PlayerController(Controller).ClientMessage(S, Type);
	}
	//return;	
}

function Trigger(Actor Other, Pawn EventInstigator)
{
	// End:0x24
	if(Controller != none)
	{
		Controller.Trigger(Other, EventInstigator);
	}
	//return;	
}

function bool CanTrigger(Trigger t)
{
	return true;
	//return;	
}

function CreateInventory(string InventoryClassName)
{
	//return;	
}

function GiveWeapon(string aClassName)
{
	local Class<Weapon> WeaponClass;
	local Weapon newWeapon;

	WeaponClass = Class<Weapon>(DynamicLoadObject(aClassName, Class'Core.Class'));
	// End:0x2E
	if((FindInventoryType(WeaponClass)) != none)
	{
		return;
	}
	newWeapon = Spawn(WeaponClass);
	// End:0x57
	if(newWeapon != none)
	{
		newWeapon.GiveTo(self);
	}
	//return;	
}

function SetDisplayProperties(Actor.ERenderStyle NewStyle, Material NewTexture, bool bLighting)
{
	Style = NewStyle;
	Texture = NewTexture;
	bUnlit = bLighting;
	// End:0x4D
	if(Weapon != none)
	{
		Weapon.SetDisplayProperties(Style, Texture, bUnlit);
	}
	// End:0x7C
	if(!bUpdatingDisplay && Inventory != none)
	{
		bUpdatingDisplay = true;
		Inventory.SetOwnerDisplay();
	}
	bUpdatingDisplay = false;
	//return;	
}

function SetDefaultDisplayProperties()
{
	Style = default.Style;
	Texture = default.Texture;
	bUnlit = default.bUnlit;
	// End:0x3D
	if(Weapon != none)
	{
		Weapon.SetDefaultDisplayProperties();
	}
	// End:0x6C
	if(!bUpdatingDisplay && Inventory != none)
	{
		bUpdatingDisplay = true;
		Inventory.SetOwnerDisplay();
	}
	bUpdatingDisplay = false;
	//return;	
}

function FinishedInterpolation()
{
	DropToGround();
	//return;	
}

function JumpOutOfWater(Vector jumpDir)
{
	Falling();
	Velocity = jumpDir * WaterSpeed;
	Acceleration = jumpDir * AccelRate;
	Velocity.Z = FMax(380.0000000, JumpZ);
	bUpAndOut = true;
	//return;	
}

simulated event ModifyVelocity(float DeltaTime, Vector OldVelocity)
{
	//return;	
}

event FellOutOfWorld(Actor.eKillZType KillType)
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_Client))
	{
		return;
	}
	// End:0x3C
	if((Controller != none) && Controller.AvoidCertainDeath())
	{
		return;
	}
	Health = -1;
	// End:0x6B
	if(int(KillType) == int(1))
	{
		Died(none, Class'Engine.FellLava', Location);		
	}
	else
	{
		// End:0x8F
		if(int(KillType) == int(2))
		{
			Died(none, Class'Engine.fell', Location);			
		}
		else
		{
			// End:0xA4
			if(int(Physics) != int(13))
			{
				SetPhysics(0);
			}
			Died(none, Class'Engine.fell', Location);
		}
	}
	//return;	
}

function ShouldCrouch(bool Crouch)
{
	// End:0x1E
	if(bWantsToCrouch != Crouch)
	{
		bWantsToCrouch = Crouch;
	}
	//return;	
}

event EndCrouch(float HeightAdjust)
{
	EyeHeight -= HeightAdjust;
	OldZ += HeightAdjust;
	BaseEyeHeight = default.BaseEyeHeight;
	//return;	
}

event StartCrouch(float HeightAdjust)
{
	EyeHeight += HeightAdjust;
	OldZ -= HeightAdjust;
	BaseEyeHeight = FMin(0.8000000 * CrouchHeight, CrouchHeight - float(10));
	//return;	
}

function RestartPlayer()
{
	//return;	
}

function AddVelocity(Vector NewVelocity)
{
	// End:0x24
	if(bIgnoreForces || NewVelocity == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	// End:0x52
	if((int(Physics) == int(2)) && AIController(Controller) != none)
	{
		ImpactVelocity += NewVelocity;
	}
	// End:0xA1
	if((int(Physics) == int(1)) || ((int(Physics) == int(11)) || int(Physics) == int(9)) && NewVelocity.Z > default.JumpZ)
	{
		SetPhysics(2);
	}
	// End:0xDC
	if((Velocity.Z > float(380)) && NewVelocity.Z > float(0))
	{
		NewVelocity.Z *= 0.5000000;
	}
	Velocity += NewVelocity;
	//return;	
}

function KilledBy(Pawn EventInstigator)
{
	local Controller Killer;

	Health = 0;
	// End:0x26
	if(EventInstigator != none)
	{
		Killer = EventInstigator.Controller;
	}
	Died(Killer, Class'Engine.Suicided', Location);
	//return;	
}

function TakeFallingDamage()
{
	local float Shake, EffectiveSpeed;

	// End:0x11E
	if(Velocity.Z < (-0.5000000 * MaxFallSpeed))
	{
		// End:0xD5
		if(int(Role) == int(ROLE_Authority))
		{
			MakeNoise(1.0000000);
			// End:0xD5
			if(Velocity.Z < (float(-1) * MaxFallSpeed))
			{
				EffectiveSpeed = Velocity.Z;
				// End:0x81
				if(TouchingWaterVolume())
				{
					EffectiveSpeed = FMin(0.0000000, EffectiveSpeed + float(100));
				}
				// End:0xD5
				if(EffectiveSpeed < (float(-1) * MaxFallSpeed))
				{
					TakeDamage(int((float(-100) * (EffectiveSpeed + MaxFallSpeed)) / MaxFallSpeed), none, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'Engine.fell');
				}
			}
		}
		// End:0x11B
		if(Controller != none)
		{
			Shake = FMin(1.0000000, (-1.0000000 * Velocity.Z) / MaxFallSpeed);
			Controller.DamageShake(int(Shake));
		}		
	}
	else
	{
		// End:0x141
		if(Velocity.Z < (-1.4000000 * JumpZ))
		{
			MakeNoise(0.5000000);
		}
	}
	//return;	
}

function ClientReStart()
{
	Velocity = vect(0.0000000, 0.0000000, 0.0000000);
	Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
	BaseEyeHeight = default.BaseEyeHeight;
	EyeHeight = BaseEyeHeight;
	PlayWaiting();
	//return;	
}

function ClientSetLocation(Vector NewLocation, Rotator NewRotation)
{
	// End:0x24
	if(Controller != none)
	{
		Controller.ClientSetLocation(NewLocation, NewRotation);
	}
	//return;	
}

function ClientSetRotation(Rotator NewRotation)
{
	// End:0x1F
	if(Controller != none)
	{
		Controller.ClientSetRotation(NewRotation);
	}
	//return;	
}

simulated function FaceRotation(Rotator NewRotation, float DeltaTime)
{
	// End:0x24
	if(int(Physics) == int(11))
	{
		SetRotation(OnLadder.WallDir);		
	}
	else
	{
		// End:0x52
		if((int(Physics) == int(1)) || int(Physics) == int(2))
		{
			NewRotation.Pitch = 0;
		}
		SetRotation(NewRotation);
	}
	//return;	
}

simulated function int LimitPitch(int Pitch)
{
	Pitch = Pitch & 65535;
	// End:0x68
	if((Pitch > PitchUpLimit) && Pitch < PitchDownLimit)
	{
		// End:0x5D
		if((Pitch - PitchUpLimit) < (PitchDownLimit - Pitch))
		{
			Pitch = PitchUpLimit;			
		}
		else
		{
			Pitch = PitchDownLimit;
		}
	}
	return Pitch;
	//return;	
}

function ClientDying(Class<DamageType> DamageType, Vector HitLocation)
{
	// End:0x24
	if(Controller != none)
	{
		Controller.ClientDying(DamageType, HitLocation);
	}
	//return;	
}

function DoComboName(string ComboClassName)
{
	//return;	
}

function bool InCurrentCombo()
{
	return false;
	//return;	
}

function EnableUDamage(float Amount)
{
	//return;	
}

function DisableUDamage()
{
	//return;	
}

function float GetShieldStrengthMax()
{
	//return;	
}

function float GetShieldStrength()
{
	//return;	
}

function bool AddShieldStrength(int Amount)
{
	//return;	
}

function int CanUseShield(int Amount)
{
	//return;	
}

simulated function bool CanThrowWeapon()
{
	return ((Weapon != none) && Weapon.CanThrow()) && Level.Game.bAllowWeaponThrowing;
	//return;	
}

function TossWeapon(Vector TossVel)
{
	local Vector X, Y, Z;

	Weapon.Velocity = TossVel;
	GetAxes(Rotation, X, Y, Z);
	Weapon.DropFrom((Location + ((0.8000000 * CollisionRadius) * X)) - ((0.5000000 * CollisionRadius) * Y));
	//return;	
}

exec function SwitchToLastWeapon()
{
	// End:0x61
	if(((Weapon != none) && Weapon.OldWeapon != none) && Weapon.OldWeapon.HasAmmo())
	{
		PendingWeapon = Weapon.OldWeapon;
		Weapon.PutDown();
	}
	//return;	
}

simulated function PrevWeapon()
{
	// End:0x16
	if(Level.Pauser != none)
	{
		return;
	}
	// End:0x3F
	if((Weapon == none) && Controller != none)
	{
		Controller.SwitchToBestWeapon();
		return;
	}
	// End:0x7C
	if(PendingWeapon != none)
	{
		// End:0x5E
		if(PendingWeapon.bForceSwitch)
		{
			return;
		}
		PendingWeapon = Inventory.PrevWeapon(none, PendingWeapon);		
	}
	else
	{
		PendingWeapon = Inventory.PrevWeapon(none, Weapon);
	}
	// End:0xB1
	if(PendingWeapon != none)
	{
		Weapon.PutDown();
	}
	//return;	
}

simulated function NextWeapon()
{
	// End:0x16
	if(Level.Pauser != none)
	{
		return;
	}
	// End:0x3F
	if((Weapon == none) && Controller != none)
	{
		Controller.SwitchToBestWeapon();
		return;
	}
	// End:0x7C
	if(PendingWeapon != none)
	{
		// End:0x5E
		if(PendingWeapon.bForceSwitch)
		{
			return;
		}
		PendingWeapon = Inventory.NextWeapon(none, PendingWeapon);		
	}
	else
	{
		PendingWeapon = Inventory.NextWeapon(none, Weapon);
	}
	// End:0xB1
	if(PendingWeapon != none)
	{
		Weapon.PutDown();
	}
	//return;	
}

simulated function SwitchWeapon(byte F)
{
	local Weapon newWeapon;

	// End:0x23
	if((Level.Pauser != none) || Inventory == none)
	{
		return;
	}
	// End:0x6B
	if((Weapon != none) && Weapon.Inventory != none)
	{
		newWeapon = Weapon.Inventory.WeaponChange(F, false);		
	}
	else
	{
		newWeapon = none;
	}
	// End:0x98
	if(newWeapon == none)
	{
		newWeapon = Inventory.WeaponChange(F, true);
	}
	// End:0xB9
	if(newWeapon == none)
	{
		// End:0xB7
		if(int(F) == 10)
		{
			ServerNoTranslocator();
		}
		return;
	}
	// End:0xDA
	if((PendingWeapon != none) && PendingWeapon.bForceSwitch)
	{
		return;
	}
	// End:0xF9
	if(Weapon == none)
	{
		PendingWeapon = newWeapon;
		ChangedWeapon();		
	}
	else
	{
		// End:0x132
		if((Weapon != newWeapon) || PendingWeapon != none)
		{
			PendingWeapon = newWeapon;
			Weapon.PutDown();			
		}
		else
		{
			// End:0x150
			if(Weapon == newWeapon)
			{
				Weapon.Reselect();
			}
		}
	}
	//return;	
}

function ServerNoTranslocator()
{
	// End:0x36
	if(Level.Game != none)
	{
		Level.Game.NoTranslocatorKeyPressed(PlayerController(Controller));
	}
	//return;	
}

exec function NextItem()
{
	// End:0x0D
	if(Inventory == none)
	{
		return;
	}
	// End:0x2F
	if(SelectedItem == none)
	{
		SelectedItem = Inventory.SelectNext();
		return;
	}
	// End:0x64
	if(SelectedItem.Inventory != none)
	{
		SelectedItem = SelectedItem.Inventory.SelectNext();		
	}
	else
	{
		SelectedItem = Inventory.SelectNext();
	}
	// End:0x99
	if(SelectedItem == none)
	{
		SelectedItem = Inventory.SelectNext();
	}
	//return;	
}

function Inventory FindInventoryType(Class DesiredClass)
{
	local Inventory Inv, First;

	// End:0x4B
	foreach __NFUN_326__(Class<Inventory>(DesiredClass), Inv)
	{
		// End:0x2B
		if(First == none)
		{
			First = Inv;
		}
		// End:0x4A
		if(Inv.Class == DesiredClass)
		{			
			return Inv;
		}		
	}	
	return First;
	//return;	
}

function bool AddInventory(Inventory NewItem)
{
	local Inventory Inv;
	local Actor Last, Prev;
	local bool bAddedInOrder;

	Last = self;
	// End:0x3A
	if(NewItem == none)
	{
		Log("tried to add none inventory to " $ string(self));
	}
	NewItem.SetOwner(self);
	NewItem.NetUpdateTime = Level.TimeSeconds - float(1);
	// End:0x1BF
	if(Weapon(NewItem) != none)
	{
		Prev = self;
		// End:0x162
		foreach __NFUN_326__(Class'Engine.Inventory', Inv)
		{
			// End:0x104
			if((int(Inv.InventoryGroup) == int(NewItem.InventoryGroup)) && Weapon(Inv) != none)
			{
				// End:0x101
				if(int(Weapon(Inv).Priority) < int(Weapon(NewItem).Priority))
				{
					bAddedInOrder = true;
					// End:0x162
					break;
				}				
			}
			else
			{
				// End:0x14B
				if((Weapon(Prev) != none) && int(Weapon(Prev).InventoryGroup) == int(NewItem.InventoryGroup))
				{
					bAddedInOrder = true;
					// End:0x162
					break;
				}
			}
			// End:0x161
			if(!bAddedInOrder)
			{
				Prev = Inv;
			}			
		}		
		// End:0x1BF
		if(bAddedInOrder)
		{
			NewItem.Inventory = Prev.Inventory;
			Prev.Inventory = NewItem;
			Prev.NetUpdateTime = Level.TimeSeconds - float(1);
		}
	}
	// End:0x23F
	if(!bAddedInOrder)
	{
		// End:0x1F8
		foreach __NFUN_326__(Class'Engine.Inventory', Inv)
		{
			// End:0x1EC
			if(Inv == NewItem)
			{				
				return false;
			}
			Last = Inv;			
		}		
		NewItem.Inventory = none;
		Last.Inventory = NewItem;
		Last.NetUpdateTime = Level.TimeSeconds - float(1);
	}
	// End:0x25E
	if(Controller != none)
	{
		Controller.NotifyAddInventory(NewItem);
	}
	return true;
	//return;	
}

function DeleteInventory(Inventory Item)
{
	local Actor Link;
	local int Count;

	// End:0x16
	if(Item == Weapon)
	{
		Weapon = none;
	}
	// End:0x2C
	if(Item == SelectedItem)
	{
		SelectedItem = none;
	}
	Link = self;
	J0x33:

	// End:0x113 [Loop If]
	if(Link != none)
	{
		// End:0xCA
		if(Link.Inventory == Item)
		{
			Link.Inventory = Item.Inventory;
			Item.Inventory = none;
			Link.NetUpdateTime = Level.TimeSeconds - float(1);
			Item.NetUpdateTime = Level.TimeSeconds - float(1);
			// [Explicit Break]
			goto J0x113;
		}
		// End:0xFC
		if(int(Level.NetMode) == int(NM_Client))
		{
			Count++;
			// End:0xFC
			if(Count > 1000)
			{
				// [Explicit Break]
				goto J0x113;
			}
		}
		Link = Link.Inventory;
		// [Loop Continue]
		goto J0x33;
	}
	J0x113:

	Item.SetOwner(none);
	//return;	
}

simulated function ChangedWeapon()
{
	local Weapon OldWeapon;

	ServerChangedWeapon(Weapon, PendingWeapon);
	// End:0x76
	if(int(Role) < int(ROLE_Authority))
	{
		OldWeapon = Weapon;
		Weapon = PendingWeapon;
		PendingWeapon = none;
		// End:0x57
		if(Controller != none)
		{
			Controller.ChangedWeapon();
		}
		// End:0x76
		if(Weapon != none)
		{
			Weapon.BringUp(OldWeapon);
		}
	}
	//return;	
}

function name GetOffhandBoneFor(Inventory i)
{
	return 'None';
	//return;	
}

function name GetWeaponBoneFor(Inventory i)
{
	return 'righthand';
	//return;	
}

function ServerChangedWeapon(Weapon OldWeapon, Weapon newWeapon)
{
	Weapon = newWeapon;
	// End:0x25
	if(Controller != none)
	{
		Controller.ChangedWeapon();
	}
	PendingWeapon = none;
	// End:0x7A
	if(OldWeapon != none)
	{
		OldWeapon.SetDefaultDisplayProperties();
		OldWeapon.DetachFromPawn(self);
		OldWeapon.GotoState('Hidden');
		OldWeapon.NetUpdateFrequency = 2.0000000;
	}
	// End:0xC8
	if(Weapon != none)
	{
		Weapon.NetUpdateFrequency = 100.0000000;
		Weapon.AttachToPawn(self);
		Weapon.BringUp(OldWeapon);
		PlayWeaponSwitch(newWeapon);
	}
	// End:0xE7
	if(Inventory != none)
	{
		Inventory.OwnerEvent('ChangedWeapon');
	}
	//return;	
}

function bool IsHeadShot(Vector loc, Vector ray, float AdditionalScale)
{
	local Coords C;
	local Vector HeadLoc, B, M, diff;
	local float t, DotMM, Distance;
	local int look;

	// End:0x11
	if(HeadBone == 'None')
	{
		return false;
	}
	// End:0x12B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		// End:0x51
		if(int(Physics) == int(2))
		{
			PlayAnim(AirAnims[0], 1.0000000, 0.0000000);			
		}
		else
		{
			// End:0xFC
			if(int(Physics) == int(1))
			{
				// End:0x7F
				if(bIsCrouched)
				{
					PlayAnim(IdleCrouchAnim, 1.0000000, 0.0000000);					
				}
				else
				{
					PlayAnim(IdleWeaponAnim, 1.0000000, 0.0000000);
				}
				// End:0xF9
				if(bDoTorsoTwist)
				{
					SmoothViewYaw = Rotation.Yaw;
					SmoothViewPitch = int(ViewPitch);
					look = (256 * int(ViewPitch)) & 65535;
					// End:0xED
					if(look > 32768)
					{
						look -= 65536;
					}
					SetTwistLook(0, look);
				}				
			}
			else
			{
				// End:0x120
				if(int(Physics) == int(3))
				{
					PlayAnim(SwimAnims[0], 1.0000000, 0.0000000);
				}
			}
		}
		SetAnimFrame(0.5000000);
	}
	C = GetBoneCoords(HeadBone);
	HeadLoc = C.Origin + (((HeadHeight * HeadScale) * AdditionalScale) * C.XAxis);
	B = loc;
	M = ray * ((2.0000000 * CollisionHeight) + (2.0000000 * CollisionRadius));
	diff = HeadLoc - B;
	t = M Dot diff;
	// End:0x239
	if(t > float(0))
	{
		DotMM = M Dot M;
		// End:0x21F
		if(t < DotMM)
		{
			t = t / DotMM;
			diff = diff - (t * M);			
		}
		else
		{
			t = 1.0000000;
			diff -= M;
		}		
	}
	else
	{
		t = 0.0000000;
	}
	Distance = Sqrt(diff Dot diff);
	return Distance < ((HeadRadius * HeadScale) * AdditionalScale);
	//return;	
}

event bool EncroachingOn(Actor Other)
{
	// End:0x28
	if(Other.bWorldGeometry || Other.bBlocksTeleport)
	{
		return true;
	}
	// End:0x5D
	if(((Vehicle(Other) != none) && Weapon != none) && Weapon.IsA('Translauncher'))
	{
		return true;
	}
	// End:0x9D
	if((((Controller == none) || !Controller.bIsPlayer) || bWarping) && Pawn(Other) != none)
	{
		return true;
	}
	return false;
	//return;	
}

event EncroachedBy(Actor Other)
{
	// End:0x2D
	if((Pawn(Other) != none) && Vehicle(Other) == none)
	{
		gibbedBy(Other);
	}
	//return;	
}

function gibbedBy(Actor Other)
{
	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x48
	if(Pawn(Other) != none)
	{
		Died(Pawn(Other).Controller, Class'Engine.DamTypeTelefragged', Location);		
	}
	else
	{
		Died(none, Class'Engine.Gibbed', Location);
	}
	//return;	
}

function JumpOffPawn()
{
	Velocity += ((float(100) + CollisionRadius) * VRand());
	Velocity.Z = 200.0000000 + CollisionHeight;
	SetPhysics(2);
	bNoJumpAdjust = true;
	// End:0x54
	if(Controller != none)
	{
		Controller.SetFall();
	}
	//return;	
}

singular event BaseChange()
{
	local float decorMass;

	// End:0x0B
	if(bInterpolating)
	{
		return;
	}
	// End:0x30
	if((Base == none) && int(Physics) == int(0))
	{
		SetPhysics(2);		
	}
	else
	{
		// End:0xCE
		if((Pawn(Base) != none) && Base != DrivenVehicle)
		{
			// End:0xCB
			if(!Pawn(Base).bCanBeBaseForPawns)
			{
				Base.TakeDamage(int((float(int(float(1) - (Velocity.Z / float(400)))) * Mass) / Base.Mass), self, Location, 0.5000000 * Velocity, Class'Engine.Crushed');
				JumpOffPawn();
			}			
		}
		else
		{
			// End:0x168
			if((Decoration(Base) != none) && Velocity.Z < float(-400))
			{
				decorMass = FMax(Decoration(Base).Mass, 1.0000000);
				Base.TakeDamage(int((((float(-2) * Mass) / decorMass) * Velocity.Z) / float(400)), self, Location, 0.5000000 * Velocity, Class'Engine.Crushed');
			}
		}
	}
	//return;	
}

event UpdateEyeHeight(float DeltaTime)
{
	local float smooth, MaxEyeHeight, OldEyeHeight;
	local Actor HitActor;
	local Vector HitLocation, HitNormal;

	// End:0x18
	if(Controller == none)
	{
		EyeHeight = 0.0000000;
		return;
	}
	// End:0x3E
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		EyeHeight = BaseEyeHeight;
		return;
	}
	// End:0x5C
	if(bTearOff)
	{
		EyeHeight = default.BaseEyeHeight;
		bUpdateEyeheight = false;
		return;
	}
	HitActor = Trace(HitLocation, HitNormal, Location + (((CollisionHeight + 35.0000000) + float(14)) * vect(0.0000000, 0.0000000, 1.0000000)), Location + (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000)), true);
	// End:0xD3
	if(HitActor == none)
	{
		MaxEyeHeight = CollisionHeight + 35.0000000;		
	}
	else
	{
		MaxEyeHeight = (HitLocation.Z - Location.Z) - float(14);
	}
	// End:0x121
	if(Abs(Location.Z - OldZ) > float(15))
	{
		bJustLanded = false;
		bLandRecovery = false;
	}
	// End:0x200
	if(!bJustLanded)
	{
		smooth = FMin(0.9000000, (10.0000000 * DeltaTime) / Level.TimeDilation);
		LandBob *= (float(1) - smooth);
		// End:0x1D1
		if(Controller.WantsSmoothedView())
		{
			OldEyeHeight = EyeHeight;
			EyeHeight = FClamp((((EyeHeight - Location.Z) + OldZ) * (float(1) - smooth)) + (BaseEyeHeight * smooth), -0.5000000 * CollisionHeight, MaxEyeHeight);			
		}
		else
		{
			EyeHeight = FMin((EyeHeight * (float(1) - smooth)) + (BaseEyeHeight * smooth), MaxEyeHeight);
		}		
	}
	else
	{
		// End:0x2AA
		if(bLandRecovery)
		{
			smooth = FMin(0.9000000, 10.0000000 * DeltaTime);
			OldEyeHeight = EyeHeight;
			EyeHeight = FMin((EyeHeight * (float(1) - (0.6000000 * smooth))) + ((BaseEyeHeight * 0.6000000) * smooth), BaseEyeHeight);
			LandBob *= (float(1) - smooth);
			// End:0x2A7
			if(EyeHeight >= (BaseEyeHeight - float(1)))
			{
				bJustLanded = false;
				bLandRecovery = false;
				EyeHeight = BaseEyeHeight;
			}			
		}
		else
		{
			smooth = FMin(0.6500000, 10.0000000 * DeltaTime);
			OldEyeHeight = EyeHeight;
			EyeHeight = FMin(EyeHeight * (float(1) - (1.5000000 * smooth)), MaxEyeHeight);
			LandBob += (0.0300000 * (OldEyeHeight - EyeHeight));
			// End:0x357
			if((EyeHeight < ((0.2500000 * BaseEyeHeight) + float(1))) || LandBob > float(3))
			{
				bLandRecovery = true;
				EyeHeight = (0.2500000 * BaseEyeHeight) + float(1);
			}
		}
	}
	Controller.AdjustView(DeltaTime);
	//return;	
}

simulated function Vector EyePosition()
{
	return (EyeHeight * vect(0.0000000, 0.0000000, 1.0000000)) + WalkBob;
	//return;	
}

simulated event Destroyed()
{
	// End:0x17
	if(Shadow != none)
	{
		Shadow.Destroy();
	}
	// End:0x32
	if(Controller != none)
	{
		Controller.PawnDied(self);
	}
	// End:0x4D
	if(int(Level.NetMode) == int(NM_Client))
	{
		return;
	}
	J0x4D:

	// End:0x67 [Loop If]
	if(Inventory != none)
	{
		Inventory.Destroy();
		// [Loop Continue]
		goto J0x4D;
	}
	Weapon = none;
	super.Destroyed();
	//return;	
}

event PreBeginPlay()
{
	super.PreBeginPlay();
	Instigator = self;
	DesiredRotation = Rotation;
	// End:0x23
	if(bDeleteMe)
	{
		return;
	}
	// End:0x42
	if(BaseEyeHeight == float(0))
	{
		BaseEyeHeight = 0.8000000 * CollisionHeight;
	}
	EyeHeight = BaseEyeHeight;
	// End:0x6C
	if(MenuName == "")
	{
		MenuName = GetItemName(string(Class));
	}
	//return;	
}

event PostBeginPlay()
{
	local AIScript A;

	super.PostBeginPlay();
	SplashTime = 0.0000000;
	SpawnTime = Level.TimeSeconds;
	EyeHeight = BaseEyeHeight;
	OldRotYaw = float(Rotation.Yaw);
	// End:0x11A
	if((Level.bStartup && Health > 0) && !bDontPossess)
	{
		// End:0xBF
		if(AIScriptTag != 'None')
		{
			// End:0x96
			foreach AllActors(Class'Engine.AIScript', A, AIScriptTag)
			{
				// End:0x96
				break;				
			}			
			// End:0xBF
			if(A != none)
			{
				A.SpawnControllerFor(self);
				// End:0xBF
				if(Controller != none)
				{
					return;
				}
			}
		}
		// End:0xE5
		if((ControllerClass != none) && Controller == none)
		{
			Controller = Spawn(ControllerClass);
		}
		// End:0x11A
		if(Controller != none)
		{
			Controller.Possess(self);
			AIController(Controller).Skill += SkillModifier;
		}
	}
	//return;	
}

simulated event PostNetBeginPlay()
{
	local PlayerController P;

	// End:0x40
	if(Level.bDropDetail || int(Level.DetailMode) == int(0))
	{
		MaxLights = byte(Min(4, int(MaxLights)));
	}
	// End:0x52
	if(int(Role) == int(ROLE_Authority))
	{
		return;
	}
	// End:0xC7
	if((Controller != none) && Controller.Pawn == none)
	{
		Controller.Pawn = self;
		// End:0xC7
		if((PlayerController(Controller) != none) && PlayerController(Controller).ViewTarget == Controller)
		{
			PlayerController(Controller).SetViewTarget(self);
		}
	}
	// End:0xDF
	if(int(Role) == int(ROLE_AutonomousProxy))
	{
		bUpdateEyeheight = true;
	}
	// End:0x182
	if((PlayerReplicationInfo != none) && PlayerReplicationInfo.Owner == none)
	{
		PlayerReplicationInfo.SetOwner(Controller);
		// End:0x182
		if(Left(PlayerReplicationInfo.PlayerName, 5) ~= "PRESS")
		{
			P = Level.GetLocalPlayerController();
			// End:0x182
			if((P.PlayerReplicationInfo != none) && !Left(PlayerReplicationInfo.PlayerName, 5) ~= "PRESS")
			{
				bScriptPostRender = true;
			}
		}
	}
	PlayWaiting();
	//return;	
}

simulated function SetMesh()
{
	// End:0x0D
	if(Mesh != none)
	{
		return;
	}
	LinkMesh(default.Mesh);
	//return;	
}

function Gasp()
{
	//return;	
}

function SetMovementPhysics()
{
	//return;	
}

function bool GiveHealth(int HealAmount, int HealMax)
{
	// End:0x2A
	if(Health < HealMax)
	{
		Health = Min(HealMax, Health + HealAmount);
		return true;
	}
	return false;
	//return;	
}

function bool HasUDamage()
{
	return false;
	//return;	
}

function int ShieldAbsorb(int Damage)
{
	return Damage;
	//return;	
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	local int actualDamage;
	local Controller Killer;

	// End:0x6D
	if(DamageType == none)
	{
		// End:0x62
		if(instigatedBy != none)
		{
			Warn((("No damagetype for damage by " $ string(instigatedBy)) $ " with weapon ") $ string(instigatedBy.Weapon));
		}
		DamageType = Class'Engine.DamageType';
	}
	// End:0xB6
	if(int(Role) < int(ROLE_Authority))
	{
		Log((((string(self) $ " client damage type ") $ string(DamageType)) $ " by ") $ string(instigatedBy));
		return;
	}
	// End:0xC3
	if(Health <= 0)
	{
		return;
	}
	// End:0x119
	if((((instigatedBy == none) || instigatedBy.Controller == none) && DamageType.default.bDelayedDamage) && DelayedDamageInstigatorController != none)
	{
		instigatedBy = DelayedDamageInstigatorController.Pawn;
	}
	// End:0x13C
	if((int(Physics) == int(0)) && DrivenVehicle == none)
	{
		SetMovementPhysics();
	}
	// End:0x185
	if((int(Physics) == int(1)) && DamageType.default.bExtraMomentumZ)
	{
		Momentum.Z = FMax(Momentum.Z, 0.4000000 * VSize(Momentum));
	}
	// End:0x19C
	if(instigatedBy == self)
	{
		Momentum *= 0.6000000;
	}
	Momentum = Momentum / Mass;
	// End:0x1E1
	if(Weapon != none)
	{
		Weapon.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	}
	// End:0x214
	if(DrivenVehicle != none)
	{
		DrivenVehicle.AdjustDriverDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	}
	// End:0x23E
	if((instigatedBy != none) && instigatedBy.HasUDamage())
	{
		Damage *= float(2);
	}
	actualDamage = Level.Game.ReduceDamage(Damage, self, instigatedBy, HitLocation, Momentum, DamageType);
	// End:0x2A6
	if(DamageType.default.bArmorStops && actualDamage > 0)
	{
		actualDamage = ShieldAbsorb(actualDamage);
	}
	Health -= actualDamage;
	// End:0x2D4
	if(HitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		HitLocation = Location;
	}
	PlayHit(float(actualDamage), instigatedBy, HitLocation, DamageType, Momentum);
	// End:0x3BD
	if(Health <= 0)
	{
		// End:0x347
		if((DamageType.default.bCausedByWorld && (instigatedBy == none) || instigatedBy == self) && LastHitBy != none)
		{
			Killer = LastHitBy;			
		}
		else
		{
			// End:0x367
			if(instigatedBy != none)
			{
				Killer = instigatedBy.GetKillerController();
			}
		}
		// End:0x391
		if((Killer == none) && DamageType.default.bDelayedDamage)
		{
			Killer = DelayedDamageInstigatorController;
		}
		// End:0x3A5
		if(bPhysicsAnimUpdate)
		{
			TearOffMomentum = Momentum;
		}
		Died(Killer, DamageType, HitLocation);		
	}
	else
	{
		AddVelocity(Momentum);
		// End:0x3FB
		if(Controller != none)
		{
			Controller.NotifyTakeHit(instigatedBy, HitLocation, actualDamage, DamageType, Momentum);
		}
		// End:0x427
		if((instigatedBy != none) && instigatedBy != self)
		{
			LastHitBy = instigatedBy.Controller;
		}
	}
	MakeNoise(1.0000000);
	//return;	
}

function SetDelayedDamageInstigatorController(Controller C)
{
	DelayedDamageInstigatorController = C;
	//return;	
}

simulated function int GetTeamNum()
{
	// End:0x1B
	if(Controller != none)
	{
		return Controller.GetTeamNum();
	}
	// End:0x55
	if((DrivenVehicle != none) && DrivenVehicle.Controller != none)
	{
		return DrivenVehicle.Controller.GetTeamNum();
	}
	// End:0x79
	if((PlayerReplicationInfo == none) || PlayerReplicationInfo.Team == none)
	{
		return 255;
	}
	return PlayerReplicationInfo.Team.TeamIndex;
	//return;	
}

function TeamInfo GetTeam()
{
	// End:0x1A
	if(PlayerReplicationInfo != none)
	{
		return PlayerReplicationInfo.Team;
	}
	// End:0x53
	if((DrivenVehicle != none) && DrivenVehicle.PlayerReplicationInfo != none)
	{
		return DrivenVehicle.PlayerReplicationInfo.Team;
	}
	return none;
	//return;	
}

function Controller GetKillerController()
{
	return Controller;
	//return;	
}

function Died(Controller Killer, Class<DamageType> DamageType, Vector HitLocation)
{
	local Vector TossVel;
	local Trigger t;
	local NavigationPoint N;

	// End:0x35
	if((bDeleteMe || Level.bLevelChange) || Level.Game == none)
	{
		return;
	}
	// End:0x7D
	if((DamageType.default.bCausedByWorld && (Killer == none) || Killer == Controller) && LastHitBy != none)
	{
		Killer = LastHitBy;
	}
	// End:0xB8
	if(Level.Game.PreventDeath(self, Killer, DamageType, HitLocation))
	{
		Health = Max(Health, 1);
		return;
	}
	Health = Min(0, Health);
	// End:0x173
	if((Weapon != none) && (DrivenVehicle == none) || DrivenVehicle.bAllowWeaponToss)
	{
		// End:0x11A
		if(Controller != none)
		{
			Controller.LastPawnWeapon = Weapon.Class;
		}
		Weapon.HolderDied();
		TossVel = Vector(GetViewRotation());
		TossVel = (TossVel * ((Velocity Dot TossVel) + float(500))) + vect(0.0000000, 0.0000000, 200.0000000);
		TossWeapon(TossVel);
	}
	// End:0x1A1
	if(DrivenVehicle != none)
	{
		Velocity = DrivenVehicle.Velocity;
		DrivenVehicle.DriverDied();
	}
	// End:0x1EB
	if(Controller != none)
	{
		Controller.WasKilledBy(Killer);
		Level.Game.Killed(Killer, Controller, self, DamageType);		
	}
	else
	{
		Level.Game.Killed(Killer, Controller(Owner), self, DamageType);
	}
	DrivenVehicle = none;
	// End:0x247
	if(Killer != none)
	{
		TriggerEvent(Event, self, Killer.Pawn);		
	}
	else
	{
		TriggerEvent(Event, self, none);
	}
	// End:0x2CE
	if((IsPlayerPawn()) || WasPlayerPawn())
	{
		PhysicsVolume.PlayerPawnDiedInVolume(self);
		// End:0x299
		foreach TouchingActors(Class'Engine.Trigger', t)
		{
			t.PlayerToucherDied(self);			
		}		
		// End:0x2CD
		foreach TouchingActors(Class'Engine.NavigationPoint', N)
		{
			// End:0x2CC
			if(N.bReceivePlayerToucherDiedNotify)
			{
				N.PlayerToucherDied(self);
			}			
		}		
	}
	RemovePowerups();
	Velocity.Z *= 1.3000000;
	// End:0x302
	if(IsHumanControlled())
	{
		PlayerController(Controller).ForceDeathUpdate();
	}
	// End:0x33D
	if((DamageType != none) && DamageType.default.bAlwaysGibs)
	{
		ChunkUp(Rotation, DamageType.default.GibPerterbation);		
	}
	else
	{
		NetUpdateFrequency = default.NetUpdateFrequency;
		PlayDying(DamageType, HitLocation);
		// End:0x375
		if(Level.Game.bGameEnded)
		{
			return;
		}
		// End:0x39D
		if(!bPhysicsAnimUpdate && !IsLocallyControlled())
		{
			ClientDying(DamageType, HitLocation);
		}
	}
	//return;	
}

function RemovePowerups()
{
	//return;	
}

event Falling()
{
	// End:0x1A
	if(Controller != none)
	{
		Controller.SetFall();
	}
	//return;	
}

event HitWall(Vector HitNormal, Actor Wall)
{
	//return;	
}

event Landed(Vector HitNormal)
{
	ImpactVelocity = vect(0.0000000, 0.0000000, 0.0000000);
	TakeFallingDamage();
	// End:0x34
	if(Health > 0)
	{
		PlayLanded(Velocity.Z);
	}
	// End:0x87
	if((Velocity.Z < float(-200)) && PlayerController(Controller) != none)
	{
		bJustLanded = PlayerController(Controller).bLandingShake;
		OldZ = Location.Z;
	}
	LastHitBy = none;
	//return;	
}

event HeadVolumeChange(PhysicsVolume newHeadVolume)
{
	// End:0x28
	if((int(Level.NetMode) == int(NM_Client)) || Controller == none)
	{
		return;
	}
	// End:0x93
	if(HeadVolume.bWaterVolume)
	{
		// End:0x90
		if(!newHeadVolume.bWaterVolume)
		{
			// End:0x85
			if((Controller.bIsPlayer && BreathTime > float(0)) && BreathTime < float(8))
			{
				Gasp();
			}
			BreathTime = -1.0000000;
		}		
	}
	else
	{
		// End:0xB0
		if(newHeadVolume.bWaterVolume)
		{
			BreathTime = UnderWaterTime;
		}
	}
	//return;	
}

function bool TouchingWaterVolume()
{
	local PhysicsVolume V;

	// End:0x26
	foreach TouchingActors(Class'Engine.PhysicsVolume', V)
	{
		// End:0x25
		if(V.bWaterVolume)
		{			
			return true;
		}		
	}	
	return false;
	//return;	
}

function bool IsInPain()
{
	local PhysicsVolume V;

	// End:0x58
	foreach TouchingActors(Class'Engine.PhysicsVolume', V)
	{
		// End:0x57
		if((V.bPainCausing && V.DamageType != ReducedDamageType) && V.DamagePerSec > float(0))
		{			
			return true;
		}		
	}	
	return false;
	//return;	
}

event BreathTimer()
{
	// End:0x42
	if((((Health < 0) || int(Level.NetMode) == int(NM_Client)) || DrivenVehicle != none) || Controller == none)
	{
		return;
	}
	TakeDrowningDamage();
	// End:0x5E
	if(Health > 0)
	{
		BreathTime = 2.0000000;
	}
	//return;	
}

function TakeDrowningDamage()
{
	//return;	
}

function bool CheckWaterJump(out Vector WallNormal)
{
	local Actor HitActor;
	local Vector HitLocation, HitNormal, checkpoint, Start, checkNorm;

	// End:0x2B
	if(AIController(Controller) != none)
	{
		checkpoint = Acceleration;
		checkpoint.Z = 0.0000000;
	}
	// End:0x4F
	if(checkpoint == vect(0.0000000, 0.0000000, 0.0000000))
	{
		checkpoint = Vector(Rotation);
	}
	checkpoint.Z = 0.0000000;
	checkNorm = Normal(checkpoint);
	checkpoint = Location + ((1.2000000 * CollisionRadius) * checkNorm);
	HitActor = Trace(HitLocation, HitNormal, checkpoint, Location, true, GetCollisionExtent());
	// End:0x164
	if((HitActor != none) && Pawn(HitActor) == none)
	{
		WallNormal = float(-1) * HitNormal;
		Start = Location;
		Start.Z += (1.1000000 * 35.0000000);
		checkpoint = Start + ((float(2) * CollisionRadius) * checkNorm);
		HitActor = Trace(HitLocation, HitNormal, checkpoint, Start, true);
		// End:0x164
		if((HitActor == none) || HitNormal.Z > 0.7000000)
		{
			return true;
		}
	}
	return false;
	//return;	
}

function DoDoubleJump(bool bUpdating)
{
	//return;	
}

function bool CanDoubleJump()
{
	//return;	
}

function bool CanMultiJump()
{
	//return;	
}

function UpdateRocketAcceleration(float DeltaTime, float YawChange, float PitchChange)
{
	//return;	
}

function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
{
	//return;	
}

function bool Dodge(Actor.EDoubleClickDir DoubleClickMove)
{
	return false;
	//return;	
}

function bool DoJump(bool bUpdating)
{
	// End:0x19A
	if((!bIsCrouched && !bWantsToCrouch) && ((int(Physics) == int(1)) || int(Physics) == int(11)) || int(Physics) == int(9))
	{
		// End:0xDF
		if(int(Role) == int(ROLE_Authority))
		{
			// End:0xB5
			if((Level.Game != none) && Level.Game.GameDifficulty > float(2))
			{
				MakeNoise(0.1000000 * Level.Game.GameDifficulty);
			}
			// End:0xDF
			if(bCountJumps && Inventory != none)
			{
				Inventory.OwnerEvent('Jumped');
			}
		}
		// End:0x104
		if(int(Physics) == int(9))
		{
			Velocity = JumpZ * Floor;			
		}
		else
		{
			// End:0x127
			if(int(Physics) == int(11))
			{
				Velocity.Z = 0.0000000;				
			}
			else
			{
				// End:0x143
				if(bIsWalking)
				{
					Velocity.Z = default.JumpZ;					
				}
				else
				{
					Velocity.Z = JumpZ;
				}
			}
		}
		// End:0x193
		if((Base != none) && !Base.bWorldGeometry)
		{
			Velocity.Z += Base.Velocity.Z;
		}
		SetPhysics(2);
		return true;
	}
	return false;
	//return;	
}

function PlayMoverHitSound()
{
	//return;	
}

function PlayDyingSound()
{
	//return;	
}

function PlayHit(float Damage, Pawn instigatedBy, Vector HitLocation, Class<DamageType> DamageType, Vector Momentum)
{
	local Vector BloodOffset, Mo, HitNormal;
	local Class<Effects> DesiredEffect;
	local Class<Emitter> DesiredEmitter;
	local PlayerController Hearer;

	// End:0x0D
	if(DamageType == none)
	{
		return;
	}
	// End:0x3F
	if((Damage <= float(0)) && (Controller == none) || !Controller.bGodMode)
	{
		return;
	}
	// End:0x1CD
	if(Damage > float(DamageType.default.DamageThreshold))
	{
		HitNormal = Normal(HitLocation - Location);
		// End:0x1CD
		if(EffectIsRelevant(Location, true))
		{
			DesiredEffect = DamageType.static.GetPawnDamageEffect(HitLocation, Damage, Momentum, self, Level.bDropDetail || int(Level.DetailMode) == int(0));
			// End:0x156
			if(DesiredEffect != none)
			{
				BloodOffset = (0.2000000 * CollisionRadius) * HitNormal;
				BloodOffset.Z = BloodOffset.Z * 0.5000000;
				Mo = Momentum;
				// End:0x139
				if(Mo.Z > float(0))
				{
					Mo.Z *= 0.5000000;
				}
				Spawn(DesiredEffect, self,, HitLocation + BloodOffset, Rotator(Mo));
			}
			DesiredEmitter = DamageType.static.GetPawnDamageEmitter(HitLocation, Damage, Momentum, self, Level.bDropDetail || int(Level.DetailMode) == int(0));
			// End:0x1CD
			if(DesiredEmitter != none)
			{
				Spawn(DesiredEmitter,,, HitLocation + HitNormal, Rotator(HitNormal));
			}
		}
	}
	// End:0x213
	if(Health <= 0)
	{
		// End:0x211
		if(PhysicsVolume.bDestructive && PhysicsVolume.ExitActor != none)
		{
			Spawn(PhysicsVolume.ExitActor);
		}
		return;
	}
	// End:0x2DA
	if((Level.TimeSeconds - LastPainTime) > 0.1000000)
	{
		// End:0x277
		if(((instigatedBy != none) && DamageType != none) && DamageType.default.bDirectDamage)
		{
			Hearer = PlayerController(instigatedBy.Controller);
		}
		// End:0x293
		if(Hearer != none)
		{
			Hearer.bAcuteHearing = true;
		}
		PlayTakeHit(HitLocation, int(Damage), DamageType);
		// End:0x2C6
		if(Hearer != none)
		{
			Hearer.bAcuteHearing = false;
		}
		LastPainTime = Level.TimeSeconds;
	}
	//return;	
}

simulated function ChunkUp(Rotator HitRotation, float ChunkPerterbation)
{
	// End:0x57
	if((int(Level.NetMode) != int(NM_Client)) && Controller != none)
	{
		// End:0x4B
		if(Controller.bIsPlayer)
		{
			Controller.PawnDied(self);			
		}
		else
		{
			Controller.Destroy();
		}
	}
	Destroy();
	//return;	
}

simulated function TurnOff()
{
	SetCollision(true, false);
	AmbientSound = none;
	bNoWeaponFiring = true;
	Velocity = vect(0.0000000, 0.0000000, 0.0000000);
	SetPhysics(0);
	bPhysicsAnimUpdate = false;
	bIsIdle = true;
	bWaitForAnim = false;
	StopAnimating();
	bIgnoreForces = true;
	//return;	
}

function bool IsInLoadout(Class<Inventory> InventoryClass)
{
	return true;
	//return;	
}

simulated event SetAnimAction(name NewAction)
{
	//return;	
}

simulated event PlayDying(Class<DamageType> DamageType, Vector HitLoc)
{
	AmbientSound = none;
	GotoState('Dying');
	// End:0x38
	if(bPhysicsAnimUpdate)
	{
		bReplicateMovement = false;
		bTearOff = true;
		Velocity += TearOffMomentum;
		SetPhysics(2);
	}
	bPlayedDeath = true;
	//return;	
}

simulated function PlayFiring(optional float Rate, optional name FiringMode)
{
	//return;	
}

function PlayWeaponSwitch(Weapon newWeapon)
{
	//return;	
}

simulated event StopPlayFiring()
{
	bSteadyFiring = false;
	//return;	
}

function PlayTakeHit(Vector HitLoc, int Damage, Class<DamageType> DamageType)
{
	local Sound DesiredSound;

	// End:0x0D
	if(Damage == 0)
	{
		return;
	}
	DesiredSound = DamageType.static.GetPawnDamageSound();
	// End:0x3A
	if(DesiredSound != none)
	{
		PlayOwnedSound(DesiredSound, 1);
	}
	//return;	
}

simulated event ChangeAnimation()
{
	// End:0x21
	if((Controller != none) && Controller.bControlAnimations)
	{
		return;
	}
	PlayWaiting();
	PlayMoving();
	//return;	
}

simulated event AnimEnd(int Channel)
{
	// End:0x11
	if(Channel == 0)
	{
		PlayWaiting();
	}
	//return;	
}

function bool CannotJumpNow()
{
	return false;
	//return;	
}

simulated event PlayJump()
{
	//return;	
}

simulated event PlayFalling()
{
	//return;	
}

simulated function PlayMoving()
{
	//return;	
}

simulated function PlayWaiting()
{
	//return;	
}

function PlayLanded(float impactVel)
{
	// End:0x16
	if(!bPhysicsAnimUpdate)
	{
		PlayLandingAnimation(impactVel);
	}
	//return;	
}

simulated event PlayLandingAnimation(float impactVel)
{
	//return;	
}

function PlayVictoryAnimation()
{
	//return;	
}

function Vehicle GetVehicleBase()
{
	return Vehicle(Base);
	//return;	
}

function int GetSpree()
{
	return 0;
	//return;	
}

function IncrementSpree()
{
	//return;	
}

simulated function RawInput(float DeltaTime, float aBaseX, float aBaseY, float aBaseZ, float aMouseX, float aMouseY, float aForward, float aTurn, float aStrafe, float aUp, float aLookUp)
{
	//return;	
}

function Suicide()
{
	KilledBy(self);
	//return;	
}

function bool CheatWalk()
{
	UnderWaterTime = default.UnderWaterTime;
	SetCollision(true, true, true);
	SetPhysics(1);
	bCollideWorld = true;
	return true;
	//return;	
}

function bool CheatGhost()
{
	UnderWaterTime = -1.0000000;
	SetCollision(false, false, false);
	bCollideWorld = false;
	return true;
	//return;	
}

function bool CheatFly()
{
	UnderWaterTime = default.UnderWaterTime;
	SetCollision(true, true, true);
	bCollideWorld = true;
	return true;
	//return;	
}

function float RangedAttackTime()
{
	// End:0x1B
	if(Weapon != none)
	{
		return Weapon.RangedAttackTime();
	}
	return 0.0000000;
	//return;	
}

simulated function Vector GetTargetLocation()
{
	return Location;
	//return;	
}

state Dying
{
	ignores BreathTimer;

	event ChangeAnimation()
	{
		//return;		
	}

	event StopPlayFiring()
	{
		//return;		
	}

	function PlayFiring(float Rate, name FiringMode)
	{
		//return;		
	}

	function PlayWeaponSwitch(Weapon newWeapon)
	{
		//return;		
	}

	function PlayTakeHit(Vector HitLoc, int Damage, Class<DamageType> DamageType)
	{
		//return;		
	}

	simulated function PlayNextAnimation()
	{
		//return;		
	}

	function Died(Controller Killer, Class<DamageType> DamageType, Vector HitLocation)
	{
		//return;		
	}

	event FellOutOfWorld(Actor.eKillZType KillType)
	{
		// End:0x24
		if((int(KillType) == int(1)) || int(KillType) == int(2))
		{
			return;
		}
		Destroy();
		//return;		
	}

	function Timer()
	{
		// End:0x0E
		if(!PlayerCanSeeMe())
		{
			Destroy();			
		}
		else
		{
			SetTimer(2.0000000, false);
		}
		//return;		
	}

	function Landed(Vector HitNormal)
	{
		local Rotator finalRot;

		// End:0x4F
		if(Velocity.Z < float(-500))
		{
			TakeDamage(int(float(1) - (Velocity.Z / float(30))), Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'Engine.Crushed');
		}
		finalRot = Rotation;
		finalRot.Roll = 0;
		finalRot.Pitch = 0;
		SetRotation(finalRot);
		SetPhysics(0);
		SetCollision(true, false);
		// End:0x93
		if(!IsAnimating(0))
		{
			LieStill();
		}
		//return;		
	}

	function ReduceCylinder()
	{
		SetCollision(false, false);
		//return;		
	}

	function LandThump()
	{
		// End:0x18
		if(int(Physics) == int(0))
		{
			bThumped = true;
		}
		//return;		
	}

	event AnimEnd(int Channel)
	{
		// End:0x0D
		if(Channel != 0)
		{
			return;
		}
		// End:0x26
		if(int(Physics) == int(0))
		{
			LieStill();			
		}
		else
		{
			// End:0x46
			if(PhysicsVolume.bWaterVolume)
			{
				bThumped = true;
				LieStill();
			}
		}
		//return;		
	}

	function LieStill()
	{
		// End:0x11
		if(!bThumped)
		{
			LandThump();
		}
		ReduceCylinder();
		//return;		
	}

	singular function BaseChange()
	{
		// End:0x13
		if(Base == none)
		{
			SetPhysics(2);			
		}
		else
		{
			// End:0x33
			if(Pawn(Base) != none)
			{
				ChunkUp(Rotation, 1.0000000);
			}
		}
		//return;		
	}

	function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
	{
		SetPhysics(2);
		// End:0x3C
		if((int(Physics) == int(0)) && Momentum.Z < float(0))
		{
			Momentum.Z *= float(-1);
		}
		Velocity += ((float(3) * Momentum) / (Mass + float(200)));
		// End:0x66
		if(bInvulnerableBody)
		{
			return;
		}
		Damage *= DamageType.default.GibModifier;
		Health -= Damage;
		// End:0xC7
		if(((Damage > 30) || !IsAnimating()) && Health < -80)
		{
			ChunkUp(Rotation, DamageType.default.GibPerterbation);
		}
		//return;		
	}

	function BeginState()
	{
		local int i;

		// End:0x32
		if(bTearOff && int(Level.NetMode) == int(NM_DedicatedServer))
		{
			LifeSpan = 1.0000000;			
		}
		else
		{
			SetTimer(12.0000000, false);
		}
		SetPhysics(2);
		bInvulnerableBody = true;
		// End:0x84
		if(Controller != none)
		{
			// End:0x78
			if(Controller.bIsPlayer)
			{
				Controller.PawnDied(self);				
			}
			else
			{
				Controller.Destroy();
			}
		}
		i = 0;
		J0x8B:

		// End:0xCB [Loop If]
		if(i < Attached.Length)
		{
			// End:0xC1
			if(Attached[i] != none)
			{
				Attached[i].PawnBaseDied();
			}
			i++;
			// [Loop Continue]
			goto J0x8B;
		}
		//return;		
	}
Begin:

	Sleep(0.2000000);
	bInvulnerableBody = false;
	PlayDyingSound();
	stop;		
}

defaultproperties
{
	bJumpCapable=true
	bCanJump=true
	bCanWalk=true
	bCanDoubleJump=true
	bSimulateGravity=true
	bServerMoveSetPawnRot=true
	bNoCoronas=true
	bAutoActivate=true
	bLOSHearing=true
	bUseCompressedPosition=true
	bWeaponBob=true
	bCanUse=true
	Visibility=128
	DesiredSpeed=1.0000000
	MaxDesiredSpeed=1.0000000
	HearingThreshold=2800.0000000
	SightRadius=5000.0000000
	AvgPhysicsTime=0.1000000
	GroundSpeed=440.0000000
	WaterSpeed=300.0000000
	AirSpeed=440.0000000
	LadderSpeed=200.0000000
	AccelRate=2048.0000000
	JumpZ=420.0000000
	AirControl=0.0500000
	WalkingPct=0.5000000
	CrouchedPct=0.5000000
	MaxFallSpeed=1200.0000000
	PitchUpLimit=18000
	PitchDownLimit=49153
	BaseEyeHeight=64.0000000
	EyeHeight=54.0000000
	CrouchHeight=40.0000000
	CrouchRadius=34.0000000
	DrivingHeight=20.0000000
	DrivingRadius=22.0000000
	HealthMax=100.0000000
	SuperHealthMax=199.0000000
	Health=100
	HeadRadius=9.0000000
	HeadHeight=6.0000000
	HeadScale=1.0000000
	bSetPCRotOnPossess=true
	noise1time=-10.0000000
	noise2time=-10.0000000
	Bob=0.0060000
	SoundDampening=1.0000000
	DamageScaling=1.0000000
	AmbientSoundScaling=0.8000000
	ControllerClass=Class'Engine.AIController'
	LandMovementState="PlayerWalking"
	WaterMovementState="PlayerSwimming"
	BlendChangeTime=0.2500000
	DrawType=2
	bUseDynamicLights=true
	bStasis=true
	bUpdateSimulatedPosition=true
	RemoteRole=2
	NetPriority=2.0000000
	Texture=Texture'Engine.S_Pawn'
	bTravel=true
	bCanBeDamaged=true
	bShouldBaseAtStartup=true
	bOwnerNoSee=true
	bCanTeleport=true
	bDisturbFluidSurface=true
	SoundVolume=255
	SoundRadius=160.0000000
	CollisionRadius=34.0000000
	CollisionHeight=78.0000000
	bCollideActors=true
	bCollideWorld=true
	bBlockActors=true
	bProjTarget=true
	bRotateToDesired=true
	RotationRate=(Pitch=4096,Yaw=20000,Roll=3072)
	bNoRepMesh=true
	bDirectional=true
}
