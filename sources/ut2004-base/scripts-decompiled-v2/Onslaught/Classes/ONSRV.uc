class ONSRV extends ONSWheeledCraft
	config(User);

var bool bLeftArmBroke;
var bool bRightArmBroke;
var bool bClientLeftArmBroke;
var bool bClientRightArmBroke;
var() Sound ArmExtendSound;
var() Sound ArmRetractSound;
var() Sound BladeBreakSound;
var string ArmExtendForce;
var string ArmRetractForce;
var float LastArmExtendTime;
var float LastArmRetractTime;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		bClientLeftArmBroke, bClientRightArmBroke;
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

function AltFire(optional float F)
{
	super(Vehicle).AltFire(F);
	//return;	
}

function ClientVehicleCeaseFire(bool bWasAltFire)
{
	// End:0x18
	if(bWasAltFire)
	{
		super(Vehicle).ClientVehicleCeaseFire(bWasAltFire);		
	}
	else
	{
		super(ONSVehicle).ClientVehicleCeaseFire(bWasAltFire);
	}
	//return;	
}

function VehicleFire(bool bWasAltFire)
{
	// End:0x85
	if(bWasAltFire)
	{
		PlayAnim('RVarmEXTEND');
		// End:0x82
		if(!bLeftArmBroke || !bRightArmBroke)
		{
			// End:0x7A
			if((Level.TimeSeconds - LastArmExtendTime) > 0.1000000)
			{
				LastArmExtendTime = Level.TimeSeconds;
				PlaySound(ArmExtendSound, 0, 2.0000000,,,, false);
				ClientPlayForceFeedback(ArmExtendForce);
			}
			bWeaponisAltFiring = true;
		}		
	}
	else
	{
		super(Vehicle).VehicleFire(bWasAltFire);
	}
	//return;	
}

function VehicleCeaseFire(bool bWasAltFire)
{
	// End:0x85
	if(bWasAltFire)
	{
		PlayAnim('RVarmRETRACT');
		// End:0x82
		if(!bLeftArmBroke || !bRightArmBroke)
		{
			// End:0x7A
			if((Level.TimeSeconds - LastArmRetractTime) > 0.1000000)
			{
				LastArmRetractTime = Level.TimeSeconds;
				PlaySound(ArmRetractSound, 0, 2.0000000,,,, false);
				ClientPlayForceFeedback(ArmRetractForce);
			}
			bWeaponisAltFiring = false;
		}		
	}
	else
	{
		super(ONSVehicle).VehicleCeaseFire(bWasAltFire);
	}
	//return;	
}

function Pawn CheckForHeadShot(Vector loc, Vector ray, float AdditionalScale)
{
	local Vector X, Y, Z;

	GetAxes(Rotation, X, Y, Z);
	// End:0x4A
	if((Driver != none) && Driver.IsHeadShot(loc, ray, AdditionalScale))
	{
		return Driver;
	}
	return none;
	//return;	
}

simulated function Tick(float dt)
{
	local Coords ArmBaseCoords, ArmTipCoords;
	local Vector HitLocation, HitNormal;
	local Actor Victim;

	super.Tick(dt);
	// End:0x11B
	if(((int(Role) == int(ROLE_Authority)) && bWeaponisAltFiring) && !bLeftArmBroke)
	{
		ArmBaseCoords = GetBoneCoords('CarLShoulder');
		ArmTipCoords = GetBoneCoords('LeftBladeDummy');
		Victim = Trace(HitLocation, HitNormal, ArmTipCoords.Origin, ArmBaseCoords.Origin);
		// End:0x11B
		if((Victim != none) && Victim.bBlockActors)
		{
			// End:0xF9
			if(Victim.IsA('Pawn') && !Victim.IsA('Vehicle'))
			{
				Pawn(Victim).TakeDamage(1000, self, HitLocation, Velocity * float(100), Class'Onslaught.DamTypeONSRVBlade');				
			}
			else
			{
				bLeftArmBroke = true;
				bClientLeftArmBroke = true;
				BladeBreakOff(4, 'CARLslider', Class'Onslaught.ONSRVLeftBladeBreakOffEffect');
			}
		}
	}
	// End:0x158
	if((int(Role) < int(ROLE_Authority)) && bClientLeftArmBroke)
	{
		bLeftArmBroke = true;
		bClientLeftArmBroke = false;
		BladeBreakOff(4, 'CARLslider', Class'Onslaught.ONSRVLeftBladeBreakOffEffect');
	}
	// End:0x268
	if(((int(Role) == int(ROLE_Authority)) && bWeaponisAltFiring) && !bRightArmBroke)
	{
		ArmBaseCoords = GetBoneCoords('CarRShoulder');
		ArmTipCoords = GetBoneCoords('RightBladeDummy');
		Victim = Trace(HitLocation, HitNormal, ArmTipCoords.Origin, ArmBaseCoords.Origin);
		// End:0x268
		if((Victim != none) && Victim.bBlockActors)
		{
			// End:0x246
			if(Victim.IsA('Pawn') && !Victim.IsA('Vehicle'))
			{
				Pawn(Victim).TakeDamage(1000, self, HitLocation, Velocity * float(100), Class'Onslaught.DamTypeONSRVBlade');				
			}
			else
			{
				bRightArmBroke = true;
				bClientRightArmBroke = true;
				BladeBreakOff(5, 'CARRslider', Class'Onslaught.ONSRVRightBladeBreakOffEffect');
			}
		}
	}
	// End:0x2A5
	if((int(Role) < int(ROLE_Authority)) && bClientRightArmBroke)
	{
		bRightArmBroke = true;
		bClientRightArmBroke = false;
		BladeBreakOff(5, 'CARRslider', Class'Onslaught.ONSRVRightBladeBreakOffEffect');
	}
	//return;	
}

simulated function BladeBreakOff(int Slot, name BoneName, Class<Emitter> BreakEffect)
{
	PlaySound(BladeBreakSound, 0, 2.0000000,,,, false);
	SetBoneScale(Slot, 0.0000000, BoneName);
	// End:0x49
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Spawn(BreakEffect);
	}
	//return;	
}

static function StaticPrecache(LevelInfo L)
{
	super(ONSVehicle).StaticPrecache(L);
	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RVexploded.RVgun');
	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RVexploded.RVrail');
	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RVexploded.Rvtire');
	L.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris2');
	L.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris1');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp2_frames');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp1_frames');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.we1_frames');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.SmokeReOrdered');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.NapalmSpot');
	L.AddPrecacheMaterial(Texture'EpicParticles.Fire.SprayFire1');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.RVGroup.RVcolorRED');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.RVGroup.NEWrvNoCOLOR');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.RVGroup.RVblades');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.Environments.ReflectionTexture');
	L.AddPrecacheMaterial(Texture'VMWeaponsTX.RVgunGroup.RVnewGUNtex');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.MuzzleSpray');
	L.AddPrecacheMaterial(Texture'VehicleFX.Particles.DustyCloud2');
	L.AddPrecacheMaterial(Texture'VMparticleTextures.DirtKICKGROUP.dirtKICKTEX');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.RVGroup.RVcolorBlue');
	L.AddPrecacheMaterial(Texture'Engine.GRADIENT_Fade');
	L.AddPrecacheMaterial(Texture'XEffectMat.Link.link_spark_green');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RVexploded.RVgun');
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RVexploded.RVrail');
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.RVexploded.Rvtire');
	Level.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris2');
	Level.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris1');
	super(ONSVehicle).UpdatePrecacheStaticMeshes();
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp2_frames');
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp1_frames');
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.we1_frames');
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.SmokeReOrdered');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.NapalmSpot');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Fire.SprayFire1');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.RVGroup.RVcolorRED');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.RVGroup.NEWrvNoCOLOR');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.RVGroup.RVblades');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.Environments.ReflectionTexture');
	Level.AddPrecacheMaterial(Texture'VMWeaponsTX.RVgunGroup.RVnewGUNtex');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.MuzzleSpray');
	Level.AddPrecacheMaterial(Texture'VehicleFX.Particles.DustyCloud2');
	Level.AddPrecacheMaterial(Texture'VMparticleTextures.DirtKICKGROUP.dirtKICKTEX');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.RVGroup.RVcolorBlue');
	Level.AddPrecacheMaterial(Texture'Engine.GRADIENT_Fade');
	Level.AddPrecacheMaterial(Texture'XEffectMat.Link.link_spark_green');
	super(ONSVehicle).UpdatePrecacheMaterials();
	//return;	
}

function ShouldTargetMissile(Projectile P)
{
	// End:0x99
	if((((Health < 200) && Bot(Controller) != none) && Level.Game.GameDifficulty > (float(4) + (float(4) * FRand()))) && VSize(P.Location - Location) < VSize(P.Velocity))
	{
		KDriverLeave(false);
		TeamUseTime = Level.TimeSeconds + float(4);
	}
	//return;	
}

defaultproperties
{
	ArmExtendSound=Sound'ONSVehicleSounds-S.RV.Shing1'
	ArmRetractSound=Sound'ONSVehicleSounds-S.RV.Shing2'
	BladeBreakSound=Sound'ONSVehicleSounds-S.RV.RVBladeBreakOff'
	ArmExtendForce="RVBladeOpen"
	ArmRetractForce="RVBladeClose"
	WheelSoftness=0.0250000
	WheelPenScale=1.2000000
	WheelPenOffset=0.0100000
	WheelRestitution=0.1000000
	WheelInertia=0.1000000
	WheelLongFrictionFunc=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=100.0000000,OutVal=1.0000000),(InVal=200.0000000,OutVal=0.9000000),(InVal=10000000000.0000000,OutVal=0.9000000)))
	WheelLongSlip=0.0010000
	WheelLatSlipFunc=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=30.0000000,OutVal=0.0090000),(InVal=45.0000000,OutVal=0.0000000),(InVal=10000000000.0000000,OutVal=0.0000000)))
	WheelLongFrictionScale=1.1000000
	WheelLatFrictionScale=1.3500000
	WheelHandbrakeSlip=0.0100000
	WheelHandbrakeFriction=0.1000000
	WheelSuspensionTravel=15.0000000
	WheelSuspensionMaxRenderTravel=15.0000000
	FTScale=0.0300000
	ChassisTorqueScale=0.4000000
	MinBrakeFriction=4.0000000
	MaxSteerAngleCurve=(Points=((InVal=0.0000000,OutVal=25.0000000),(InVal=1500.0000000,OutVal=11.0000000),(InVal=1000000000.0000000,OutVal=11.0000000)))
	TorqueCurve=(Points=((InVal=0.0000000,OutVal=9.0000000),(InVal=200.0000000,OutVal=10.0000000),(InVal=1500.0000000,OutVal=11.0000000),(InVal=2800.0000000,OutVal=0.0000000)))
	GearRatios[0]=-0.5000000
	GearRatios[1]=0.4000000
	GearRatios[2]=0.6500000
	GearRatios[3]=0.8500000
	GearRatios[4]=1.1000000
	TransRatio=0.1500000
	ChangeUpPoint=2000.0000000
	ChangeDownPoint=1000.0000000
	LSDFactor=1.0000000
	EngineBrakeFactor=0.0001000
	EngineBrakeRPMScale=0.1000000
	MaxBrakeTorque=20.0000000
	SteerSpeed=160.0000000
	TurnDamping=35.0000000
	StopThreshold=100.0000000
	HandbrakeThresh=200.0000000
	EngineInertia=0.1000000
	IdleRPM=500.0000000
	EngineRPMSoundRange=9000.0000000
	SteerBoneName="SteeringWheel"
	SteerBoneAxis=2
	SteerBoneMaxAngle=90.0000000
	RevMeterScale=4000.0000000
	bMakeBrakeLights=true
	BrakeLightOffset[0]=(X=-100.0000000,Y=23.0000000,Z=7.0000000)
	BrakeLightOffset[1]=(X=-100.0000000,Y=-23.0000000,Z=7.0000000)
	BrakeLightMaterial=Texture'EpicParticles.Flares.FlashFlare1'
	DaredevilThreshInAirSpin=180.0000000
	DaredevilThreshInAirTime=1.7000000
	DaredevilThreshInAirDistance=21.0000000
	bDoStuntInfo=true
	bAllowBigWheels=true
	AirTurnTorque=35.0000000
	AirPitchTorque=55.0000000
	AirPitchDamping=35.0000000
	AirRollTorque=35.0000000
	AirRollDamping=35.0000000
	DriverWeapons[0]=(WeaponClass=Class'Onslaught.ONSRVWebLauncher',WeaponBone="ChainGunAttachment")
	bHasAltFire=false
	RedSkin=Shader'VMVehicles-TX.RVGroup.RVChassisFinalRED'
	BlueSkin=Shader'VMVehicles-TX.RVGroup.RVChassisFinalBLUE'
	IdleSound=Sound'ONSVehicleSounds-S.RV.RVEng01'
	StartUpSound=Sound'ONSVehicleSounds-S.RV.RVStart01'
	ShutDownSound=Sound'ONSVehicleSounds-S.RV.RVStop01'
	StartUpForce="RVStartUp"
	DestroyedVehicleMesh=StaticMesh'ONSDeadVehicles-SM.RVDead'
	DestructionEffectClass=Class'Onslaught.ONSSmallVehicleExplosionEffect'
	DisintegrationEffectClass=Class'Onslaught.ONSVehDeathRV'
	DisintegrationHealth=-25.0000000
	DestructionLinearMomentum=(Min=200000.0000000,Max=300000.0000000)
	DestructionAngularMomentum=(Min=100.0000000,Max=150.0000000)
	DamagedEffectOffset=(X=60.0000000,Y=10.0000000,Z=10.0000000)
	ImpactDamageMult=0.0010000
	HeadlightCoronaOffset[0]=()
	HeadlightCoronaOffset[1]=()
	HeadlightCoronaMaterial=Texture'EpicParticles.Flares.FlashFlare1'
	HeadlightCoronaMaxSize=65.0000000
	HeadlightProjectorMaterial=Texture'VMVehicles-TX.RVGroup.RVprojector'
	HeadlightProjectorOffset=(X=90.0000000,Y=0.0000000,Z=7.0000000)
	HeadlightProjectorRotation=(Pitch=-1000,Yaw=0,Roll=0)
	HeadlightProjectorScale=0.3000000
	// Reference: SVehicleWheel'Onslaught.ONSRV.RRWheel'
	begin object name="RRWheel" class=Engine.SVehicleWheel
		bPoweredWheel=true
		bHandbrakeWheel=true
		BoneName="tire02"
		BoneRollAxis=1
		BoneOffset=(X=0.0000000,Y=7.0000000,Z=0.0000000)
		WheelRadius=24.0000000
		SupportBoneName="RrearStrut"
		SupportBoneAxis=0
	end object
	Wheels[0]=RRWheel
	// Reference: SVehicleWheel'Onslaught.ONSRV.LRWheel'
	begin object name="LRWheel" class=Engine.SVehicleWheel
		bPoweredWheel=true
		bHandbrakeWheel=true
		BoneName="tire04"
		BoneRollAxis=1
		BoneOffset=(X=0.0000000,Y=-7.0000000,Z=0.0000000)
		WheelRadius=24.0000000
		SupportBoneName="LrearStrut"
		SupportBoneAxis=0
	end object
	Wheels[1]=LRWheel
	// Reference: SVehicleWheel'Onslaught.ONSRV.RFWheel'
	begin object name="RFWheel" class=Engine.SVehicleWheel
		bPoweredWheel=true
		SteerType=1
		BoneName="tire"
		BoneRollAxis=1
		BoneOffset=(X=0.0000000,Y=7.0000000,Z=0.0000000)
		WheelRadius=24.0000000
		SupportBoneName="RFrontStrut"
		SupportBoneAxis=0
	end object
	Wheels[2]=RFWheel
	// Reference: SVehicleWheel'Onslaught.ONSRV.LFWheel'
	begin object name="LFWheel" class=Engine.SVehicleWheel
		bPoweredWheel=true
		SteerType=1
		BoneName="tire03"
		BoneRollAxis=1
		BoneOffset=(X=0.0000000,Y=-7.0000000,Z=0.0000000)
		WheelRadius=24.0000000
		SupportBoneName="LfrontStrut"
		SupportBoneAxis=0
	end object
	Wheels[3]=LFWheel
	VehicleMass=3.5000000
	bDrawDriverInTP=true
	bCanDoTrickJumps=true
	bDrawMeshInFP=true
	bHasHandbrake=true
	bSeparateTurretFocus=true
	DrivePos=(X=2.0000000,Y=0.0000000,Z=38.0000000)
	ExitPositions[0]=()
	ExitPositions[1]=()
	ExitPositions[2]=()
	ExitPositions[3]=()
	EntryRadius=160.0000000
	FPCamPos=(X=15.0000000,Y=0.0000000,Z=25.0000000)
	TPCamDistance=375.0000000
	CenterSpringForce="SpringONSSRV"
	TPCamLookat=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	TPCamWorldOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	DriverDamageMult=0.8000000
	VehiclePositionString="in a Scorpion"
	VehicleNameString="Scorpion"
	RanOverDamageType=Class'Onslaught.DamTypeRVRoadkill'
	CrushedDamageType=Class'Onslaught.DamTypeRVPancake'
	MaxDesireability=0.4000000
	ObjectiveGetOutDist=1500.0000000
	HornSounds[0]=Sound'ONSVehicleSounds-S.Horns.Horn06'
	HornSounds[1]=Sound'ONSVehicleSounds-S.Horns.Dixie_Horn'
	GroundSpeed=940.0000000
	HealthMax=300.0000000
	Health=300
	bReplicateAnimations=true
	Mesh=SkeletalMesh'ONSVehicles-A.RV'
	SoundVolume=180
	CollisionRadius=100.0000000
	CollisionHeight=40.0000000
	// Reference: KarmaParamsRBFull'Onslaught.ONSRV.KParams0'
	begin object name="KParams0" class=Engine.KarmaParamsRBFull
		KInertiaTensor[0]=1.0000000
		KInertiaTensor[3]=3.0000000
		KInertiaTensor[5]=3.0000000
		KCOMOffset=(X=-0.2500000,Y=0.0000000,Z=-0.4000000)
		KLinearDamping=0.0500000
		KAngularDamping=0.0500000
		KStartEnabled=true
		bKNonSphericalInertia=true
		bHighDetailOnly=false
		bClientOnly=false
		bKDoubleTickRate=true
		bDestroyOnWorldPenetrate=true
		bDoSafetime=true
		KFriction=0.5000000
		KImpactThreshold=700.0000000
	end object
	KParams=KParams0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: KarmaParamsRBFull'Onslaught.ONSRV.KParams0'
begin object name="KParams0" class=Engine.KarmaParamsRBFull
	KInertiaTensor[0]=1.0000000
	KInertiaTensor[3]=3.0000000
	KInertiaTensor[5]=3.0000000
	KCOMOffset=(X=-0.2500000,Y=0.0000000,Z=-0.4000000)
	KLinearDamping=0.0500000
	KAngularDamping=0.0500000
	KStartEnabled=true
	bKNonSphericalInertia=true
	bHighDetailOnly=false
	bClientOnly=false
	bKDoubleTickRate=true
	bDestroyOnWorldPenetrate=true
	bDoSafetime=true
	KFriction=0.5000000
	KImpactThreshold=700.0000000
end object
// Reference: SVehicleWheel'Onslaught.ONSRV.RRWheel'
begin object name="RRWheel" class=Engine.SVehicleWheel
	bPoweredWheel=true
	bHandbrakeWheel=true
	BoneName="tire02"
	BoneRollAxis=1
	BoneOffset=(X=0.0000000,Y=7.0000000,Z=0.0000000)
	WheelRadius=24.0000000
	SupportBoneName="RrearStrut"
	SupportBoneAxis=0
end object
// Reference: SVehicleWheel'Onslaught.ONSRV.LRWheel'
begin object name="LRWheel" class=Engine.SVehicleWheel
	bPoweredWheel=true
	bHandbrakeWheel=true
	BoneName="tire04"
	BoneRollAxis=1
	BoneOffset=(X=0.0000000,Y=-7.0000000,Z=0.0000000)
	WheelRadius=24.0000000
	SupportBoneName="LrearStrut"
	SupportBoneAxis=0
end object
// Reference: SVehicleWheel'Onslaught.ONSRV.RFWheel'
begin object name="RFWheel" class=Engine.SVehicleWheel
	bPoweredWheel=true
	SteerType=1
	BoneName="tire"
	BoneRollAxis=1
	BoneOffset=(X=0.0000000,Y=7.0000000,Z=0.0000000)
	WheelRadius=24.0000000
	SupportBoneName="RFrontStrut"
	SupportBoneAxis=0
end object
// Reference: SVehicleWheel'Onslaught.ONSRV.LFWheel'
begin object name="LFWheel" class=Engine.SVehicleWheel
	bPoweredWheel=true
	SteerType=1
	BoneName="tire03"
	BoneRollAxis=1
	BoneOffset=(X=0.0000000,Y=-7.0000000,Z=0.0000000)
	WheelRadius=24.0000000
	SupportBoneName="LfrontStrut"
	SupportBoneAxis=0
end object
