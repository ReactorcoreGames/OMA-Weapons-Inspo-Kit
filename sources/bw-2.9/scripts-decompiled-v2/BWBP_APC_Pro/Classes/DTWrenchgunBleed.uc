class DTWrenchgunBleed extends DT_BWMiscDamage
	config(BallisticProV55);

var() float ArmorDrain;

defaultproperties
{
	DeathStrings[0]="%o bled to death from %k's fragmented wrench shot."
	SimpleKillString="Redwood Wrenchgun Bleed"
	FlashThreshold=0
	FlashV=(X=350.0000000,Y=0.0000000,Z=0.0000000)
	FlashF=0.7000000
	bDetonatesBombs=false
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BWBP_APC_Pro.Wrenchgun'
	DeathString="%o bled to death from %k's fragmented wrench shot."
	FemaleSuicide="%o doesn't know how to aim."
	MaleSuicide="%o can't aim very well."
	bArmorStops=false
	bLocationalHit=false
	bDelayedDamage=true
	bNeverSevers=true
	GibModifier=1.5000000
	GibPerterbation=0.4000000
	KDamageImpulse=15000.0000000
	VehicleDamageScaling=0.0000000
}
