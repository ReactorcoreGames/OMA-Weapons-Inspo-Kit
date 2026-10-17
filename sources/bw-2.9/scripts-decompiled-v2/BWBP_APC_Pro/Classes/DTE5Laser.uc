class DTE5Laser extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o had %vh lower spine beamed in half by %k's ASP."
	DeathStrings[1]="%k carved %kh name in %o's stomach with a mini plasma pistol."
	DeathStrings[2]="%o's fingers made for good finger food for %k's viper."
	DeathStrings[3]="%o took %k's small but potent beam to the groin."
	DeathStrings[4]="%k burrowed a decent sized hole into %o's belly despite %kh pistol being miniature."
	SimpleKillString="E-5 'ViPeR' Laser"
	AimedString="Scoped"
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	bIgniteFires=true
	DamageIdent="Energy"
	DamageDescription=",Laser,"
	WeaponClass=Class'BWBP_APC_Pro.E5PlasmaRifle'
	DeathString="%o was burnt in two by %k's sacred fire."
	FemaleSuicide="%o accidentally scorched her own legs off with the E-5 laser."
	MaleSuicide="%o accidentally scorched his own legs off with the E-5 laser."
	bInstantHit=true
	GibModifier=4.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.7500000
	VehicleMomentumScaling=0.7500000
}
