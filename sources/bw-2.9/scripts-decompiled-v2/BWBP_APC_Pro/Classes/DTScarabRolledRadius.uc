class DTScarabRolledRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o walked down the street, failing to see %k's rolling Scarabs."
	DeathStrings[1]="%k bowled a Scarab towards %o's direction, getting an explosive strike."
	InvasionDamageScaling=3.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BWBP_APC_Pro.ScarabGrenade'
	DeathString="%k rolled a pineapple into %o's town."
	FemaleSuicide="%o blew herself apart with a pineapple."
	MaleSuicide="%o blew himself apart with a pineapple."
	bDelayedDamage=true
	VehicleDamageScaling=1.5000000
	VehicleMomentumScaling=0.3500000
}
