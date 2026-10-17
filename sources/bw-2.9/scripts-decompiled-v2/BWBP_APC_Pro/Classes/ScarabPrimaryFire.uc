class ScarabPrimaryFire extends BallisticHandGrenadeFire;

defaultproperties
{
	NoClipPreFireAnim="ThrowNoClip"
	SpawnOffset=(X=25.0000000,Y=10.0000000,Z=2.0000000)
	BrassClass=Class'BallisticProV55.Brass_GClip'
	BrassBone="tip"
	BrassOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	BallisticFireSound=(Sound=Sound'BWBP_APC_Sounds.CruGren.CruGren-Throw',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	PreFireAnim="PrepThrow"
	FireAnim="Throw"
	AmmoClass=Class'BallisticProV55.Ammo_Pineapple'
	ShakeRotMag=(X=32.0000000,Y=8.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	ProjectileClass=Class'BWBP_APC_Pro.ScarabThrown'
	BotRefireRate=0.4000000
	WarnTargetPct=0.7500000
}
