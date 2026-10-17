class DTAM67Laser extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was cut down by %k's AM67 laser."
	DeathStrings[1]="%k burned through %o with %kh AM67."
	DeathStrings[2]="%o discovered %k's AM67 laser."
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	bIgniteFires=true
	WeaponClass=Class'BallisticProV55.AM67Pistol'
	DeathString="%o discovered %k's flailing AM67 laser."
	FemaleSuicide="%o thought it was just a laser-sight."
	MaleSuicide="%o thought it was just a laser-sight."
	bInstantHit=true
	GibModifier=4.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.2000000
}
