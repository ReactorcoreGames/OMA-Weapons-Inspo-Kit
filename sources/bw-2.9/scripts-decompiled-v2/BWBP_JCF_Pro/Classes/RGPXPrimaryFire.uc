class RGPXPrimaryFire extends BallisticProProjectileFire;

simulated event ModeDoFire()
{
	// End:0x10
	if(!AllowFire())
	{
		return;		
	}
	else
	{
		super.ModeDoFire();
		RGPXBazooka(BW).HideMiniRockets();
	}
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	MuzzleFlashClass=Class'BWBP_JCF_Pro.RGPXFlashEmitter'
	FlashScaleFactor=2.0000000
	FireRecoil=64.0000000
	FireChaos=0.5000000
	XInaccuracy=4.0000000
	YInaccuracy=4.0000000
	BallisticFireSound=(Sound=Sound'BWBP_JCF_Sounds.RGX.RGX_Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	FireEndAnim="None"
	FireRate=0.8000000
	AmmoClass=Class'BallisticProV55.Ammo_RPG'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=16.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.5000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.5000000
	ProjectileClass=Class'BWBP_JCF_Pro.RGPXRocket'
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
}
