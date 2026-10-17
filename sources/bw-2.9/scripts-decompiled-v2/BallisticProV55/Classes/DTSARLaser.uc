class DTSARLaser extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was seared by %k's SAR laser."
	DeathStrings[1]="%k scorched through %o with %kh SAR."
	DeathStrings[2]="%k grilled %o with %kh SAR laser."
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	bIgniteFires=true
	WeaponClass=Class'BallisticProV55.SARAssaultRifle'
	DeathString="%o was seared by %k's SAR laser."
	FemaleSuicide="%o thought it was just a laser-sight."
	MaleSuicide="%o  thought it was just a laser-sight."
	bInstantHit=true
	GibModifier=3.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.2000000
}
