class DT_FlameSwordChest extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was laid open in a blinding flash of %k's incendiary blade."
	DeathStrings[1]="%k stands gore-soaked, with flame blade in hand, among %o's smoldering carcass."
	DeathStrings[2]="Bones cracked and tendons snapped as %k cleaved %kh fire sword through %o's wretched body."
	DeathStrings[3]="%o could not withstand the might of %k's pyrokinetic blade."
	DeathStrings[4]="%k's psychic flames washed over a sundered %o."
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=5.0000000
	BlockPenetration=0.2000000
	BlockFatiguePenalty=0.2000000
	DamageIdent="Melee"
	WeaponClass=Class'BWBP_OP_Pro.FlameSword'
	DeathString="%o's torso was cut open by %k and %kh DTS."
	FemaleSuicide="%o activated her DTS backwards."
	MaleSuicide="%o activated his DTS backwards."
	bNeverSevers=true
	GibModifier=4.0000000
	PawnDamageSounds[0]=Sound'BWBP_SKC_Sounds.DTS.NanoSwordHitFlesh'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.3500000
}
