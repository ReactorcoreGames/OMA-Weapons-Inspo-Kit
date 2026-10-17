class MGLPrimaryFire extends BallisticProProjectileFire;

defaultproperties
{
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	AimedFireAnim="SightFire"
	FireRecoil=768.0000000
	FireChaos=0.6500000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.MGL.MGL-Fire',Volume=9.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	bModeExclusive=false
	FireForce="AssaultRifleAltFire"
	FireRate=0.8500000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_MGL'
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-400.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.MGLGrenade'
	BotRefireRate=0.5000000
	WarnTargetPct=0.7500000
}
