class DTBOBTorsoLunge extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k carved the heart out of %o with his black ops blade."
	DeathStrings[1]="%k lunged into %o with his X5W."
	DeathStrings[2]="%o was fatally speared by %k's black ops blade."
	WeaponClass=Class'BWBP_SKC_Pro.BlackOpsWristBlade'
	DeathString="%k carved out %o's heart with his black ops blade."
	FemaleSuicide="%o cut her own heart out."
	MaleSuicide="%o cut his own heart out."
	bArmorStops=false
	bNeverSevers=true
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.5000000
}
