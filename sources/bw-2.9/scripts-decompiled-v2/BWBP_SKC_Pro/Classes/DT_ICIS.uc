class DT_ICIS extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k stabbed %o with a dirty needle."
	DeathStrings[1]="%o contracted a disease from %k's rusty needles."
	DamageDescription=",Slash,Stab,"
	WeaponClass=Class'BWBP_SKC_Pro.ICISStimpack'
	DeathString="%k stabbed %o with a dirty needle."
	FemaleSuicide="%o died from super AIDS."
	MaleSuicide="%o got HIV, Syphillis, the mumps, gangrene, and FEV."
	bArmorStops=false
	KDamageImpulse=1000.0000000
}
