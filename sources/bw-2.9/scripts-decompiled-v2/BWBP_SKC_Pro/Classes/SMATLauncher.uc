class SMATLauncher extends BallisticWeapon
	config(BallisticProV55);

var() FullSound LeverDownSound;
var() FullSound LeverUpSound;
var() FullSound EjectSound;
var bool bRunOffsetting;
var bool bRunOverride;
var bool bInUse;
var() Rotator RunOffset;
var() bool bExploded;
var() float Heat;
var() float CoolRate;

simulated function Notify_LeverDown()
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, LeverDownSound);
	//return;	
}

simulated function Notify_LeverUp()
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, LeverUpSound);
	//return;	
}

simulated function Notify_EjectRocket()
{
	local Vector Start;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, EjectSound);
	SMATPrimaryFire(FireMode[0]).FlashHatchSmoke();
	Start = (Instigator.Location + Instigator.EyePosition()) + Class'BCoreProV55.BUtil'.static.AlignedOffset(Instigator.GetViewRotation(), vect(5.0000000, 10.0000000, -5.0000000));
	Spawn(Class'BWBP_SKC_Pro.Brass_SMAT', self,, Start, Instigator.GetViewRotation() + rot(8192, 0, 0));
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x39
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		bRunOverride = true;
	}
	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	Instigator.SoundPitch = default.SoundPitch;
	Instigator.SoundRadius = default.SoundRadius;
	Instigator.bFullVolume = true;
	//return;	
}

simulated function bool PutDown()
{
	super.PutDown();
	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	Instigator.SoundPitch = default.SoundPitch;
	Instigator.SoundRadius = default.SoundRadius;
	Instigator.bFullVolume = false;
	return true;
	//return;	
}

simulated event Tick(float dt)
{
	Heat = FMax(0.0000000, Heat - (CoolRate * dt));
	super.Tick(dt);
	//return;	
}

simulated function WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x53
	if(FireMode[0].bIsFiring == true)
	{
		bInUse = true;
		SMATSecondaryFire(FireMode[1]).RailPower = 0.0000000;
		Heat = 0.0000000;		
	}
	else
	{
		bInUse = false;
	}
	//return;	
}

function DropFrom(Vector StartLocation)
{
	// End:0x1B
	if(bExploded || PickupClass == none)
	{
		return;		
	}
	else
	{
		super.DropFrom(StartLocation);
	}
	//return;	
}

function byte BestMode()
{
	return 0;
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
	// End:0xA7
	if(dist < float(600))
	{
		Result -= 0.6000000;		
	}
	else
	{
		// End:0xC7
		if(dist > float(4000))
		{
			Result -= 0.3000000;			
		}
		else
		{
			// End:0xF6
			if(dist > float(20000))
			{
				Result += ((dist - float(1000)) / float(2000));
			}
		}
	}
	Result += (0.2000000 - (FRand() * 0.4000000));
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.9000000;
	//return;	
}

simulated function float ChargeBar()
{
	return FMin(Heat + SMATSecondaryFire(FireMode[1]).RailPower, 1.0000000);
	//return;	
}

defaultproperties
{
	LeverDownSound=(Sound=Sound'BWBP_SKC_Sounds.SMAA.SMAT-LeverOpen',Volume=0.7000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	LeverUpSound=(Sound=Sound'BWBP_SKC_Sounds.SMAA.SMAT-LeverClose',Volume=0.7000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	EjectSound=(Sound=Sound'BWBP_SKC_Sounds.SMAA.SMAT-Eject',Volume=1.7000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	RunOffset=(Pitch=-1500,Yaw=-4500,Roll=0)
	CoolRate=0.7000000
	SpecialInfo[0]=(Id="EvoDefs",Info="500.0;60.0;1.0;80.0;2.0;0.0;1.5")
	AIReloadTime=4.0000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.SMATWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.SMATWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.SMATWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.SMATWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.SMAT.BigIcon_SMAT'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.Artillery.Art-Deploy',Volume=0.2100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.Artillery.Art-Undeploy',Volume=0.2100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Single Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	ZoomInAnim="ZoomIn"
	ZoomOutAnim="ZoomOut"
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinZoom=2.0000000
	MaxZoom=8.0000000
	ScopeViewTex=Texture'BWBP_SKC_Tex.SMAT.SMATAAScopeView'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Lever',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Lever',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ReloadAnim="ReloadFancy"
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.SMAA.SMAT-RocketOut',Volume=1.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.MRL.MRL-Cycle',Volume=1.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.SMAA.SMAT-RocketIn',Volume=1.6000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc6',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=255,G=0,B=0,A=192),Color2=(R=255,G=255,B=0,A=192),StartSize1=89,StartSize2=13)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.2500000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Projectile=true
	bWT_Super=true
	PlayerSpeedFactor=0.7000000
	SightingTime=0.7500000
	SightOffset=(X=20.0000000,Y=0.0000000,Z=0.5000000)
	MagAmmo=1
	CockingBringUpTime=2.8000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.SMATPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.SMATSecondaryFire'
	SelectAnimRate=0.6000000
	PutDownAnimRate=0.8000000
	PutDownTime=0.8000000
	BringUpTime=1.0000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7500000
	CurrentRating=0.7500000
	bShowChargingBar=true
	Description="FGM-16 Shoulder Mounted Anti-Tank Infantry Cannon||Manufacturer: UTC Defense Tech|Primary: Launch Rocket|Secondary: Detonate Rocket||The SMAT Infantry Cannon is a reloadable, single shot rocket launcher. The portable version of the Flak 54 AT system, the FGM-16 SMAT is housed in a reinforced casing with advanced recoil buffering technlogy and fires high-speed HEAT-DP shaped charges for maximum penetration and damage. Engineered after UTC generals noticed the Cryons' knack for overrunning and taking over their Flak 54 sites, this new portable cannon has been the bane of Cryon armored divisions ever since."
	Priority=164
	CenteredOffsetY=10.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=8
	PickupClass=Class'BWBP_SKC_Pro.SMATPickup'
	PlayerViewOffset=(X=-6.0000000,Y=5.0000000,Z=-1.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.SMATAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.SMAT.SmallIcon_SMAT'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="S.M.A.T. Infantry Cannon"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.SMAT_FPm'
	DrawScale=0.3000000
}
