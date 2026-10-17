class M58Grenade extends BallisticHandGrenade
	config(BallisticProV55);

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
	bFireMode[0].ModeDoFire();
	//return;	
}

defaultproperties
{
	bCookable=false
	ClipReleaseSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PinPullSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-PinOut',Volume=0.1000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;0.0;0.0;-1.0;0.0;0.0;0.0")
	ParamsClasses[0]=Class'BallisticProV55.M58WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.M58WeaponParamsComp'
	ParamsClasses[2]=Class'BallisticProV55.M58WeaponParamsComp'
	ParamsClasses[3]=Class'BallisticProV55.M58WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.M58.BigIcon_M58'
	BigIconCoords=(X1=0,Y1=12,X2=511,Y2=240)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Pullout',Volume=0.1120000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Putaway',Volume=0.1110000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.NRP57OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=0,G=255,B=255,A=114),Color2=(R=255,G=255,B=255,A=148),StartSize1=96,StartSize2=46)
	FireModeClass[0]=Class'BallisticProV55.M58PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.M58SecondaryFire'
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.4000000
	CurrentRating=0.4000000
	Description="M58 Smoke Grenade||Manuacturer: UTC Defense Tech|Primary: Throw Grenade|Secondary: Roll Grenade|Special: Release Clip||Smoke grenades have been around since the 20th century, used for signaling troops or disguising movements through heavy smoke, they're extremely versatile. They're still in use today and the M58 Smoke Grenade is the latest model introduced by the UTC Defense Tech. Designed to spew out vivid gray smoke, the M58 allows the user to perform a wide range of activities from tactical retreats to confuse and disorient the enemy, and when used in tangent with thermal vision and good fire power, it can create ambushes as well. However, the smoke isn't damaging as well as having a short amount of time before the heavy cloud disperses, removing the element of surprise."
	Priority=3
	HudColor=(R=150,G=150,B=150,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=0
	GroupOffset=7
	PickupClass=Class'BallisticProV55.M58Pickup'
	PlayerViewOffset=(X=0.9500000,Y=7.5000000,Z=-9.0000000)
	PlayerViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	AttachmentClass=Class'BallisticProV55.M58Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.M58.SmallIcon_M58'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="M58 Smoke Grenade"
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.T10_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BW_Core_WeaponTex.M58.M58GrenadeSkin'
}
