class A2WSkrithLance extends BallisticWeapon
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

var Actor GlowFX;

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x22
	if(GlowFX != none)
	{
		GlowFX.Destroy();
	}
	// End:0x93
	if((Instigator.IsLocallyControlled() && int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2)
	{
		GlowFX = none;
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GlowFX, Class'BWBP_SWC_Pro.A2WAmbientFX', DrawScale, self, 'Weapon');
	}
	//return;	
}

simulated event Destroyed()
{
	// End:0x17
	if(GlowFX != none)
	{
		GlowFX.Destroy();
	}
	super.Destroyed();
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
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x41
	if((B == none) || B.Enemy == none)
	{
		return super.GetAIRating();
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = super.GetAIRating();
	// End:0xAB
	if(Vehicle(B.Enemy) != none)
	{
		Result *= float(2);
	}
	Result += ((dist - float(1000)) / float(2000));
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.8000000;
	//return;	
}

defaultproperties
{
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;-15.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BWBP_SWC_Pro.A2WWeaponParams'
	ParamsClasses[1]=Class'BWBP_SWC_Pro.A2WWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SWC_Pro.A2WWeaponParamsRealistic'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_A42'
	BigIconCoords=(X1=80,Y1=24,X2=410,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-Pullout',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-Putaway',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bNoCrosshairInScope=true
	bNonCocking=true
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc7',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc10',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=89,G=44,B=160,A=137),Color2=(R=0,G=255,B=151,A=202),StartSize1=84,StartSize2=61)
	NDCrosshairInfo=(SpreadRatios=(X1=0.3000000,Y1=0.3000000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=3.0000000,CurrentScale=0.0000000)
	NDCrosshairChaosFactor=0.7000000
	MeleeFireClass=Class'BWBP_SWC_Pro.A2WMeleeFire'
	bWT_RapidProj=true
	bWT_Energy=true
	ManualLines[0]=""
	ManualLines[1]=""
	ManualLines[2]=""
	SightOffset=(X=-24.0000000,Y=-0.5000000,Z=18.0000000)
	MagAmmo=40
	FireModeClass[0]=Class'BWBP_SWC_Pro.A2WPrimaryFire'
	FireModeClass[1]=Class'BWBP_SWC_Pro.A2WSecondaryFire'
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	bShowChargingBar=true
	Priority=16
	HudColor=(R=100,G=175,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=5
	PickupClass=Class'BWBP_SWC_Pro.A2WPickup'
	PlayerViewOffset=(X=3.0000000,Y=10.0000000,Z=-15.0000000)
	AttachmentClass=Class'BWBP_SWC_Pro.A2WAttachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_A42'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="[B] A2-W Skrith Lance"
	LightType=2
	LightEffect=13
	LightHue=180
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	DrawScale=0.3000000
	SoundPitch=56
	SoundRadius=32.0000000
}
