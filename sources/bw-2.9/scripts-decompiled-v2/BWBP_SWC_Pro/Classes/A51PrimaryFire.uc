class A51PrimaryFire extends BallisticHandGrenadeFire;

defaultproperties
{
	NoClipPreFireAnim="ThrowNoClip"
	SpawnOffset=(X=25.0000000,Y=10.0000000,Z=2.0000000)
	BrassBone="tip"
	BrassOffset=(X=-20.0000000,Y=0.0000000,Z=-2.0000000)
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Throw',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	PreFireAnim="PrepThrow"
	FireAnim="Throw"
	AmmoClass=Class'BWBP_SWC_Pro.Ammo_A51Grenades'
	ShakeRotMag=(X=32.0000000,Y=8.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	ProjectileClass=Class'BWBP_SWC_Pro.A51Thrown'
}
