class HB4PrimaryFire extends BallisticProProjectileFire;

defaultproperties
{
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	MuzzleFlashClass=Class'BWBP_APC_Pro.HB4FlashEmitter'
	FlashScaleFactor=0.4000000
	AimedFireAnim="SightFire"
	FireRecoil=768.0000000
	FireChaos=0.6500000
	BallisticFireSound=(Sound=Sound'BWBP_APC_Sounds.EP110.EP110-Fire',Volume=9.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	bModeExclusive=false
	FireForce="AssaultRifleAltFire"
	FireRate=0.8500000
	AmmoClass=Class'BWBP_APC_Pro.Ammo_HB4Blaster'
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_APC_Pro.HB4PulseProjectile'
	BotRefireRate=0.5000000
	WarnTargetPct=0.7500000
}
