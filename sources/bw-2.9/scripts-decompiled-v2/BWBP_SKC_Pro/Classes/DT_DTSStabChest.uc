class DT_DTSStabChest extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's torso was cut open by %k and %kh DTS."
	DeathStrings[1]="%k's Dragon's Tooth Sword ripped %o open."
	DeathStrings[2]="%k cut %o open with the Dragon's Tooth Sword."
	DeathStrings[3]="%o was sliced in half by %k's nanosword."
	DeathStrings[4]="%o lost a vital organ to %k's DTS."
	SimpleKillString="Dragon Nanoblade Stab"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=5.0000000
	BlockPenetration=0.4000000
	DamageIdent="Melee"
	WeaponClass=Class'BWBP_SKC_Pro.DragonsToothSword'
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
