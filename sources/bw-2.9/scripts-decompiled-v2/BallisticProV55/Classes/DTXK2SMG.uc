class DTXK2SMG extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was put out by %k's XK2."
	DeathStrings[1]="%k dispelled %o's shrieks with a hail of XK2 bullets."
	DeathStrings[2]="%k silenced %o with XK2 rounds."
	EffectChance=0.5000000
	TagMultiplier=0.7000000
	TagDuration=0.1000000
	InvasionDamageScaling=1.5000000
	DamageIdent="SMG"
	WeaponClass=Class'BallisticProV55.XK2SubMachinegun'
	DeathString="%o was put out by %k's XK2."
	FemaleSuicide="%o silenced herself."
	MaleSuicide="%o silenced himself."
	bFastInstantHit=true
	VehicleDamageScaling=0.1500000
}
