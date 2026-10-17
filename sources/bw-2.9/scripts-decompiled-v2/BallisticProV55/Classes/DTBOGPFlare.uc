class DTBOGPFlare extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k lobbed a scorching flare into %o's mop of hair."
	DeathStrings[1]="%o swallowed %k's BORT-85 flare and turned out medium-rare."
	DeathStrings[2]="%o was smacked down by %k's flare."
	InvasionDamageScaling=2.0000000
	DamageIdent="Pistol"
	DamageDescription=",Flame,Hazard,NonSniper,Blunt,"
	WeaponClass=Class'BallisticProV55.BOGPPistol'
	DeathString="%k lobbed a scorching flare into %o's mop of hair."
	FemaleSuicide="%o set her own hair on fire with a BORT-85 flare."
	MaleSuicide="%o set his own hair on fire with a BORT-85 flare."
	bDelayedDamage=true
	VehicleDamageScaling=0.5000000
}
