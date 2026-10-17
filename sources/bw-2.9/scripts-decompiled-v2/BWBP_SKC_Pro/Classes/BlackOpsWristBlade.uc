class BlackOpsWristBlade extends BallisticMeleeWeapon
	config(BallisticProV55);

var bool bSingle;

simulated function OnWeaponParamsChanged()
{
	super(BallisticWeapon).OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bSingle = false;
	// End:0x43
	if(InStr(WeaponParams.LayoutTags, "single") != -1)
	{
		bSingle = true;
	}
	//return;	
}

function bool CanAttack(Actor Other)
{
	return true;
	//return;	
}

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

function float GetAIRating()
{
	local Bot B;
	local float Result, dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return AIRating;
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = AIRating;
	// End:0x9C
	if(dist > float(1500))
	{
		return 0.1000000;
	}
	// End:0xE4
	if((Vector(B.Enemy.Rotation) Dot Normal(Dir)) < 0.0000000)
	{
		Result += (0.0800000 * B.Skill);
	}
	// End:0x153
	if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
	{
		Result = FMax(0.0000000, Result *= (0.7000000 - (dist / float(1000))));		
	}
	else
	{
		Result = FMax(0.0000000, Result *= (float(1) - (dist / float(1000))));
	}
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
	return AIController(Instigator.Controller).Skill / float(4);
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
	Result *= (float(1) - (dist / float(1500)));
	return FClamp(Result, -1.0000000, -0.3000000);
	//return;	
}

defaultproperties
{
	SpecialInfo[0]=(Id="EvoDefs",Info="360.0;10.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.BlkOpsBlade.BigIcon_WristBld'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.EKS43.EKS-Pullout',Volume=0.1050000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.EKS43.EKS-Putaway',Volume=0.1050000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.X3OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50In',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=0,G=64,B=159,A=255),Color2=(R=255,G=255,B=255,A=255),StartSize1=98,StartSize2=101)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	PlayerSpeedFactor=1.1000000
	MagAmmo=1
	GunLength=0.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.BlackOpsWristBladePrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.BlackOpsWristBladeSecondaryFire'
	PutDownTime=0.5000000
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.3000000
	CurrentRating=0.3000000
	bMeleeWeapon=true
	Description="X5W Black Ops Wrist Blade||Manufacturer: Enravion Combat Solutions|Primary: Slash|Secondary: Prepared Slash|Special: Block||A rare variant of the X5 short combat sword, the X5W is a special edition wrist blade developed for the UTC Black Ops paramilitary forces. Given to the elite assassination squads during the Skrith wars, this blade proved itself many times in close quarters combat. It is constructed using modern forging techniques and the highest quality materials, is built to last and is one of the only blades capable of standing its own against a charging Skrith warrior. Don't leave home without one."
	Priority=12
	CenteredOffsetY=7.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	GroupOffset=5
	PickupClass=Class'BWBP_SKC_Pro.BlackOpsWristBladePickup'
	PlayerViewOffset=(X=50.0000000,Y=0.0000000,Z=-40.0000000)
	BobDamping=1.0000000
	AttachmentClass=Class'BWBP_SKC_Pro.BlackOpsWristBladeAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.BlkOpsBlade.SmallIcon_WristBld'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="X5W Black Ops Blade"
	Mesh=SkeletalMesh'BWBP_SKC_Anim.BOB_FPm'
	DrawScale=1.2500000
}
