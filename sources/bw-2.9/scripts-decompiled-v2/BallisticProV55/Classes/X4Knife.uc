class X4Knife extends BallisticMeleeWeapon
	config(BallisticProV55);

function byte BestMode()
{
	local Bot B;
	local float Result;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x86
	if(VSize(B.Enemy.Location - Instigator.Location) > (FireMode[0].MaxRange() * 1.5000000))
	{
		return 1;
	}
	Result = FRand();
	// End:0xEB
	if((Vector(B.Enemy.Rotation) Dot Normal(Instigator.Location - B.Enemy.Location)) < 0.0000000)
	{
		Result += 0.3000000;		
	}
	else
	{
		Result -= 0.3000000;
	}
	// End:0x109
	if(Result > 0.5000000)
	{
		return 1;
	}
	return 0;
	//return;	
}

function float SuggestAttackStyle()
{
	return 1.0000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -1.0000000;
	//return;	
}

defaultproperties
{
	bCanBlock=false
	SpecialInfo[0]=(Id="EvoDefs",Info="180.0;6.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BallisticProV55.X4WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.X4WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.X4WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.X4WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.X4.BigIcon_X4'
	BigIconCoords=(X1=0,Y1=48,X2=511,Y2=240)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.Knife.KnifePullOut',Volume=0.1090000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.Knife.KnifePutaway',Volume=0.1090000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.X3OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.X3InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=129,G=0,B=0,A=192),Color2=(R=0,G=196,B=0,A=192),StartSize1=99,StartSize2=107)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	ManualLines[0]="Slashes with the knife. Solid damage output and short range."
	ManualLines[1]="Prepared slash. Gains damage over hold time (maximum bonus reached after 1.5 seconds). Deals more damage from behind."
	ManualLines[2]=""
	bAimDisabled=true
	GunLength=0.0000000
	FireModeClass[0]=Class'BallisticProV55.X4PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.X4SecondaryFire'
	SelectAnimRate=1.2500000
	PutDownTime=0.2000000
	BringUpTime=0.2000000
	SelectForce="SwitchToAssaultRifle"
	bMeleeWeapon=true
	Description="Much like its predecessor, the X4 is a high quality weapon, manufactured by the renowned Enravion group. The X4 was designed for use in other combat situations, specifically for the Outworld's large urban and industrial sprawls. Made of tougher, heavier and more durable materials, the X4 is not as light or balanced as the X3, and is thus not an easy weapon to use for throwing purposes."
	Priority=13
	HudColor=(R=50,G=150,B=25,A=255)
	CenteredOffsetY=7.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	GroupOffset=3
	PickupClass=Class'BallisticProV55.X4Pickup'
	PlayerViewOffset=(X=4.0000000,Y=8.0000000,Z=-10.0000000)
	AttachmentClass=Class'BallisticProV55.X4Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.X4.SmallIcon_X4'
	IconCoords=(X1=0,Y1=0,X2=128,Y2=32)
	ItemName="X4 Knife"
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.X4_FPm'
	DrawScale=0.3000000
}
