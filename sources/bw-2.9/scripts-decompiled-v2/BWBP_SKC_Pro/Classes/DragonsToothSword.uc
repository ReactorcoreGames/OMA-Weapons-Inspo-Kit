class DragonsToothSword extends BallisticMeleeWeapon
	config(BallisticProV55);

var Actor BladeGlow;
var Sound LoopAmbientSound;
var() bool bIsRed;
var() bool bIsBlack;
var() bool bIsGold;
var() FullSound ToothUpSound;
var() FullSound ToothDownSound;

simulated function OnWeaponParamsChanged()
{
	super(BallisticWeapon).OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bIsRed = false;
	bIsBlack = false;
	bIsGold = false;
	// End:0x50
	if(InStr(WeaponParams.LayoutTags, "red") != -1)
	{
		bIsRed = true;
	}
	// End:0x79
	if(InStr(WeaponParams.LayoutTags, "black") != -1)
	{
		bIsBlack = true;
	}
	// End:0xA1
	if(InStr(WeaponParams.LayoutTags, "gold") != -1)
	{
		bIsGold = true;
	}
	//return;	
}

simulated function Notify_ToothUp()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ToothUpSound);
	//return;	
}

simulated function Notify_ToothDown()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ToothDownSound);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super(BallisticWeapon).BringUp(PrevWeapon);
	// End:0x68
	if((Instigator.PlayerReplicationInfo != none) && Instigator.PlayerReplicationInfo.Team != none)
	{
		// End:0x68
		if(bIsRed)
		{
			// End:0x68
			if(ThirdPersonActor != none)
			{
				DragonsToothAttachment(ThirdPersonActor).bRedTeam = true;
			}
		}
	}
	Instigator.AmbientSound = LoopAmbientSound;
	Instigator.SoundVolume = byte(255);
	Instigator.SoundPitch = 48;
	Instigator.SoundRadius = 128.0000000;
	Instigator.bFullVolume = true;
	//return;	
}

simulated function bool PutDown()
{
	// End:0xA8
	if(super(BallisticWeapon).PutDown())
	{
		// End:0x20
		if(BladeGlow != none)
		{
			BladeGlow.Destroy();
		}
		Instigator.AmbientSound = none;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		Instigator.SoundPitch = Instigator.default.SoundPitch;
		Instigator.SoundRadius = Instigator.default.SoundRadius;
		Instigator.bFullVolume = Instigator.default.bFullVolume;
		return true;
	}
	return false;
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(BladeGlow != none)
	{
		BladeGlow.Destroy();
	}
	// End:0xB1
	if(Instigator.AmbientSound != none)
	{
		Instigator.AmbientSound = none;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		Instigator.SoundPitch = Instigator.default.SoundPitch;
		Instigator.SoundRadius = Instigator.default.SoundRadius;
		Instigator.bFullVolume = Instigator.default.bFullVolume;
	}
	super(BallisticWeapon).Destroyed();
	//return;	
}

simulated function BladeEffectStart()
{
	// End:0x30
	if(bIsRed)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(BladeGlow, Class'BWBP_SKC_Pro.DragonsToothBladeEffectR', DrawScale, self, 'BladeBase');		
	}
	else
	{
		// End:0x6C
		if(!bIsBlack && !bIsGold)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(BladeGlow, Class'BWBP_SKC_Pro.DragonsToothBladeEffect', DrawScale, self, 'BladeBase');
		}
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
	LoopAmbientSound=Sound'BWBP_SKC_Sounds.DTS.DragonsTooth-Loop'
	ToothUpSound=(Sound=Sound'BWBP_SKC_Sounds.DTS.DragonsTooth-Up',Volume=1.1900000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ToothDownSound=(Sound=Sound'BWBP_SKC_Sounds.DTS.DragonsTooth-Down',Volume=1.2130000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	BlockIdleAnim="bLock"
	SpecialInfo[0]=(Id="EvoDefs",Info="420.0;20.0;-999.0;-1.0;-999.0;0.9;-999.0")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.DragonsToothWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.DragonsToothWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.DragonsToothWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.DragonToothSword.BigIcon_DTS'
	BigIconCoords=(X1=0,Y1=40,X2=511,Y2=240)
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.DTS.DragonsTooth-Draw',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.X3OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc11',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=207,B=0,A=255),Color2=(R=71,G=27,B=255,A=93),StartSize1=98,StartSize2=101)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	ManualLines[0]="Strikes once for fatal damage. Has a good range but a very slow swing rate."
	ManualLines[1]="Strikes twice consecutively for good damage. Good for baiting block."
	ManualLines[2]="The Weapon Function key allows the Nanoblade to block incoming frontal melee attacks.||Devastating at close range."
	bAimDisabled=true
	GunLength=0.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.DragonsToothPrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.DragonsToothSecondaryFire'
	SelectAnim="PulloutFancy"
	SelectAnimRate=1.2500000
	PutDownTime=0.5000000
	BringUpTime=0.7000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bMeleeWeapon=true
	Description="The Dragon Nanoblade is a technological marvel. A weapon consisting of a nanotechnologically created blade which is dynamically 'forged' on command into a non-eutactic solid. Nanoscale whetting devices ensure that the blade is both unbreakable and lethally sharp. The true weapon of a modern warrior."
	Priority=12
	HudColor=(R=75,G=125,B=255,A=255)
	CenteredOffsetY=7.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	GroupOffset=5
	PickupClass=Class'BWBP_SKC_Pro.DragonsToothPickup'
	PlayerViewOffset=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
	BobDamping=1.0000000
	AttachmentClass=Class'BWBP_SKC_Pro.DragonsToothAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.DragonToothSword.SmallIcon_DTS'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="XM300 Dragon Nanoblade"
	Mesh=SkeletalMesh'BWBP_SKC_Anim.DTS_FPm'
	DrawScale=1.2500000
	SoundRadius=32.0000000
}
