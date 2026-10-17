class TAC30PrimaryFire extends BallisticProjectileFire;

var() Sound SuperFireSound;
var() Sound FabulousFireSound;

simulated function DestroyEffects()
{
	// End:0x17
	if(MuzzleFlash != none)
	{
		MuzzleFlash.Destroy();
	}
	super(BallisticFire).DestroyEffects();
	//return;	
}

defaultproperties
{
	SuperFireSound=Sound'BWBP_SKC_Sounds.Misc.SRAC-Fire'
	FabulousFireSound=Sound'BWBP_SKC_Sounds.M1911.M1911-Fire2'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	BrassClass=Class'BWBP_SKC_Pro.Brass_FRAGSpent'
	BrassOffset=(X=-1.0000000,Y=0.0000000,Z=-1.0000000)
	bCockAfterEmpty=true
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	XInaccuracy=32.0000000
	YInaccuracy=32.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.SRAC-Fire',Volume=1.7500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	FireEndAnim="None"
	FireRate=0.8000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_20mmGrenade'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-12.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.TAC30Projectile'
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
}
