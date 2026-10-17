class ONSPRV extends ONSWheeledCraft
	config(User);

var ScriptedTexture LicensePlate;
var Material LicensePlateFallBack;
var Material LicensePlateBackground;
var string LicensePlateName;
var Font LicensePlateFont;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0xB9
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		LicensePlate = ScriptedTexture(Level.ObjectPool.AllocateObject(Class'Engine.ScriptedTexture'));
		LicensePlate.SetSize(256, 128);
		LicensePlate.FallbackMaterial = LicensePlateFallBack;
		LicensePlate.Client = self;
		Skins[3] = LicensePlate;
		LicensePlateFont = Font(DynamicLoadObject("2k4Fonts.Verdana28", Class'Engine.Font'));
	}
	//return;	
}

simulated event RenderTexture(ScriptedTexture Tex)
{
	local int SizeX, SizeY;
	local Color BackColor, ForegroundColor, HighLightColor;

	HighLightColor.R = 100;
	HighLightColor.G = 100;
	HighLightColor.B = 100;
	HighLightColor.A = byte(255);
	ForegroundColor.R = 25;
	ForegroundColor.G = 25;
	ForegroundColor.B = 25;
	ForegroundColor.A = byte(255);
	BackColor.R = 128;
	BackColor.G = 128;
	BackColor.B = 128;
	BackColor.A = 0;
	// End:0x1C2
	if(bDriving)
	{
		Tex.TextSize(LicensePlateName, LicensePlateFont, SizeX, SizeY);
		Tex.DrawTile(0.0000000, 0.0000000, float(Tex.USize), float(Tex.VSize), 0.0000000, 0.0000000, float(Tex.USize), float(Tex.VSize), LicensePlateBackground, BackColor);
		Tex.DrawText(int(float(Tex.USize - SizeX) * 0.5000000) - 1, 40 - 1, LicensePlateName, LicensePlateFont, HighLightColor);
		Tex.DrawText(int(float(Tex.USize - SizeX) * 0.5000000), 40, LicensePlateName, LicensePlateFont, ForegroundColor);		
	}
	else
	{
		Tex.DrawTile(0.0000000, 0.0000000, float(Tex.USize), float(Tex.VSize), 0.0000000, 0.0000000, float(Tex.USize), float(Tex.VSize), LicensePlateFallBack, BackColor);
	}
	//return;	
}

simulated event DrivingStatusChanged()
{
	local array<string> Characters;
	local int i, AscCode;

	// End:0x2B3
	if((bDriving && LicensePlate != none) && PlayerReplicationInfo != none)
	{
		LicensePlateName = Caps(PlayerReplicationInfo.PlayerName);
		// End:0x2A3
		if(Len(LicensePlateName) > 8)
		{
			LicensePlateName = Repl(LicensePlateName, "[", "", false);
			LicensePlateName = Repl(LicensePlateName, "]", "", false);
			LicensePlateName = Repl(LicensePlateName, "(", "", false);
			LicensePlateName = Repl(LicensePlateName, ")", "", false);
			LicensePlateName = Repl(LicensePlateName, "{", "", false);
			LicensePlateName = Repl(LicensePlateName, "}", "", false);
			LicensePlateName = Repl(LicensePlateName, "<", "", false);
			LicensePlateName = Repl(LicensePlateName, ">", "", false);
			// End:0x294
			if(Len(LicensePlateName) > 8)
			{
				i = 0;
				J0xF4:

				// End:0x128 [Loop If]
				if(i < Len(LicensePlateName))
				{
					Characters[i] = Mid(LicensePlateName, i, 1);
					i++;
					// [Loop Continue]
					goto J0xF4;
				}
				i = Characters.Length - 1;
				J0x137:

				// End:0x195 [Loop If]
				if(i >= 0)
				{
					AscCode = Asc(Characters[i]);
					// End:0x17B
					if((AscCode < 65) || AscCode > 90)
					{
						Characters.Remove(i, 1);
					}
					// End:0x18B
					if(Characters.Length <= 8)
					{
						// [Explicit Break]
						goto J0x195;
					}
					i--;
					// [Loop Continue]
					goto J0x137;
				}
				J0x195:

				// End:0x257
				if(Characters.Length > 8)
				{
					i = Characters.Length - 1;
					J0x1B1:

					// End:0x257 [Loop If]
					if(i >= 0)
					{
						AscCode = Asc(Characters[i]);
						switch(AscCode)
						{
							// End:0x1EA
							case 65:
								Characters.Remove(i, 1);
								// End:0x23D
								break;
							// End:0x1FE
							case 69:
								Characters.Remove(i, 1);
								// End:0x23D
								break;
							// End:0x212
							case 73:
								Characters.Remove(i, 1);
								// End:0x23D
								break;
							// End:0x226
							case 79:
								Characters.Remove(i, 1);
								// End:0x23D
								break;
							// End:0x23A
							case 85:
								Characters.Remove(i, 1);
								// End:0x23D
								break;
							// End:0xFFFF
							default:
								break;
						}
						// End:0x24D
						if(Characters.Length <= 8)
						{
							// [Explicit Break]
							goto J0x257;
						}
						i--;
						// [Loop Continue]
						goto J0x1B1;
					}
				}
				J0x257:

				LicensePlateName = "";
				i = 0;
				J0x266:

				// End:0x294 [Loop If]
				if(i < Characters.Length)
				{
					LicensePlateName $= Characters[i];
					i++;
					// [Loop Continue]
					goto J0x266;
				}
			}
			LicensePlateName = Left(LicensePlateName, 8);
		}
		LicensePlate.Revision++;
	}
	super.DrivingStatusChanged();
	//return;	
}

simulated event Destroyed()
{
	// End:0x38
	if(LicensePlate != none)
	{
		LicensePlate.Client = none;
		Level.ObjectPool.FreeObject(LicensePlate);
	}
	super.Destroyed();
	//return;	
}

function VehicleFire(bool bWasAltFire)
{
	ServerPlayHorn(0);
	//return;	
}

function float BotDesireability(Actor S, int TeamIndex, Actor Objective)
{
	local Bot B;
	local SquadAI Squad;
	local int Num;

	// End:0x57
	if(Level.Game.JustStarted(20.0000000) && !Level.Game.IsA('ASGameInfo'))
	{
		return super(Vehicle).BotDesireability(S, TeamIndex, Objective);
	}
	Squad = SquadAI(S);
	// End:0xE9
	if(Squad.Size == 1)
	{
		// End:0xE3
		if(((Squad.Team != none) && Squad.Team.Size == 1) && Level.Game.IsA('ASGameInfo'))
		{
			return super(Vehicle).BotDesireability(S, TeamIndex, Objective);
		}
		return 0.0000000;
	}
	B = Squad.SquadMembers;
	J0xFD:

	// End:0x1AF [Loop If]
	if(B != none)
	{
		// End:0x198
		if((Vehicle(B.Pawn) == none) && ((B.RouteGoal == self) || B.Pawn == none) || VSize(B.Pawn.Location - Location) < Squad.MaxVehicleDist(B.Pawn))
		{
			Num++;
		}
		B = B.NextSquadMember;
		// [Loop Continue]
		goto J0xFD;
	}
	// End:0x1C1
	if(Num < 2)
	{
		return 0.0000000;
	}
	return super(Vehicle).BotDesireability(S, TeamIndex, Objective);
	//return;	
}

function Vehicle FindEntryVehicle(Pawn P)
{
	local Bot B;
	local int i;

	// End:0x2C
	if(Level.Game.JustStarted(20.0000000))
	{
		return super(ONSVehicle).FindEntryVehicle(P);
	}
	B = Bot(P.Controller);
	// End:0xDD
	if((((B == none) || WeaponPawns.Length == 0) || !IsVehicleEmpty()) || ((B.PlayerReplicationInfo.Team != none) && B.PlayerReplicationInfo.Team.Size == 1) && Level.Game.IsA('ASGameInfo'))
	{
		return super(ONSVehicle).FindEntryVehicle(P);
	}
	i = WeaponPawns.Length - 1;
	J0xEC:

	// End:0x127 [Loop If]
	if(i >= 0)
	{
		// End:0x11D
		if(WeaponPawns[i].Driver == none)
		{
			return WeaponPawns[i];
		}
		i--;
		// [Loop Continue]
		goto J0xEC;
	}
	return super(ONSVehicle).FindEntryVehicle(P);
	//return;	
}

static function StaticPrecache(LevelInfo L)
{
	super(ONSVehicle).StaticPrecache(L);
	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellTire');
	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellDoor');
	L.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellGun');
	L.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris2');
	L.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris1');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.SparkHead');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp2_frames');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp1_frames');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.we1_frames');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.MuchSmoke1');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.NapalmSpot');
	L.AddPrecacheMaterial(Texture'EpicParticles.Fire.SprayFire1');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.NEWprvGroup.newPRVnoColor');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.NEWprvGroup.PRVcolorRED');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.NEWprvGroup.PRVcolorBlue');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.NEWprvGroup.EnergyEffectMASKtex');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.PowerSwirl');
	L.AddPrecacheMaterial(Texture'VMWeaponsTX.ManualBaseGun.baseGunEffectcopy');
	L.AddPrecacheMaterial(Texture'VehicleFX.Particles.DustyCloud2');
	L.AddPrecacheMaterial(Texture'VMparticleTextures.DirtKICKGROUP.dirtKICKTEX');
	L.AddPrecacheMaterial(Texture'Engine.GRADIENT_Fade');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.NEWprvGroup.PRVtagFallBack');
	L.AddPrecacheMaterial(Texture'VMVehicles-TX.NEWprvGroup.prvTAGSCRIPTED');
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellTire');
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellDoor');
	Level.AddPrecacheStaticMesh(StaticMesh'ONSDeadVehicles-SM.HELLbenderExploded.HellGun');
	Level.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris2');
	Level.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Debris.Veh_Debris1');
	super(ONSVehicle).UpdatePrecacheStaticMeshes();
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.SparkHead');
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp2_frames');
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp1_frames');
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.we1_frames');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.MuchSmoke1');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.NapalmSpot');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Fire.SprayFire1');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.NEWprvGroup.newPRVnoColor');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.NEWprvGroup.PRVcolorRED');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.NEWprvGroup.PRVcolorBlue');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.NEWprvGroup.EnergyEffectMASKtex');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.PowerSwirl');
	Level.AddPrecacheMaterial(Texture'VMWeaponsTX.ManualBaseGun.baseGunEffectcopy');
	Level.AddPrecacheMaterial(Texture'VehicleFX.Particles.DustyCloud2');
	Level.AddPrecacheMaterial(Texture'VMparticleTextures.DirtKICKGROUP.dirtKICKTEX');
	Level.AddPrecacheMaterial(Texture'Engine.GRADIENT_Fade');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.NEWprvGroup.PRVtagFallBack');
	Level.AddPrecacheMaterial(Texture'VMVehicles-TX.NEWprvGroup.prvTAGSCRIPTED');
	super(ONSVehicle).UpdatePrecacheMaterials();
	//return;	
}

defaultproperties
{
	LicensePlate=ScriptedTexture'VMVehicles-TX.NEWprvGroup.PRVtag'
	LicensePlateFallBack=Texture'VMVehicles-TX.NEWprvGroup.PRVtagFallBack'
	LicensePlateBackground=Texture'VMVehicles-TX.NEWprvGroup.prvTAGSCRIPTED'
	WheelSoftness=0.0400000
	WheelPenScale=1.5000000
	WheelPenOffset=0.0100000
	WheelRestitution=0.1000000
	WheelInertia=0.1000000
	WheelLongFrictionFunc=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=100.0000000,OutVal=1.0000000),(InVal=200.0000000,OutVal=0.9000000),(InVal=10000000000.0000000,OutVal=0.9000000)))
	WheelLongSlip=0.0010000
	WheelLatSlipFunc=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=30.0000000,OutVal=0.0090000),(InVal=45.0000000,OutVal=0.0000000),(InVal=10000000000.0000000,OutVal=0.0000000)))
	WheelLongFrictionScale=1.1000000
	WheelLatFrictionScale=1.5000000
	WheelHandbrakeSlip=0.0100000
	WheelHandbrakeFriction=0.1000000
	WheelSuspensionTravel=25.0000000
	WheelSuspensionOffset=-10.0000000
	WheelSuspensionMaxRenderTravel=25.0000000
	FTScale=0.0300000
	ChassisTorqueScale=0.7000000
	MinBrakeFriction=4.0000000
	MaxSteerAngleCurve=(Points=((InVal=0.0000000,OutVal=25.0000000),(InVal=1500.0000000,OutVal=8.0000000),(InVal=1000000000.0000000,OutVal=8.0000000)))
	TorqueCurve=(Points=((InVal=0.0000000,OutVal=9.0000000),(InVal=200.0000000,OutVal=10.0000000),(InVal=1500.0000000,OutVal=11.0000000),(InVal=2500.0000000,OutVal=0.0000000)))
	GearRatios[0]=-0.5000000
	GearRatios[1]=0.4000000
	GearRatios[2]=0.6500000
	GearRatios[3]=0.8500000
	GearRatios[4]=1.1000000
	TransRatio=0.1100000
	ChangeUpPoint=2000.0000000
	ChangeDownPoint=1000.0000000
	LSDFactor=1.0000000
	EngineBrakeFactor=0.0001000
	EngineBrakeRPMScale=0.1000000
	MaxBrakeTorque=20.0000000
	SteerSpeed=110.0000000
	TurnDamping=35.0000000
	StopThreshold=100.0000000
	HandbrakeThresh=200.0000000
	EngineInertia=0.1000000
	IdleRPM=500.0000000
	EngineRPMSoundRange=10000.0000000
	SteerBoneAxis=2
	SteerBoneMaxAngle=90.0000000
	RevMeterScale=4000.0000000
	bMakeBrakeLights=true
	BrakeLightOffset[0]=(X=-173.0000000,Y=73.0000000,Z=30.0000000)
	BrakeLightOffset[1]=(X=-173.0000000,Y=-73.0000000,Z=30.0000000)
	BrakeLightMaterial=Texture'EpicParticles.Flares.FlashFlare1'
	DaredevilThreshInAirSpin=90.0000000
	DaredevilThreshInAirTime=1.2000000
	bDoStuntInfo=true
	bAllowBigWheels=true
	AirTurnTorque=35.0000000
	AirPitchTorque=55.0000000
	AirPitchDamping=35.0000000
	AirRollTorque=35.0000000
	AirRollDamping=35.0000000
	PassengerWeapons[0]=(WeaponPawnClass=Class'Onslaught.ONSPRVSideGunPawn',WeaponBone="Dummy01")
	PassengerWeapons[1]=(WeaponPawnClass=Class'Onslaught.ONSPRVRearGunPawn',WeaponBone="Dummy02")
	RedSkin=Shader'VMVehicles-TX.NEWprvGroup.newPRVredSHAD'
	BlueSkin=Shader'VMVehicles-TX.NEWprvGroup.newPRVshad'
	IdleSound=Sound'ONSVehicleSounds-S.PRV.PRVEng01'
	StartUpSound=Sound'ONSVehicleSounds-S.PRV.PRVStart01'
	ShutDownSound=Sound'ONSVehicleSounds-S.PRV.PRVStop01'
	StartUpForce="PRVStartUp"
	ShutDownForce="PRVShutDown"
	DestroyedVehicleMesh=StaticMesh'ONSDeadVehicles-SM.newPRVdead'
	DestructionEffectClass=Class'Onslaught.ONSVehicleExplosionEffect'
	DisintegrationEffectClass=Class'Onslaught.ONSVehDeathPRV'
	DisintegrationHealth=-100.0000000
	DestructionLinearMomentum=(Min=250000.0000000,Max=400000.0000000)
	DestructionAngularMomentum=(Min=100.0000000,Max=150.0000000)
	DamagedEffectScale=1.2000000
	DamagedEffectOffset=(X=100.0000000,Y=-10.0000000,Z=35.0000000)
	ImpactDamageMult=0.0010000
	HeadlightCoronaOffset[0]=()
	HeadlightCoronaOffset[1]=()
	HeadlightCoronaMaterial=Texture'EpicParticles.Flares.FlashFlare1'
	HeadlightCoronaMaxSize=100.0000000
	HeadlightProjectorMaterial=Texture'VMVehicles-TX.NEWprvGroup.PRVprojector'
	HeadlightProjectorOffset=(X=145.0000000,Y=0.0000000,Z=11.0000000)
	HeadlightProjectorRotation=(Pitch=-1000,Yaw=0,Roll=0)
	HeadlightProjectorScale=0.6500000
	// Reference: SVehicleWheel'Onslaught.ONSPRV.RRWheel'
	begin object name="RRWheel" class=Engine.SVehicleWheel
		bPoweredWheel=true
		bHandbrakeWheel=true
		BoneName="RightRearTIRe"
		BoneOffset=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
		WheelRadius=34.0000000
		SupportBoneName="RightRearSTRUT"
	end object
	Wheels[0]=RRWheel
	// Reference: SVehicleWheel'Onslaught.ONSPRV.LRWheel'
	begin object name="LRWheel" class=Engine.SVehicleWheel
		bPoweredWheel=true
		bHandbrakeWheel=true
		BoneName="LeftRearTIRE"
		BoneOffset=(X=15.0000000,Y=0.0000000,Z=0.0000000)
		WheelRadius=34.0000000
		SupportBoneName="LeftRearSTRUT"
	end object
	Wheels[1]=LRWheel
	// Reference: SVehicleWheel'Onslaught.ONSPRV.RFWheel'
	begin object name="RFWheel" class=Engine.SVehicleWheel
		bPoweredWheel=true
		SteerType=1
		BoneName="RightFrontTIRE"
		BoneOffset=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
		WheelRadius=34.0000000
		SupportBoneName="RightFrontSTRUT"
	end object
	Wheels[2]=RFWheel
	// Reference: SVehicleWheel'Onslaught.ONSPRV.LFWheel'
	begin object name="LFWheel" class=Engine.SVehicleWheel
		bPoweredWheel=true
		SteerType=1
		BoneName="LeftFrontTIRE"
		BoneOffset=(X=15.0000000,Y=0.0000000,Z=0.0000000)
		WheelRadius=34.0000000
		SupportBoneName="LeftFrontSTRUT"
	end object
	Wheels[3]=LFWheel
	VehicleMass=4.0000000
	bDrawDriverInTP=true
	bCanDoTrickJumps=true
	bDrawMeshInFP=true
	bHasHandbrake=true
	bDriverHoldsFlag=false
	DrivePos=(X=16.9210000,Y=-40.2840000,Z=65.7940000)
	ExitPositions[0]=()
	ExitPositions[1]=()
	ExitPositions[2]=()
	ExitPositions[3]=()
	EntryPosition=(X=20.0000000,Y=-60.0000000,Z=10.0000000)
	EntryRadius=190.0000000
	FPCamPos=(X=20.0000000,Y=-40.0000000,Z=50.0000000)
	TPCamDistance=375.0000000
	TPCamLookat=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	TPCamWorldOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	MomentumMult=2.0000000
	DriverDamageMult=0.4000000
	VehiclePositionString="in a HellBender"
	VehicleNameString="HellBender"
	RanOverDamageType=Class'Onslaught.DamTypePRVRoadkill'
	CrushedDamageType=Class'Onslaught.DamTypePRVPancake'
	ObjectiveGetOutDist=1500.0000000
	FlagBone="Dummy01"
	FlagRotation=(Pitch=0,Yaw=32768,Roll=0)
	HornSounds[0]=Sound'ONSVehicleSounds-S.Horns.Horn09'
	HornSounds[1]=Sound'ONSVehicleSounds-S.Horns.Horn04'
	VehicleIcon=(Material=Texture'AS_FX_TX.Icons.OBJ_HellBender',X=0.0000000,Y=0.0000000,SizeX=64.0000000,SizeY=64.0000000,bIsGreyScale=true)
	GroundSpeed=840.0000000
	HealthMax=600.0000000
	Health=600
	Mesh=SkeletalMesh'ONSVehicles-A.PRVchassis'
	DrawScale=0.8000000
	SoundVolume=180
	CollisionRadius=175.0000000
	// Reference: KarmaParamsRBFull'Onslaught.ONSPRV.KParams0'
	begin object name="KParams0" class=Engine.KarmaParamsRBFull
		KInertiaTensor[0]=1.0000000
		KInertiaTensor[3]=3.0000000
		KInertiaTensor[5]=3.5000000
		KCOMOffset=(X=-0.3000000,Y=0.0000000,Z=-0.5000000)
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
		KImpactThreshold=500.0000000
	end object
	KParams=KParams0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: KarmaParamsRBFull'Onslaught.ONSPRV.KParams0'
begin object name="KParams0" class=Engine.KarmaParamsRBFull
	KInertiaTensor[0]=1.0000000
	KInertiaTensor[3]=3.0000000
	KInertiaTensor[5]=3.5000000
	KCOMOffset=(X=-0.3000000,Y=0.0000000,Z=-0.5000000)
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
	KImpactThreshold=500.0000000
end object
// Reference: SVehicleWheel'Onslaught.ONSPRV.RRWheel'
begin object name="RRWheel" class=Engine.SVehicleWheel
	bPoweredWheel=true
	bHandbrakeWheel=true
	BoneName="RightRearTIRe"
	BoneOffset=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	WheelRadius=34.0000000
	SupportBoneName="RightRearSTRUT"
end object
// Reference: SVehicleWheel'Onslaught.ONSPRV.LRWheel'
begin object name="LRWheel" class=Engine.SVehicleWheel
	bPoweredWheel=true
	bHandbrakeWheel=true
	BoneName="LeftRearTIRE"
	BoneOffset=(X=15.0000000,Y=0.0000000,Z=0.0000000)
	WheelRadius=34.0000000
	SupportBoneName="LeftRearSTRUT"
end object
// Reference: SVehicleWheel'Onslaught.ONSPRV.RFWheel'
begin object name="RFWheel" class=Engine.SVehicleWheel
	bPoweredWheel=true
	SteerType=1
	BoneName="RightFrontTIRE"
	BoneOffset=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	WheelRadius=34.0000000
	SupportBoneName="RightFrontSTRUT"
end object
// Reference: SVehicleWheel'Onslaught.ONSPRV.LFWheel'
begin object name="LFWheel" class=Engine.SVehicleWheel
	bPoweredWheel=true
	SteerType=1
	BoneName="LeftFrontTIRE"
	BoneOffset=(X=15.0000000,Y=0.0000000,Z=0.0000000)
	WheelRadius=34.0000000
	SupportBoneName="LeftFrontSTRUT"
end object
