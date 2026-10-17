class DTGASCMelee extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was beaten like an egg by %k and %kh GASC."
	DeathStrings[1]="%k used %kh GASC pistol to tenderise %o."
	DamageIdent="Melee"
	WeaponClass=Class'BWBP_APC_Pro.GASCPistol'
	DeathString="%o was beaten like an egg by %k's GASC."
	FemaleSuicide="%o beat herself up with an GASC."
	MaleSuicide="%o beat himself up with an GASC."
	bArmorStops=false
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.3000000
}
