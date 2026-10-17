class DTM50AssaultLimb extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was gunned down by %k with the M50."
	DeathStrings[1]="%o's foot was shot to ribbons by %k's M50."
	DeathStrings[2]="%k shot %o's kneecaps off with the M50."
	DeathStrings[3]="%k reduced %o's arms to nothing with the M50."
	DamageIdent="Assault"
	WeaponClass=Class'BallisticProV55.M50AssaultRifle'
	DeathString="%o was gunned down by %k with the M50."
	FemaleSuicide="%o nailed herself with the M50."
	MaleSuicide="%o nailed himself with the M50."
	bFastInstantHit=true
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
	VehicleDamageScaling=0.0000000
}
