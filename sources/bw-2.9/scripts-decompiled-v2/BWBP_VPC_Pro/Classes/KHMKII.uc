class KHMKII extends ONSChopperCraft
	config(BWBP_VPC_Pro);

var(Chopper) float MaxPitchSpeed;
var(Chopper) float MaxSoundPitch;
var(Chopper) float MinSoundPitch;
var(Chopper) float MinBladeRotationRate;
var(Chopper) float BladeRotationScale;
var TexRotator Blades;
var Shader BladeShader;
var Emitter Steam[2];
var Emitter Lights[5];
var(Effects) Class<Emitter> GreenLightClass;
var(Effects) Class<Emitter> RedLightClass;
var(Effects) Class<Emitter> BlueLightClass;
var(Effects) Class<Emitter> WhiteLightClass;
var(Effects) Class<Emitter> SteamClass;
var(Effects) array<Vector> ChopperDustOffset;
var(Effects) float ChopperDustTraceDistance;
var array<KHMKIIDust> ChopperDust;
var array<Vector> ChopperDustLastNormal;
var bool bOverWater;
var(Effects) name SteamBones[2];
var(Effects) name GreenLightBones[2];
var(Effects) name TeamLightBones[2];
var(Effects) name WhiteLightBone;
var(HUD) Material RocketCounterTex;
var(HUD) Material VehicleIconTex;
var(HUD) float CounterXDimension;
var(HUD) float CounterYDimension;
var(HUD) float IconXDimension;
var(HUD) float IconYDimension;
var(HUD) config bool bUseAmmoDisplay;
var(HUD) float AmmoDisplaySizeX;
var(HUD) float AmmoDisplaySizeY;
var(HUD) float IconDisplaySizeX;
var(HUD) float IconDisplaySizeY;
var bool bAmmoCounterActive;
var bool bPackRequiresReloading;
var int AmmoCount;
var float PackDFOffset;

replication
{
	// Pos:0x000
	reliable if((int(Role) < int(ROLE_Authority)) || int(Role) == int(ROLE_Authority))
		AmmoCount, PackDFOffset, 
		bAmmoCounterActive;
}

static simulated function Font GetBEFontSize(Canvas Canvas, int FontSize)
{
	// End:0x21
	if(Canvas.ClipX >= float(512))
	{
		FontSize++;
	}
	// End:0x42
	if(Canvas.ClipX >= float(640))
	{
		FontSize++;
	}
	// End:0x63
	if(Canvas.ClipX >= float(800))
	{
		FontSize++;
	}
	// End:0x84
	if(Canvas.ClipX >= float(1024))
	{
		FontSize++;
	}
	// End:0xA5
	if(Canvas.ClipX >= float(1280))
	{
		FontSize++;
	}
	// End:0xC6
	if(Canvas.ClipX >= float(1600))
	{
		FontSize++;
	}
	return Class'XInterface.HudBase'.static.LoadFontStatic(Clamp(8 - FontSize, 0, 8));
	//return;	
}

simulated function SpawnEffects()
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	Steam[0] = Spawn(SteamClass);
	Steam[1] = Spawn(SteamClass);
	Lights[0] = Spawn(GreenLightClass);
	Lights[1] = Spawn(GreenLightClass);
	Lights[4] = Spawn(WhiteLightClass);
	AttachToBone(Steam[0], SteamBones[0]);
	AttachToBone(Steam[1], SteamBones[1]);
	AttachToBone(Lights[0], GreenLightBones[0]);
	AttachToBone(Lights[1], GreenLightBones[1]);
	AttachToBone(Lights[4], WhiteLightBone);
	//return;	
}

simulated event TeamChanged()
{
	super(ONSVehicle).TeamChanged();
	// End:0x72
	if(int(Team) == 0)
	{
		// End:0x30
		if(Lights[2] != none)
		{
			Lights[2].Destroy();
		}
		// End:0x4D
		if(Lights[3] != none)
		{
			Lights[3].Destroy();
		}
		Lights[2] = Spawn(RedLightClass);
		Lights[3] = Spawn(RedLightClass);		
	}
	else
	{
		// End:0xDB
		if(int(Team) == 1)
		{
			// End:0x9C
			if(Lights[2] != none)
			{
				Lights[2].Destroy();
			}
			// End:0xB9
			if(Lights[3] != none)
			{
				Lights[3].Destroy();
			}
			Lights[2] = Spawn(BlueLightClass);
			Lights[3] = Spawn(BlueLightClass);
		}
	}
	AttachToBone(Lights[2], TeamLightBones[0]);
	AttachToBone(Lights[3], TeamLightBones[1]);
	//return;	
}

simulated function PreBeginPlay()
{
	local int i;

	super(Vehicle).PreBeginPlay();
	AmbientSound = IdleSound;
	SpawnEffects();
	// End:0x36
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SetupBlades();
	}
	// End:0x13E
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && ChopperDust.Length == 0) && !bDropDetail)
	{
		ChopperDust.Length = ChopperDustOffset.Length;
		ChopperDustLastNormal.Length = ChopperDustOffset.Length;
		i = 0;
		J0x8B:

		// End:0x13E [Loop If]
		if(i < ChopperDustOffset.Length)
		{
			// End:0x134
			if(ChopperDust[i] == none)
			{
				ChopperDust[i] = Spawn(Class'BWBP_VPC_Pro.KHMKIIDust', self,, Location + (ChopperDustOffset[i] >> Rotation));
				ChopperDust[i].SetDustColor(Level.DustColor, false);
				ChopperDust[i].UpdateBladeDust(true, 1.0000000);
				ChopperDustLastNormal[i] = vect(0.0000000, 0.0000000, 1.0000000);
			}
			i++;
			// [Loop Continue]
			goto J0x8B;
		}
	}
	//return;	
}

simulated function Destroyed()
{
	local int i;

	// End:0x2F
	if(Blades != none)
	{
		Level.ObjectPool.FreeObject(Blades);
		Blades = none;
	}
	// End:0x5E
	if(BladeShader != none)
	{
		Level.ObjectPool.FreeObject(BladeShader);
		BladeShader = none;
	}
	// End:0xB2
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		i = 0;
		J0x7E:

		// End:0xAA [Loop If]
		if(i < ChopperDust.Length)
		{
			ChopperDust[i].Destroy();
			i++;
			// [Loop Continue]
			goto J0x7E;
		}
		ChopperDust.Length = 0;
	}
	// End:0xCD
	if(Steam[0] != none)
	{
		Steam[0].Destroy();
	}
	// End:0xE8
	if(Steam[1] != none)
	{
		Steam[1].Destroy();
	}
	i = 0;
	J0xEF:

	// End:0x128 [Loop If]
	if(i < 5)
	{
		// End:0x11E
		if(Lights[i] != none)
		{
			Lights[i].Destroy();
		}
		i++;
		// [Loop Continue]
		goto J0xEF;
	}
	super(ONSVehicle).Destroyed();
	AmbientSound = none;
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
		if(i < ChopperDust.Length)
		{
			ChopperDust[i].Destroy();
			i++;
			// [Loop Continue]
			goto J0x20;
		}
		ChopperDust.Length = 0;
	}
	super(ONSVehicle).DestroyAppearance();
	AmbientSound = none;
	//return;	
}

simulated function SetupBlades()
{
	Blades = TexRotator(Level.ObjectPool.AllocateObject(Class'Engine.TexRotator'));
	// End:0xA4
	if(Blades != none)
	{
		Blades.Material = Skins[1];
		Blades.Rotation.Yaw = 0;
		Blades.TexRotationType = 1;
		Blades.UOffset = 256.0000000;
		Blades.VOffset = 256.0000000;
		Skins[1] = Blades;
	}
	BladeShader = Shader(Level.ObjectPool.AllocateObject(Class'Engine.Shader'));
	// End:0x146
	if(BladeShader != none)
	{
		BladeShader.Diffuse = Skins[1];
		BladeShader.Opacity = Skins[1];
		BladeShader.TwoSided = true;
		BladeShader.DetailScale = 4.0000000;
		BladeShader.OutputBlending = 0;
		Skins[1] = BladeShader;
	}
	//return;	
}

simulated function Tick(float DeltaTime)
{
	local KHMKIIRocketPack Pack;
	local float EnginePitch, hitDist, CurrentVehicleSpeed;
	local int i;
	local Vector TraceStart, TraceEnd, HitLocation, HitNormal;
	local Actor HitActor;
	local KarmaParams KP;

	super(SVehicle).Tick(DeltaTime);
	Pack = KHMKIIRocketPack(Weapons[0]);
	AmmoCount = KHMKIIRocketPack(Weapons[0]).LoadedShotCount;
	bPackRequiresReloading = KHMKIIRocketPack(Weapons[0]).bRequiresReloading;
	PackDFOffset = KHMKIIRocketPack(Weapons[0]).NewDualFireOffset;
	// End:0x362
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		CurrentVehicleSpeed = VSize(Velocity) * DeltaTime;
		Pack.SetSpread(CurrentVehicleSpeed);
		EnginePitch = MinSoundPitch + ((VSize(Velocity) / MaxPitchSpeed) * 64.0000000);
		SoundPitch = byte(FClamp(EnginePitch, MinSoundPitch, MaxSoundPitch));
		// End:0x32C
		if(!bDropDetail)
		{
			bOverWater = false;
			KP = KarmaParams(KParams);
			i = 0;
			J0x116:

			// End:0x165 [Loop If]
			if(i < KP.Repulsors.Length)
			{
				// End:0x15B
				if(KP.Repulsors[i].bRepulsorOnWater)
				{
					bOverWater = true;
					// [Explicit Break]
					goto J0x165;
				}
				i++;
				// [Loop Continue]
				goto J0x116;
			}
			J0x165:

			i = 0;
			J0x16C:

			// End:0x32C [Loop If]
			if(i < ChopperDust.Length)
			{
				TraceStart = Location + (ChopperDustOffset[i] >> Rotation);
				TraceEnd = TraceStart - (ChopperDustTraceDistance * vect(0.0000000, 0.0000000, 1.0000000));
				HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, true);
				// End:0x204
				if(HitActor == none)
				{
					ChopperDust[i].UpdateBladeDust(false, 0.0000000);
					// [Explicit Continue]
					goto J0x322;
				}
				// End:0x25F
				if(bOverWater || (PhysicsVolume(HitActor) != none) && PhysicsVolume(HitActor).bWaterVolume)
				{
					ChopperDust[i].SetDustColor(Level.WaterDustColor, true);					
				}
				else
				{
					ChopperDust[i].SetDustColor(Level.DustColor, false);
				}
				hitDist = VSize(HitLocation - TraceStart);
				ChopperDust[i].SetLocation(HitLocation + (float(10) * HitNormal));
				ChopperDustLastNormal[i] = Normal((float(3) * ChopperDustLastNormal[i]) + HitNormal);
				ChopperDust[i].SetRotation(Rotator(ChopperDustLastNormal[i]));
				ChopperDust[i].UpdateBladeDust(true, hitDist / ChopperDustTraceDistance);
				J0x322:

				i++;
				// [Loop Continue]
				goto J0x16C;
			}
		}
		// End:0x362
		if(Blades != none)
		{
			Blades.Rotation.Yaw = int(MinBladeRotationRate + (VSize(Velocity) * BladeRotationScale));
		}
	}
	//return;	
}

simulated function DrawHUD(Canvas Canvas)
{
	local float ScaleFactor;

	ScaleFactor = Canvas.ClipX / float(1600);
	// End:0x7AB
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x7AB
		if((bUseAmmoDisplay && bPackRequiresReloading) && bAmmoCounterActive)
		{
			Canvas.Font = GetBEFontSize(Canvas, -2 + int(float(2) * Class'Engine.HUD'.default.HudScale));
			Canvas.Style = 1;
			Canvas.SetDrawColor(byte(255), byte(255), byte(255), 192);
			Canvas.SetPos(Canvas.OrgX + (float(400) * ScaleFactor), Canvas.OrgY + (float(1000) * ScaleFactor));
			Canvas.DrawTile(RocketCounterTex, AmmoDisplaySizeX, AmmoDisplaySizeY, 0.0000000, 0.0000000, -1.0000000 * CounterXDimension, CounterYDimension);
			Canvas.Style = 1;
			Canvas.SetDrawColor(byte(255), byte(255), byte(255), 192);
			Canvas.SetPos(Canvas.OrgX + (float(1072) * ScaleFactor), Canvas.OrgY + (float(1000) * ScaleFactor));
			Canvas.DrawTile(RocketCounterTex, AmmoDisplaySizeX, AmmoDisplaySizeY, 0.0000000, 0.0000000, CounterXDimension, CounterYDimension);
			Canvas.Style = 1;
			Canvas.SetDrawColor(byte(255), byte(255), byte(255), 192);
			Canvas.SetPos(Canvas.OrgX + (float(597) * ScaleFactor), Canvas.OrgY + (float(892) * ScaleFactor));
			Canvas.DrawTile(VehicleIconTex, IconDisplaySizeX, IconDisplaySizeY, 0.0000000, 0.0000000, IconXDimension, IconYDimension);
			Canvas.Style = 1;
			Canvas.SetDrawColor(0, 192, 0, 192);
			Canvas.SetPos(Canvas.OrgX + (float(380) * ScaleFactor), Canvas.OrgY + (float(1065) * ScaleFactor));
			Canvas.DrawText("L", false);
			Canvas.Style = 1;
			Canvas.SetDrawColor(0, 192, 0, 192);
			Canvas.SetPos(Canvas.OrgX + (float(1240) * ScaleFactor), Canvas.OrgY + (float(1065) * ScaleFactor));
			Canvas.DrawText("R", false);
			// End:0x4F9
			if(((((AmmoCount == 8) || AmmoCount == 6) || AmmoCount == 4) || AmmoCount == 2) || AmmoCount == 0)
			{
				Canvas.Style = 1;
				Canvas.SetDrawColor(byte(255), 0, 0, 192);
				Canvas.SetPos(Canvas.OrgX + (float(464) * ScaleFactor), Canvas.OrgY + (float(1065) * ScaleFactor));
				Canvas.DrawText(string(AmmoCount / 2) $ "", false);
				Canvas.Style = 1;
				Canvas.SetDrawColor(byte(255), 0, 0, 192);
				Canvas.SetPos(Canvas.OrgX + (float(1136) * ScaleFactor), Canvas.OrgY + (float(1065) * ScaleFactor));
				Canvas.DrawText(string(AmmoCount / 2) $ "", false);				
			}
			else
			{
				// End:0x7AB
				if(((((AmmoCount == 9) || AmmoCount == 7) || AmmoCount == 5) || AmmoCount == 3) || AmmoCount == 1)
				{
					// End:0x675
					if(PackDFOffset < float(0))
					{
						Canvas.Style = 1;
						Canvas.SetDrawColor(byte(255), 0, 0, byte(255));
						Canvas.SetPos(Canvas.OrgX + (float(464) * ScaleFactor), Canvas.OrgY + (float(1065) * ScaleFactor));
						Canvas.DrawText(string((AmmoCount / 2) + 1) $ "", false);
						Canvas.Style = 1;
						Canvas.SetDrawColor(byte(255), 0, 0, byte(255));
						Canvas.SetPos(Canvas.OrgX + (float(1136) * ScaleFactor), Canvas.OrgY + (float(1065) * ScaleFactor));
						Canvas.DrawText(string(AmmoCount / 2) $ "", false);						
					}
					else
					{
						// End:0x7AB
						if(PackDFOffset > float(0))
						{
							Canvas.Style = 1;
							Canvas.SetDrawColor(byte(255), 0, 0, byte(255));
							Canvas.SetPos(Canvas.OrgX + (float(464) * ScaleFactor), Canvas.OrgY + (float(1065) * ScaleFactor));
							Canvas.DrawText(string(AmmoCount / 2) $ "", false);
							Canvas.Style = 1;
							Canvas.SetDrawColor(byte(255), 0, 0, byte(255));
							Canvas.SetPos(Canvas.OrgX + (float(1136) * ScaleFactor), Canvas.OrgY + (float(1065) * ScaleFactor));
							Canvas.DrawText(string((AmmoCount / 2) + 1) $ "", false);
						}
					}
				}
			}
		}
	}
	super(ONSVehicle).DrawHUD(Canvas);
	//return;	
}

simulated event SetInitialState()
{
	super(Vehicle).SetInitialState();
	Enable('Tick');
	//return;	
}

simulated event DrivingStatusChanged()
{
	// End:0x4E
	if(!bDriving)
	{
		Enable('Tick');
		// End:0x38
		if(Blades != none)
		{
			Blades.Rotation.Yaw = int(MinBladeRotationRate);
		}
		bAmmoCounterActive = false;
		AmbientSound = IdleSound;		
	}
	else
	{
		bAmmoCounterActive = true;
	}
	//return;	
}

defaultproperties
{
	MaxPitchSpeed=7000.0000000
	MaxSoundPitch=74.0000000
	MinSoundPitch=48.0000000
	MinBladeRotationRate=50000.0000000
	BladeRotationScale=45.0000000
	GreenLightClass=Class'BWBP_VPC_Pro.KHMKIILightGreen'
	RedLightClass=Class'BWBP_VPC_Pro.KHMKIILightRed'
	BlueLightClass=Class'BWBP_VPC_Pro.KHMKIILightBlue'
	WhiteLightClass=Class'BWBP_VPC_Pro.KHMKIILightWhite'
	SteamClass=Class'BWBP_VPC_Pro.KHMKIIEngineSteam'
	ChopperDustOffset[0]=()
	ChopperDustTraceDistance=1750.0000000
	SteamBones[0]="Vent1"
	SteamBones[1]="Vent2"
	GreenLightBones[0]="Light1"
	GreenLightBones[1]="Light2"
	TeamLightBones[0]="Light3"
	TeamLightBones[1]="Light4"
	WhiteLightBone="Light5"
	RocketCounterTex=Texture'BWBP_Vehicles_Tex.ui.KHMKIIAmmoIcon'
	VehicleIconTex=Texture'BWBP_Vehicles_Tex.ui.KHMKIIHUDIcon'
	CounterXDimension=128.0000000
	CounterYDimension=128.0000000
	IconXDimension=256.0000000
	IconYDimension=256.0000000
	bUseAmmoDisplay=true
	AmmoDisplaySizeX=64.0000000
	AmmoDisplaySizeY=64.0000000
	IconDisplaySizeX=160.0000000
	IconDisplaySizeY=160.0000000
	UprightStiffness=500.0000000
	UprightDamping=300.0000000
	MaxThrustForce=50.0000000
	LongDamping=0.0500000
	MaxStrafeForce=40.0000000
	LatDamping=0.0500000
	MaxRiseForce=40.0000000
	UpDamping=0.1000000
	TurnTorqueFactor=600.0000000
	TurnTorqueMax=200.0000000
	TurnDamping=50.0000000
	MaxYawRate=1.0000000
	PitchTorqueFactor=100.0000000
	PitchTorqueMax=30.0000000
	PitchDamping=20.0000000
	RollTorqueTurnFactor=30.0000000
	RollTorqueStrafeFactor=100.0000000
	RollTorqueMax=30.0000000
	RollDamping=30.0000000
	StopThreshold=100.0000000
	MaxRandForce=3.0000000
	RandForceInterval=0.7500000
	DriverWeapons[0]=(WeaponClass=Class'BWBP_VPC_Pro.KHMKIIRocketPack',WeaponBone="RocketBone")
	PassengerWeapons[0]=(WeaponPawnClass=Class'BWBP_VPC_Pro.KHMKIINoseGunPawn',WeaponBone="NoseBone")
	RedSkin=Texture'BWBP_Vehicles_Tex.Cobra.KHMKIIChasisRed'
	BlueSkin=Texture'BWBP_Vehicles_Tex.Cobra.KHMKIIChasisBlue'
	IdleSound=Sound'BWBP_Vehicles_Sound.Cobra.ChopperAmbient'
	StartUpForce="AttackCraftStartUp"
	ShutDownForce="AttackCraftShutDown"
	DestroyedVehicleMesh=StaticMesh'BWBP_Vehicles_Static.Cobra.KHMKIIDead'
	DestructionEffectClass=Class'BWBP_VPC_Pro.KHMKIIExplosionEffect'
	DisintegrationEffectClass=Class'Onslaught.ONSVehDeathAttackCraft'
	DisintegrationHealth=-4096.0000000
	DestructionLinearMomentum=(Min=50000.0000000,Max=150000.0000000)
	DestructionAngularMomentum=(Min=100.0000000,Max=300.0000000)
	DamagedEffectOffset=(X=-64.0000000,Y=0.0000000,Z=350.0000000)
	ImpactDamageMult=0.0010000
	VehicleMass=4.0000000
	bVehicleShadows=false
	bTurnInPlace=true
	bShowDamageOverlay=true
	bDriverHoldsFlag=false
	bCanCarryFlag=false
	ExitPositions[0]=()
	ExitPositions[1]=()
	EntryRadius=400.0000000
	FPCamPos=(X=176.0000000,Y=0.0000000,Z=288.0000000)
	TPCamDistance=1250.0000000
	TPCamLookat=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	TPCamWorldOffset=(X=0.0000000,Y=0.0000000,Z=512.0000000)
	TPCamDistRange=(Min=1250.0000000,Max=2500.0000000)
	MomentumMult=0.2000000
	DriverDamageMult=0.0000000
	VehiclePositionString="Flying a KH MarkII"
	VehicleNameString="KH MarkII Cobra"
	RanOverDamageType=Class'BWBP_VPC_Pro.KHMKIIDamTypeRoadKill'
	CrushedDamageType=Class'BWBP_VPC_Pro.KHMKIIDamTypePancake'
	MaxDesireability=0.7000000
	FlagBone="NoseBone"
	FlagOffset=(X=0.0000000,Y=0.0000000,Z=140.0000000)
	WaterDamage=50.0000000
	GroundSpeed=2000.0000000
	WaterSpeed=1500.0000000
	HealthMax=750.0000000
	Health=750
	Mesh=SkeletalMesh'BWBP_Vehicles_Anim.KHMKII'
	Skins[0]=none
	Skins[1]=Texture'BWBP_Vehicles_Tex.Cobra.KHMKIIBlades'
	ScaleGlow=0.7500000
	bFullVolume=true
	SoundRadius=850.0000000
	// Reference: KarmaParamsRBFull'BWBP_VPC_Pro.KHMKII.KParams0'
	begin object name="KParams0" class=Engine.KarmaParamsRBFull
		KInertiaTensor[0]=1.0000000
		KInertiaTensor[3]=3.0000000
		KInertiaTensor[5]=3.0000000
		KLinearDamping=0.0000000
		KAngularDamping=0.0000000
		KStartEnabled=true
		bKNonSphericalInertia=true
		KActorGravScale=0.0000000
		KMaxSpeed=3500.0000000
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
	bTraceWater=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: KarmaParamsRBFull'BWBP_VPC_Pro.KHMKII.KParams0'
begin object name="KParams0" class=Engine.KarmaParamsRBFull
	KInertiaTensor[0]=1.0000000
	KInertiaTensor[3]=3.0000000
	KInertiaTensor[5]=3.0000000
	KLinearDamping=0.0000000
	KAngularDamping=0.0000000
	KStartEnabled=true
	bKNonSphericalInertia=true
	KActorGravScale=0.0000000
	KMaxSpeed=3500.0000000
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
