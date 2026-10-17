class SRKSmgSecondaryFire extends BallisticProjectileFire;

var bool bLoaded;

simulated function bool CheckGrenade()
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	// End:0x79
	if(!SRKSubMachinegun(Weapon).bLoaded)
	{
		Weapon.GetAnimParams(Channel, seq, frame, Rate);
		// End:0x5B
		if(seq == SRKSubMachinegun(Weapon).GrenadeLoadAnim)
		{
			return false;
		}
		SRKSubMachinegun(Weapon).LoadGrenade();
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
	SRKSubMachinegun(Weapon).bLoaded = false;
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	MuzzleFlashClass=Class'BWBP_APC_Pro.SRKSmgAltFlashEmitter'
	AimedFireAnim="GrenadeFireSight"
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	FireAnim="GrenadeFire"
	FireForce="AssaultRifleAltFire"
	FireRate=0.6000000
	AmmoClass=Class'BWBP_APC_Pro.Ammo_SHADRACH'
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_APC_Pro.SHADRACHRifleGrenade'
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
}
