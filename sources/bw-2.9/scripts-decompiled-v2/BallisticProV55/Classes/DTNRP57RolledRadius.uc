class DTNRP57RolledRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k rolled a pineapple into %o's town."
	DeathStrings[1]="%o tripped on %k's patroling pineapple."
	InvasionDamageScaling=3.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BallisticProV55.NRP57Grenade'
	DeathString="%k rolled a pineapple into %o's town."
	FemaleSuicide="%o blew herself apart with a pineapple."
	MaleSuicide="%o blew himself apart with a pineapple."
	bDelayedDamage=true
	VehicleDamageScaling=1.5000000
	VehicleMomentumScaling=0.3500000
}
