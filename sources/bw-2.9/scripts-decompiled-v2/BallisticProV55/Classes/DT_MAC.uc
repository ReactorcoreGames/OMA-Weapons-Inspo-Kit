class DT_MAC extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was completely obliterated by %k's HAMR cannon."
	DeathStrings[1]="%k used a HAMR cannon to reduce %o to a fine paste."
	DeathStrings[2]="%o accidentally swallowed %k's incoming HAMR shell."
	DeathStrings[3]="%k launched a HAMR round straight into %o's ear."
	DisplacementType=1
	AimDisplacementDamageThreshold=150
	InvasionDamageScaling=2.0000000
	DamageIdent="Ordnance"
	WeaponClass=Class'BallisticProV55.MACWeapon'
	DeathString="%o was completely obliterated by %k's HAMR cannon."
	FemaleSuicide="%o totally eradicated herself with her HAMR."
	MaleSuicide="%o totally eradicated himself with his HAMR."
	bDelayedDamage=true
	bExtraMomentumZ=true
	VehicleDamageScaling=1.5000000
}
