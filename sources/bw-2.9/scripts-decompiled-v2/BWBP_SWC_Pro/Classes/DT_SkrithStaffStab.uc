class DT_SkrithStaffStab extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was impaled on the blades of %k's Shillelagh."
	DeathStrings[1]="%o was split like a pear by %k's Shillelagh blades."
	DeathStrings[2]="%k skewered %o with the Shillelagh."
	DamageDescription=",Stab,"
	WeaponClass=Class'BWBP_SWC_Pro.SkrithStaff'
	DeathString="%o was impaled on the blades of %k's Shillelagh."
	FemaleSuicide="%o cut herself on her Shillelagh."
	MaleSuicide="%o cut himself on his Shillelagh."
	bArmorStops=false
	bNeverSevers=true
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.A73.A73StabFlesh'
	KDamageImpulse=2000.0000000
	VehicleDamageScaling=0.5000000
}
