class VSKTranqRifle extends BallisticWeapon
	config(BallisticProV55);

simulated function bool HasAmmo()
{
	// End:0x38
	if((!bNoMag && FireMode[0] != none) && MagAmmo >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	// End:0x7D
	if(((Ammo[0] != none) && FireMode[0] != none) && Ammo[0].AmmoAmount >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	return false;
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

	B = Bot(Instigator.Controller);
	// End:0x41
	if((B == none) || B.Enemy == none)
	{
		return super.GetAIRating();
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Result = super.GetAIRating();
	// End:0xAA
	if(dist < float(1000))
	{
		Result += ((dist / float(1000)) - float(1));		
	}
	else
	{
		Result += (float(1) - (Abs(dist - float(5000)) / float(5000)));
	}
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.1000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.8000000;
	//return;	
}

defaultproperties
{
	SpecialInfo[0]=(Id="EvoDefs",Info="320.0;25.0;1.0;110.0;2.0;0.1;0.1")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.VSKWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.VSKWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.VSKWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.VSKWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.VSKS.BigIcon_VSK'
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.VSK.VSK-Draw',Volume=0.2000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_SKC_Sounds.VSK.VSK-Holster',Volume=0.1700000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="High Powered",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Low Powered",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=1
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	FullZoomFOV=50.0000000
	ScopeViewTex=Texture'BWBP_SKC_Tex.VSKS.VSKScopeView'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.VSK.VSK-Cock',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.M1911.RS04-SlideLock',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.VSK.VSK-ClipOut',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.VSK.VSK-ClipIn',Volume=1.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Cross4',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.A73OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=11,G=122,B=25,A=255),Color2=(R=255,G=255,B=255,A=255),StartSize1=22,StartSize2=59)
	bWT_Bullet=true
	ZoomType=1
	SightOffset=(X=30.0000000,Y=0.5000000,Z=-1.2500000)
	FireModeClass[0]=Class'BWBP_SKC_Pro.VSKPrimaryFire'
	FireModeClass[1]=Class'BCoreProV55.BallisticScopeFire'
	PutDownTime=0.7000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="VSK42 'Vampir' Tranqulizer Rifle||Manufacturer: Zavod Tochnogo Voorujeniya (ZTV Export)|Primary: Tranqulizer Dart Fire|Secondary: Zooming Scope||Vintovka Snayperskaya Kisel'eva - Paraliticheskaya. Named the Vampire due to the fact that it literally sucks the life force out of its enemies with its highly potent tranqulizer rounds. Perfect for stealthy take downs, the tactical VSP-42 and non-lethal VSK-42 are high class weapons produced in the post-war Russian Federation. The unique cased subsonic rounds of the VSK are packed with an extremely potent immobilising drug capable of dropping a juggernaut in a single shot. (Usage of more than one shot is not recommended as doses of more than 1 ml carry a 95% casualty rate in humans.) Dart velocity can be adjusted when using gas-assisted firemodes to increase range and hypodermic penetration."
	Priority=65
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=9
	PickupClass=Class'BWBP_SKC_Pro.VSKPickup'
	PlayerViewOffset=(X=0.0000000,Y=10.0000000,Z=-11.0000000)
	BobDamping=2.0000000
	AttachmentClass=Class'BWBP_SKC_Pro.VSKAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.VSKS.SmallIcon_VSK'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="VSK-42 Tranquilizer Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.VSKS_FPm'
	DrawScale=0.7000000
}
