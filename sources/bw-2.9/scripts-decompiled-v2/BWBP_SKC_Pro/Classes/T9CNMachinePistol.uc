class T9CNMachinePistol extends BallisticHandgun
	config(BallisticProV55);

var() bool bHasGauss;
var() bool bGaussCharged;
var float GaussLevel;
var float MaxGaussLevel;
var() Sound GaussOnSound;

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasGauss = false;
	// End:0x4A
	if(InStr(WeaponParams.LayoutTags, "gauss") != -1)
	{
		bHasGauss = true;
		bShowChargingBar = true;
	}
	// End:0x78
	if(InStr(WeaponParams.LayoutTags, "raffica") != -1)
	{
		SupportHandBone = 'l_upperarm';
	}
	//return;	
}

simulated function Tick(float dt)
{
	super(BallisticWeapon).Tick(dt);
	// End:0x1F
	if(bHasGauss)
	{
		AddGauss(dt);
	}
	//return;	
}

simulated function AddGauss(optional float Amount)
{
	// End:0x15
	if(bBerserk)
	{
		Amount *= 1.2000000;
	}
	GaussLevel = FMin(GaussLevel + Amount, MaxGaussLevel);
	// End:0x66
	if(!bGaussCharged && GaussLevel == MaxGaussLevel)
	{
		PlaySound(GaussOnSound,, 1.2000000,, 32.0000000);
		bGaussCharged = true;
	}
	//return;	
}

simulated function float ChargeBar()
{
	return FMax(0.0000000, GaussLevel / MaxGaussLevel);
	//return;	
}

simulated function bool CanAlternate(int Mode)
{
	// End:0x0D
	if(Mode != 0)
	{
		return false;
	}
	return super.CanAlternate(Mode);
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x6B
	if((LastFireTime < (Level.TimeSeconds - RcComponent.DeclineDelay)) && MeleeFatigue > float(0))
	{
		MeleeFatigue = FMax(0.0000000, MeleeFatigue - (dt / RcComponent.DeclineTime));
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x28
	if(MagAmmo < 2)
	{
		SetBoneScale(0, 0.0000000, 'Bullet');
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0xD7
	if((((((Anim == 'FireOpen') || Anim == 'Fire') || Anim == CockAnim) || Anim == ReloadAnim) || Anim == DualReloadAnim) || Anim == DualReloadEmptyAnim)
	{
		// End:0xC1
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
		{
			IdleAnim = 'IdleOpen';
			ReloadAnim = 'ReloadOpen';
			SetBoneScale(0, 0.0000000, 'Bullet');			
		}
		else
		{
			IdleAnim = 'Idle';
			ReloadAnim = 'Reload';
		}
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function Notify_ClipOutOfSight()
{
	SetBoneScale(0, 1.0000000, 'Bullet');
	//return;	
}

simulated function Notify_HideBullet()
{
	// End:0x1D
	if(MagAmmo < 2)
	{
		SetBoneScale(0, 0.0000000, 'Bullet');
	}
	//return;	
}

simulated function PlayReload()
{
	super.PlayReload();
	// End:0x23
	if(MagAmmo < 2)
	{
		SetBoneScale(0, 0.0000000, 'Bullet');
	}
	//return;	
}

simulated function bool HasAmmoLoaded(byte Mode)
{
	// End:0x0F
	if(int(Mode) == 1)
	{
		return true;
	}
	// End:0x27
	if(bNoMag)
	{
		return HasNonMagAmmo(Mode);		
	}
	else
	{
		return HasMagAmmo(Mode);
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, 768.0000000, 1536.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.8000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.8000000;
	//return;	
}

simulated state Lowering
{Begin:

	SafePlayAnim(PutDownAnim, 1.7500000, 0.1000000);
	FinishAnim();
	GotoState('Lowered');
	stop;					
}

defaultproperties
{
	MaxGaussLevel=3.0000000
	GaussOnSound=Sound'BW_Core_WeaponSound.Gauss.Gauss-Charge'
	HandgunGroup=6
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;12.0;1.50;80.0;0.4;0.2;-999.0")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.T9CNWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.T9CNWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.T9CNWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.T9CNWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.T9CN.BigIcon_BerSilver'
	BigIconCoords=(X1=64,Y1=0,X2=511,Y2=255)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Pullout',Volume=0.1500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Putaway',Volume=0.1480000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst of Three",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Burst of Six",bUnavailable=true,ModeID="WM_BigBurst",Value=6.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=3
	SightDisplayFOV=40.0000000
	bNoCrosshairInScope=true
	SightBobScale=0.2500000
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-Cock',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-SlideBack',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-ClipOut',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-ClipIn',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M806OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross3',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=197,G=190,B=185,A=117),Color2=(R=255,G=255,B=255,A=149),StartSize1=90,StartSize2=38)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.8000000,X2=0.5000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=2.0000000,CurrentScale=0.0000000)
	bWT_Bullet=true
	bWT_Machinegun=true
	ManualLines[0]="Automatic pistol fire. Good strength and low recoil."
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	SightOffset=(X=0.0000000,Y=0.0000000,Z=1.7300000)
	CockingBringUpTime=0.8000000
	GunLength=0.1000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.T9CNPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.T9CNSecondaryFire'
	PutDownTime=0.4000000
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="The T9CN was the precursor to the standard GRS9 Pistol, and it sported a rugged automatic firing mechanism and nickel finish. The automatic variant was designed with use by counter-terrorism units in mind, but sadly a lack of compensator gave the gun horrible inaccuracy and recoil. Most CTU's quickly dropped the T9CN in favor of other more accurate machine pistols like the XRS-10 and the XK2, however infamous outlaw Var Dehidra and his cronies stole a stash of T9CN's and found good use for them. They were known for spraying them to keep enemies at bay and even tilting them to the side like gangsters of old. Their brazen use of police equipment inspired robberies throughout the cosmos!"
	Priority=143
	HudColor=(R=150,G=150,B=150,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=3
	GroupOffset=12
	PickupClass=Class'BWBP_SKC_Pro.T9CNPickup'
	PlayerViewOffset=(X=4.0000000,Y=3.0000000,Z=-6.0000000)
	BobDamping=2.0000000
	AttachmentClass=Class'BWBP_SKC_Pro.T9CNAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.T9CN.SmallIcon_BerSilver'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="T9CN Automatic Pistol"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=130.0000000
	LightRadius=3.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.T9CNRC_FPm'
	DrawScale=0.3000000
}
