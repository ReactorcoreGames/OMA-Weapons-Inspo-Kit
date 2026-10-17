class DTLAWRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o perished in %k's massive LAW shockwave."
	DeathStrings[1]="%o was blown to the heavens by %k's LAW."
	DeathStrings[2]="%k blasted the hell out of %o with a LAW."
	DeathStrings[3]="%k brought the LAW down on %o."
	DeathStrings[4]="%k brought justice to %o with the LAW."
	FemaleSuicides[0]="%o's body couldn't take the punishment of the LAW."
	FemaleSuicides[1]="%o underestimated the power of her LAW."
	FemaleSuicides[2]="%o got on the wrong side of the LAW."
	MaleSuicides[0]="%o's body couldn't take the punishment of the LAW."
	MaleSuicides[1]="%o failed to distance himself from his LAW blast."
	MaleSuicides[2]="%o got on the wrong side of the LAW."
	SimpleKillString="LAW Rocket"
	DisplacementType=1
	AimDisplacementDamageThreshold=100
	InvasionDamageScaling=3.0000000
	DamageIdent="Killstreak"
	WeaponClass=Class'BWBP_SKC_Pro.LAWLauncher'
	DeathString="%o was blown to smithereens by %k's LAW blast."
	FemaleSuicide="%o set the LAW on herself."
	MaleSuicide="%o underestimated the full extent of the LAW."
	bDelayedDamage=true
	VehicleDamageScaling=2.0000000
	VehicleMomentumScaling=0.8000000
}
