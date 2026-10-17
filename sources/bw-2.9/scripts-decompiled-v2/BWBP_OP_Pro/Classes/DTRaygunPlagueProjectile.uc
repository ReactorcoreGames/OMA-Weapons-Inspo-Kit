class DTRaygunPlagueProjectile extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was fatally irradiated by %k's raygun."
	DeathStrings[1]="%k's radiation overdose was too much for %o."
	DeathStrings[2]="%o contracted %k's dreaded lurgie."
	SimpleKillString="Raygun Irradiation Bolt"
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
	bAlwaysGibs=true
	bDetonatesGoop=false
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=30000.0000000
	VehicleDamageScaling=0.2000000
	VehicleMomentumScaling=0.2000000
}
