class DTRS04TrackerStuck extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k pinned the tracker dart on the %o."
	DeathStrings[1]="%o's corpse has a new tracker dart thanks to %k."
	DeathStrings[2]="%k's proximity grenade latched onto %o's flapping ear."
	SimpleKillString="RS04 Tracker Dart"
	bDetonatesBombs=false
	InvasionDamageScaling=2.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BWBP_SKC_Pro.RS04Pistol'
	DeathString="%k's tracker dart lodged in %o's eye."
	FemaleSuicide="%o had a terrible tracker dark accident."
	MaleSuicide="%o is the reason why tracker darts are banned in the civillian market."
	bDelayedDamage=true
}
