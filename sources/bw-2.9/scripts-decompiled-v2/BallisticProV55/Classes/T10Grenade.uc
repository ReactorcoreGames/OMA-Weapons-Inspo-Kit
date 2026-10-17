class T10Grenade extends BallisticHandGrenade
	config(BallisticProV55);

simulated function DoExplosionEffects()
{
	//return;	
}

simulated function DoExplosion()
{
	// End:0x16
	if(int(Role) == int(ROLE_Authority))
	{
		CheckNoGrenades();
	}
	//return;	
}

simulated function ExplodeInHand()
{
	ClipReleaseTime = 666.0000000;
	KillSmoke();
	SetBoneScale(2, 1.0000000, ClipBone);
	HandExplodeTime = Level.TimeSeconds;
	// End:0x95
	if(IsFiring())
	{
		FireMode[0].HoldTime = 0.0000000;
		FireMode[0].bIsFiring = false;
		FireMode[1].HoldTime = 0.0000000;
		FireMode[1].bIsFiring = false;		
	}
	else
	{
		FireMode[0].HoldTime = 0.0000000;
		FireMode[0].ModeDoFire();
		FireMode[0].bIsFiring = false;
	}
	// End:0xED
	if(int(Role) == int(ROLE_Authority))
	{
		DoExplosionEffects();
		MakeNoise(1.0000000);
	}
	SetTimer(0.1000000, false);
	//return;	
}

defaultproperties
{
	FuseDelay=2.0000000
	ClipReleaseSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PinPullSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-PinOut',Volume=0.1000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;0.0;0.0;-1.0;0.0;0.0;0.0")
	ParamsClasses[0]=Class'BallisticProV55.T10WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.T10WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.T10WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.T10WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_T10'
	BigIconCoords=(X1=0,Y1=12,X2=511,Y2=240)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Pullout',Volume=0.1120000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Putaway',Volume=0.1110000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.NRP57OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=0,G=255,B=0,A=128),Color2=(R=255,G=255,B=255,A=130),StartSize1=98,StartSize2=54)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Grenade=true
	ManualLines[0]="Throws a grenade overarm. Upon expiry of the 2 second fuse, the grenade emits clouds of toxic gas which linger for some time, inflicting good damage to nearby organic targets."
	ManualLines[1]="As primary, except the throw is underarm."
	ManualLines[2]="As with all grenades, Reload and Weapon Function keys will remove the pin. With the T10 this is important, as throwing a grenade when the fuse is about to expire leads to the grenade spreading gas as it travels in the air, granting greater coverage. Overcooking the grenade will result in the gassing of the user. Effective in corridors and against static positions."
	FireModeClass[0]=Class'BallisticProV55.T10PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.T10SecondaryFire'
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	Description="A recent addition to the Terran arsenal, the T10 toxin grenade was designed primarily for anti-Krao missions in underground facilities. When the clip is released, the grenade will start to release toxic fumes and dangerous gasses until depleted. The grenade can still roll or fly, whilst releasing toxic vapours. This becomes useful for clearing out passageways or small rooms and leaving no room for the enemy to breathe."
	Priority=3
	HudColor=(R=50,G=150,B=25,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=0
	GroupOffset=6
	PickupClass=Class'BallisticProV55.T10Pickup'
	PlayerViewOffset=(X=0.9500000,Y=7.5000000,Z=-9.0000000)
	PlayerViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	AttachmentClass=Class'BallisticProV55.T10Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_T10'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="T10 Toxic Grenade"
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.T10_FPm'
	DrawScale=0.3000000
}
