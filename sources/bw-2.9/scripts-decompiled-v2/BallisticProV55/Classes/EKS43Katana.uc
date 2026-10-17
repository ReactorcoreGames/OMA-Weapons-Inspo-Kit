class EKS43Katana extends BallisticMeleeWeapon
	config(BallisticProV55);

var() bool bIsSuperHeated;

simulated function OnWeaponParamsChanged()
{
	super(BallisticWeapon).OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bIsSuperHeated = false;
	// End:0x48
	if(InStr(WeaponParams.LayoutTags, "superheated") != -1)
	{
		bIsSuperHeated = true;
	}
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

defaultproperties
{
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;10.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BallisticProV55.EKS43WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.EKS43WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.EKS43WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.EKS43WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_EKS43'
	BigIconCoords=(X1=0,Y1=32,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.EKS43.EKS-Pullout',Volume=0.2090000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.EKS43.EKS-Putaway',Volume=0.2090000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.X3OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.X3InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=64,B=159,A=255),Color2=(R=255,G=255,B=255,A=255),StartSize1=98,StartSize2=101)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	ManualLines[0]="Slashes with the katana. Has a relatively long range and good damage, but a poor swing rate."
	ManualLines[1]="Prepares a slash, which will be executed upon release. The damage of this slash increases the longer altfire is held, up to 1.5 seconds for maximum damage output. This attack inflicts more damage from behind."
	ManualLines[2]="The Weapon Function key allows the player to block. Whilst blocking, no attacks are possible, but all melee damage striking the player frontally will be mitigated.||The EKS-43 is effective at close range, but has lower DPS than shorter ranged melee weapons."
	bAimDisabled=true
	GunLength=0.0000000
	FireModeClass[0]=Class'BallisticProV55.EKS43PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.EKS43SecondaryFire'
	SelectAnimRate=1.5000000
	PutDownAnimRate=1.5000000
	SelectForce="SwitchToAssaultRifle"
	bMeleeWeapon=true
	Description="The EKS-43 sword is one of a few weapons produced by Enravion, not designed for widescale military use. It is an expenisve artefact preferred by collectors and other rare procurers. The blade is forged by the use of both ancient techniques and the most modern technology, making it a mighty weapon with incredible sharpness and legendary Enravion strength. Civilians use the weapon for various training and other personal purposes, while several mercenary groups, most notably, the highly skilled 'Apocalytes', adopted the weapon for use with their more skilled warriors."
	Priority=12
	HudColor=(R=200,G=200,B=255,A=255)
	CenteredOffsetY=7.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	GroupOffset=1
	PickupClass=Class'BallisticProV55.EKS43Pickup'
	PlayerViewOffset=(X=7.2000000,Y=0.0000000,Z=-21.6000000)
	AttachmentClass=Class'BallisticProV55.EKS43Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_EKS43'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="EKS-43 Katana"
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.EKS43_FPm'
	DrawScale=0.3000000
}
