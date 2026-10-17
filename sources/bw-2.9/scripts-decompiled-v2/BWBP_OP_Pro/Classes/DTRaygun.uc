class DTRaygun extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was infused with ethereal energy by %k's raygun bolt."
	DeathStrings[1]="%k's plasma storm made %o dead."
	DeathStrings[2]="%k abducted %o's life."
	DeathStrings[3]="%k gave %o a demonstration in extraterrestrial weaponry."
	SimpleKillString="Raygun Bolt"
	BloodManagerName="BallisticProV55.BloodMan_DarkSlow"
	bIgniteFires=true
	DamageIdent="Energy"
	DamageDescription=",Plasma,"
	WeaponClass=Class'BWBP_OP_Pro.Raygun'
	DeathString="%o was infused with ethereal energy by %k's raygun bolt."
	FemaleSuicide="%o was seared by her own plasma shot."
	MaleSuicide="%o was seared by his own plasma shot."
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=30000.0000000
	VehicleDamageScaling=0.4000000
	VehicleMomentumScaling=0.4000000
}
