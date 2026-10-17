class ThumperGrenadeLauncher extends BallisticWeapon
	config(BallisticProV55);

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
	return bFireMode[1].HoldTime / bFireMode[1].MaxHoldTime;
	//return;	
}

defaultproperties
{
	SpecialInfo[0]=(Id="EvoDefs",Info="210.0;30.0;0.95;80.0;0.0;0.8;0.8")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsRealistic'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.Thumper.BigIcon_Thumper'
	BigIconCoords=(X1=0,Y1=30,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Putaway',Volume=0.2600000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Blast",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-MagIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-MagOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-MagHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.A73OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M806OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=58,G=60,B=61,A=255),Color2=(R=0,G=0,B=0,A=255),StartSize1=73,StartSize2=114)
	bWT_Hazardous=true
	bWT_Projectile=true
	SightPivot=(Pitch=-550,Yaw=0,Roll=0)
	SightOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	MagAmmo=5
	GunLength=48.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.ThumperPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.ThumperSecondaryFire'
	PutDownTime=0.8000000
	BringUpTime=0.9500000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	Description="Whatever the west has for their armaments, be it rifles or explosive ordinance, ZTV Exports refuses to be outclassed.  Their latest weapon to come off the assembly line is the LRGh-90 ''Topor'' Grenade Launcher, based off an old prototype that never saw the light of day until now. Firing either concussion or smoke 35mm caseless grenades in a bullpup configuration, the Topor may not look like it's ergo-friendly, but more than makes up for its versatility and ruggedness, living up to the legend that ZTV weapons can never malfunction, no matter the environment.  ZTV projects that the ''Thumper''  will be able to outshine their competitors with their newest offering, and given how the PKMA and AK-490 are doing, it could be another home run."
	Priority=39
	HudColor=(R=150,G=200,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=8
	PickupClass=Class'BWBP_SKC_Pro.ThumperPickup'
	PlayerViewOffset=(X=0.0000000,Y=5.0000000,Z=-3.0000000)
	PlayerViewPivot=(Pitch=600,Yaw=0,Roll=0)
	AttachmentClass=Class'BWBP_SKC_Pro.ThumperAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.Thumper.SmallIcon_Thumper'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="LRGh-90 'Topor' Grenade Launcher"
	LightType=2
	LightEffect=13
	LightHue=54
	LightSaturation=100
	LightBrightness=150.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.Thumper_FPm'
	DrawScale=0.6000000
	SoundPitch=56
	SoundRadius=32.0000000
}
