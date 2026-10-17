class DT_FLASH extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o rode %k's napalm rocket straight to hell."
	DeathStrings[1]="%o jumped in front of %k's STREAK rocket."
	DeathStrings[2]="%k lobbed an incendiary rocket onto %o's head."
	DeathStrings[3]="%k's screaming STREAK rocket blasted %o."
	DeathStrings[4]="%o took %k's rocket like a man and exploded in a fireball."
	InvasionDamageScaling=2.0000000
	DamageIdent="Killstreak"
	WeaponClass=Class'BWBP_SKC_Pro.FLASHLauncher'
	DeathString="%o took %k's incendiary rocket in the face."
	FemaleSuicide="%o skilfully shot her rocket up and caught it on the way down. Woo!"
	MaleSuicide="%o skilfully shot his rocket up and caught it on the way down. Congrats."
	bDelayedDamage=true
}
