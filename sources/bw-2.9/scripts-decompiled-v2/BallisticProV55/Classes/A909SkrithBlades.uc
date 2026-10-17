class A909SkrithBlades extends BallisticMeleeWeapon
	config(BallisticProV55);

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

simulated function bool ConsumeAmmo(int Mode, float load, optional bool bAmountNeededIsMax)
{
	return true;
	//return;	
}

simulated function Notify_A909HackRight()
{
	A909PrimaryFire(FireMode[0]).bFireNotified = true;
	FireMode[0].ModeDoFire();
	//return;	
}

simulated function Notify_A909HackLeft()
{
	A909PrimaryFire(FireMode[0]).bFireNotified = true;
	FireMode[0].ModeDoFire();
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x5A
	if((Anim == FireMode[0].FireAnim) && FireMode[0].bIsFiring)
	{
		FireMode[0].PlayFiring();		
	}
	else
	{
		super.AnimEnd(Channel);
	}
	//return;	
}

defaultproperties
{
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;2.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BallisticProV55.A909WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.A909WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.A909WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.A909WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_A909'
	BigIconCoords=(X1=24,Y1=48,X2=432,Y2=212)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.A909.A909Pullout',Volume=0.1050000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.A909.A909Putaway',Volume=0.1050000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.X3OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.X3InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=0,B=0,A=255),Color2=(R=0,G=255,B=0,A=255),StartSize1=108,StartSize2=101)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	ManualLines[0]="Thrusting attack with the blades. Good range, but requires accuracy to hit. The first strike requires twice as long to complete as subsequent strikes. This attack has the highest sustained damage output of all melee weapons."
	ManualLines[1]="Prepares a slash, which will be executed upon release. The damage of this slash increases the longer altfire is held, up to 1.5 seconds for maximum damage output. This attack inflicts more damage from behind."
	ManualLines[2]="The Weapon Function key allows the player to block. Whilst blocking, no attacks are possible, but all melee damage striking the player frontally will be mitigated.||The A909s have extreme damage output at close range, but their short range makes realizing this potential difficult.||The player moves faster with the blades equipped."
	bAimDisabled=true
	GunLength=0.0000000
	FireModeClass[0]=Class'BallisticProV55.A909PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.A909SecondaryFire'
	PutDownAnimRate=2.2000000
	PutDownTime=0.2000000
	BringUpTime=0.2000000
	SelectForce="SwitchToAssaultRifle"
	bMeleeWeapon=true
	Description="The A909 Skrith Blades are a common Skrith melee weapon. They were a terrible bane of the human armies during the first war. The Skrith used them ruthlessly and with great skill to viciously slice up their enemies. Though the blades are useless at range, they are capable of great harm if the user can sneak up on an opponent. All or most Skrith warriors seem to prefer melee battle, and as such hone their skill with close range weapons. The blades can be extremely deadly when close up, as they can jab and slice very fast."
	Priority=13
	HudColor=(R=200,G=200,B=255,A=255)
	CenteredOffsetY=7.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	GroupOffset=2
	PickupClass=Class'BallisticProV55.A909Pickup'
	PlayerViewOffset=(X=41.4000000,Y=-3.2400000,Z=-4.8600000)
	AttachmentClass=Class'BallisticProV55.A909Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_A909'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="A909 Skrith Blades"
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.A909_FPm'
	DrawScale=0.3000000
}
