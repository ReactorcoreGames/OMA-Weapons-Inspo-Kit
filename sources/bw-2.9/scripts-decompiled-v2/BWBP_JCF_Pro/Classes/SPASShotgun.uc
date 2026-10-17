class SPASShotgun extends BallisticProShotgun
	config(BallisticProV55);

var() bool bIsSlug;

simulated function OnWeaponParamsChanged()
{
	super(BallisticWeapon).OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bIsSlug = false;
	// End:0x41
	if(InStr(WeaponParams.LayoutTags, "slug") != -1)
	{
		bIsSlug = true;
	}
	//return;	
}

simulated function AltFire(float F)
{
	FirePressed(F);
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist;
	local Vector Dir;

	// End:0x0C
	if(bNoaltfire)
	{
		return 0;
	}
	B = Bot(Instigator.Controller);
	// End:0x49
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	Dir = Instigator.Location - B.Enemy.Location;
	dist = VSize(Dir);
	// End:0x97
	if(dist > float(450))
	{
		return 1;
	}
	// End:0xC3
	if((dist < FireMode[1].MaxRange()) && FRand() > 0.3000000)
	{
		return 0;
	}
	// End:0x14D
	if(((Vector(B.Enemy.Rotation) Dot Normal(Dir)) < 0.0000000) && (VSize(B.Enemy.Velocity) < float(100)) || (Normal(B.Enemy.Velocity) Dot Normal(Instigator.Velocity)) < 0.5000000)
	{
		return 1;
	}
	return byte(Rand(2));
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
		return super(BallisticWeapon).GetAIRating();
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = super(BallisticWeapon).GetAIRating();
	// End:0xDE
	if(!HasMagAmmo(0) && Ammo[0].AmmoAmount < 1)
	{
		// End:0xC3
		if(dist > float(400))
		{
			return 0.0000000;
		}
		return Result / (float(1) + (dist / float(400)));
	}
	// End:0x10D
	if(dist > float(1000))
	{
		Result -= ((dist - float(1000)) / float(2000));
	}
	// End:0x16F
	if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
	{
		Result += (0.1000000 * B.Skill);		
	}
	else
	{
		// End:0x1D1
		if(((B.Enemy.Weapon != none) && B.Enemy.Weapon.bSniping) && dist > float(500))
		{
			Result -= 0.3000000;
		}
	}
	Result += (float(1) - (dist / float(1000)));
	return Result;
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
	local float dist;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return -0.5000000;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return 0.3000000 - ((B.Skill / float(6)) * (float(1) - (dist / float(3000))));
	//return;	
}

defaultproperties
{
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;30.0;1.5;100.0;0.0;2.0;-999.0")
	ParamsClasses[0]=Class'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_JCF_Tex.SPAS.BigIcon_SPAS'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Putaway',Volume=0.2600000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi-Automatic",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BWBP_JCF_Sounds.SPAS.SPAS-Cock',Volume=0.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bCockOnEmpty=true
	ReloadAnim="ReloadLoop"
	ClipInSound=(Sound=Sound'BWBP_JCF_Sounds.SPAS.SPAS-Insert',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.3750000
	bCanSkipReload=true
	bShovelLoad=true
	StartShovelAnim="PrepReload"
	EndShovelAnim="EndReload"
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Cross1',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M763OutA',USize1=128,VSize1=128,USize2=256,VSize2=256,Color1=(R=125,G=123,B=121,A=177),Color2=(R=27,G=23,B=21,A=255),StartSize1=32,StartSize2=96)
	LongGunPivot=(Pitch=4500,Yaw=-8000,Roll=0)
	bWT_Shotgun=true
	SightingTime=0.4500000
	SightOffset=(X=7.0000000,Y=-0.0500000,Z=10.2000000)
	MagAmmo=10
	ReloadAnimRate=1.5000000
	GunLength=32.0000000
	FireModeClass[0]=Class'BWBP_JCF_Pro.SPASPrimaryFire'
	FireModeClass[1]=Class'BWBP_JCF_Pro.SPASSecondaryFire'
	PutDownTime=0.5000000
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="SP-12 Shotgun||Manufacturer: Classic Weapons Industries|Primary: Pump Shot|Secondary: Semi-Auto Shot||The SP is  well known firearm brought back to life by Classic Weapons Industries. A highly accurate 12-gauge shotgun, the 8 shell SP 2 was originally produced by Enravion in the pre-war period. It was a formidible dual-mode shotgun that could be fired in both semi-automatic and pump-action firemodes. CWI has worked to improve this venerable classic and has overhauled the original pump action firemode for improved accuracy and range. Users have the option of quickly switching between these modes to deal with different tactical situations. Comes with a variety of pre-war attachments for all your shooting needs."
	Priority=36
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=7
	GroupOffset=31
	PickupClass=Class'BWBP_JCF_Pro.SPASPickup'
	PlayerViewOffset=(X=-6.0000000,Y=4.0000000,Z=-10.0000000)
	BobDamping=2.3500000
	AttachmentClass=Class'BWBP_JCF_Pro.SPASAttachment'
	IconMaterial=Texture'BWBP_JCF_Tex.SPAS.SmallIcon_SPAS'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=30)
	ItemName="SP-12 Compact Shotgun"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_JCF_Anims.SPAS_FPm'
}
