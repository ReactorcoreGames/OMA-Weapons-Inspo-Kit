class DTAkeron extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o got blasted by %k's Akeron launcher."
	DeathStrings[1]="%k's Akeron rocket put an end to %o's hopes of conquest."
	DeathStrings[2]="%o was completely wrecked by %k's speeding rocket."
	InvasionDamageScaling=2.0000000
	DamageIdent="Ordnance"
	WeaponClass=Class'BWBP_OP_Pro.AkeronLauncher'
	DeathString="%o got blasted by %k's Akeron launcher."
	FemaleSuicide="%o wrecked herself with an Akeron rocket."
	MaleSuicide="%o spammed his Akeron hard."
	bDelayedDamage=true
	bExtraMomentumZ=true
}
