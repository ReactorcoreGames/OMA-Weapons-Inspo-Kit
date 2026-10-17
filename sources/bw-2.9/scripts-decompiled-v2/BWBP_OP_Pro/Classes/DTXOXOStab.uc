class DTXOXOStab extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o got spiked by %k's XOXO."
	BlockFatiguePenalty=0.2500000
	AimDisplacementDamageThreshold=75
	AimDisplacementDuration=0.7500000
	DamageIdent="Melee"
	DamageDescription=",Stab,"
	WeaponClass=Class'BWBP_OP_Pro.XOXOStaff'
	DeathString="%o got spiked by %k's XOXO."
	FemaleSuicide="%o plunged her XOXO into her teammate."
	MaleSuicide="%o plunged his XOXO into his teammate."
	bNeverSevers=true
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.A73.A73StabFlesh'
	KDamageImpulse=2000.0000000
}
