class DTCYLOStab extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was slain by %k's CYLO."
	DeathStrings[1]="%o was split down the middle by %k's CYLO blade."
	DeathStrings[2]="%k cut %o down with %kh CYLO."
	DeathStrings[3]="%k viciously hacked at %o with %kh CYLO blade."
	DeathStrings[4]="%o lost %vh limbs to %k's slicing CYLO."
	DeathStrings[5]="%o got a fatal chopping from %k's CYLO."
	ImpactManager=Class'BallisticProV55.IM_Fifty9Blade'
	BlockFatiguePenalty=0.2500000
	DamageDescription=",Stab,"
	WeaponClass=Class'BWBP_SKC_Pro.CYLOUAW'
	DeathString="%o was impaled on %k's CYLO."
	FemaleSuicide="%o cut herself on her CYLO."
	MaleSuicide="%o cut himself on his CYLO."
	bNeverSevers=true
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.A73.A73StabFlesh'
	KDamageImpulse=2000.0000000
	VehicleDamageScaling=0.1000000
}
