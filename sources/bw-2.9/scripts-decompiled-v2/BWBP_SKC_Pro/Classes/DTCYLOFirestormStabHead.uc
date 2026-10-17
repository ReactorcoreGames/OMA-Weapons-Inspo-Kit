class DTCYLOFirestormStabHead extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o lost an eye to %k's CYLO blade."
	DeathStrings[1]="%k lobotomized %o with %kh CYLO blade."
	DeathStrings[2]="%k's CYLO amputated %o's head."
	BlockFatiguePenalty=0.2500000
	bHeaddie=true
	DamageIdent="Melee"
	DamageDescription=",Stab,"
	WeaponClass=Class'BWBP_SKC_Pro.CYLOUAW'
	DeathString="%o was was mauled by %k's CYLO."
	FemaleSuicide="%o sliced her own head in half with the CYLO."
	MaleSuicide="%o sliced his own head in half with the CYLO."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.A73.A73StabFlesh'
	KDamageImpulse=2000.0000000
}
