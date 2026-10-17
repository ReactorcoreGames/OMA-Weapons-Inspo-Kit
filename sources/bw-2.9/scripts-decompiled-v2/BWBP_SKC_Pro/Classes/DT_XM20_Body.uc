class DT_XM20_Body extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o melted away in a brilliant storm of %k's laser carbine."
	DeathStrings[1]="%k's laser assault rifle burned %o to the ground."
	DeathStrings[2]="%o was left a smoldering heap thanks to %k's XM-20."
	DeathStrings[3]="%k murdered %o with frickin' lasers."
	DeathStrings[4]="%o's heart melted when %k gave %vm the gift of AUTOMATIC LASERS."
	SimpleKillString="XM20 Laser Carbine"
	BloodManagerName="BloodMan_HMCLaser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=2.0000000
	ShieldDamage=3
	bIgniteFires=true
	DamageIdent="Energy"
	DamageDescription=",Laser,"
	WeaponClass=Class'BWBP_SKC_Pro.XM20Carbine'
	DeathString="%o melted away in a brilliant storm of %k's laser carbine."
	FemaleSuicide="%o cannot use a laser assault rifle effectively."
	MaleSuicide="%o stinks at using laser assault rifles."
	bInstantHit=true
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.6000000
	VehicleMomentumScaling=0.4000000
}
