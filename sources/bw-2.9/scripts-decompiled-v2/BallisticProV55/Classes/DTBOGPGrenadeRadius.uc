class DTBOGPGrenadeRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was shattered by %k's BORT grenade."
	DeathStrings[1]="%k splintered %o with %kh break open grenade pistol."
	InvasionDamageScaling=2.0000000
	DamageIdent="Pistol"
	WeaponClass=Class'BallisticProV55.BOGPPistol'
	DeathString="%o was shattered by %k's BORT grenade."
	FemaleSuicide="%o painted herself on the wall with a BORT grenade."
	MaleSuicide="%o painted himself on the wall with a BORT grenade."
	bDelayedDamage=true
}
