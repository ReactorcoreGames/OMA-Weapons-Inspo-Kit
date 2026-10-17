class ONSHoverTank extends ONSTreadCraft
	config(User);

var() float MaxPitchSpeed;
var VariableTexPanner LeftTreadPanner;
var VariableTexPanner RightTreadPanner;
var float TreadVelocityScale;
var float MaxGroundSpeed;
var float MaxAirSpeed;

simulated function PostBeginPlay()
{
	super(Vehicle).PostBeginPlay();
	// End:0x25
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SetupTreads();
	}
	//return;	
}

simulated function Destroyed()
{
	DestroyTreads();
	super.Destroyed();
	//return;	
}

function bool ImportantVehicle()
{
	return true;
	//return;	
}

simulated function SetupTreads()
{
	LeftTreadPanner = VariableTexPanner(Level.ObjectPool.AllocateObject(Class'Engine.VariableTexPanner'));
	// End:0x86
	if(LeftTreadPanner != none)
	{
		LeftTreadPanner.Material = Skins[1];
		LeftTreadPanner.PanDirection = rot(0, 16384, 0);
		LeftTreadPanner.PanRate = 0.0000000;
		Skins[1] = LeftTreadPanner;
	}
	RightTreadPanner = VariableTexPanner(Level.ObjectPool.AllocateObject(Class'Engine.VariableTexPanner'));
	// End:0x10E
	if(RightTreadPanner != none)
	{
		RightTreadPanner.Material = Skins[2];
		RightTreadPanner.PanDirection = rot(0, 16384, 0);
		RightTreadPanner.PanRate = 0.0000000;
		Skins[2] = RightTreadPanner;
	}
	//return;	
}

simulated function DestroyTreads()
{
	// End:0x2F
	if(LeftTreadPanner != none)
	{
		Level.ObjectPool.FreeObject(LeftTreadPanner);
		LeftTreadPanner = none;
	}
	// End:0x5E
	if(RightTreadPanner != none)
	{
		Level.ObjectPool.FreeObject(RightTreadPanner);
		RightTreadPanner = none;
	}
	//return;	
}

simulated event DrivingStatusChanged()
{
	super(Vehicle).DrivingStatusChanged();
	// End:0x4F
	if(!bDriving)
	{
		// End:0x30
		if(LeftTreadPanner != none)
		{
			LeftTreadPanner.PanRate = 0.0000000;
		}
		// End:0x4F
		if(RightTreadPanner != none)
		{
			RightTreadPanner.PanRate = 0.0000000;
		}
	}
	//return;	
}

simulated function Tick(float DeltaTime)
{
	local float EnginePitch, LinTurnSpeed;
	local KRigidBodyState BodyState;
	local KarmaParams KP;
	local bool bOnGround;
	local int i;

	KGetRigidBodyState(BodyState);
	KP = KarmaParams(KParams);
	bOnGround = false;
	i = 0;
	J0x2A:

	// End:0x92 [Loop If]
	if(i < KP.Repulsors.Length)
	{
		// End:0x88
		if((KP.Repulsors[i] != none) && KP.Repulsors[i].bRepulsorInContact)
		{
			bOnGround = true;
		}
		i++;
		// [Loop Continue]
		goto J0x2A;
	}
	// End:0xB2
	if(bOnGround)
	{
		KP.KMaxSpeed = MaxGroundSpeed;		
	}
	else
	{
		KP.KMaxSpeed = MaxAirSpeed;
	}
	// End:0x224
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		LinTurnSpeed = 0.5000000 * BodyState.AngVel.Z;
		EnginePitch = 64.0000000 + ((VSize(Velocity) / MaxPitchSpeed) * 64.0000000);
		SoundPitch = byte(FClamp(EnginePitch, 64.0000000, 128.0000000));
		// End:0x1AD
		if(LeftTreadPanner != none)
		{
			LeftTreadPanner.PanRate = VSize(Velocity) / TreadVelocityScale;
			// End:0x198
			if((Velocity Dot Vector(Rotation)) > float(0))
			{
				LeftTreadPanner.PanRate = -1.0000000 * LeftTreadPanner.PanRate;
			}
			LeftTreadPanner.PanRate += LinTurnSpeed;
		}
		// End:0x224
		if(RightTreadPanner != none)
		{
			RightTreadPanner.PanRate = VSize(Velocity) / TreadVelocityScale;
			// End:0x20F
			if((Velocity Dot Vector(Rotation)) > float(0))
			{
				RightTreadPanner.PanRate = -1.0000000 * RightTreadPanner.PanRate;
			}
			RightTreadPanner.PanRate -= LinTurnSpeed;
		}
	}
	super(SVehicle).Tick(DeltaTime);
	//return;	
}

function KDriverEnter(Pawn P)
{
	super(ONSVehicle).KDriverEnter(P);
	SVehicleUpdateParams();
	//return;	
}

function DriverLeft()
{
	super(ONSVehicle).DriverLeft();
	SVehicleUpdateParams();
	//return;	
}

function AltFire(optional float F)
{
	local PlayerController PC;

	PC = PlayerController(Controller);
	// End:0x1D
	if(PC == none)
	{
		return;
	}
	bWeaponisAltFiring = true;
	PC.ToggleZoomWithMax(0.5000000);
	//return;	
}

function ClientVehicleCeaseFire(bool bWasAltFire)
{
	local PlayerController PC;

	// End:0x19
	if(!bWasAltFire)
	{
		super(ONSVehicle).ClientVehicleCeaseFire(bWasAltFire);
		return;
	}
	PC = PlayerController(Controller);
	// End:0x36
	if(PC == none)
	{
		return;
	}
	bWeaponisAltFiring = false;
	PC.StopZoom();
	//return;	
}

simulated function ClientKDriverLeave(PlayerController PC)
{
	super(ONSVehicle).ClientKDriverLeave(PC);
	bWeaponisAltFiring = false;
	PC.EndZoom();
	//return;	
}

function bool RecommendLongRangedAttack()
{
	return true;
	//return;	
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x1B
	if(DamageType == Class'Onslaught.DamTypeHoverBikePlasma')
	{
		Damage *= 0.8000000;
	}
	super(ONSVehicle).TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

static function StaticPrecache(LevelInfo L)
{
	super(ONSVehicle).StaticPrecache(L);
	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.TANKexploded.TankTurret');
	L.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris2');
	L.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris1');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RocketProj');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.SparkHead');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp2_frames');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp1_frames');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.we1_frames');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.SmokeReOrdered');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.MuchSmoke1');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.NapalmSpot');
	L.AddPrecacheMaterial(Texture'EpicParticles.Fire.SprayFire1');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.HoverTankGroup.TankColorRED');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.HoverTankGroup.TankColorBlue');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.HoverTankGroup.TankNoColor');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.HoverTankGroup.tankTreads');
	L.AddPrecacheMaterial(Texture'VMparticleTextures.EJECTA.Tex');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.TrailBlur');
	L.AddPrecacheMaterial(Texture'Engine.GRADIENT_Fade');
	L.AddPrecacheMaterial(Texture'AW-2004Explosions.Fire.Fireball3');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.SmokeFragment');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.TANKexploded.TankTurret');
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
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.SmokeReOrdered');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.MuchSmoke1');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.NapalmSpot');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Fire.SprayFire1');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.HoverTankGroup.TankColorRED');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.HoverTankGroup.TankColorBlue');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.HoverTankGroup.TankNoColor');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.HoverTankGroup.tankTreads');
	Level.AddPrecacheMaterial(Texture'VMparticleTextures.EJECTA.Tex');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.TrailBlur');
	Level.AddPrecacheMaterial(Texture'Engine.GRADIENT_Fade');
	Level.AddPrecacheMaterial(Texture'AW-2004Explosions.Fire.Fireball3');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.SmokeFragment');
	super(ONSVehicle).UpdatePrecacheMaterials();
	//return;	
}

function ShouldTargetMissile(Projectile P)
{
	// End:0x2F
	if((WeaponPawns.Length > 0) && WeaponPawns[0].Controller == none)
	{
		super(Vehicle).ShouldTargetMissile(P);
	}
	//return;	
}

defaultproperties
{
	MaxPitchSpeed=700.0000000
	TreadVelocityScale=450.0000000
	MaxGroundSpeed=800.0000000
	MaxAirSpeed=5000.0000000
	ThrusterOffsets=/* ERROR: System.ArgumentOutOfRangeException */
	HoverSoftness=0.0500000
	HoverPenScale=1.5000000
	HoverCheckDist=65.0000000
	UprightStiffness=500.0000000
	UprightDamping=300.0000000
	MaxThrust=65.0000000
	MaxSteerTorque=100.0000000
	ForwardDampFactor=0.1000000
	LateralDampFactor=0.5000000
	ParkingDampFactor=0.8000000
	SteerDampFactor=100.0000000
	InvertSteeringThrottleThreshold=-0.1000000
	DriverWeapons[0]=(WeaponClass=Class'Onslaught.ONSHoverTankCannon',WeaponBone="TankCannonWeapon")
	PassengerWeapons[0]=(WeaponPawnClass=Class'Onslaught.ONSTankSecondaryTurretPawn',WeaponBone="MachineGunTurret")
	bHasAltFire=false
	RedSkin=Shader'VMVehicles-TX.HoverTankGroup.HoverTankChassisFinalRED'
	BlueSkin=Shader'VMVehicles-TX.HoverTankGroup.HoverTankChassisFinalBLUE'
	IdleSound=Sound'ONSVehicleSounds-S.Tank.TankEng01'
	StartUpSound=Sound'ONSVehicleSounds-S.Tank.TankStart01'
	ShutDownSound=Sound'ONSVehicleSounds-S.Tank.TankStop01'
	StartUpForce="TankStartUp"
	ShutDownForce="TankShutDown"
	ViewShakeRadius=600.0000000
	ViewShakeOffsetMag=(X=0.5000000,Y=0.0000000,Z=2.0000000)
	ViewShakeOffsetFreq=7.0000000
	DestroyedVehicleMesh=StaticMesh'ONSDeadVehicles-SM.TankDead'
	DestructionEffectClass=Class'Onslaught.ONSVehicleExplosionEffect'
	DisintegrationEffectClass=Class'Onslaught.ONSVehDeathHoverTank'
	DisintegrationHealth=-125.0000000
	DestructionLinearMomentum=(Min=250000.0000000,Max=400000.0000000)
	DestructionAngularMomentum=(Min=100.0000000,Max=300.0000000)
	DamagedEffectScale=1.5000000
	DamagedEffectOffset=(X=100.0000000,Y=20.0000000,Z=26.0000000)
	bEnableProximityViewShake=true
	VehicleMass=12.0000000
	bTurnInPlace=true
	bDrawMeshInFP=true
	bPCRelativeFPRotation=false
	bSeparateTurretFocus=true
	bDriverHoldsFlag=false
	bFPNoZFromCameraPitch=true
	DrivePos=(X=0.0000000,Y=0.0000000,Z=130.0000000)
	ExitPositions[0]=()
	ExitPositions[1]=()
	EntryRadius=375.0000000
	FPCamPos=(X=-70.0000000,Y=0.0000000,Z=130.0000000)
	FPCamViewOffset=(X=90.0000000,Y=0.0000000,Z=0.0000000)
	TPCamLookat=(X=-50.0000000,Y=0.0000000,Z=0.0000000)
	TPCamWorldOffset=(X=0.0000000,Y=0.0000000,Z=250.0000000)
	MomentumMult=0.3000000
	DriverDamageMult=0.0000000
	VehiclePositionString="in a Goliath"
	VehicleNameString="Goliath"
	RanOverDamageType=Class'Onslaught.DamTypeTankRoadkill'
	CrushedDamageType=Class'Onslaught.DamTypeTankPancake'
	MaxDesireability=0.8000000
	FlagBone="MachineGunTurret"
	FlagRotation=(Pitch=0,Yaw=32768,Roll=0)
	HornSounds[0]=Sound'ONSVehicleSounds-S.Horns.Horn09'
	HornSounds[1]=Sound'ONSVehicleSounds-S.Horns.Horn02'
	bCanStrafe=true
	GroundSpeed=520.0000000
	HealthMax=800.0000000
	Health=800
	Mesh=SkeletalMesh'ONSNewTank-A.HoverTank'
	Skins[0]=none
	Skins[1]=Texture'VMVehicles-TX.HoverTankGroup.tankTreads'
	Skins[2]=Texture'VMVehicles-TX.HoverTankGroup.tankTreads'
	SoundVolume=200
	CollisionRadius=260.0000000
	CollisionHeight=60.0000000
	// Reference: KarmaParamsRBFull'Onslaught.ONSHoverTank.KParams0'
	begin object name="KParams0" class=Engine.KarmaParamsRBFull
		KInertiaTensor[0]=1.3000000
		KInertiaTensor[3]=4.0000000
		KInertiaTensor[5]=4.5000000
		KLinearDamping=0.0000000
		KAngularDamping=0.0000000
		KStartEnabled=true
		KMaxSpeed=800.0000000
		bHighDetailOnly=false
		bClientOnly=false
		bKDoubleTickRate=true
		bKStayUpright=true
		bKAllowRotate=true
		bDestroyOnWorldPenetrate=true
		bDoSafetime=true
		KFriction=0.5000000
	end object
	KParams=KParams0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: KarmaParamsRBFull'Onslaught.ONSHoverTank.KParams0'
begin object name="KParams0" class=Engine.KarmaParamsRBFull
	KInertiaTensor[0]=1.3000000
	KInertiaTensor[3]=4.0000000
	KInertiaTensor[5]=4.5000000
	KLinearDamping=0.0000000
	KAngularDamping=0.0000000
	KStartEnabled=true
	KMaxSpeed=800.0000000
	bHighDetailOnly=false
	bClientOnly=false
	bKDoubleTickRate=true
	bKStayUpright=true
	bKAllowRotate=true
	bDestroyOnWorldPenetrate=true
	bDoSafetime=true
	KFriction=0.5000000
end object
