class DT_LS440Body extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="Red pulses from %k's LS440 reduced %o to ash."
	DeathStrings[1]="%k's LS-440 mercilessly lasered %o away."
	DeathStrings[2]="%o took a red storm of %k's lasers to the chest."
	DeathStrings[3]="%k singed %o's chest with a LS-440 laser fusilade."
	BloodManagerName="BWBP_SKC_Pro.BloodMan_HMCLaser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=2.0000000
	ShieldDamage=3
	bIgniteFires=true
	DamageDescription=",Laser,"
	WeaponClass=Class'BWBP_SKC_Pro.LS14Carbine'
	DeathString="Red pulses from %k's LS440 reduced %o to ash."
	FemaleSuicide="%o cannot use a carbine effectively."
	MaleSuicide="%o stinks at using laser carbines."
	bInstantHit=true
	GibPerterbation=1.2000000
	KDamageImpulse=1000.0000000
}
