class DT_PUMARadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was pounced on by %k's PUMA."
	DeathStrings[1]="%k introduced %o to %kh fearsome PUMA."
	DeathStrings[2]="%k's PUMA grenade got the jump on %o."
	DeathStrings[3]="%k's PUMA mauled an unfortunate %o."
	WeaponClass=Class'BWBP_SKC_Pro.PumaRepeater'
	DeathString="%o was pounced on by %k's PUMA."
	FemaleSuicide="%o bounced a PUMA grenade into her face."
	MaleSuicide="%o bounced a PUMA grenade into his face."
	bDelayedDamage=true
}
