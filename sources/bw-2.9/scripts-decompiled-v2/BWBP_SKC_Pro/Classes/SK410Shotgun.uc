class SK410Shotgun extends BallisticProShotgun
	config(BallisticProV55);

var name BulletBone;

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x1C
	if(int(MeleeState) >= int(2))
	{
		Momentum *= 0.5000000;
	}
	super(BallisticWeapon).AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x3C
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		SetBoneScale(0, 0.0000000, BulletBone);
		ReloadAnim = 'ReloadEmpty';		
	}
	else
	{
		ReloadAnim = 'Reload';
	}
	super(BallisticWeapon).BringUp(PrevWeapon);
	GunLength = default.GunLength;
	//return;	
}

simulated function PlayReload()
{
	// End:0x19
	if(MagAmmo < 1)
	{
		ReloadAnim = 'ReloadEmpty';		
	}
	else
	{
		ReloadAnim = 'Reload';
	}
	SafePlayAnim(ReloadAnim, ReloadAnimRate,, 0, "RELOAD");
	//return;	
}

simulated function Notify_ClipUp()
{
	SetBoneScale(0, 1.0000000, BulletBone);
	//return;	
}

simulated function Notify_ClipOut()
{
	super(BallisticWeapon).Notify_ClipOut();
	// End:0x22
	if(MagAmmo < 1)
	{
		SetBoneScale(0, 0.0000000, BulletBone);
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x64
	if((Anim == 'Fire') || Anim == 'ReloadEmpty')
	{
		// End:0x64
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
		{
			SetBoneScale(0, 0.0000000, BulletBone);
		}
	}
	super(BallisticWeapon).AnimEnd(Channel);
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
	// End:0xD0
	if((dist > float(1024)) || (B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
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

defaultproperties
{
	BulletBone="Bullet1"
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;30.0;0.5;60.0;0.0;1.0;0.0")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.SK410WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.SK410WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.SK410WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.SK410WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.SK410.BigIcon_SK410'
	BigIconCoords=(X1=0,Y1=40,X2=511,Y2=212)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Putaway',Volume=0.2600000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Automatic Slug",bUnavailable=true,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="0451-EXECUTE",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	SightBobScale=0.2000000
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.Saiga.SK410-Cock',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_SKC_Sounds.Saiga.SK410-Cock',Volume=1.4000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.SK410.SK410-MagOut',Volume=1.3000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.SK410.SK410-MagIn',Volume=1.3000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M763OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M763InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=255,B=255,A=192),Color2=(R=255,G=0,B=0,A=192),StartSize1=113,StartSize2=120)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=0.7500000,Y1=1.0000000,X2=0.7500000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	MeleeFireClass=Class'BWBP_SKC_Pro.SK410MeleeFire'
	bWT_Shotgun=true
	bWT_Machinegun=true
	ManualLines[0]="Rapid fire shotgun blasts with wide spread. Short range, but high sustained damage output."
	ManualLines[1]="Fires an explosive slug. Deals good impact damage and minor radius damage. Targets hit will be knocked back a significant distance."
	ManualLines[2]="Has a melee attack. Damage improves over hold time, with a max bonus being reached at 1.5 seconds of holding. As a blunt attack, has lower damage than sharp melee attacks but inflicts a minor blind effect upon striking. Deals more damage from behind.||Extremely effective at close range and against charges and melee."
	SightPivot=(Pitch=150,Yaw=0,Roll=0)
	SightOffset=(X=0.0000000,Y=0.0100000,Z=2.4000000)
	CockingBringUpTime=1.8000000
	GunLength=48.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.SK410PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.SK410SecondaryFire'
	SelectAnimRate=1.6000000
	PutDownAnimRate=1.6000000
	PutDownTime=0.3500000
	BringUpTime=0.6000000
	AIRating=0.8500000
	CurrentRating=0.8500000
	Description="The SK-410 shotgun is a large-bore, compact shotgun based off the popular AK-490 design. While it is illegal on several major planets, this powerful weapon and its signature explosive shotgun shells are almost ubiquitous. A weapon originally designed for breaching use, the SK-410 is now found in the hands of civillians and terrorists throughout the worlds. It had become so prolific with outer colony terrorist groups that the UTC began the SKAS assault weapon program in an effort to find a powerful shotgun of their own."
	Priority=245
	HudColor=(R=255,G=25,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=7
	GroupOffset=7
	PickupClass=Class'BWBP_SKC_Pro.SK410Pickup'
	PlayerViewOffset=(X=7.0000000,Y=4.5000000,Z=-5.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.SK410Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.SK410.SmallIcon_SK410'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=35)
	ItemName="SK-410 Assault Shotgun"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.SK410_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BWBP_SKC_Tex.SK410.SK410-Main'
	Skins[2]=Texture'BWBP_SKC_Tex.SK410.SK410-Misc'
	Skins[3]=Shader'BWBP_SKC_Tex.SK410.SK410-LightsOn'
}
