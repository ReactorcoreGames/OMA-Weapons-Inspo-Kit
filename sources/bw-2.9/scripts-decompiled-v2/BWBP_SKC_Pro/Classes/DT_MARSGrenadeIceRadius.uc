class DT_MARSGrenadeIceRadius extends DT_BWExplode
	config(BallisticProV55);

var() float ArmorDrain;

defaultproperties
{
	DeathStrings[0]="%k's cryo grenade put %o on ice."
	DeathStrings[1]="%o was turned into a snow-cone by %k's cryo grenade."
	SimpleKillString="MARS Ice Grenade Radius"
	FlashThreshold=25
	FlashV=(X=350.0000000,Y=350.0000000,Z=700.0000000)
	FlashF=0.2500000
	DamageIdent="Grenade"
	WeaponClass=Class'BWBP_SKC_Pro.MARSAssaultRifle'
	DeathString="%k's cryo grenade put %o on ice."
	FemaleSuicide="%o stayed out in the cold."
	MaleSuicide="%o stayed out in the cold."
	bDelayedDamage=true
	GibModifier=0.5000000
	GibPerterbation=0.4000000
	KDamageImpulse=15000.0000000
	VehicleDamageScaling=2.0000000
}
