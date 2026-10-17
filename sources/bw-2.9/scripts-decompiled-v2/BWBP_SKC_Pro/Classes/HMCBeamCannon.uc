class HMCBeamCannon extends BallisticWeapon
	config(BallisticProV55);

var() bool bGravitron;
var() bool bRedTeam;
var() bool bTeamSet;
var() bool bIsCharging;
var() Actor glow1;
var() Actor Glow2;
var() Sound FullyChargedSound;
var() Sound OverheatSound;
var() float Heat;
var() float CoolRate;
var() bool bLaserOn;
var() bool bBigLaser;
var() bool bGreenLaser;
var() bool bOldGreenLaser;
var() LaserActor Laser;
var() Emitter LaserDot;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientOverCharge, ClientSetHeat, 
		ClientSwitchHMCMode, bGreenLaser, 
		bLaserOn;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bGravitron = false;
	// End:0x41
	if(InStr(WeaponParams.LayoutTags, "grav") != -1)
	{
		bGravitron = true;
	}
	//return;	
}

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	HMCSecondaryFire(FireMode[1]).SwitchWeaponMode(CurrentWeaponMode);
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x25
	if(FireMode[0].bIsFiring || Heat > float(0))
	{
		return;
	}
	super.ServerSwitchWeaponMode(newmode);
	// End:0x5F
	if(!Instigator.IsLocallyControlled())
	{
		HMCSecondaryFire(FireMode[1]).SwitchWeaponMode(CurrentWeaponMode);
	}
	// End:0xE8
	if(ThirdPersonActor != none)
	{
		// End:0x83
		if(int(CurrentWeaponMode) == 2)
		{
			bGreenLaser = true;			
		}
		else
		{
			bGreenLaser = false;
		}
		// End:0xAD
		if(bGreenLaser)
		{
			Laser.Skins[0] = TexPanner'BWBP_SKC_Tex.BeamCannon.LaserPannerGreen';			
		}
		else
		{
			Laser.Skins[0] = Laser.default.Skins[0];
		}
		HMCAttachment(ThirdPersonActor).SwitchMedicLaser(bGreenLaser);
	}
	ClientSwitchHMCMode(CurrentWeaponMode);
	//return;	
}

simulated function ClientSwitchHMCMode(byte newmode)
{
	HMCSecondaryFire(FireMode[1]).SwitchWeaponMode(newmode);
	//return;	
}

simulated function PlayIdle()
{
	// End:0x12
	if(bPendingSightUp)
	{
		ScopeBackUp();		
	}
	else
	{
		// End:0x43
		if(int(SightingState) != int(0))
		{
			// End:0x40
			if(SafePlayAnim(IdleAnim, 1.0000000))
			{
				FreezeAnimAt(0.0000000);
			}			
		}
		else
		{
			// End:0x6D
			if(bScopeView)
			{
				// End:0x6A
				if(SafePlayAnim(ZoomOutAnim, 1.0000000))
				{
					FreezeAnimAt(0.0000000);
				}				
			}
			else
			{
				SafeLoopAnim(IdleAnim, IdleAnimRate, IdleTweenTime,, "IDLE");
			}
		}
	}
	//return;	
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	local int M;
	local Weapon W;
	local bool bPossiblySwitch, bJustSpawned;

	Instigator = Other;
	W = Weapon(Other.FindInventoryType(Class));
	// End:0x156
	if(W == none)
	{
		bJustSpawned = true;
		super(Inventory).GiveTo(Other);
		bPossiblySwitch = true;
		W = self;
		// End:0xEA
		if((Pickup != none) && BallisticWeaponPickup(Pickup) != none)
		{
			GenerateLayout(BallisticWeaponPickup(Pickup).LayoutIndex);
			GenerateCamo(BallisticWeaponPickup(Pickup).CamoIndex);
			// End:0xCE
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = BallisticWeaponPickup(Pickup).MagAmmo;			
		}
		else
		{
			GenerateLayout(byte(255));
			GenerateCamo(byte(255));
			// End:0x126
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = MagAmmo + ((int(!bNonCocking) * int(bMagPlusOne)) * int(!bNeedCock));
		}		
	}
	else
	{
		// End:0x172
		if(!W.HasAmmo())
		{
			bPossiblySwitch = true;
		}
	}
	// End:0x185
	if(Pickup == none)
	{
		bPossiblySwitch = true;
	}
	M = 0;
	J0x18C:

	// End:0x1E8 [Loop If]
	if(M < 2)
	{
		// End:0x1DE
		if(FireMode[M] != none)
		{
			FireMode[M].Instigator = Instigator;
			GiveAmmo(M, WeaponPickup(Pickup), bJustSpawned);
		}
		M++;
		// [Loop Continue]
		goto J0x18C;
	}
	// End:0x221
	if((Instigator.Weapon != none) && Instigator.Weapon.IsFiring())
	{
		bPossiblySwitch = false;
	}
	// End:0x24E
	if(Instigator.Weapon != W)
	{
		W.ClientWeaponSet(bPossiblySwitch);
	}
	// End:0x286
	if(!bJustSpawned)
	{
		M = 0;
		J0x260:

		// End:0x283 [Loop If]
		if(M < 2)
		{
			Ammo[M] = none;
			M++;
			// [Loop Continue]
			goto J0x260;
		}
		Destroy();
	}
	//return;	
}

simulated function ClientOverCharge()
{
	// End:0x1B
	if(FireMode[1].bIsFiring)
	{
		StopFire(1);
	}
	//return;	
}

simulated function ClientSetHeat(float NewHeat)
{
	Heat = NewHeat;
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x24
	if(bLaserOn != default.bLaserOn)
	{
		default.bLaserOn = bLaserOn;
		ClientSwitchLaser();
	}
	// End:0x85
	if(bGreenLaser != bOldGreenLaser)
	{
		// End:0x57
		if(bGreenLaser)
		{
			Laser.Skins[0] = TexPanner'BWBP_SKC_Tex.BeamCannon.LaserPannerGreen';			
		}
		else
		{
			Laser.Skins[0] = Laser.default.Skins[0];
		}
		bOldGreenLaser = bGreenLaser;
	}
	super(Weapon).PostNetReceive();
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	// End:0x13
	if(bLaserOn == bNewLaserOn)
	{
		return;
	}
	bLaserOn = bNewLaserOn;
	// End:0x46
	if(ThirdPersonActor != none)
	{
		HMCAttachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	// End:0x5E
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchLaser();
	}
	//return;	
}

simulated function ClientSwitchLaser()
{
	// End:0x11
	if(!bLaserOn)
	{
		KillLaserDot();
	}
	PlayIdle();
	//return;	
}

simulated function KillLaserDot()
{
	// End:0x32
	if(LaserDot != none)
	{
		LaserDot.bHidden = false;
		LaserDot.Kill();
		LaserDot = none;
	}
	//return;	
}

simulated function SpawnLaserDot(Vector loc)
{
	// End:0x4E
	if(LaserDot == none)
	{
		// End:0x39
		if((Instigator != none) && bRedTeam)
		{
			LaserDot = Spawn(Class'BallisticProV55.IE_GRS9LaserHit',,, loc);			
		}
		else
		{
			LaserDot = Spawn(Class'BWBP_SKC_Pro.IE_HMCLase',,, loc);
		}
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x60
	if(super.PutDown())
	{
		KillLaserDot();
		// End:0x26
		if(glow1 != none)
		{
			glow1.Destroy();
		}
		// End:0x3D
		if(Glow2 != none)
		{
			Glow2.Destroy();
		}
		// End:0x5E
		if(ThirdPersonActor != none)
		{
			HMCAttachment(ThirdPersonActor).bLaserOn = false;
		}
		return true;
	}
	Instigator.AmbientSound = none;
	Instigator.SoundVolume = Instigator.default.SoundVolume;
	Instigator.SoundPitch = Instigator.default.SoundPitch;
	Instigator.SoundRadius = Instigator.default.SoundRadius;
	Instigator.bFullVolume = Instigator.default.bFullVolume;
	return false;
	//return;	
}

simulated function Destroyed()
{
	default.bLaserOn = false;
	// End:0x1F
	if(Laser != none)
	{
		Laser.Destroy();
	}
	// End:0x36
	if(LaserDot != none)
	{
		LaserDot.Destroy();
	}
	// End:0x4D
	if(glow1 != none)
	{
		glow1.Destroy();
	}
	// End:0x64
	if(Glow2 != none)
	{
		Glow2.Destroy();
	}
	// End:0x102
	if(Instigator.AmbientSound == UsedAmbientSound)
	{
		Instigator.AmbientSound = none;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		Instigator.SoundPitch = Instigator.default.SoundPitch;
		Instigator.SoundRadius = Instigator.default.SoundRadius;
		Instigator.bFullVolume = Instigator.default.bFullVolume;
	}
	super.Destroyed();
	//return;	
}

simulated function Vector ConvertFOVs(Vector InVec, float InFOV, float OutFOV, float Distance)
{
	local Vector ViewLoc, Outvec, Dir, X, Y, Z;

	local Rotator ViewRot;

	ViewLoc = Instigator.Location + Instigator.EyePosition();
	ViewRot = Instigator.GetViewRotation();
	Dir = InVec - ViewLoc;
	GetAxes(ViewRot, X, Y, Z);
	Outvec.X = Distance / Tan((OutFOV * 3.1415930) / float(360));
	Outvec.Y = ((Dir Dot Y) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec.Z = ((Dir Dot Z) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec = Outvec >> ViewRot;
	return Outvec + ViewLoc;
	//return;	
}

simulated function DrawLaserSight(Canvas Canvas)
{
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc;

	local Rotator AimDir;
	local Actor Other;
	local bool bAimAligned;

	// End:0x1F
	if((int(ClientState) == int(1)) || !bLaserOn)
	{
		return;
	}
	AimDir = BallisticFire(FireMode[0]).GetFireAim(Start);
	loc = GetBoneCoords('tip').Origin;
	End = Start + (Normal(Vector(AimDir)) * float(3000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xB7
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x11C
	if((((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.1000000)
	{
		bAimAligned = true;
	}
	// End:0x140
	if(bAimAligned && Other != none)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x1F4
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
		LaserDot.SetRotation(Rotator(HitNormal));
		LaserDot.Emitters[0].AutomaticInitialSpawning = Other.bWorldGeometry;
		LaserDot.Emitters[3].AutomaticInitialSpawning = Other.bWorldGeometry;
		Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	}
	Laser.SetLocation(loc);
	HitLocation = ConvertFOVs(End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x25D
	if(bAimAligned)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('Muzzle');
		Laser.SetRotation(AimDir);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	// End:0x2CA
	if(bBigLaser)
	{
		Scale3D.Y = 16.0000000;
		Scale3D.Z = 16.0000000;		
	}
	else
	{
		Scale3D.Y = 8.0000000;
		Scale3D.Z = 8.0000000;
	}
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	super.RenderOverlays(Canvas);
	// End:0x18
	if(IsInState('Lowered'))
	{
		return;
	}
	DrawLaserSight(Canvas);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0xC2
	if((!bTeamSet && Instigator.PlayerReplicationInfo != none) && Instigator.PlayerReplicationInfo.Team != none)
	{
		bTeamSet = true;
		// End:0xC2
		if(Instigator.PlayerReplicationInfo.Team.TeamIndex == 0)
		{
			bRedTeam = true;
			bFireMode[0].BallisticFireSound.Sound = HMCPrimaryFire(bFireMode[0]).RTeamFireSound;
			bFireMode[0].MuzzleFlashClass = Class'BWBP_SKC_Pro.A48FlashEmitter';
		}
	}
	// End:0x102
	if((Instigator != none) && Laser == none)
	{
		// End:0xF4
		if(bRedTeam)
		{
			Laser = Spawn(Class'BWBP_SKC_Pro.LaserActor_HMCRed');			
		}
		else
		{
			Laser = Spawn(Class'BWBP_SKC_Pro.LaserActor_HMC');
		}
	}
	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	Instigator.SoundPitch = default.SoundPitch;
	Instigator.SoundRadius = default.SoundRadius;
	Instigator.bFullVolume = false;
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x2D
	if(FireMode[1].bIsFiring)
	{
		CoolRate = 0.0000000;		
	}
	else
	{
		CoolRate = 0.5000000;
	}
	// End:0x76
	if(FireMode[0].bIsFiring || HMCPrimaryFire(FireMode[0]).RailPower > float(0))
	{
		bIsCharging = true;		
	}
	else
	{
		bIsCharging = false;
	}
	// End:0xCD
	if(!IsFiring())
	{
		Heat = FMax(0.0000000, Heat - (CoolRate * dt));
		// End:0xCD
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			Heat = 0.0000000;
		}
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x76
	if(FireMode[0].bIsFiring)
	{
		// End:0x4F
		if(bRedTeam)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(glow1, Class'BWBP_SKC_Pro.HMCBarrelGlowRed', DrawScale, self, 'tip');			
		}
		else
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(glow1, Class'BWBP_SKC_Pro.HMCBarrelGlow', DrawScale, self, 'tip');
		}		
	}
	else
	{
		// End:0x8D
		if(glow1 != none)
		{
			glow1.Destroy();
		}
		// End:0xA4
		if(Glow2 != none)
		{
			Glow2.Destroy();
		}
	}
	// End:0xE8
	if((AmmoAmount(0)) < 10)
	{
		HMCPrimaryFire(FireMode[0]).RailPower = 0.0000000;
		Heat = 0.0000000;
		Instigator.AmbientSound = none;
	}
	//return;	
}

simulated function AddHeat(float Amount)
{
	Heat += Amount;
	// End:0x4B
	if((Heat > 1.0000000) && Heat < 1.2000000)
	{
		Heat = 1.4000000;
		PlaySound(OverheatSound,, 6.7000000,, 64.0000000);
	}
	//return;	
}

simulated function bool MayNeedReload(byte Mode, float load)
{
	return false;
	//return;	
}

function ServerStartReload(optional byte i)
{
	//return;	
}

simulated function TargetedSlowRadius(float SlowAmount, float SlowDuration, float SlowRadius, Vector HitLocation, optional Pawn ExcludedPawn)
{
	local Pawn Target;
	local float damageScale, dist;
	local Vector Dir;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0xDA
	foreach VisibleCollidingActors(Class'Engine.Pawn', Target, SlowRadius, HitLocation)
	{
		// End:0xD9
		if(Target != ExcludedPawn)
		{
			Dir = Target.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Target.CollisionRadius) / SlowRadius);
			Class'BCoreProV55.BCSprintControl'.static.AddSlowTo(Target, damageScale * SlowAmount, damageScale * SlowDuration);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

function byte BestMode()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float Result, dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x41
	if((B == none) || B.Enemy == none)
	{
		return super.GetAIRating();
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = super.GetAIRating();
	// End:0xD7
	if(dist > float(700))
	{
		// End:0xC8
		if((FRand() > 0.6000000) && FRand() < 0.7000000)
		{
			// End:0xC8
			if(int(CurrentWeaponMode) != 2)
			{
				CurrentWeaponMode = 2;
			}
		}
		Result += 0.3000000;		
	}
	else
	{
		// End:0x136
		if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
		{
			Result -= (0.0500000 * B.Skill);
		}
	}
	// End:0x165
	if(dist > float(2000))
	{
		Result -= ((dist - float(2000)) / float(4000));
	}
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.1000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.5000000;
	//return;	
}

simulated function float ChargeBar()
{
	return FMin(Heat + HMCPrimaryFire(FireMode[0]).RailPower, 1.0000000);
	//return;	
}

defaultproperties
{
	FullyChargedSound=Sound'BW_Core_WeaponSound.LightningGun.LG-Charge'
	OverheatSound=Sound'BW_Core_WeaponSound.LightningGun.LG-OverHeat'
	CoolRate=0.5000000
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;20.0;1.80;80.0;0.8;0.8;0.1")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.HMCBeamCannonParamsArena'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.HMCBeamCannonParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.HMCBeamCannonParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.HMCBeamCannonParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.BeamCannon.BigIcon_HMC'
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.BeamCannon.Beam-Up',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_SKC_Sounds.BeamCannon.Beam-Down',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Full Power",bUnavailable=false,ModeID="WM_FullAuto",Value=0.2500000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Repulsor Beam",bUnavailable=true,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Healing Beam",bUnavailable=true,ModeID="WM_FullAuto",Value=0.3333330,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightDisplayFOV=40.0000000
	bNoMag=true
	bNonCocking=true
	MeleeFireClass=Class'BWBP_SKC_Pro.FG50MeleeFire'
	bWT_Energy=true
	SightOffset=(X=10.0000000,Y=-15.0000000,Z=20.0000000)
	MagAmmo=500
	FireModeClass[0]=Class'BWBP_SKC_Pro.HMCPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.HMCSecondaryFire'
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.5500000
	CurrentRating=0.5500000
	bShowChargingBar=true
	Description="HMC-117 Volatile Photon Cannon||Manufacturer: Nexron Defence|Primary: Charged Photon Blast|Secondary: Sweeping Plasma Beam|Special: None|The HMC-117 Volatile Photon Cannon, often nicknamed 'The Sentinel', was created originally as a tool for testing heat shielding on space craft. It was often used by shuttle crews for zero-G EVA repairs during rough space trips. Due to a couple horrifying accidents and its tendency to melt through bulkheads, the HMC was scrapped in favor of other testing and repair methods. Deemed an overall failure, somehow a variant of this bulky device managed to find its way onto the field and proved to be quite effective at taking out Cryon units. The power and reliability of its industrial grade photon generator was praised by many troopers and not even the strongest of Cryons could withstand a fully charged photon blast. While the original HMC power cells are long gone, Nexron modified HMCs can successfully run on HVPC power cells."
	Priority=72
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=5
	GroupOffset=4
	PickupClass=Class'BWBP_SKC_Pro.HMCPickup'
	PlayerViewOffset=(X=5.0000000,Y=13.0000000,Z=-10.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.HMCAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.BeamCannon.SmallIcon_HMC'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="HMC-117 Photon Cannon"
	LightType=2
	LightEffect=13
	LightHue=64
	LightSaturation=96
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.HMC117_FPm'
	DrawScale=0.3000000
	bFullVolume=true
	SoundRadius=512.0000000
}
