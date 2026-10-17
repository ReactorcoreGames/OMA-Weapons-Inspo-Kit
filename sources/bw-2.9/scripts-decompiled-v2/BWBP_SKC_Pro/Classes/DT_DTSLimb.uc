class DT_DTSLimb extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k chopped %o down with the Dragon's Tooth."
	DeathStrings[1]="%o was eviscerated by %k's nanosword."
	DeathStrings[2]="%k sliced a chunk off %o with %kh nanosword."
	DeathStrings[3]="%o's limbs were amputated by %k's swinging DTS."
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=3.0000000
	DamageIdent="Melee"
	WeaponClass=Class'BWBP_SKC_Pro.DragonsToothSword'
	DeathString="%k chopped %o down with the Dragon's Tooth."
	FemaleSuicide="%o's Dragon Tooth bit off her arm."
	MaleSuicide="%o's Dragon Tooth bit off his arm."
	PawnDamageSounds[0]=Sound'BWBP_SKC_Sounds.DTS.NanoSwordHitFlesh'
	KDamageImpulse=1000.0000000
}
