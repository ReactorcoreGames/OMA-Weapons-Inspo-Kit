class DT_DTSStabHead extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's Dragon's Tooth Sword bit off %o's head."
	DeathStrings[1]="%k swung %kh nanosword through %o's neck."
	DeathStrings[2]="%o's head was lopped off by %k's speeding DTS."
	DeathStrings[3]="%o was decapitated by %k's lethal nanosword."
	SimpleKillString="Dragon Nanoblade Stab"
	BlockPenetration=0.4000000
	bHeaddie=true
	DamageIdent="Melee"
	WeaponClass=Class'BWBP_SKC_Pro.DragonsToothSword'
	DeathString="%k's Dragon's Tooth Sword bit off %o's head."
	FemaleSuicide="%o swung her Dragon's Tooth like a fool."
	MaleSuicide="%o swung his Dragon's Tooth like a fool."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	KDamageImpulse=1000.0000000
}
