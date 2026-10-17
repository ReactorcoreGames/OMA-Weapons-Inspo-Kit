class DTVPRLaser extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was burnt in two by %k's sacred fire."
	DeathStrings[1]="%k's burning hot E-23 laser surged through %o."
	DeathStrings[2]="%k scorched %o with %kh ViPeR laser."
	SimpleKillString="E-23 'ViPeR' Laser"
	AimedString="Scoped"
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	bIgniteFires=true
	DamageIdent="Energy"
	DamageDescription=",Laser,"
	WeaponClass=Class'BallisticProV55.E23PlasmaRifle'
	DeathString="%o was burnt in two by %k's sacred fire."
	FemaleSuicide="%o accidentally scorched her own legs off with the E-23 laser."
	MaleSuicide="%o accidentally scorched his own legs off with the E-23 laser."
	bInstantHit=true
	GibModifier=4.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.7500000
	VehicleMomentumScaling=0.7500000
}
