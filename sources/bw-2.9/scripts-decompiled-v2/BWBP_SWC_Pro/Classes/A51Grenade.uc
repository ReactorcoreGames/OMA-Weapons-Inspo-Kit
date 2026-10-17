class A51Grenade extends BallisticHandGrenade
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

function DoExplosion()
{
	local A51AcidControl F;
	local Vector V;

	// End:0xD4
	if(int(Role) == int(ROLE_Authority))
	{
		SpecialHurtRadius(float(HeldDamage), float(HeldRadius), HeldDamageType, float(HeldMomentum), Location);
		CheckNoGrenades();
		// End:0x80
		if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
		{
			V = Location;
		}
		F = Spawn(Class'BWBP_SWC_Pro.A51AcidControl',,, Location, rot(0, 0, 0));
		F.Instigator = Instigator;
		F.Initialize(vect(0.0000000, 0.0000000, 1.0000000), 8);
	}
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	ClipReleaseTime = Level.TimeSeconds + 0.2000000;
	SetTimer(FuseDelay + 0.2000000, false);
	SpawnSmoke();
	bFireMode[0].EjectBrass();
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ClipReleaseSound);
	// End:0x74
	if(!IsFiring())
	{
		PlayAnim(ClipReleaseAnim, 1.0000000, 0.1000000);
	}
	//return;	
}

defaultproperties
{
	HeldDamage=200
	HeldRadius=250
	HeldMomentum=55000
	HeldDamageType=Class'BWBP_SWC_Pro.DTA51Held'
	GrenadeSmokeClass=Class'BallisticProV55.NRP57Trail'
	ClipReleaseSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806LSight',Volume=1.5000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PinPullSound=(Sound=Sound'2K4MenuSounds.Generic.msfxDrag',Volume=5.0000000,Radius=0.0000000,Slot=0,Pitch=0.0000000,bAtten=false,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;5.0;-999.0;25.0;-999.0;0.0;0.5")
	ParamsClasses[0]=Class'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_SWC_Pro.A51GrenadeWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SWC_Pro.A51GrenadeWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Pullout',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Putaway',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.NRP57OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.NRP57InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=255,B=0,A=128),Color2=(R=255,G=0,B=0,A=212),StartSize1=98,StartSize2=101)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Grenade=true
	FireModeClass[0]=Class'BWBP_SWC_Pro.A51PrimaryFire'
	FireModeClass[1]=Class'BWBP_SWC_Pro.A51SecondaryFire'
	SelectAnimRate=1.0000000
	BringUpTime=2.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.4000000
	CurrentRating=0.4000000
	Description="A51 Skrith Acid Grenade||Manufacturer: Unknown Skrith Engineers|Primary: Throw Grenade|Secondary: Roll Grenade|Special: Timed Detonation||Based on the same technology and chemicals sported by the A500 'Reptile' gun, the A51 grenade is often used by Skrith who want to wittle down their opponent's armor before attacking up close. Upon detonation, the A51 creates a pool of acid that eats through anything in its way. Whoever designed this clearly took the Skrith saying ''Don't just kill humans, make them suffer first'' to heart."
	Priority=124
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=0
	PickupClass=Class'BWBP_SWC_Pro.A51Pickup'
	PlayerViewOffset=(X=3.0000000,Y=10.0000000,Z=-12.0000000)
	PlayerViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	BobDamping=1.0000000
	AttachmentClass=Class'BWBP_SWC_Pro.A51Attachment'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="AD-51 Reptile Corrosive Grenade"
	DrawScale=0.4000000
}
