class DTScarabGrenadeRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o discovered a nest of %k's Scarabs way too late."
	DeathStrings[1]="%Surprise, %o! It's a swarm of scarabs courtesy of %k!"
	DeathStrings[2]="%o couldn't get enough pineapples, so %k brought a Scarab as a gift."
	InvasionDamageScaling=3.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BWBP_APC_Pro.ScarabGrenade'
	DeathString="%o discovered one of %k's lurking pineapples."
	FemaleSuicide="%o blew herself apart with a pineapple."
	MaleSuicide="%o blew himself apart with a pineapple."
	bDelayedDamage=true
	VehicleDamageScaling=1.5000000
	VehicleMomentumScaling=0.3500000
}
