class DT_PUMAGrenade extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k bounced a PUMA round off %o."
	DeathStrings[1]="%o was hit by %k's passing PUMA round."
	WeaponClass=Class'BWBP_SKC_Pro.PumaRepeater'
	DeathString="%k bounced a PUMA round off %o."
	FemaleSuicide="%o tripped on her PUMA grenade."
	MaleSuicide="%o tripped on his PUMA grenade."
	bDelayedDamage=true
}
