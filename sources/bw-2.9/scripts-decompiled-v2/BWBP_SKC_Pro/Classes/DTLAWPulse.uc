class DTLAWPulse extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o got %vh neurons scrambled by %k's LAW pulse."
	DeathStrings[1]="%o had some organs ruptured by %k's LAW pulse."
	DeathStrings[2]="%k's LAW mine ruptured %o's fragile brain."
	DeathStrings[3]="%o camped out by %k's pulsating LAW mine."
	DeathStrings[4]="%k's LAW mine shook %o out of %vh hiding spot."
	FemaleSuicides[0]="%o basked in the blue glow of her LAW mine."
	FemaleSuicides[1]="%o ignored the warning labels on her LAW mine."
	FemaleSuicides[2]="%o got a fatal dose of radiation from his own LAW mine."
	MaleSuicides[0]="%o basked in the blue glow of his LAW mine."
	MaleSuicides[1]="%o ignored the warning labels on his LAW mine."
	MaleSuicides[2]="%o got a fatal dose of radiation from his own LAW mine."
	SimpleKillString="LAW Shockwave"
	InvasionDamageScaling=3.0000000
	DamageIdent="Killstreak"
	WeaponClass=Class'BWBP_SKC_Pro.LAWLauncher'
	DeathString="%o got %vh neurons scrambled by %k's LAW pulse."
	FemaleSuicide="%o basked in the blue glow of her LAW mine."
	MaleSuicide="%o basked in the blue glow of his LAW mine."
	bArmorStops=false
	bDelayedDamage=true
	bNeverSevers=true
	VehicleDamageScaling=1.9000000
	VehicleMomentumScaling=0.8000000
}
