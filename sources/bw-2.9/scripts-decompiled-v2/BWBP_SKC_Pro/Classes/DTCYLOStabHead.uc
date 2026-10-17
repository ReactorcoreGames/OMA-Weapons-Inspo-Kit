class DTCYLOStabHead extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was mauled by %k's CYLO."
	DeathStrings[1]="%k accidentally stabbed %kh CYLO into %o's face."
	DeathStrings[2]="%k's CYLO tried to eat %o."
	BlockFatiguePenalty=0.2500000
	bHeaddie=true
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
