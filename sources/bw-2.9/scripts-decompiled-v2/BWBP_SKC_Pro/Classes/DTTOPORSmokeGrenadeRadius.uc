class DTTOPORSmokeGrenadeRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k concussed %o so hard that they began to speak Russian before collapsing."
	DeathStrings[1]="%o drank too much, %k's concussion 'nade didn't help matters."
	DeathStrings[2]="%k knocked %o around like a pinball before their neck snapped from the various impacts."
	DeathStrings[3]="%o was sent to the gulags by %k's concussion grenades."
	InvasionDamageScaling=2.0000000
	WeaponClass=Class'BWBP_SKC_Pro.ThumperGrenadeLauncher'
	DeathString="%o devoured a grenade launched from %k's Topor."
	FemaleSuicide="%o swallowed her own Topor grenade."
	MaleSuicide="%o swallowed his own Topor grenade."
	bDelayedDamage=true
}
