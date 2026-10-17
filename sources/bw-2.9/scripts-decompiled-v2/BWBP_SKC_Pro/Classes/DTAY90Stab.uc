class DTAY90Stab extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was impaled on the blades of %k's Elite AY90."
	DeathStrings[1]="%o was split like a pear by %k's Elite AY90 blades."
	DeathStrings[2]="%k skewered %o with the Elite AY90."
	DamageDescription=",Stab,"
	WeaponClass=Class'BWBP_SKC_Pro.AY90SkrithBoltcaster'
	DeathString="%o was impaled on the blades of %k's Elite AY90."
	FemaleSuicide="%o cut herself on her Elite AY90."
	MaleSuicide="%o cut himself on his Elite AY90."
	bArmorStops=false
	bNeverSevers=true
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.A73.A73StabFlesh'
	KDamageImpulse=2000.0000000
	VehicleDamageScaling=0.5000000
}
