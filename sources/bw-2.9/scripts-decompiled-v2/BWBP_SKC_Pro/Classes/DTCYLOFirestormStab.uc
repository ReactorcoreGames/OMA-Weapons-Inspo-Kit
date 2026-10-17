class DTCYLOFirestormStab extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o tripped into %k's CYLO blade."
	DeathStrings[1]="%o was shredded by %k's bladed CYLO."
	DeathStrings[2]="%k's CYLO ripped into defenseless %o."
	BlockFatiguePenalty=0.2500000
	DamageIdent="Melee"
	DamageDescription=",Stab,"
	WeaponClass=Class'BWBP_SKC_Pro.CYLOUAW'
	DeathString="%o tripped into %k's CYLO blade."
	FemaleSuicide="%o cut herself on her CYLO."
	MaleSuicide="%o cut himself on his CYLO."
	bNeverSevers=true
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.A73.A73StabFlesh'
	KDamageImpulse=2000.0000000
	VehicleDamageScaling=0.5000000
}
