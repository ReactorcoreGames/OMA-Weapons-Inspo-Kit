class DT_MRDR88SpikeHead extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k rammed %kh spiky MR-DR88 into %o's head."
	DeathStrings[1]="%o faceplanted into %k's MR-DR88 spiky handle."
	DeathStrings[2]="%k poked %o's beady little eyes out with an MR-DR88."
	DeathStrings[3]="%k has a little bit of %o face on his MR-DR88."
	BlockFatiguePenalty=0.1500000
	bHeaddie=true
	DamageIdent="Melee"
	DamageDescription=",Stab,"
	WeaponClass=Class'BWBP_SKC_Pro.MRDRMachinePistol'
	DeathString="%k rammed %kh spiky MR-DR88 into %o's head."
	FemaleSuicide="%o  picked her nose with a 3 inch spike."
	MaleSuicide="%o picked his nose with a 3 inch spike."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.A73.A73StabFlesh'
	KDamageImpulse=2000.0000000
}
