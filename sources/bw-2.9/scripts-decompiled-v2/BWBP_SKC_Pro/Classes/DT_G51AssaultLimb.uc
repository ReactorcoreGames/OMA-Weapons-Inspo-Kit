class DT_G51AssaultLimb extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's G51 made sure %o couldn't feel %vh legs."
	DeathStrings[1]="%o was crippled by %k's G51."
	DeathStrings[2]="%k gave %o's kneecaps air holes with an G51."
	DeathStrings[3]="%k jammed some G51 rounds into %o's fingers."
	WeaponClass=Class'BWBP_SKC_Pro.G51Carbine'
	DeathString="%k's G51 made sure %o couldn't feel %vh legs."
	FemaleSuicide="%o nailed herself with the G51."
	MaleSuicide="%o nailed himself with the G51."
	bFastInstantHit=true
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
	VehicleDamageScaling=0.6500000
}
