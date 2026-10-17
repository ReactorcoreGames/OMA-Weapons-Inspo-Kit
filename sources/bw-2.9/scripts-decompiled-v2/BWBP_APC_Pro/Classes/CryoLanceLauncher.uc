class CryoLanceLauncher extends BallisticWeapon
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

var float ChargeRate;
var() float Heat;
var() float CoolRate;
var bool bIsCharging;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ChargeRate;
}

function byte BestMode()
{
	local Bot B;
	local float dist;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0x8D
	if((dist > float(2048)) || Rand(100) < 10)
	{
		return 1;
	}
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.5000000, dist, 1536.0000000, 3072.0000000);
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

simulated function float ChargeBar()
{
	return bFireMode[0].HoldTime / bFireMode[0].MaxHoldTime;
	//return;	
}

defaultproperties
{
	ChargeRate=2.4000000
	CoolRate=1.0000000
	SpecialInfo[0]=(Id="EvoDefs",Info="320.0;25.0;1.0;110.0;0.8;0.5;0.0")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_APC_Pro.CryoLanceWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_APC_Pro.CryoLanceWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_APC_Pro.CryoLanceWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_APC_Pro.CryoLanceWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_APC_Tex.CryoCannon.BigIcon_Freeze'
	BigIconCoords=(X1=32,Y1=40,X2=475,Y2=212)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Pullout',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Putaway',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-BoltPull',Volume=1.1000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bNonCocking=true
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-MagFiddle',Volume=1.2000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-MagOut',Volume=1.2000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-MagIn',Volume=1.2000000,Radius=32.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M50OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=255,B=0,A=134),Color2=(R=255,G=0,B=0,A=255),StartSize1=50,StartSize2=51)
	bWT_Bullet=true
	ManualLines[0]=""
	ManualLines[1]=""
	ManualLines[2]=""
	SightOffset=(X=6.0000000,Y=-6.3500000,Z=23.1500000)
	CockAnimRate=1.1000000
	ReloadAnimRate=1.1000000
	FireModeClass[0]=Class'BWBP_APC_Pro.CryoLancePrimaryFire'
	FireModeClass[1]=Class'BWBP_APC_Pro.CryoLanceSecondaryFire'
	PutDownTime=0.7000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7500000
	CurrentRating=0.7500000
	bShowChargingBar=true
	Priority=65
	HudColor=(R=125,G=175,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=4
	PickupClass=Class'BWBP_APC_Pro.CryoLanceLauncherPickup'
	PlayerViewOffset=(X=-5.5000000,Y=12.0000000,Z=-18.0000000)
	BobDamping=2.0000000
	AttachmentClass=Class'BWBP_APC_Pro.CryoLanceLauncherAttatchment'
	IconMaterial=Texture'BWBP_APC_Tex.CryoCannon.SmallIcon_Freeze'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="[B] Cryo Lance"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_APC_Anim.CryoCannon_FPm'
	DrawScale=0.4000000
}
