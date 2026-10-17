class SKASShotgun extends BallisticProShotgun
	config(BallisticProV55);

var() Sound QuickCockSound;
var() Sound UltraDrawSound;
var() float Heat;
var() float CoolRate;
var() bool bGatlingMode;
var() float DesiredSpeed;
var() float BarrelSpeed;
var() float MaxRotationSpeed;
var() int BarrelTurn;
var() Sound BarrelSpinSound;
var() Sound BarrelStopSound;
var() Sound BarrelStartSound;

simulated function OnWeaponParamsChanged()
{
	super(BallisticWeapon).OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bGatlingMode = false;
	// End:0x5B
	if(InStr(WeaponParams.LayoutTags, "spinup") != -1)
	{
		bGatlingMode = true;
		SKASPrimaryFire(FireMode[0]).bRequireSpool = true;
	}
	//return;	
}

function SetServerTurnVelocity(int NewTVYaw, int NewTVPitch)
{
	SKASPrimaryFire(FireMode[0]).TurnVelocity.Yaw = NewTVYaw;
	SKASPrimaryFire(FireMode[0]).TurnVelocity.Pitch = NewTVPitch;
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	SKASPrimaryFire(FireMode[0]).MainGun = self;
	//return;	
}

simulated function float GetRampUpSpeed()
{
	local float mult;

	mult = 1.0000000 - (BarrelSpeed / MaxRotationSpeed);
	// End:0x51
	if(bGatlingMode)
	{
		return 0.0750000 + ((3.0000000 * mult) * (float(1) + (0.2500000 * float(int(bBerserk)))));		
	}
	else
	{
		return 0.0750000 + (mult * (float(1) + (0.2500000 * float(int(bBerserk)))));
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local Rotator bt;

	// End:0x2D
	if(Heat > float(0))
	{
		Heat = FMax(0.0000000, Heat - (CoolRate * dt));
	}
	super(BallisticWeapon).WeaponTick(dt);
	// End:0x45
	if(!bGatlingMode)
	{
		return;
	}
	bt.Pitch = BarrelTurn;
	SetBoneRotation('BarrelRotator', bt);
	DesiredSpeed = MaxRotationSpeed;
	//return;	
}

simulated function bool PutDown()
{
	// End:0x26
	if(super(BallisticWeapon).PutDown())
	{
		Instigator.AmbientSound = none;
		BarrelSpeed = 0.0000000;
		return true;
	}
	return false;
	//return;	
}

simulated event Tick(float dt)
{
	local float OldBarrelTurn;

	super(BallisticWeapon).Tick(dt);
	// End:0x18
	if(!bGatlingMode)
	{
		return;
	}
	// End:0x8E
	if(FireMode[0].IsFiring() && !bServerReloading)
	{
		BarrelSpeed = BarrelSpeed + FClamp(DesiredSpeed - BarrelSpeed, -0.3500000 * dt, (GetRampUpSpeed()) * dt);
		BarrelTurn += int((BarrelSpeed * float(655360)) * dt);		
	}
	else
	{
		// End:0x171
		if(BarrelSpeed > float(0))
		{
			BarrelSpeed = FMax(BarrelSpeed - (2.0000000 * dt), 0.0100000);
			OldBarrelTurn = float(BarrelTurn);
			BarrelTurn += int((BarrelSpeed * float(655360)) * dt);
			// End:0x171
			if((BarrelSpeed <= 0.0250000) && int(OldBarrelTurn / 10922.6700000) < int(float(BarrelTurn) / 10922.6700000))
			{
				BarrelTurn = int(float(int(float(BarrelTurn) / 10922.6700000)) * 10922.6700000);
				BarrelSpeed = 0.0000000;
				PlaySound(BarrelStopSound, 0, 0.5000000,, 32.0000000, 1.0000000, true);
				Instigator.AmbientSound = none;
			}
		}
	}
	// End:0x1B4
	if(BarrelSpeed > float(0))
	{
		Instigator.AmbientSound = BarrelSpinSound;
		Instigator.SoundPitch = byte(float(32) + (float(96) * BarrelSpeed));
	}
	//return;	
}

simulated function float GetSecCharge()
{
	return SKASSecondaryFire(FireMode[1]).RailPower;
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x48
	if((Heat + SKASSecondaryFire(FireMode[1]).RailPower) > float(0))
	{
		return FMin(Heat + SKASSecondaryFire(FireMode[1]).RailPower, 1.0000000);
	}
	// End:0x59
	if(!bGatlingMode)
	{
		return 0.0000000;
	}
	return BarrelSpeed / DesiredSpeed;
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x0F
	if(BarrelSpeed > float(0))
	{
		return;
	}
	super(BallisticWeapon).ServerSwitchWeaponMode(newmode);
	//return;	
}

static function Class<Pickup> RecommendAmmoPickup(int Mode)
{
	return Class'BWBP_SKC_Pro.AP_SKASDrum';
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
	// End:0x207
	if(MeleeFireMode != none)
	{
		MeleeFireMode.Instigator = Instigator;
	}
	// End:0x240
	if((Instigator.Weapon != none) && Instigator.Weapon.IsFiring())
	{
		bPossiblySwitch = false;
	}
	// End:0x26D
	if(Instigator.Weapon != W)
	{
		W.ClientWeaponSet(bPossiblySwitch);
	}
	bAimDisabled = default.bAimDisabled || !Instigator.IsHumanControlled();
	// End:0x2C8
	if(!bJustSpawned)
	{
		M = 0;
		J0x2A2:

		// End:0x2C5 [Loop If]
		if(M < 2)
		{
			Ammo[M] = none;
			M++;
			// [Loop Continue]
			goto J0x2A2;
		}
		Destroy();
	}
	//return;	
}

simulated function float RateSelf()
{
	// End:0x54
	if(((PlayerController(Instigator.Controller) != none) && Ammo[0].AmmoAmount <= 0) && MagAmmo <= 0)
	{
		CurrentRating = super(BallisticWeapon).RateSelf() * 0.2000000;		
	}
	else
	{
		return super(BallisticWeapon).RateSelf();
	}
	return CurrentRating;
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	Dir = Instigator.Location - B.Enemy.Location;
	dist = VSize(Dir);
	// End:0x8B
	if(dist > float(400))
	{
		return 0;
	}
	// End:0xB7
	if((dist < FireMode[1].MaxRange()) && FRand() > 0.1000000)
	{
		return 1;
	}
	// End:0x141
	if(((Vector(B.Enemy.Rotation) Dot Normal(Dir)) < 0.0000000) && (VSize(B.Enemy.Velocity) < float(100)) || (Normal(B.Enemy.Velocity) Dot Normal(B.Velocity)) < 0.5000000)
	{
		return 1;
	}
	return byte(Rand(2));
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float dist, rating;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	rating = super(BallisticWeapon).GetAIRating();
	// End:0x50
	if(B.Enemy == none)
	{
		return rating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, 768.0000000, 1536.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	// End:0x1F
	if(AIController(Instigator.Controller) == none)
	{
		return 0.5000000;
	}
	return AIController(Instigator.Controller).Skill / float(7);
	//return;	
}

function float SuggestDefenseStyle()
{
	local Bot B;
	local float Result, dist;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return -0.5000000;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Result = -1.0000000 * (B.Skill / float(6));
	Result *= (float(1) - (dist / float(4000)));
	return FClamp(Result, -1.0000000, -0.3000000);
	//return;	
}

simulated function Notify_BrassOut()
{
	//return;	
}

simulated function Notify_ManualBrassOut()
{
	bFireMode[0].EjectBrass();
	//return;	
}

defaultproperties
{
	QuickCockSound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-Cock'
	UltraDrawSound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-UltraDraw'
	CoolRate=0.7000000
	MaxRotationSpeed=1.0000000
	BarrelSpinSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-BarrelSpinLoop'
	BarrelStopSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-BarrelStop'
	BarrelStartSound=Sound'BW_Core_WeaponSound.XMV-850.XMV-BarrelStart'
	SpecialInfo[0]=(Id="EvoDefs",Info="360.0;45.0;0.9;120.0;0.0;3.0;0.0")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.SKASWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.SKASWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.SKASWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.SKASWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.SKAS.BigIcon_SKAS'
	BigIconCoords=(X1=0,Y1=24,X2=511,Y2=212)
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-Select',Volume=0.2250000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Putaway',Volume=0.2600000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Manual",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Semi-Auto",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="1110011",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="XR4 System",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightBobScale=0.7500000
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-CockLong',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-ClipOut1',Volume=2.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-ClipIn',Volume=2.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M763OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc6',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=255,B=255,A=192),Color2=(R=255,G=0,B=0,A=98),StartSize1=113,StartSize2=120)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=0.7500000,Y1=1.0000000,X2=0.7500000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	bWT_Shotgun=true
	bWT_Machinegun=true
	ManualLines[0]="Automatic fire has moderate spread, moderate damage, short range and fast fire rate.||Manual fire has tight spread, long range, good damage and low fire rate."
	ManualLines[1]="Multi-shot attack. Loads a shell into each of the barrels, then fires them all at once. Very high damage, short range and wide spread."
	ManualLines[2]="Extremely effective at close range."
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	SightOffset=(X=-22.5000000,Y=0.0000000,Z=8.8000000)
	MagAmmo=24
	GunLength=32.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.SKASPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.SKASSecondaryFire'
	IdleAnimRate=0.1000000
	PutDownTime=0.7000000
	AIRating=0.8500000
	CurrentRating=0.8500000
	bShowChargingBar=true
	Description="SKAS-21 Super Shotgun||Manufacturer: UTC Defense Tech|Primary: Variable Fire Buckshot|Secondary: Tri-Barrel Blast||The SKAS-21 Super Assault Shotgun is a brand-new, state-of-the-art weapons system developed by UTC Defense Tech. It has been nicknamed 'The Decimator' for its ability to sweep entire streets clean of hostiles in seconds. Built to provide sustained suppressive fire, the fully automatic SKAS fires from an electrically assisted, rotating triple-barrel system. An electric motor housed in the stock operates various internal functions, making this gun one of the few gas-operated/Gatling hybrids. Non-ambidexterous models can disable this system for use with low-impulse ammunition, however use with standard ammunition is not recommended due to the resulting overpressurization. This heavy duty shotgun fires 10 gauge ammunition from a 18 round U drum by default, however 12 gauge (SKAS/M-21), grenade launching (SRAC/G-21), and box fed (SAS/CE-3) variants exist as well. Handle with care, as this is one expensive gun."
	Priority=245
	HudColor=(R=190,G=190,B=190,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=7
	GroupOffset=4
	PickupClass=Class'BWBP_SKC_Pro.SKASPickup'
	PlayerViewOffset=(X=10.0000000,Y=5.0000000,Z=-4.5000000)
	AttachmentClass=Class'BWBP_SKC_Pro.SKASAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.SKAS.SmallIcon_SKAS'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=30)
	ItemName="SKAS-21 Automatic Shotgun"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.SKAS_FPm'
	DrawScale=0.3000000
}
