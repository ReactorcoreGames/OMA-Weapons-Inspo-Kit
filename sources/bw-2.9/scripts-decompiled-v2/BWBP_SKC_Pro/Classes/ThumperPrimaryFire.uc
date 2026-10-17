class ThumperPrimaryFire extends BallisticProProjectileFire;

defaultproperties
{
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireChaos=0.7000000
	XInaccuracy=64.0000000
	YInaccuracy=64.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-Fire',Volume=3.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	PreFireAnim="None"
	FireForce="AssaultRifleAltFire"
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_ThumperGrenades'
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.ThumperGrenade'
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
}
