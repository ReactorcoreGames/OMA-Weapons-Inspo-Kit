class DT_RSDeathBall extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was blown to pieces by %k's deathball."
	DeathStrings[1]="%k's deathball completely devastated %o."
	DeathStrings[2]="%o couldn't scamper away from the might of %k's deathball."
	SimpleKillString="Deathball"
	DamageIdent="Energy"
	DeathString="%o was blown to pieces by %k's deathball."
	FemaleSuicide="%o splattered the walls with her gibs using a deathball."
	MaleSuicide="%o splattered the walls with his gibs using a deathball."
	bDelayedDamage=true
	VehicleDamageScaling=1.5000000
	VehicleMomentumScaling=1.5000000
}
