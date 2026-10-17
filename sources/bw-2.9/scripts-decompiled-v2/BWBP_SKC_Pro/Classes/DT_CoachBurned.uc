class DT_CoachBurned extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o had their fat rendered to a crisp after being shot by %kâ€™s white hot phosphorus."
	DeathStrings[1]="%k won the fire making challenge after using %oâ€™s corpse as a heat source."
	DeathStrings[2]="%o reached maximum thermal capacity after taking about 2 shells from %k."
	DeathStrings[3]="%k burned the skin on their dish, a roast %o with a blood sauce reduction."
	DeathStrings[4]="%o was cremated in 30 seconds or less after being lit up by %kâ€™s dragonâ€™s breath."
	DeathStrings[5]="%k flambeed %o with a dragonâ€™s breath shell, too bad they forgot the marshmallows."
	InvasionDamageScaling=1.5000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BWBP_SKC_Pro.CoachGun'
	DeathString="%%o reached maximum thermal capacity after taking about 2 shells from %k."
	FemaleSuicide="%o miscalculated the theoretical thermal capacity of her body."
	MaleSuicide="%o miscalculated the theoretical thermal capacity of his body."
	bDelayedDamage=true
	KDamageImpulse=2000.0000000
}
