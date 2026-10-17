class DT_G51Assault extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k shot through %o with the G51."
	DeathStrings[1]="%o was fatally preforated by %k's G51."
	DeathStrings[2]="%k removed %o's spine with G51 rounds."
	WeaponClass=Class'BWBP_SKC_Pro.G51Carbine'
	DeathString="%k shot through %o with the G51."
	FemaleSuicide="%o nailed herself with the G51."
	MaleSuicide="%o nailed himself with the G51."
	bFastInstantHit=true
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
	VehicleDamageScaling=0.6500000
}
