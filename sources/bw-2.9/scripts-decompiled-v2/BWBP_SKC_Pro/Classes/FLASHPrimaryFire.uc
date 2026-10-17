class FLASHPrimaryFire extends BallisticProProjectileFire;

var() Class<Actor> HatchSmokeClass;
var Actor HatchSmoke;
var() Sound SteamSound;

defaultproperties
{
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireRecoil=1024.0000000
	XInaccuracy=400.0000000
	YInaccuracy=400.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.M202-FireInc',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bSplashDamage=true
	bRecommendSplashDamage=true
	FireEndAnim="None"
	FireRate=0.7000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_FLASH'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=16.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.5000000
	ShakeOffsetMag=(X=-50.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1600.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=5.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.FLASHProjectile'
	BotRefireRate=0.7000000
	WarnTargetPct=1.0000000
}
