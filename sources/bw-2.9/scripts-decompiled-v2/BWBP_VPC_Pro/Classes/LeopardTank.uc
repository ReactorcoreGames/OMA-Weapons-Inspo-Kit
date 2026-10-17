class LeopardTank extends ONSTreadCraft
	config(BWBP_VPC_Pro);

var LeopardDust Dust[20];
var(Leopard) name DustBoneNames[20];
var(Leopard) float MaxPitchSpeed;
var(Leopard) float MaxSoundPitch;
var(Leopard) float MinSoundPitch;
var(Leopard) float TireRotationScale;
var(Leopard) float TireTurnScale;
var VariableTexPanner LeftTreadPanner;
var VariableTexPanner RightTreadPanner;
var TexRotator Tires;
var(Leopard) float TreadVelocityScale;
var(Dust) float DustAmmountScale;
var(Dust) float DustVelocityScale;
var(Dust) float DustSizeScale;
var(Dust) float DustLifeScale;
var(Dust) float DustFadeScale;
var(Dust) int DustEmittersCount;
var float MaxGroundSpeed;
var float MaxAirSpeed;
var(Leopard) float TreadTurnScale;
var(Leopard) Sound MovingIdleSound;
var float StartIdleTime;
var bool bSightActive;
var(Sights) config bool bHasSight;
var(Sights) config float MaxZoom;
var(Sights) Material SightTex;
var byte ToggleCount;

simulated function SpawnDust()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x50 [Loop If]
	if(i < DustEmittersCount)
	{
		Dust[i] = Spawn(Class'BWBP_VPC_Pro.LeopardDust');
		AttachToBone(Dust[i], DustBoneNames[i]);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated event TeamChanged()
{
	local LeopardTurret Turret;

	super(ONSVehicle).TeamChanged();
	Turret = LeopardTurret(Weapons[0]);
	// End:0x45
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Turret.SpawnSmokers(Team);
	}
	//return;	
}

simulated function PreBeginPlay()
{
	local int i;

	super(Vehicle).PreBeginPlay();
	ToggleCount = 0;
	// End:0x3A
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && !bDropDetail)
	{
		SpawnDust();
	}
	i = 0;
	J0x41:

	// End:0x70 [Loop If]
	if(i < DustEmittersCount)
	{
		Dust[i].UpdateTrackDust(false);
		i++;
		// [Loop Continue]
		goto J0x41;
	}
	i = 0;
	J0x77:

	// End:0xB3 [Loop If]
	if(i < DustEmittersCount)
	{
		Dust[i].SetDustColor(Level.DustColor);
		i++;
		// [Loop Continue]
		goto J0x77;
	}
	// End:0xD2
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SetupTreads();
	}
	// End:0xF1
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SetupTires();
	}
	//return;	
}

simulated function PostBeginPlay()
{
	super(Vehicle).PostBeginPlay();
	LeopardTurret(Weapons[0]).ToggleSmokers(false);
	//return;	
}

simulated function Destroyed()
{
	local int i;

	DestroyTreads();
	// End:0x35
	if(Tires != none)
	{
		Level.ObjectPool.FreeObject(Tires);
		Tires = none;
	}
	// End:0x91
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		i = 0;
		J0x55:

		// End:0x91 [Loop If]
		if(i < DustEmittersCount)
		{
			// End:0x87
			if(Dust[i] != none)
			{
				Dust[i].Destroy();
			}
			i++;
			// [Loop Continue]
			goto J0x55;
		}
	}
	super.Destroyed();
	AmbientSound = none;
	//return;	
}

simulated function DestroyAppearance()
{
	local int i;

	// End:0x5C
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		i = 0;
		J0x20:

		// End:0x5C [Loop If]
		if(i < DustEmittersCount)
		{
			// End:0x52
			if(Dust[i] != none)
			{
				Dust[i].Destroy();
			}
			i++;
			// [Loop Continue]
			goto J0x20;
		}
	}
	super(ONSVehicle).DestroyAppearance();
	AmbientSound = none;
	//return;	
}

function bool ImportantVehicle()
{
	return true;
	//return;	
}

simulated function SetupTreads()
{
	RightTreadPanner = VariableTexPanner(Level.ObjectPool.AllocateObject(Class'Engine.VariableTexPanner'));
	// End:0x88
	if(RightTreadPanner != none)
	{
		RightTreadPanner.Material = Skins[2];
		RightTreadPanner.PanDirection = rot(0, 49152, 0);
		RightTreadPanner.PanRate = 0.0000000;
		Skins[2] = RightTreadPanner;
	}
	LeftTreadPanner = VariableTexPanner(Level.ObjectPool.AllocateObject(Class'Engine.VariableTexPanner'));
	// End:0x10E
	if(LeftTreadPanner != none)
	{
		LeftTreadPanner.Material = Skins[1];
		LeftTreadPanner.PanDirection = rot(0, 49152, 0);
		LeftTreadPanner.PanRate = 0.0000000;
		Skins[1] = LeftTreadPanner;
	}
	//return;	
}

simulated function SetupTires()
{
	Tires = TexRotator(Level.ObjectPool.AllocateObject(Class'Engine.TexRotator'));
	// End:0xA6
	if(Tires != none)
	{
		Tires.Material = Skins[3];
		Tires.Rotation.Yaw = 0;
		Tires.TexRotationType = 0;
		Tires.UOffset = -1.2500000;
		Tires.VOffset = 0.0000000;
		Skins[3] = Tires;
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
	local int i;

	super(Vehicle).DrivingStatusChanged();
	// End:0xA4
	if(!bDriving)
	{
		ToggleCount = 0;
		LeopardTurret(Weapons[0]).ToggleSmokers(false);
		i = 0;
		J0x37:

		// End:0x66 [Loop If]
		if(i < DustEmittersCount)
		{
			Dust[i].UpdateTrackDust(false);
			i++;
			// [Loop Continue]
			goto J0x37;
		}
		// End:0x85
		if(LeftTreadPanner != none)
		{
			LeftTreadPanner.PanRate = 0.0000000;
		}
		// End:0xA4
		if(RightTreadPanner != none)
		{
			RightTreadPanner.PanRate = 0.0000000;
		}
	}
	//return;	
}

simulated function Tick(float DeltaTime)
{
	local float EnginePitch, LinTurnSpeed, TireTurnSpeed;
	local KRigidBodyState BodyState;
	local KarmaParams KP;
	local bool bOnGround;
	local int i;
	local float CurrentDustSize, CurrentDustVelocity, CurrentDustLife, CurrentDustFade, CurrentDustAmmount, CurrentVehicleSpeed;

	super(SVehicle).Tick(DeltaTime);
	KGetRigidBodyState(BodyState);
	KP = KarmaParams(KParams);
	CurrentVehicleSpeed = VSize(Velocity) * DeltaTime;
	LeopardTurret(Weapons[0]).SetSpread(CurrentVehicleSpeed);
	bOnGround = false;
	i = 0;
	J0x64:

	// End:0xCC [Loop If]
	if(i < KP.Repulsors.Length)
	{
		// End:0xC2
		if((KP.Repulsors[i] != none) && KP.Repulsors[i].bRepulsorInContact)
		{
			bOnGround = true;
		}
		i++;
		// [Loop Continue]
		goto J0x64;
	}
	// End:0xEC
	if(bOnGround)
	{
		KP.KMaxSpeed = MaxGroundSpeed;		
	}
	else
	{
		KP.KMaxSpeed = MaxAirSpeed;
	}
	// End:0x630
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		LinTurnSpeed = BodyState.AngVel.Z / TreadTurnScale;
		TireTurnSpeed = (BodyState.AngVel.Z * TireTurnScale) * DeltaTime;
		EnginePitch = 62.0000000 + ((VSize(Velocity) / MaxPitchSpeed) * 96.0000000);
		CurrentDustSize = 5.0000000 + (VSize(Velocity) / DustSizeScale);
		CurrentDustLife = 2.0000000 + (VSize(Velocity) / DustLifeScale);
		CurrentDustFade = 1.5000000 + (VSize(Velocity) / DustFadeScale);
		CurrentDustVelocity = 5.0000000 + (VSize(Velocity) / DustVelocityScale);
		CurrentDustAmmount = VSize(Velocity) / DustAmmountScale;
		SoundPitch = byte(FClamp(EnginePitch, MinSoundPitch, MaxSoundPitch));
		// End:0x26E
		if((AmbientSound != none) || (StartIdleTime != float(0)) && Level.TimeSeconds >= StartIdleTime)
		{
			// End:0x263
			if(EnginePitch > float(62))
			{
				AmbientSound = MovingIdleSound;				
			}
			else
			{
				AmbientSound = IdleSound;
			}
		}
		// End:0x2A8
		if((!bOnGround || EnginePitch <= float(62)) || VSize(Velocity) <= float(0))
		{
			CurrentDustAmmount = 0.0000000;			
		}
		else
		{
			// End:0x2D3
			if((EnginePitch <= float(64)) || VSize(Velocity) <= float(10))
			{
				CurrentDustAmmount = 2.5000000;
			}
		}
		i = 0;
		J0x2DA:

		// End:0x321 [Loop If]
		if(i < DustEmittersCount)
		{
			Dust[i].DustScale(CurrentDustSize, CurrentDustVelocity, CurrentDustLife, CurrentDustFade, CurrentDustAmmount);
			i++;
			// [Loop Continue]
			goto J0x2DA;
		}
		i = 0;
		J0x328:

		// End:0x357 [Loop If]
		if(i < DustEmittersCount)
		{
			Dust[i].UpdateTrackDust(true);
			i++;
			// [Loop Continue]
			goto J0x328;
		}
		LeopardTurret(Weapons[0]).GetSmokeScale(CurrentDustSize);
		// End:0x388
		if(int(ToggleCount) == 2)
		{
			ToggleCount = 0;
		}
		// End:0x3AF
		if(int(ToggleCount) >= 1)
		{
			LeopardTurret(Weapons[0]).ToggleSmokers(true);			
		}
		else
		{
			// End:0x3D3
			if(int(ToggleCount) < 1)
			{
				LeopardTurret(Weapons[0]).ToggleSmokers(false);
			}
		}
		// End:0x44A
		if(LeftTreadPanner != none)
		{
			LeftTreadPanner.PanRate = VSize(Velocity) / TreadVelocityScale;
			// End:0x435
			if((Velocity Dot Vector(Rotation)) > float(0))
			{
				LeftTreadPanner.PanRate = -1.0000000 * LeftTreadPanner.PanRate;
			}
			LeftTreadPanner.PanRate += LinTurnSpeed;
		}
		// End:0x4C1
		if(RightTreadPanner != none)
		{
			RightTreadPanner.PanRate = VSize(Velocity) / TreadVelocityScale;
			// End:0x4AC
			if((Velocity Dot Vector(Rotation)) > float(0))
			{
				RightTreadPanner.PanRate = -1.0000000 * RightTreadPanner.PanRate;
			}
			RightTreadPanner.PanRate -= LinTurnSpeed;
		}
		// End:0x578
		if(Tires != none)
		{
			// End:0x511
			if((Velocity Dot Vector(Rotation)) > float(0))
			{
				Tires.Rotation.Yaw += int((VSize(Velocity) * TireRotationScale) * DeltaTime);				
			}
			else
			{
				Tires.Rotation.Yaw -= int((VSize(Velocity) * TireRotationScale) * DeltaTime);
			}
			// End:0x578
			if((VSize(Velocity) > float(0)) || EnginePitch > float(62))
			{
				Tires.Rotation.Yaw += int(TireTurnSpeed);
			}
		}
		// End:0x5B2
		if(Tires.Rotation.Yaw >= 65536)
		{
			Tires.Rotation.Yaw -= 65536;			
		}
		else
		{
			// End:0x5E9
			if(Tires.Rotation.Yaw <= -65536)
			{
				Tires.Rotation.Yaw += 65536;
			}
		}
		// End:0x630
		if((VSize(Velocity) <= float(0)) || EnginePitch <= float(62))
		{
			LeftTreadPanner.PanRate = 0.0000000;
			RightTreadPanner.PanRate = 0.0000000;
		}
	}
	//return;	
}

simulated function POVChanged(PlayerController PC, bool bBehindViewChanged)
{
	super(Vehicle).POVChanged(PC, bBehindViewChanged);
	// End:0x45
	if(PC.bBehindView)
	{
		bSightActive = false;
		bWeaponisAltFiring = false;
		PC.EndZoom();		
	}
	else
	{
		bSightActive = true;
	}
	//return;	
}

simulated function DrawHUD(Canvas Canvas)
{
	// End:0xFF
	if(((SightTex != none) && bSightActive) && bHasSight)
	{
		Canvas.Style = 1;
		Canvas.DrawColor.R = 200;
		Canvas.DrawColor.G = 200;
		Canvas.DrawColor.B = 200;
		Canvas.DrawColor.A = byte(255);
		Canvas.SetPos(Canvas.OrgX, Canvas.OrgY);
		Canvas.DrawTile(SightTex, float(Canvas.SizeX), float(Canvas.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);		
	}
	else
	{
		// End:0x122
		if(!bSightActive || !bHasSight)
		{
			super(ONSVehicle).DrawHUD(Canvas);
		}
	}
	//return;	
}

function KDriverEnter(Pawn P)
{
	super(ONSVehicle).KDriverEnter(P);
	ToggleCount = 0;
	SVehicleUpdateParams();
	//return;	
}

simulated function DriverLeft()
{
	local int i;

	super(ONSVehicle).DriverLeft();
	ToggleCount = 0;
	i = 0;
	J0x15:

	// End:0x44 [Loop If]
	if(i < DustEmittersCount)
	{
		Dust[i].UpdateTrackDust(false);
		i++;
		// [Loop Continue]
		goto J0x15;
	}
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
	// End:0x4D
	if(!PC.bBehindView)
	{
		bWeaponisAltFiring = true;
		PC.ToggleZoomWithMax(MaxZoom);
	}
	// End:0x66
	if(PC.bBehindView)
	{
		ToggleCount++;
	}
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
	// End:0x61
	if(!PC.bBehindView)
	{
		bWeaponisAltFiring = false;
		PC.StopZoom();
	}
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

event TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x27
	if(DamageType == Class'Onslaught.DamTypeONSVehicleExplosion')
	{
		Damage *= 0.4000000;
		Momentum *= 0.3000000;
	}
	super(ONSVehicle).TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
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
	DustBoneNames[0]="DustBone1"
	DustBoneNames[1]="DustBone2"
	DustBoneNames[2]="DustBone3"
	DustBoneNames[3]="DustBone4"
	DustBoneNames[4]="DustBone5"
	DustBoneNames[5]="DustBone6"
	DustBoneNames[6]="DustBone7"
	DustBoneNames[7]="DustBone8"
	DustBoneNames[8]="DustBone9"
	DustBoneNames[9]="DustBone10"
	MaxPitchSpeed=1000.0000000
	MaxSoundPitch=128.0000000
	MinSoundPitch=62.0000000
	TireRotationScale=100.0000000
	TireTurnScale=50000.0000000
	TreadVelocityScale=600.0000000
	DustAmmountScale=150.0000000
	DustVelocityScale=12.0000000
	DustSizeScale=15.0000000
	DustLifeScale=150.0000000
	DustFadeScale=250.0000000
	DustEmittersCount=10
	MaxGroundSpeed=20000.0000000
	MaxAirSpeed=50000.0000000
	TreadTurnScale=0.6000000
	MovingIdleSound=Sound'BWBP_Vehicles_Sound.Leopard.Leo-EngineMotion'
	bHasSight=true
	MaxZoom=0.8000000
	SightTex=Texture'BWBP_Vehicles_Tex.ui.LeopardSight'
	ThrusterOffsets=/* ERROR: System.ArgumentOutOfRangeException */
	HoverSoftness=0.0500000
	HoverPenScale=7.5000000
	HoverCheckDist=32.0000000
	UprightStiffness=500.0000000
	UprightDamping=300.0000000
	MaxThrust=80.0000000
	MaxSteerTorque=100.0000000
	ForwardDampFactor=0.1000000
	LateralDampFactor=0.8000000
	ParkingDampFactor=0.3000000
	SteerDampFactor=200.0000000
	InvertSteeringThrottleThreshold=-0.1000000
	DriverWeapons[0]=(WeaponClass=Class'BWBP_VPC_Pro.LeopardTurret',WeaponBone="TurretBone")
	PassengerWeapons[0]=(WeaponPawnClass=Class'BWBP_VPC_Pro.LeopardMGPawn',WeaponBone="MGBone")
	bHasAltFire=false
	RedSkin=Texture'BWBP_Vehicles_Tex.Leopard.LeopardChasisRed'
	BlueSkin=Texture'BWBP_Vehicles_Tex.Leopard.LeopardChasisBlue'
	IdleSound=Sound'BWBP_Vehicles_Sound.Leopard.Leo-EngineIdle'
	StartUpSound=Sound'ONSVehicleSounds-S.Tank.TankStart01'
	ShutDownSound=Sound'ONSVehicleSounds-S.Tank.TankStop01'
	StartUpForce="TankStartUp"
	ShutDownForce="TankShutDown"
	ViewShakeRadius=600.0000000
	ViewShakeOffsetMag=(X=0.5000000,Y=0.0000000,Z=2.0000000)
	ViewShakeOffsetFreq=7.0000000
	DestroyedVehicleMesh=StaticMesh'BWBP_Vehicles_Static.Leopard.LeopardDead'
	DestructionEffectClass=Class'BWBP_VPC_Pro.LeopardExplosionEffect'
	DisintegrationHealth=-4096.0000000
	DestructionLinearMomentum=(Min=250000.0000000,Max=400000.0000000)
	DestructionAngularMomentum=(Min=100.0000000,Max=300.0000000)
	DamagedEffectScale=1.5000000
	DamagedEffectOffset=(X=-192.0000000,Y=76.0000000,Z=64.0000000)
	bEnableProximityViewShake=true
	VehicleMass=13.0000000
	bVehicleShadows=false
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
	FPCamPos=(X=-64.0000000,Y=-8.0000000,Z=120.0000000)
	FPCamViewOffset=(X=90.0000000,Y=0.0000000,Z=0.0000000)
	TPCamDistance=1024.0000000
	TPCamLookat=(X=-50.0000000,Y=0.0000000,Z=0.0000000)
	TPCamWorldOffset=(X=0.0000000,Y=0.0000000,Z=250.0000000)
	TPCamDistRange=(Min=700.0000000,Max=1024.0000000)
	MomentumMult=0.3000000
	DriverDamageMult=0.0000000
	VehiclePositionString="Driving a Leopard TM V"
	VehicleNameString="Leopard TankMaster V"
	RanOverDamageType=Class'BWBP_VPC_Pro.LeopardDamTypeRoadKill'
	CrushedDamageType=Class'BWBP_VPC_Pro.LeopardDamTypePancake'
	MaxDesireability=0.8500000
	FlagBone="MGBone"
	FlagRotation=(Pitch=0,Yaw=32768,Roll=0)
	HornSounds[0]=Sound'ONSVehicleSounds-S.Horns.Horn09'
	HornSounds[1]=Sound'ONSVehicleSounds-S.Horns.Horn02'
	WaterDamage=50.0000000
	bCanStrafe=true
	GroundSpeed=20000.0000000
	WaterSpeed=1000.0000000
	HealthMax=1300.0000000
	Health=1300
	Mesh=SkeletalMesh'BWBP_Vehicles_Anim.LeopardTank'
	Skins[0]=none
	Skins[1]=Texture'BWBP_Vehicles_Tex.Leopard.LeopardTracks'
	Skins[2]=Texture'BWBP_Vehicles_Tex.Leopard.LeopardTracks'
	Skins[3]=Texture'BWBP_Vehicles_Tex.Leopard.MetalTireRim'
	ScaleGlow=0.7500000
	bFullVolume=true
	SoundRadius=250.0000000
	CollisionRadius=260.0000000
	CollisionHeight=60.0000000
	// Reference: KarmaParamsRBFull'BWBP_VPC_Pro.LeopardTank.KParams0'
	begin object name="KParams0" class=Engine.KarmaParamsRBFull
		KInertiaTensor[0]=1.3000000
		KInertiaTensor[3]=4.0000000
		KInertiaTensor[5]=4.5000000
		KLinearDamping=0.0000000
		KAngularDamping=0.0000000
		KStartEnabled=true
		KMaxSpeed=2000.0000000
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
// Reference: KarmaParamsRBFull'BWBP_VPC_Pro.LeopardTank.KParams0'
begin object name="KParams0" class=Engine.KarmaParamsRBFull
	KInertiaTensor[0]=1.3000000
	KInertiaTensor[3]=4.0000000
	KInertiaTensor[5]=4.5000000
	KLinearDamping=0.0000000
	KAngularDamping=0.0000000
	KStartEnabled=true
	KMaxSpeed=2000.0000000
	bHighDetailOnly=false
	bClientOnly=false
	bKDoubleTickRate=true
	bKStayUpright=true
	bKAllowRotate=true
	bDestroyOnWorldPenetrate=true
	bDoSafetime=true
	KFriction=0.5000000
end object
