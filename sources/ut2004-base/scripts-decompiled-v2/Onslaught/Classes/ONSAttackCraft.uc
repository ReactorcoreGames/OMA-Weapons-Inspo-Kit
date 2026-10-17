class ONSAttackCraft extends ONSChopperCraft
	config(User);

var() float MaxPitchSpeed;
var() array<Vector> TrailEffectPositions;
var Class<ONSAttackCraftExhaust> TrailEffectClass;
var array<ONSAttackCraftExhaust> TrailEffects;
var() array<Vector> StreamerEffectOffset;
var Class<ONSAttackCraftStreamer> StreamerEffectClass;
var array<ONSAttackCraftStreamer> StreamerEffect;
var() Range StreamerOpacityRamp;
var() float StreamerOpacityChangeRate;
var() float StreamerOpacityMax;
var float StreamerCurrentOpacity;
var bool StreamerActive;

function bool FastVehicle()
{
	return true;
	//return;	
}

function bool Dodge(Actor.EDoubleClickDir DoubleClickMove)
{
	// End:0x30
	if(FRand() < 0.7000000)
	{
		VehicleMovingTime = Level.TimeSeconds + float(1);
		Rise = 1.0000000;
	}
	return false;
	//return;	
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

simulated function SpecialCalcBehindView(PlayerController PC, out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
	local Vector CamLookAt, HitLocation, HitNormal, OffsetVector;
	local Actor HitActor;
	local Vector X, Y, Z;

	// End:0x42
	if(DesiredTPCamDistance < TPCamDistance)
	{
		TPCamDistance = FMax(DesiredTPCamDistance, TPCamDistance - (CameraSpeed * (Level.TimeSeconds - LastCameraCalcTime)));		
	}
	else
	{
		// End:0x81
		if(DesiredTPCamDistance > TPCamDistance)
		{
			TPCamDistance = FMin(DesiredTPCamDistance, TPCamDistance + (CameraSpeed * (Level.TimeSeconds - LastCameraCalcTime)));
		}
	}
	GetAxes(PC.Rotation, X, Y, Z);
	ViewActor = self;
	CamLookAt = ((GetCameraLocationStart()) + (TPCamLookat >> Rotation)) + TPCamWorldOffset;
	OffsetVector = vect(0.0000000, 0.0000000, 0.0000000);
	OffsetVector.X = -1.0000000 * TPCamDistance;
	CameraLocation = CamLookAt + (OffsetVector >> PC.Rotation);
	HitActor = Trace(HitLocation, HitNormal, CameraLocation, Location, true, vect(40.0000000, 40.0000000, 40.0000000));
	// End:0x1AA
	if((HitActor != none) && (HitActor.bWorldGeometry || HitActor == (GetVehicleBase())) || Trace(HitLocation, HitNormal, CameraLocation, Location, false, vect(40.0000000, 40.0000000, 40.0000000)) != none)
	{
		CameraLocation = HitLocation;
	}
	CameraRotation = Normalize(PC.Rotation + PC.ShakeRot);
	CameraLocation = ((CameraLocation + (PC.ShakeOffset.X * X)) + (PC.ShakeOffset.Y * Y)) + (PC.ShakeOffset.Z * Z);
	//return;	
}

function Died(Controller Killer, Class<DamageType> DamageType, Vector HitLocation)
{
	local int i;

	// End:0x8F
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		i = 0;
		J0x20:

		// End:0x4C [Loop If]
		if(i < TrailEffects.Length)
		{
			TrailEffects[i].Destroy();
			i++;
			// [Loop Continue]
			goto J0x20;
		}
		TrailEffects.Length = 0;
		i = 0;
		J0x5B:

		// End:0x87 [Loop If]
		if(i < StreamerEffect.Length)
		{
			StreamerEffect[i].Destroy();
			i++;
			// [Loop Continue]
			goto J0x5B;
		}
		StreamerEffect.Length = 0;
	}
	super(ONSVehicle).Died(Killer, DamageType, HitLocation);
	//return;	
}

simulated function Destroyed()
{
	local int i;

	// End:0x8F
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		i = 0;
		J0x20:

		// End:0x4C [Loop If]
		if(i < TrailEffects.Length)
		{
			TrailEffects[i].Destroy();
			i++;
			// [Loop Continue]
			goto J0x20;
		}
		TrailEffects.Length = 0;
		i = 0;
		J0x5B:

		// End:0x87 [Loop If]
		if(i < StreamerEffect.Length)
		{
			StreamerEffect[i].Destroy();
			i++;
			// [Loop Continue]
			goto J0x5B;
		}
		StreamerEffect.Length = 0;
	}
	super(ONSVehicle).Destroyed();
	//return;	
}

simulated event DrivingStatusChanged()
{
	local Vector RotX, RotY, RotZ;
	local int i;

	super(Vehicle).DrivingStatusChanged();
	// End:0x18E
	if((bDriving && int(Level.NetMode) != int(NM_DedicatedServer)) && !bDropDetail)
	{
		GetAxes(Rotation, RotX, RotY, RotZ);
		// End:0xFD
		if(TrailEffects.Length == 0)
		{
			TrailEffects.Length = TrailEffectPositions.Length;
			i = 0;
			J0x6D:

			// End:0xFD [Loop If]
			if(i < TrailEffects.Length)
			{
				// End:0xF3
				if(TrailEffects[i] == none)
				{
					TrailEffects[i] = Spawn(TrailEffectClass, self,, Location + (TrailEffectPositions[i] >> Rotation));
					TrailEffects[i].SetBase(self);
					TrailEffects[i].SetRelativeRotation(rot(0, 32768, 0));
				}
				i++;
				// [Loop Continue]
				goto J0x6D;
			}
		}
		// End:0x18B
		if(StreamerEffect.Length == 0)
		{
			StreamerEffect.Length = StreamerEffectOffset.Length;
			i = 0;
			J0x11D:

			// End:0x18B [Loop If]
			if(i < StreamerEffect.Length)
			{
				// End:0x181
				if(StreamerEffect[i] == none)
				{
					StreamerEffect[i] = Spawn(StreamerEffectClass, self,, Location + (StreamerEffectOffset[i] >> Rotation));
					StreamerEffect[i].SetBase(self);
				}
				i++;
				// [Loop Continue]
				goto J0x11D;
			}
		}		
	}
	else
	{
		// End:0x21D
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			i = 0;
			J0x1AE:

			// End:0x1DA [Loop If]
			if(i < TrailEffects.Length)
			{
				TrailEffects[i].Destroy();
				i++;
				// [Loop Continue]
				goto J0x1AE;
			}
			TrailEffects.Length = 0;
			i = 0;
			J0x1E9:

			// End:0x215 [Loop If]
			if(i < StreamerEffect.Length)
			{
				StreamerEffect[i].Destroy();
				i++;
				// [Loop Continue]
				goto J0x1E9;
			}
			StreamerEffect.Length = 0;
		}
	}
	//return;	
}

simulated function Tick(float DeltaTime)
{
	local float EnginePitch, DesiredOpacity, DeltaOpacity, MaxOpacityChange, ThrustAmount;

	local TrailEmitter t;
	local int i;
	local Vector RelVel;
	local bool NewStreamerActive, bIsBehindView;
	local PlayerController PC;

	// End:0x33D
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		EnginePitch = 64.0000000 + ((VSize(Velocity) / MaxPitchSpeed) * 32.0000000);
		SoundPitch = byte(FClamp(EnginePitch, 64.0000000, 96.0000000));
		RelVel = Velocity << Rotation;
		PC = Level.GetLocalPlayerController();
		// End:0xB6
		if((PC != none) && PC.ViewTarget == self)
		{
			bIsBehindView = PC.bBehindView;			
		}
		else
		{
			bIsBehindView = true;
		}
		// End:0x103
		if(!bIsBehindView)
		{
			i = 0;
			J0xD0:

			// End:0x100 [Loop If]
			if(i < TrailEffects.Length)
			{
				TrailEffects[i].SetThrustEnabled(false);
				i++;
				// [Loop Continue]
				goto J0xD0;
			}			
		}
		else
		{
			ThrustAmount = FClamp(OutputThrust, 0.0000000, 1.0000000);
			i = 0;
			J0x121:

			// End:0x16B [Loop If]
			if(i < TrailEffects.Length)
			{
				TrailEffects[i].SetThrustEnabled(true);
				TrailEffects[i].SetThrust(ThrustAmount);
				i++;
				// [Loop Continue]
				goto J0x121;
			}
		}
		DesiredOpacity = (RelVel.X - StreamerOpacityRamp.Min) / (StreamerOpacityRamp.Max - StreamerOpacityRamp.Min);
		DesiredOpacity = FClamp(DesiredOpacity, 0.0000000, StreamerOpacityMax);
		MaxOpacityChange = DeltaTime * StreamerOpacityChangeRate;
		DeltaOpacity = DesiredOpacity - StreamerCurrentOpacity;
		DeltaOpacity = FClamp(DeltaOpacity, -MaxOpacityChange, MaxOpacityChange);
		// End:0x20C
		if(!bIsBehindView)
		{
			StreamerCurrentOpacity = 0.0000000;			
		}
		else
		{
			StreamerCurrentOpacity += DeltaOpacity;
		}
		// End:0x232
		if(StreamerCurrentOpacity < 0.0100000)
		{
			NewStreamerActive = false;			
		}
		else
		{
			NewStreamerActive = true;
		}
		i = 0;
		J0x241:

		// End:0x330 [Loop If]
		if(i < StreamerEffect.Length)
		{
			// End:0x2DF
			if(NewStreamerActive)
			{
				// End:0x295
				if(!StreamerActive)
				{
					t = TrailEmitter(StreamerEffect[i].Emitters[0]);
					t.ResetTrail();
				}
				StreamerEffect[i].Emitters[0].Disabled = false;
				StreamerEffect[i].Emitters[0].Opacity = StreamerCurrentOpacity;
				// [Explicit Continue]
				goto J0x326;
			}
			StreamerEffect[i].Emitters[0].Disabled = true;
			StreamerEffect[i].Emitters[0].Opacity = 0.0000000;
			J0x326:

			i++;
			// [Loop Continue]
			goto J0x241;
		}
		StreamerActive = NewStreamerActive;
	}
	super(SVehicle).Tick(DeltaTime);
	//return;	
}

function float ImpactDamageModifier()
{
	local float Multiplier;
	local Vector X, Y, Z;

	GetAxes(Rotation, X, Y, Z);
	// End:0x50
	if((ImpactInfo.impactNorm Dot Z) > float(0))
	{
		Multiplier = 1.0000000 - (ImpactInfo.impactNorm Dot Z);		
	}
	else
	{
		Multiplier = 1.0000000;
	}
	return super(ONSVehicle).ImpactDamageModifier() * Multiplier;
	//return;	
}

function bool RecommendLongRangedAttack()
{
	return true;
	//return;	
}

function bool PlaceExitingDriver()
{
	local int i;
	local Vector tryPlace, Extent, HitLocation, HitNormal, ZOffset;

	Extent = Driver.default.CollisionRadius * vect(1.0000000, 1.0000000, 0.0000000);
	Extent *= float(2);
	Extent.Z = Driver.default.CollisionHeight;
	ZOffset = Driver.default.CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000);
	// End:0x18A
	if(VSize(Velocity) > float(100))
	{
		tryPlace = (Normal(Velocity Cross vect(0.0000000, 0.0000000, 1.0000000)) * (CollisionRadius + Driver.default.CollisionRadius)) * 1.2500000;
		// End:0xCE
		if(FRand() < 0.5000000)
		{
			tryPlace *= float(-1);
		}
		// End:0x18A
		if(((Trace(HitLocation, HitNormal, (Location + tryPlace) + ZOffset, Location + ZOffset, false, Extent) == none) && Driver.SetLocation((Location + tryPlace) + ZOffset)) || (Trace(HitLocation, HitNormal, (Location - tryPlace) + ZOffset, Location + ZOffset, false, Extent) == none) && Driver.SetLocation((Location - tryPlace) + ZOffset))
		{
			return true;
		}
	}
	i = 0;
	J0x191:

	// End:0x2A4 [Loop If]
	if(i < ExitPositions.Length)
	{
		// End:0x1D9
		if(ExitPositions[0].Z != float(0))
		{
			ZOffset = vect(0.0000000, 0.0000000, 1.0000000) * ExitPositions[0].Z;			
		}
		else
		{
			ZOffset = Driver.default.CollisionHeight * vect(0.0000000, 0.0000000, 2.0000000);
		}
		// End:0x236
		if(bRelativeExitPos)
		{
			tryPlace = (Location + ((ExitPositions[i] - ZOffset) >> Rotation)) + ZOffset;			
		}
		else
		{
			tryPlace = ExitPositions[i];
		}
		// End:0x27F
		if(bRelativeExitPos && Trace(HitLocation, HitNormal, tryPlace, Location + ZOffset, false, Extent) != none)
		{
			// [Explicit Continue]
			goto J0x29A;
		}
		// End:0x298
		if(!Driver.SetLocation(tryPlace))
		{
			// [Explicit Continue]
			goto J0x29A;
		}
		return true;
		J0x29A:

		i++;
		// [Loop Continue]
		goto J0x191;
	}
	return false;
	//return;	
}

static function StaticPrecache(LevelInfo L)
{
	super(ONSVehicle).StaticPrecache(L);
	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorWing');
	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorTailWing');
	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorGun');
	L.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris2');
	L.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris1');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RocketProj');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.SparkHead');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp2_frames');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp1_frames');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.we1_frames');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.SmokePanels2');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.NapalmSpot');
	L.AddPrecacheMaterial(Texture'EpicParticles.Fire.SprayFire1');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.AttackCraftGroup.RaptorColorRed');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.AttackCraftGroup.RaptorColorBlue');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.AttackCraftGroup.AttackCraftNoColor');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.TrailBlura');
	L.AddPrecacheMaterial(Texture'Engine.GRADIENT_Fade');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.AttackCraftGroup.raptorCOLORtest');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.SmokeFragment');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorWing');
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorTailWing');
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RAPTORexploded.RaptorGun');
	Level.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris2');
	Level.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris1');
	Level.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RocketProj');
	super(ONSVehicle).UpdatePrecacheStaticMeshes();
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.SparkHead');
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp2_frames');
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp1_frames');
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.we1_frames');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.SmokePanels2');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.NapalmSpot');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Fire.SprayFire1');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.AttackCraftGroup.RaptorColorRed');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.AttackCraftGroup.RaptorColorBlue');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.AttackCraftGroup.AttackCraftNoColor');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.TrailBlura');
	Level.AddPrecacheMaterial(Texture'Engine.GRADIENT_Fade');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.AttackCraftGroup.raptorCOLORtest');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.SmokeFragment');
	super(ONSVehicle).UpdatePrecacheMaterials();
	//return;	
}

defaultproperties
{
	MaxPitchSpeed=2000.0000000
	TrailEffectPositions[0]=()
	TrailEffectPositions[1]=()
	TrailEffectClass=Class'Onslaught.ONSAttackCraftExhaust'
	StreamerEffectOffset=/* ERROR: System.ArgumentOutOfRangeException */
	StreamerEffectClass=Class'Onslaught.ONSAttackCraftStreamer'
	StreamerOpacityRamp=(Min=1200.0000000,Max=1600.0000000)
	StreamerOpacityChangeRate=1.0000000
	StreamerOpacityMax=0.7000000
	UprightStiffness=500.0000000
	UprightDamping=300.0000000
	MaxThrustForce=100.0000000
	LongDamping=0.0500000
	MaxStrafeForce=80.0000000
	LatDamping=0.0500000
	MaxRiseForce=50.0000000
	UpDamping=0.0500000
	TurnTorqueFactor=600.0000000
	TurnTorqueMax=200.0000000
	TurnDamping=50.0000000
	MaxYawRate=1.5000000
	PitchTorqueFactor=200.0000000
	PitchTorqueMax=35.0000000
	PitchDamping=20.0000000
	RollTorqueTurnFactor=450.0000000
	RollTorqueStrafeFactor=50.0000000
	RollTorqueMax=50.0000000
	RollDamping=30.0000000
	StopThreshold=100.0000000
	MaxRandForce=3.0000000
	RandForceInterval=0.7500000
	DriverWeapons[0]=(WeaponClass=Class'Onslaught.ONSAttackCraftGun',WeaponBone="PlasmaGunAttachment")
	RedSkin=Shader'VMVehicles-TX.AttackCraftGroup.AttackCraftChassisFinalRED'
	BlueSkin=Shader'VMVehicles-TX.AttackCraftGroup.AttackCraftChassisFInalBLUE'
	IdleSound=Sound'ONSVehicleSounds-S.AttackCraft.AttackCraftIdle'
	StartUpSound=Sound'ONSVehicleSounds-S.AttackCraft.AttackCraftStartUp'
	ShutDownSound=Sound'ONSVehicleSounds-S.AttackCraft.AttackCraftShutDown'
	StartUpForce="AttackCraftStartUp"
	ShutDownForce="AttackCraftShutDown"
	DestroyedVehicleMesh=StaticMesh'ONSDeadVehicles-SM.AttackCraftDead'
	DestructionEffectClass=Class'Onslaught.ONSVehicleExplosionEffect'
	DisintegrationEffectClass=Class'Onslaught.ONSVehDeathAttackCraft'
	DestructionLinearMomentum=(Min=50000.0000000,Max=150000.0000000)
	DestructionAngularMomentum=(Min=100.0000000,Max=300.0000000)
	DamagedEffectOffset=(X=-120.0000000,Y=10.0000000,Z=65.0000000)
	ImpactDamageMult=0.0010000
	HeadlightCoronaOffset[0]=()
	HeadlightCoronaOffset[1]=()
	HeadlightCoronaMaterial=Texture'EpicParticles.Flares.FlashFlare1'
	HeadlightCoronaMaxSize=60.0000000
	VehicleMass=4.0000000
	bTurnInPlace=true
	bShowDamageOverlay=true
	bDriverHoldsFlag=false
	bCanCarryFlag=false
	ExitPositions[0]=()
	ExitPositions[1]=()
	EntryPosition=(X=-40.0000000,Y=0.0000000,Z=0.0000000)
	EntryRadius=210.0000000
	TPCamDistance=500.0000000
	TPCamLookat=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	TPCamWorldOffset=(X=0.0000000,Y=0.0000000,Z=200.0000000)
	DriverDamageMult=0.0000000
	VehiclePositionString="in a Raptor"
	VehicleNameString="Raptor"
	RanOverDamageType=Class'Onslaught.DamTypeAttackCraftRoadkill'
	CrushedDamageType=Class'Onslaught.DamTypeAttackCraftPancake'
	MaxDesireability=0.6000000
	FlagBone="PlasmaGunAttachment"
	FlagOffset=(X=0.0000000,Y=0.0000000,Z=80.0000000)
	FlagRotation=(Pitch=0,Yaw=32768,Roll=0)
	HornSounds[0]=Sound'ONSVehicleSounds-S.Horns.Horn03'
	HornSounds[1]=Sound'ONSVehicleSounds-S.Horns.Horn07'
	GroundSpeed=2000.0000000
	HealthMax=300.0000000
	Health=300
	Mesh=SkeletalMesh'ONSVehicles-A.AttackCraft'
	SoundVolume=160
	CollisionRadius=150.0000000
	CollisionHeight=70.0000000
	// Reference: KarmaParamsRBFull'Onslaught.ONSAttackCraft.KParams0'
	begin object name="KParams0" class=Engine.KarmaParamsRBFull
		KInertiaTensor[0]=1.0000000
		KInertiaTensor[3]=3.0000000
		KInertiaTensor[5]=3.5000000
		KCOMOffset=(X=-0.2500000,Y=0.0000000,Z=0.0000000)
		KLinearDamping=0.0000000
		KAngularDamping=0.0000000
		KStartEnabled=true
		bKNonSphericalInertia=true
		KActorGravScale=0.0000000
		bHighDetailOnly=false
		bClientOnly=false
		bKDoubleTickRate=true
		bKStayUpright=true
		bKAllowRotate=true
		bDestroyOnWorldPenetrate=true
		bDoSafetime=true
		KFriction=0.5000000
		KImpactThreshold=300.0000000
	end object
	KParams=KParams0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: KarmaParamsRBFull'Onslaught.ONSAttackCraft.KParams0'
begin object name="KParams0" class=Engine.KarmaParamsRBFull
	KInertiaTensor[0]=1.0000000
	KInertiaTensor[3]=3.0000000
	KInertiaTensor[5]=3.5000000
	KCOMOffset=(X=-0.2500000,Y=0.0000000,Z=0.0000000)
	KLinearDamping=0.0000000
	KAngularDamping=0.0000000
	KStartEnabled=true
	bKNonSphericalInertia=true
	KActorGravScale=0.0000000
	bHighDetailOnly=false
	bClientOnly=false
	bKDoubleTickRate=true
	bKStayUpright=true
	bKAllowRotate=true
	bDestroyOnWorldPenetrate=true
	bDoSafetime=true
	KFriction=0.5000000
	KImpactThreshold=300.0000000
end object
