class DTLS14Twin extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k pasted %o with his twin LS-14 barrels."
	DeathStrings[1]="%k's twin LS-14 barrels destroyed %o."
	DeathStrings[2]="%k's LS-14 directed a deluge of photons through %o."
	DeathStrings[3]="%o was roasted by %k's twin LS-14 blast."
	SimpleKillString="LS-14 Double Barrel"
	BloodManagerName="BloodMan_HMCLaser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=2.0000000
	ShieldDamage=3
	bIgniteFires=true
	bSnipingDamage=true
	InvasionDamageScaling=2.0000000
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
