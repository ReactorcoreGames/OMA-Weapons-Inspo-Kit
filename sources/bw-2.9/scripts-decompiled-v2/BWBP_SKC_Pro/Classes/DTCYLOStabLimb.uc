class DTCYLOStabLimb extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o almost fended off %k's CYLO."
	DeathStrings[1]="%o tried to kick %k's CYLO."
	DeathStrings[2]="%k stuck %kh CYLO blade into %o's forearm."
	BlockFatiguePenalty=0.2500000
	DamageDescription=",Stab,"
	WeaponClass=Class'BWBP_SKC_Pro.CYLOUAW'
	DeathString="%o almost fended off %k's CYLO."
	FemaleSuicide="%o cut herself on her CYLO."
	MaleSuicide="%o cut himself on his CYLO."
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.A73.A73StabFlesh'
	KDamageImpulse=2000.0000000
}
