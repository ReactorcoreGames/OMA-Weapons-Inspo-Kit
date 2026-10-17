class DTLS14Body extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's lungs were turned to ashes by %k's laser carbine."
	DeathStrings[1]="%k's LS-14 created a sizzling hole where %o's heart was."
	DeathStrings[2]="%o found his torso fried by %k's LS-14."
	DeathStrings[3]="%k lasered %o's life away with his carbine."
	DeathStrings[4]="%o was at the receiving end of %k's energy carbine."
	SimpleKillString="LS-14 Single Barrel"
	BloodManagerName="BloodMan_HMCLaser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=2.0000000
	ShieldDamage=3
	bIgniteFires=true
	DamageIdent="Sniper"
	DamageDescription=",Laser,"
	WeaponClass=Class'BWBP_SKC_Pro.LS14Carbine'
	DeathString="%o's lungs were turned to ashes by %k's laser carbine."
	FemaleSuicide="%o cannot use a carbine effectively."
	MaleSuicide="%o stinks at using laser carbines."
	bInstantHit=true
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.6000000
	VehicleMomentumScaling=0.4000000
}
