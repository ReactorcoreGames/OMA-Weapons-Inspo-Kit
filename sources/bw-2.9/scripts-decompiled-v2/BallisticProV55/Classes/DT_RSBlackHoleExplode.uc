class DT_RSBlackHoleExplode extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was annihilated by a black hole."
	FemaleSuicides[0]="%o was caught up in an exploding black hole."
	FemaleSuicides[1]="%o got blown into many tiny pieces by a vortex."
	FemaleSuicides[2]="%o found herself getting nebulised by a collapsing black hole."
	MaleSuicides[0]="%o was caught up in an exploding black hole."
	MaleSuicides[1]="%o got blown into many tiny pieces by a vortex."
	MaleSuicides[2]="%o found himself getting nebulised by a collapsing black hole."
	SimpleKillString="Black Hole Explosion"
	FlashThreshold=0
	FlashF=0.3500000
	DamageIdent="Energy"
	WeaponClass=Class'BallisticProV55.RSDarkStar'
	DeathString="%k's black hole explosion blew %o away."
	FemaleSuicide="%o got torn to skinny ribbons by a black hole."
	MaleSuicide="%o got torn to skinny ribbons by a black hole"
	GibModifier=1.5000000
	VehicleDamageScaling=2.0000000
	VehicleMomentumScaling=1.5000000
}
