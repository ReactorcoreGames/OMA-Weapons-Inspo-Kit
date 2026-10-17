class DTXRS10SMG extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was cleansed by a hail of %k's XRS-10 rounds."
	DeathStrings[1]="%o flapped around like a fish as %k filled %vm with XRS-10 rounds."
	DeathStrings[2]="%k directed a few XRS-10 rounds into %o's belly."
	DeathStrings[3]="%k's XRS-10 sorted %o out good and proper."
	EffectChance=0.5000000
	TagMultiplier=0.7000000
	TagDuration=0.1000000
	InvasionDamageScaling=1.5000000
	DamageIdent="SMG"
	WeaponClass=Class'BallisticProV55.XRS10SubMachinegun'
	DeathString="%o was cleansed by a hail of %k's XRS-10 rounds."
	FemaleSuicide="%o silenced herself."
	MaleSuicide="%o silenced himself."
	bFastInstantHit=true
	VehicleDamageScaling=0.1500000
}
