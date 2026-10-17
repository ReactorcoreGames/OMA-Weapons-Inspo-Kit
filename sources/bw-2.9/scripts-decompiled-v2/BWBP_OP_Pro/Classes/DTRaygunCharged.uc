class DTRaygunCharged extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was blown into tiny bits and pieces by %k's raygun beam."
	DeathStrings[1]="%k totally dismantled %o with a searing beam of plasma."
	DeathStrings[2]="%k's spiralling blast vaporized %o."
	SimpleKillString="Raygun Charged Beam"
	BloodManagerName="BallisticProV55.BloodMan_DarkSlow"
	FlashV=(X=1000.0000000,Y=500.0000000,Z=0.0000000)
	FlashF=-0.1000000
	bIgniteFires=true
	bPowerPush=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Energy"
	DamageDescription=",Plasma,"
	WeaponClass=Class'BWBP_OP_Pro.Raygun'
	DeathString="%k totally dismantled %o with a searing beam of plasma."
	FemaleSuicide="%o blew herself to bits with a charged beam."
	MaleSuicide="%o blew himself to bits with a charged beam."
	bAlwaysGibs=true
	bExtraMomentumZ=true
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=30000.0000000
	VehicleDamageScaling=3.0000000
	VehicleMomentumScaling=3.0000000
}
