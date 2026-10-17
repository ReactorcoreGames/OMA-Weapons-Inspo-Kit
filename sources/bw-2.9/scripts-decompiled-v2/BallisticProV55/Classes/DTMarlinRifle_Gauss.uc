class DTMarlinRifle_Gauss extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was hounded by %k's accelerated Redwood."
	DeathStrings[1]="%k's gaussmaster hunted %o down like a bandit."
	DeathStrings[2]="%o got caught in %k's gauss DeerMaster sights."
	DeathStrings[3]="%k's custom gauss DeerMaster preyed upon %o."
	DeathStrings[4]="%o got busted like a cyberbeaver by %k's high-tech Redwood."
	DeathStrings[5]="%k's tech marlin drilled %o like a cybermoose."
	SimpleKillString="Redwood Gauss"
	TagDuration=0.2000000
	bSnipingDamage=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Sniper"
	WeaponClass=Class'BallisticProV55.MarlinRifle'
	DeathString="%o was hounded by %k's accelerated Redwood."
	FemaleSuicide="%o hunted herself to extinction."
	MaleSuicide="%o hunted himself to extinction."
	VehicleDamageScaling=0.2500000
	VehicleMomentumScaling=0.0000000
}
