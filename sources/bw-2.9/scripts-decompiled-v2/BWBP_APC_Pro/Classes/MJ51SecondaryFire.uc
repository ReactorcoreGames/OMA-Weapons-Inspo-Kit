class MJ51SecondaryFire extends BallisticProjectileFire;

var bool bLoaded;

simulated function bool CheckGrenade()
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	// End:0x79
	if(!MJ51Carbine(Weapon).bLoaded)
	{
		Weapon.GetAnimParams(Channel, seq, frame, Rate);
		// End:0x5B
		if(seq == MJ51Carbine(Weapon).GrenadeLoadAnim)
		{
			return false;
		}
		MJ51Carbine(Weapon).LoadGrenade();
		bIsFiring = false;
		return false;
	}
	return true;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x1A
	if(!CheckGrenade())
	{
		return;
	}
	super(BallisticFire).ModeDoFire();
	MJ51Carbine(Weapon).bLoaded = false;
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51AltFlashEmitter'
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	FireAnim="FireGrenade"
	FireForce="AssaultRifleAltFire"
	FireRate=0.6000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_G51Grenades'
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.G51Grenade_HE'
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
}
