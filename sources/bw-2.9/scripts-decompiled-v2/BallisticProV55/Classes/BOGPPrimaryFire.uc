class BOGPPrimaryFire extends BallisticProProjectileFire;

var() FullSound FlareFireSound;

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x28
	if(!BOGPPistol(BW).CheckGrenade())
	{
		return;
	}
	super.ModeDoFire();
	//return;	
}

function PlayFiring()
{
	BOGPPistol(Weapon).bHideHead = true;
	super(BallisticFire).PlayFiring();
	//return;	
}

defaultproperties
{
	FlashBone="Muzzle"
	bCockAfterFire=true
	bUseWeaponMag=false
	bTossed=true
	bModeExclusive=false
	FireForce="AssaultRifleAltFire"
	AmmoClass=Class'BallisticProV55.Ammo_BOGPGrenades'
	ShakeRotMag=(X=64.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=960.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.3000000
}
