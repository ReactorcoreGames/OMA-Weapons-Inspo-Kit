class MRT6Shotgun extends BallisticProShotgun
	config(BallisticProV55);

var bool bLeftLoaded;
var bool bRightLoaded;
var byte LeftChamber;
var byte RightChamber;

static function Class<Pickup> RecommendAmmoPickup(int Mode)
{
	return Class'BallisticProV55.AP_12GaugeClips';
	//return;	
}

simulated function PlayReload()
{
	// End:0x1C
	if(MagAmmo < 1)
	{
		SetBoneScale(0, 0.0000000, 'shell');
	}
	super(BallisticWeapon).PlayReload();
	//return;	
}

simulated function Notify_CockAfterFire()
{
	bPreventReload = false;
	// End:0x47
	if(((!bRightLoaded || bRightLoaded && bLeftLoaded) && bNeedCock) && MagAmmo > 0)
	{
		CommonCockGun();
	}
	//return;	
}

simulated function Notify_ClipOutOfSight()
{
	SetBoneScale(0, 1.0000000, 'shell');
	//return;	
}

simulated function CommonCockGun(optional byte Type)
{
	super(BallisticWeapon).CommonCockGun(Type);
	bLeftLoaded = true;
	bRightLoaded = true;
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
	// End:0x8E
	if(dist > float(700))
	{
		return 1;		
	}
	else
	{
		// End:0xA2
		if(dist < float(300))
		{
			return 0;
		}
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, BallisticInstantFire(bFireMode[0]).DecayRange.Min, BallisticInstantFire(bFireMode[0]).DecayRange.Max);
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

defaultproperties
{
	bLeftLoaded=true
	bRightLoaded=true
	SpecialInfo[0]=(Id="EvoDefs",Info="180.0;10.0;-999.0;25.0;0.0;0.8;-999.0")
	SightAnimScale=0.5000000
	ParamsClasses[0]=Class'BallisticProV55.MRT6WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.MRT6WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.MRT6WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.MRT6WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_MRT6'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6Pullout',Volume=0.1530000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6Putaway',Volume=0.1530000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Single Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightBobScale=0.7000000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bAltTriggerReload=true
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M763OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M763InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=255,B=0,A=128),Color2=(R=110,G=86,B=53,A=192),StartSize1=168,StartSize2=166)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	bWT_Shotgun=true
	bWT_Sidearm=true
	ManualLines[0]="Fires both barrels. Wide spread and good damage, but requires cocking after every shot."
	ManualLines[1]="Fires one barrel at a time."
	ManualLines[2]="Effective at very close range. Spreads less from the hip than other shotguns."
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	SightOffset=(X=-10.0000000,Y=0.0000000,Z=6.5000000)
	CockingBringUpTime=1.0000000
	GunLength=24.0000000
	FireModeClass[0]=Class'BallisticProV55.MRT6PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.MRT6SecondaryFire'
	AIRating=0.7000000
	CurrentRating=0.7000000
	Description="MRT6 Shotgun Sidearm||Manufacturer: Wot ya Packin Gun Corp|Primary: Dual Barrel Shot|Secondary: Single Barrel Shot||One of Wot Ya Packin's most famous creations, the ridiculous MRT6 has grown quite a reputaton. A favourite of gangsters, thieves and countless other such criminals, the MRT6 is a small, fairly light shotgun that can easily be mistaken for a pistol. It has two barrels that can be fired simultaneously, it can be reloaded quickly and has an eight shell magazine. It is rarely seen in professional military use due to its loud noise, short range and extreme spread, but it is has a very high damage when used at close range, as anyone that is unfortunate enough to be aboard an unsuspecting ship attacked by a band of cargo raiders would testify. In fact, during an incident where Var Dehidra's pirates boarded a private exploration vessel, already being attacked by another band. They used their MRT6's to defeat the entire band of over thirty B1 'Possum' wielding marauders as well as the ship's defenders."
	Priority=35
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=2
	GroupOffset=9
	PickupClass=Class'BallisticProV55.MRT6Pickup'
	PlayerViewOffset=(X=1.0000000,Y=3.0000000,Z=-5.5000000)
	AttachmentClass=Class'BallisticProV55.MRT6Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_MRT6'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="MRT-6 Shotgun"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=130
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.MRT6_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BW_Core_WeaponTex.MRT6.MRT6Skin'
	Skins[2]=Texture'BW_Core_WeaponTex.MRT6.MRT6Small'
}
