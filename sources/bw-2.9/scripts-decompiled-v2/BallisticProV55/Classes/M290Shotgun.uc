class M290Shotgun extends BallisticProShotgun
	config(BallisticProV55);

var bool bLeftLoaded;
var bool bRightLoaded;

simulated function PlayShovelEnd()
{
	PlayAnim(EndShovelAnim, EndShovelAnimRate, 0.0000000);
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

simulated function CommonCockGun(optional byte Type)
{
	super(BallisticWeapon).CommonCockGun(Type);
	// End:0x1E
	if(MagAmmo > 1)
	{
		bLeftLoaded = true;
	}
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
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;20.0;0.5;80.0;0.0;1.0;0.0")
	SightAnimScale=0.5000000
	ParamsClasses[0]=Class'BallisticProV55.M290WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.M290WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.M290WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.M290WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_M290'
	BigIconCoords=(X1=0,Y1=40,X2=490,Y2=225)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M290.M290Pullout',Volume=0.2180000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M290.M290Putaway',Volume=0.2180000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Single Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	SightBobScale=0.7500000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.M290.M290Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ReloadAnim="ReloadLoop"
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.M290.M290LoadShell',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCanSkipReload=true
	bAltTriggerReload=true
	bShovelLoad=true
	StartShovelAnim="PrepReload"
	EndShovelAnim="FinishReload"
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M763OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M763OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=0,B=0,A=192),Color2=(R=255,G=255,B=0,A=223),StartSize1=186,StartSize2=152)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	NDCrosshairChaosFactor=0.6000000
	bWT_Shotgun=true
	ManualLines[0]="Fires both barrels at once. Deals extreme damage at close to medium range. Spread is tight, recoil is high and fire rate is moderate."
	ManualLines[1]="Fires one barrel at a time. Deals high damage with tighter spread than primary. The interval between two successive shots is short, but the weapon must cock after the second shot, or it may be manually cocked."
	ManualLines[2]="The M290 is reloaded one shell at a time.||Penetration is very poor.||The M290 is extremely effective at close range and effective at medium range."
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	SightOffset=(X=-9.9000000,Y=-0.0400000,Z=6.0000000)
	StartShovelAnimRate=1.9000000
	EndShovelAnimRate=1.5000000
	FireModeClass[0]=Class'BallisticProV55.M290PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.M290SecondaryFire'
	AIRating=0.9000000
	CurrentRating=0.9000000
	Description="Another sturdy weapon by Black & Wood, the M290 has proven it's worth many times in combat situations, especially against alien forces, most notably the Krao. One of its greatest feats was during the second Human-Skrith war, when a wounded Captain in the UTC 27th Special Ops division single handedly defended an outpost from six advancing Krao companies, using the weaponï¿½s wide spread to his advantage."
	Priority=38
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=7
	GroupOffset=1
	PickupClass=Class'BallisticProV55.M290Pickup'
	PlayerViewOffset=(X=0.0000000,Y=9.6000000,Z=-12.0000000)
	AttachmentClass=Class'BallisticProV55.M290Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_M290'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="M290 Shotgun"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=150
	LightBrightness=180.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.M290_FPm'
	DrawScale=0.3000000
}
