class DT_FlameSwordHead extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's psionically imbued sword burned through %o's screaming face."
	DeathStrings[1]="%k directed %kh fire sword through %o's scrawny neck."
	DeathStrings[2]="%o was the victim of %k's pyrokinetic decapitation."
	DeathStrings[3]="%o's neck was left a smoldering stump from %k's PSI-56 Fire Sword."
	BlockPenetration=0.2000000
	BlockFatiguePenalty=0.2000000
	bHeaddie=true
	DamageIdent="Melee"
	WeaponClass=Class'BWBP_OP_Pro.FlameSword'
	DeathString="%k's psionically imbued sword burned through %o's screaming face"
	FemaleSuicide="%o swung her fire sword like a fool."
	MaleSuicide="%o swung his fire sword like a fool."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	KDamageImpulse=1000.0000000
}
