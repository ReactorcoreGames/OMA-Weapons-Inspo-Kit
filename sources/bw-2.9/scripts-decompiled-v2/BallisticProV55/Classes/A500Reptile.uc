class A500Reptile extends BallisticWeapon
	config(BallisticProV55);

var float CrosshairSpreadAngle;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	CrosshairSpreadAngle = A500PrimaryFire(bFireMode[0]).GetCrosshairInaccAngle();
	//return;	
}

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	bShowChargingBar = Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena() || Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical();
	// End:0x78
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassic())
	{
		A500PrimaryFire(FireMode[0]).HipSpreadFactor = 1.0000000;
		A500PrimaryFire(FireMode[0]).ProjectileCount = 10;		
	}
	else
	{
		// End:0xBD
		if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsRealism())
		{
			A500PrimaryFire(FireMode[0]).HipSpreadFactor = 1.0000000;
			A500PrimaryFire(FireMode[0]).ProjectileCount = 12;
		}
	}
	//return;	
}

simulated function DrawSimpleCrosshairs(Canvas C)
{
	local float offset;

	offset = C.ClipX / float(2);
	offset *= (Tan(CrosshairSpreadAngle) / Tan((Instigator.Controller.FovAngle / float(2)) * 0.0174533));
	DrawSimpleCrosshairBars(C, int(offset), int(offset));
	//return;	
}

simulated exec function CockGun(optional byte Type)
{
	//return;	
}

function ServerCockGun(optional byte Type)
{
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	GunLength = default.GunLength;
	//return;	
}

simulated function float RateSelf()
{
	// End:0x54
	if(((PlayerController(Instigator.Controller) != none) && Ammo[0].AmmoAmount < 1) && MagAmmo < 1)
	{
		CurrentRating = super.RateSelf() * 0.2000000;		
	}
	else
	{
		return super.RateSelf();
	}
	return CurrentRating;
	//return;	
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
	// End:0x50
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena() || Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical())
	{
		return FMax(0.0000000, bFireMode[1].HoldTime / bFireMode[1].MaxHoldTime);
	}
	return 0.0000000;
	//return;	
}

defaultproperties
{
	SpecialInfo[0]=(Id="EvoDefs",Info="210.0;30.0;0.95;80.0;0.0;0.8;0.8")
	SightAnimScale=0.3500000
	ParamsClasses[0]=Class'BallisticProV55.A500WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.A500WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.A500WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.A500WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Reptile.BigIcon_Reptile'
	BigIconCoords=(X1=0,Y1=30,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Putaway',Volume=0.2250000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Blast",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightZoomFactor=1.2000000
	SightBobScale=1.5000000
	bNonCocking=true
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.Reptile.Rep_ClipOut',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.Reptile.Rep_ClipIn',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7000000
	NDCrosshairCfg=(Pic1=TexRotator'BW_Core_WeaponTex.DarkStar.DarkOutA-Rot',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc3',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=255,B=0,A=129),Color2=(R=0,G=255,B=148,A=141),StartSize1=99,StartSize2=84)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	bWT_Shotgun=true
	bWT_Hazardous=true
	bWT_Projectile=true
	ManualLines[0]="Blasts the enemy with multiple acid projectiles. These projectiles gain damage over range and inflict a short-duration blind on a headshot. Good shoulder fire properties."
	ManualLines[1]="Charges a larger, direct-attack projectile with minor radius damage. This projectile creates pools of acid where it strikes. Power, number of pools and radius of coverage all increase with charge, while speed decreases."
	ManualLines[2]="The A500 is effective at close range, or at all ranges when charged. The recoil is low because of the nature of the delivery system."
	SightOffset=(X=10.0000000,Y=0.1600000,Z=14.0000000)
	MagAmmo=8
	GunLength=48.0000000
	FireModeClass[0]=Class'BallisticProV55.A500PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.A500SecondaryFire'
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bShowChargingBar=true
	Description="The A500 is a mostly experimental Skrith weapon, seen in only a handful of battles fought against Terran forces. The first encounter with Skrith troops using the 'Reptile' was during a notorious incident on one of the Outworld colonies, where UTC troops were stationed in defense of a large Terran lab still operating. The Skrith invaded the area with little warning, and although the heavily armoured Terrans far outnumbered the Skrith incursion party, the A500 was used by the aliens to great effect. The armoured Terrans affected by the acidic substances suffered a painful fate as the armour was eaten away rapidly and then the soldier themselves fell to the toxic substance. Many theorize that the A500 and other recent Skrith weapons are a response to the ineffectiveness of their previous energy weapons against much of the Terran armour."
	Priority=39
	HudColor=(R=150,G=200,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=7
	PickupClass=Class'BallisticProV55.A500Pickup'
	PlayerViewOffset=(X=10.0000000,Y=12.0000000,Z=-14.0000000)
	AttachmentClass=Class'BallisticProV55.A500Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Reptile.SmallIcon_Reptile'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="A500 'Reptile' Acid Gun"
	LightType=2
	LightEffect=13
	LightHue=54
	LightSaturation=100
	LightBrightness=150.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.A500AcidGun_FPm'
	DrawScale=0.3000000
	SoundPitch=56
	SoundRadius=32.0000000
}
