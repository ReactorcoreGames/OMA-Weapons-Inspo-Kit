class DT_FM13Immolation extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's bitter, burned corpse made %k's Pitbull very sick."
	DeathStrings[1]="%k's Pitbull feasted on %o's cooked remains for dinner."
	DeathStrings[2]="%o had %vh body covered with burns thanks to %k's FM13."
	DeathStrings[3]="%k coated %o with flaming gas for %kh Pitbull to burn off."
	InvasionDamageScaling=1.5000000
	DamageIdent="Machinegun"
	WeaponClass=Class'BWBP_OP_Pro.FM13Shotgun'
	DeathString="%o was immolated %k."
	FemaleSuicide="%o immolated herself."
	MaleSuicide="%o immolated himself."
	bSkeletize=true
	bDelayedDamage=true
	GibPerterbation=0.1000000
	KDamageImpulse=200.0000000
}
