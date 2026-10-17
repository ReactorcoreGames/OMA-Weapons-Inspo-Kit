class FLASHLauncher extends BallisticWeapon
	config(BallisticProV55);

var bool bRunOffsetting;
var() Rotator RunOffset;
var() FullSound HatchSound;

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x3D
	if(Class'BCoreProV55.BallisticReplicationInfo'.default.bNoReloading && (AmmoAmount(0)) > 1)
	{
		SetBoneScale(0, 1.0000000, 'Rocket');
	}
	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	Instigator.SoundPitch = default.SoundPitch;
	Instigator.SoundRadius = default.SoundRadius;
	Instigator.bFullVolume = true;
	//return;	
}

simulated function PlayIdle()
{
	super.PlayIdle();
	// End:0x3C
	if((bPendingSightUp || int(SightingState) != int(0)) || !CanPlayAnim(IdleAnim,, "IDLE"))
	{
		return;
	}
	FreezeAnimAt(0.0000000);
	//return;	
}

simulated function bool PutDown()
{
	// End:0x28
	if(super.PutDown())
	{
		// End:0x26
		if(MagAmmo < 2)
		{
			SetBoneScale(0, 0.0000000, 'Rocket');
		}
		return true;
	}
	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	Instigator.SoundPitch = default.SoundPitch;
	Instigator.SoundRadius = default.SoundRadius;
	Instigator.bFullVolume = false;
	return false;
	//return;	
}

simulated function bool CheckScope()
{
	// End:0x1A
	if(Level.TimeSeconds < NextCheckScopeTime)
	{
		return true;
	}
	NextCheckScopeTime = Level.TimeSeconds + 0.2500000;
	// End:0x10E
	if((((((int(ReloadState) != int(0)) && int(ReloadState) != int(8)) || bRunOffsetting) || (int(Instigator.Controller.bRun) == 0) && int(Instigator.Physics) == int(1)) || (int(Instigator.Physics) == int(2)) && VSize(Instigator.Velocity) > (Instigator.GroundSpeed * 1.5000000)) || (SprintControl != none) && SprintControl.bSprinting)
	{
		StopScopeView();
		return false;
	}
	return true;
	//return;	
}

simulated function bool CanUseSights()
{
	// End:0xA9
	if(((((((int(Instigator.Physics) == int(2)) && VSize(Instigator.Velocity) > (Instigator.GroundSpeed * 1.5000000)) || bRunOffsetting) || (SprintControl != none) && SprintControl.bSprinting) || int(ClientState) == int(2)) || int(ClientState) == int(3)) || int(ReloadState) != int(0))
	{
		return false;
	}
	return true;
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
	local float dist, rating;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	rating = super.GetAIRating();
	// End:0x50
	if(B.Enemy == none)
	{
		return rating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.5000000, dist, 1024.0000000, 1024.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.8000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.9000000;
	//return;	
}

simulated function Notify_G5HatchOpen()
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, HatchSound);
	//return;	
}

simulated function Notify_G5HideRocket()
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x50
	if(!Class'BCoreProV55.BallisticReplicationInfo'.default.bNoReloading || (AmmoAmount(0)) < 2)
	{
		SetBoneScale(0, 0.0000000, 'Rocket');
	}
	//return;	
}

defaultproperties
{
	RunOffset=(Pitch=-4000,Yaw=-2000,Roll=0)
	HatchSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75Cliphit',Volume=0.7000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="500.0;60.0;1.0;80.0;2.0;0.0;1.5")
	AIReloadTime=4.0000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.FLASHWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.FLASHWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.FLASHWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.FLASHWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.Flash.BigIcon_FLASH'
	BigIconCoords=(X1=0,Y1=48,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-PullOut',Volume=0.2230000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-Putaway',Volume=0.2700000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Incendiary Rocket",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	ScopeXScale=1.3333330
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	FullZoomFOV=90.0000000
	ScopeViewTex=Texture'BW_Core_WeaponTex.G5.G5ScopeView'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Lever',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Lever',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bNonCocking=true
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.Flash.FLASH-PullOut',Volume=1.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.Flash.FLASH-Insert',Volume=1.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ShovelIncrement=4
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.NRP57OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc9',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=192),Color2=(R=255,G=255,B=0,A=86),StartSize1=75,StartSize2=95)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.2500000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	NDCrosshairChaosFactor=0.7500000
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Projectile=true
	bWT_Super=true
	ManualLines[0]="Fires a single AT40 rocket. Upon impact, explodes into flames, igniting nearby enemies and spreading pools of fire. AT40 rockets stacked upon each other will not deal more DPS from fire."
	ManualLines[1]="Dumps the entire load of remaining rockets at once. Overlapping fire patches will only deal damage once. Invariably fatal to any target directly struck."
	ManualLines[2]="As a rocket launcher, it has no recoil. Ineffective while jumping and at close range due to the risk of burning the user."
	SightOffset=(X=4.0000000,Y=-0.0500000,Z=0.2500000)
	CockingBringUpTime=2.4000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.FLASHPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.FLASHSecondaryFire'
	PutDownTime=1.4000000
	BringUpTime=1.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.9000000
	CurrentRating=0.9000000
	Description="The G5 is an excellent tool against armored vehicles, but against infantry it loses some of its effectiveness. In response to field tester imput, the UTC is currently trying a new anti-infantry rocket launcher called the STREAK. This specialized rocket launcher uses a standard warhead filled with a mixture of napalm, tar and thermite, along with an igniting agent. This means that the STREAK can both take out infantry quickly with a direct blast and incinerate those caught in its wide area of effect. Another bonus of the STREAK is that the user can fire the rockets singlely to dispose of individuals or four at a time to wipe out larger groups. A scope can be used for larger ranges. Note: Make sure that the device is not used in tight areas, due to the large back blast of the weapon."
	Priority=164
	HudColor=(R=0,G=200,B=0,A=255)
	CenteredOffsetY=10.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=8
	PickupClass=Class'BWBP_SKC_Pro.FLASHPickup'
	PlayerViewOffset=(X=1.5000000,Y=2.7000000,Z=3.5000000)
	AttachmentClass=Class'BWBP_SKC_Pro.FLASHAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.Flash.SmallIcon_FLASH'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="AT40 STREAK"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.FLASH_FPm'
	DrawScale=0.3000000
}
