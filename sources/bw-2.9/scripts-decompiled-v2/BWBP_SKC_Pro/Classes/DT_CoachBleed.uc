class DT_CoachBleed extends DT_BWMiscDamage
	config(BallisticProV55);

var() float ArmorDrain;

defaultproperties
{
	DeathStrings[0]="%o haemorrhaged from %k's coach gun shot."
	SimpleKillString="Redwood Coach Gun Bleed"
	FlashThreshold=0
	FlashV=(X=350.0000000,Y=0.0000000,Z=0.0000000)
	FlashF=0.7000000
	bDetonatesBombs=false
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BWBP_SKC_Pro.CoachGun'
	DeathString="%o haemorrhaged from %k's coach gun shot."
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
