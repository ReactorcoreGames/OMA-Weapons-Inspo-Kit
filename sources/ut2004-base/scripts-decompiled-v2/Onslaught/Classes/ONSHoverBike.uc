class ONSHoverBike extends ONSHoverCraft
	config(User);

var() float MaxPitchSpeed;
var() float JumpDuration;
var() float JumpForceMag;
var float JumpCountdown;
var float JumpDelay;
var float LastJumpTime;
var() float DuckDuration;
var() float DuckForceMag;
var float DuckCountdown;
var() array<Vector> BikeDustOffset;
var() float BikeDustTraceDistance;
var() Sound JumpSound;
var() Sound DuckSound;
var() string JumpForce;
var array<ONSHoverBikeHoverDust> BikeDust;
var array<Vector> BikeDustLastNormal;
var bool DoBikeJump;
var bool OldDoBikeJump;
var bool DoBikeDuck;
var bool OldDoBikeDuck;
var bool bHoldingDuck;
var bool bOverWater;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		DoBikeJump;
}

function KDriverEnter(Pawn P)
{
	bHeadingInitialized = false;
	super(ONSVehicle).KDriverEnter(P);
	//return;	
}

simulated function ClientKDriverEnter(PlayerController PC)
{
	bHeadingInitialized = false;
	super(ONSVehicle).ClientKDriverEnter(PC);
	//return;	
}

function bool FastVehicle()
{
	return true;
	//return;	
}

function ShouldTargetMissile(Projectile P)
{
	// End:0x8D
	if(((Bot(Controller) != none) && Level.Game.GameDifficulty > (float(4) + (float(4) * FRand()))) && VSize(P.Location - Location) < VSize(P.Velocity))
	{
		KDriverLeave(false);
		TeamUseTime = Level.TimeSeconds + float(4);
		return;
	}
	super(Vehicle).ShouldTargetMissile(P);
	//return;	
}

function bool TooCloseToAttack(Actor Other)
{
	// End:0x12
	if(xPawn(Other) != none)
	{
		return false;
	}
	return super(ONSVehicle).TooCloseToAttack(Other);
	//return;	
}

function Pawn CheckForHeadShot(Vector loc, Vector ray, float AdditionalScale)
{
	local Vector X, Y, Z, newray;

	GetAxes(Rotation, X, Y, Z);
	// End:0x7D
	if(Driver != none)
	{
		newray = ray;
		newray.Z = 0.0000000;
		// End:0x7D
		if((Abs(newray Dot X) < 0.7000000) && Driver.IsHeadShot(loc, ray, AdditionalScale))
		{
			return Driver;
		}
	}
	return none;
	//return;	
}

simulated function Destroyed()
{
	local int i;

	// End:0x54
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		i = 0;
		J0x20:

		// End:0x4C [Loop If]
		if(i < BikeDust.Length)
		{
			BikeDust[i].Destroy();
			i++;
			// [Loop Continue]
			goto J0x20;
		}
		BikeDust.Length = 0;
	}
	super(ONSVehicle).Destroyed();
	//return;	
}

simulated function DestroyAppearance()
{
	local int i;

	// End:0x54
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		i = 0;
		J0x20:

		// End:0x4C [Loop If]
		if(i < BikeDust.Length)
		{
			BikeDust[i].Destroy();
			i++;
			// [Loop Continue]
			goto J0x20;
		}
		BikeDust.Length = 0;
	}
	super(ONSVehicle).DestroyAppearance();
	//return;	
}

function bool Dodge(Actor.EDoubleClickDir DoubleClickMove)
{
	Rise = 1.0000000;
	return true;
	//return;	
}

function ChooseFireAt(Actor A)
{
	// End:0x76
	if((((Pawn(A) != none) && Vehicle(A) == none) && VSize(A.Location - Location) < float(1500)) && Controller.LineOfSightTo(A))
	{
		// End:0x73
		if(!bWeaponisAltFiring)
		{
			AltFire(0.0000000);
		}		
	}
	else
	{
		// End:0x86
		if(bWeaponisAltFiring)
		{
			VehicleCeaseFire(true);
		}
	}
	Fire(0.0000000);
	//return;	
}

simulated event DrivingStatusChanged()
{
	local int i;

	super(Vehicle).DrivingStatusChanged();
	// End:0x100
	if(((bDriving && int(Level.NetMode) != int(NM_DedicatedServer)) && BikeDust.Length == 0) && !bDropDetail)
	{
		BikeDust.Length = BikeDustOffset.Length;
		BikeDustLastNormal.Length = BikeDustOffset.Length;
		i = 0;
		J0x66:

		// End:0xFD [Loop If]
		if(i < BikeDustOffset.Length)
		{
			// End:0xF3
			if(BikeDust[i] == none)
			{
				BikeDust[i] = Spawn(Class'Onslaught.ONSHoverBikeHoverDust', self,, Location + (BikeDustOffset[i] >> Rotation));
				BikeDust[i].SetDustColor(Level.DustColor);
				BikeDustLastNormal[i] = vect(0.0000000, 0.0000000, 1.0000000);
			}
			i++;
			// [Loop Continue]
			goto J0x66;
		}		
	}
	else
	{
		// End:0x154
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			i = 0;
			J0x120:

			// End:0x14C [Loop If]
			if(i < BikeDust.Length)
			{
				BikeDust[i].Destroy();
				i++;
				// [Loop Continue]
				goto J0x120;
			}
			BikeDust.Length = 0;
		}
		JumpCountdown = 0.0000000;
	}
	//return;	
}

simulated function Tick(float DeltaTime)
{
	local float EnginePitch, hitDist;
	local int i;
	local Vector TraceStart, TraceEnd, HitLocation, HitNormal;
	local Actor HitActor;
	local Emitter JumpEffect;
	local KarmaParams KP;

	super(SVehicle).Tick(DeltaTime);
	JumpCountdown -= DeltaTime;
	CheckJumpDuck();
	// End:0x96
	if(DoBikeJump != OldDoBikeJump)
	{
		JumpCountdown = JumpDuration;
		OldDoBikeJump = DoBikeJump;
		// End:0x96
		if((Controller != Level.GetLocalPlayerController()) && EffectIsRelevant(Location, false))
		{
			JumpEffect = Spawn(Class'Onslaught.ONSHoverBikeJumpEffect');
			JumpEffect.SetBase(self);
			ClientPlayForceFeedback(JumpForce);
		}
	}
	// End:0x399
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		EnginePitch = 64.0000000 + ((VSize(Velocity) / MaxPitchSpeed) * 64.0000000);
		SoundPitch = byte(FClamp(EnginePitch, 64.0000000, 128.0000000));
		// End:0x399
		if(!bDropDetail)
		{
			bOverWater = false;
			KP = KarmaParams(KParams);
			i = 0;
			J0x114:

			// End:0x163 [Loop If]
			if(i < KP.Repulsors.Length)
			{
				// End:0x159
				if(KP.Repulsors[i].bRepulsorOnWater)
				{
					bOverWater = true;
					// [Explicit Break]
					goto J0x163;
				}
				i++;
				// [Loop Continue]
				goto J0x114;
			}
			J0x163:

			i = 0;
			J0x16A:

			// End:0x399 [Loop If]
			if(i < BikeDust.Length)
			{
				BikeDust[i].bDustActive = false;
				TraceStart = Location + (BikeDustOffset[i] >> Rotation);
				TraceEnd = TraceStart - (BikeDustTraceDistance * vect(0.0000000, 0.0000000, 1.0000000));
				HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, true);
				// End:0x219
				if(HitActor == none)
				{
					BikeDust[i].UpdateHoverDust(false, 0.0000000);
					// [Explicit Continue]
					goto J0x38F;
				}
				// End:0x273
				if(bOverWater || (PhysicsVolume(HitActor) != none) && PhysicsVolume(HitActor).bWaterVolume)
				{
					BikeDust[i].SetDustColor(Level.WaterDustColor);					
				}
				else
				{
					BikeDust[i].SetDustColor(Level.DustColor);
				}
				hitDist = VSize(HitLocation - TraceStart);
				BikeDust[i].SetLocation(HitLocation + (float(10) * HitNormal));
				BikeDustLastNormal[i] = Normal((float(3) * BikeDustLastNormal[i]) + HitNormal);
				BikeDust[i].SetRotation(Rotator(BikeDustLastNormal[i]));
				BikeDust[i].UpdateHoverDust(true, hitDist / BikeDustTraceDistance);
				// End:0x378
				if(!BikeDust[i].bDustActive)
				{
					BikeDust[i].OldLocation = BikeDust[i].Location;
				}
				BikeDust[i].bDustActive = true;
				J0x38F:

				i++;
				// [Loop Continue]
				goto J0x16A;
			}
		}
	}
	//return;	
}

function VehicleCeaseFire(bool bWasAltFire)
{
	super(ONSVehicle).VehicleCeaseFire(bWasAltFire);
	// End:0x1D
	if(bWasAltFire)
	{
		bHoldingDuck = false;
	}
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x46
	if((Level.TimeSeconds - JumpDelay) < LastJumpTime)
	{
		return FMin((Level.TimeSeconds - LastJumpTime) / JumpDelay, 0.9990000);		
	}
	else
	{
		return 0.9990000;
	}
	//return;	
}

simulated function CheckJumpDuck()
{
	local KarmaParams KP;
	local Emitter JumpEffect, DuckEffect;
	local bool bOnGround;
	local int i;

	KP = KarmaParams(KParams);
	bOnGround = false;
	i = 0;
	J0x1F:

	// End:0x87 [Loop If]
	if(i < KP.Repulsors.Length)
	{
		// End:0x7D
		if((KP.Repulsors[i] != none) && KP.Repulsors[i].bRepulsorInContact)
		{
			bOnGround = true;
		}
		i++;
		// [Loop Continue]
		goto J0x1F;
	}
	// End:0x17C
	if(((((JumpCountdown <= 0.0000000) && Rise > float(0)) && bOnGround) && !bHoldingDuck) && (Level.TimeSeconds - JumpDelay) >= LastJumpTime)
	{
		PlaySound(JumpSound,, 1.0000000);
		// End:0x10B
		if(int(Role) == int(ROLE_Authority))
		{
			DoBikeJump = !DoBikeJump;
		}
		// End:0x14A
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			JumpEffect = Spawn(Class'Onslaught.ONSHoverBikeJumpEffect');
			JumpEffect.SetBase(self);
			ClientPlayForceFeedback(JumpForce);
		}
		// End:0x165
		if(AIController(Controller) != none)
		{
			Rise = 0.0000000;
		}
		LastJumpTime = Level.TimeSeconds;		
	}
	else
	{
		// End:0x223
		if((DuckCountdown <= 0.0000000) && (Rise < float(0)) || bWeaponisAltFiring)
		{
			// End:0x220
			if(!bHoldingDuck)
			{
				bHoldingDuck = true;
				PlaySound(DuckSound,, 1.0000000);
				// End:0x1FA
				if(int(Level.NetMode) != int(NM_DedicatedServer))
				{
					DuckEffect = Spawn(Class'Onslaught.ONSHoverBikeDuckEffect');
					DuckEffect.SetBase(self);
				}
				// End:0x215
				if(AIController(Controller) != none)
				{
					Rise = 0.0000000;
				}
				JumpCountdown = 0.0000000;
			}			
		}
		else
		{
			bHoldingDuck = false;
		}
	}
	//return;	
}

simulated function KApplyForce(out Vector Force, out Vector Torque)
{
	super(SVehicle).KApplyForce(Force, Torque);
	// End:0x45
	if(bDriving && JumpCountdown > 0.0000000)
	{
		Force += (vect(0.0000000, 0.0000000, 1.0000000) * JumpForceMag);
	}
	// End:0x74
	if(bDriving && bHoldingDuck)
	{
		Force += (vect(0.0000000, 0.0000000, -1.0000000) * DuckForceMag);
	}
	//return;	
}

static function StaticPrecache(LevelInfo L)
{
	super(ONSVehicle).StaticPrecache(L);
	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.HoverExploded.HoverWing');
	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.HoverExploded.HoverChair');
	L.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris2');
	L.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris1');
	L.AddPrecacheStaticMesh(StaticMesh'ONSWeapons-SM.PC_MantaJumpBlast');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp2_frames');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp1_frames');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.we1_frames');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.MuchSmoke1');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.NapalmSpot');
	L.AddPrecacheMaterial(Texture'EpicParticles.Fire.SprayFire1');
	L.AddPrecacheMaterial(Texture'WeaponSkins.Skins.RocketTex0');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.JumpDuck');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.HoverBikeGroup.hovercraftFANSblurTEX');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.HoverBikeGroup.hoverCraftRED');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.HoverBikeGroup.hoverCraftBlue');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.HoverBikeGroup.NewHoverCraftNOcolor');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.AirBlast');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.SmokePanels2');
	L.AddPrecacheMaterial(Texture'Engine.GRADIENT_Fade');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.HoverExploded.HoverWing');
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.HoverExploded.HoverChair');
	Level.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris2');
	Level.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris1');
	Level.AddPrecacheStaticMesh(StaticMesh'ONSWeapons-SM.PC_MantaJumpBlast');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.HoverBikeGroup.hovercraftFANSblurTEX');
	super(ONSVehicle).UpdatePrecacheStaticMeshes();
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp2_frames');
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp1_frames');
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.we1_frames');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.MuchSmoke1');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.NapalmSpot');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Fire.SprayFire1');
	Level.AddPrecacheMaterial(Texture'WeaponSkins.Skins.RocketTex0');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.JumpDuck');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.HoverBikeGroup.hoverCraftRED');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.HoverBikeGroup.hoverCraftBlue');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.HoverBikeGroup.NewHoverCraftNOcolor');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.AirBlast');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.SmokePanels2');
	Level.AddPrecacheMaterial(Texture'Engine.GRADIENT_Fade');
	super(ONSVehicle).UpdatePrecacheMaterials();
	//return;	
}

defaultproperties
{
	MaxPitchSpeed=1000.0000000
	JumpDuration=0.2200000
	JumpForceMag=100.0000000
	JumpDelay=3.0000000
	DuckForceMag=150.0000000
	BikeDustOffset[0]=()
	BikeDustOffset[1]=()
	BikeDustTraceDistance=200.0000000
	JumpSound=Sound'ONSVehicleSounds-S.HoverBike.HoverBikeJump05'
	DuckSound=Sound'ONSVehicleSounds-S.HoverBike.HoverBikeTurbo01'
	JumpForce="HoverBikeJump"
	ThrusterOffsets=/* ERROR: System.ArgumentOutOfRangeException */
	HoverSoftness=0.0900000
	HoverPenScale=1.0000000
	HoverCheckDist=150.0000000
	UprightStiffness=500.0000000
	UprightDamping=300.0000000
	MaxThrustForce=27.0000000
	LongDamping=0.0200000
	MaxStrafeForce=20.0000000
	LatDamping=0.1000000
	TurnTorqueFactor=1000.0000000
	TurnTorqueMax=125.0000000
	TurnDamping=40.0000000
	MaxYawRate=1.5000000
	PitchTorqueFactor=200.0000000
	PitchTorqueMax=9.0000000
	PitchDamping=20.0000000
	RollTorqueTurnFactor=450.0000000
	RollTorqueStrafeFactor=50.0000000
	RollTorqueMax=12.5000000
	RollDamping=30.0000000
	StopThreshold=100.0000000
	DriverWeapons[0]=(WeaponClass=Class'Onslaught.ONSHoverBikePlasmaGun',WeaponBone="PlasmaGunAttachment")
	bHasAltFire=false
	RedSkin=Shader'VMVehicles-TX.HoverBikeGroup.HoverBikeChassisFinalRED'
	BlueSkin=Shader'VMVehicles-TX.HoverBikeGroup.HoverBikeChassisFinalBLUE'
	IdleSound=Sound'ONSVehicleSounds-S.HoverBike.HoverBikeEng02'
	StartUpSound=Sound'ONSVehicleSounds-S.HoverBike.HoverBikeStart01'
	ShutDownSound=Sound'ONSVehicleSounds-S.HoverBike.HoverBikeStop01'
	StartUpForce="HoverBikeStartUp"
	ShutDownForce="HoverBikeShutDown"
	DestroyedVehicleMesh=StaticMesh'ONSDeadVehicles-SM.HoverBikeDead'
	DestructionEffectClass=Class'Onslaught.ONSSmallVehicleExplosionEffect'
	DisintegrationEffectClass=Class'Onslaught.ONSVehDeathHoverBike'
	DestructionLinearMomentum=(Min=62000.0000000,Max=100000.0000000)
	DestructionAngularMomentum=(Min=25.0000000,Max=75.0000000)
	DamagedEffectScale=0.6000000
	DamagedEffectOffset=(X=50.0000000,Y=-25.0000000,Z=10.0000000)
	ImpactDamageMult=0.0001000
	HeadlightCoronaOffset[0]=()
	HeadlightCoronaOffset[1]=()
	HeadlightCoronaMaterial=Texture'EpicParticles.Flares.FlashFlare1'
	HeadlightCoronaMaxSize=60.0000000
	bDrawDriverInTP=true
	bTurnInPlace=true
	bShowDamageOverlay=true
	bScriptedRise=true
	bShowChargingBar=true
	bDriverHoldsFlag=false
	bCanCarryFlag=false
	DrivePos=(X=-18.4380000,Y=0.0000000,Z=60.0000000)
	ExitPositions=/* ERROR: System.ArgumentOutOfRangeException */
	EntryRadius=140.0000000
	FPCamPos=(X=0.0000000,Y=0.0000000,Z=50.0000000)
	TPCamDistance=500.0000000
	TPCamLookat=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	TPCamWorldOffset=(X=0.0000000,Y=0.0000000,Z=120.0000000)
	VehiclePositionString="in a Manta"
	VehicleNameString="Manta"
	RanOverDamageType=Class'Onslaught.DamTypeHoverBikeHeadshot'
	CrushedDamageType=Class'Onslaught.DamTypeHoverBikePancake'
	MaxDesireability=0.6000000
	ObjectiveGetOutDist=750.0000000
	FlagBone="HoverCraft"
	FlagOffset=(X=0.0000000,Y=0.0000000,Z=45.0000000)
	FlagRotation=(Pitch=0,Yaw=32768,Roll=0)
	HornSounds[0]=Sound'ONSVehicleSounds-S.Horns.Horn02'
	HornSounds[1]=Sound'ONSVehicleSounds-S.Horns.La_Cucharacha_Horn'
	bCanStrafe=true
	MeleeRange=-100.0000000
	GroundSpeed=2000.0000000
	HealthMax=200.0000000
	Health=200
	Mesh=SkeletalMesh'ONSVehicles-A.HoverBike'
	SoundRadius=900.0000000
	// Reference: KarmaParamsRBFull'Onslaught.ONSHoverBike.KParams0'
	begin object name="KParams0" class=Engine.KarmaParamsRBFull
		KInertiaTensor[0]=1.3000000
		KInertiaTensor[3]=4.0000000
		KInertiaTensor[5]=4.5000000
		KLinearDamping=0.1500000
		KAngularDamping=0.0000000
		KStartEnabled=true
		bHighDetailOnly=false
		bClientOnly=false
		bKDoubleTickRate=true
		bKStayUpright=true
		bKAllowRotate=true
		bDestroyOnWorldPenetrate=true
		bDoSafetime=true
		KFriction=0.5000000
		KImpactThreshold=700.0000000
	end object
	KParams=KParams0
	bTraceWater=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: KarmaParamsRBFull'Onslaught.ONSHoverBike.KParams0'
begin object name="KParams0" class=Engine.KarmaParamsRBFull
	KInertiaTensor[0]=1.3000000
	KInertiaTensor[3]=4.0000000
	KInertiaTensor[5]=4.5000000
	KLinearDamping=0.1500000
	KAngularDamping=0.0000000
	KStartEnabled=true
	bHighDetailOnly=false
	bClientOnly=false
	bKDoubleTickRate=true
	bKStayUpright=true
	bKAllowRotate=true
	bDestroyOnWorldPenetrate=true
	bDoSafetime=true
	KFriction=0.5000000
	KImpactThreshold=700.0000000
end object
