class A2WPrimaryFire extends BallisticProInstantFire;

defaultproperties
{
	TraceRange=(Min=8000.0000000,Max=8000.0000000)
	WallPenetrationForce=8.0000000
	Damage=50.0000000
	PenetrateForce=140
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	FlashScaleFactor=0.1000000
	FireRecoil=150.0000000
	FireChaos=0.3000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-SecFire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireRate=0.3000000
	AmmoClass=Class'BallisticProV55.Ammo_Cells'
	ShakeRotMag=(X=200.0000000,Y=16.0000000,Z=0.0000000)
	ShakeRotRate=(X=5000.0000000,Y=5000.0000000,Z=5000.0000000)
	ShakeRotTime=1.0000000
	ShakeOffsetMag=(X=-2.5000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-500.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.0000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
	aimerror=800.0000000
}
