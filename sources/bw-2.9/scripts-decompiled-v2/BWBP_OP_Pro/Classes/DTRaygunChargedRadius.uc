class DTRaygunChargedRadius extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was blown into tiny bits and pieces by %k's raygun bolt."
	DeathStrings[1]="%k totally dismantled %o with a searing ball of plasma."
	DeathStrings[2]="%k's spiralling blast vaporized %o."
	SimpleKillString="Raygun Charged Bolt"
	BloodManagerName="BallisticProV55.BloodMan_DarkSlow"
	bIgniteFires=true
	DamageIdent="Energy"
	DamageDescription=",Plasma,"
	WeaponClass=Class'BWBP_OP_Pro.Raygun'
	DeathString="%k totally dismantled %o with a searing ball of plasma."
	FemaleSuicide="%o blew herself to bits with a charged bolt."
	MaleSuicide="%o blew himself to bits with a charged bolt."
	bAlwaysGibs=true
	bLocationalHit=false
	bExtraMomentumZ=true
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=30000.0000000
	VehicleDamageScaling=3.0000000
	VehicleMomentumScaling=3.0000000
}
