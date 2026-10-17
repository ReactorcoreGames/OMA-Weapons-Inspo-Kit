class DTRaygunPlague extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o couldn't withstand %k's irradiation."
	DeathStrings[1]="%k's lingering radiation overcame %o."
	DeathStrings[2]="%k's raygun made %o a terminal biohazard."
	DeathStrings[3]="%o's corpse glows bright and green thanks to %k's raygun."
	SimpleKillString="Raygun Irradiation"
	BloodManagerName="BallisticProV55.BloodMan_DarkSlow"
	FlashV=(X=1500.0000000,Y=1500.0000000,Z=0.0000000)
	FlashF=0.2000000
	InvasionDamageScaling=1.2500000
	DamageIdent="Energy"
	DamageDescription=",Plasma,"
	WeaponClass=Class'BWBP_OP_Pro.Raygun'
	DeathString="%k's radiation overdose was too much for %o."
	FemaleSuicide="%o irradiated herself."
	MaleSuicide="%o irradiated himself."
	bDetonatesGoop=false
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=30000.0000000
	VehicleDamageScaling=0.2000000
	VehicleMomentumScaling=0.2000000
}
