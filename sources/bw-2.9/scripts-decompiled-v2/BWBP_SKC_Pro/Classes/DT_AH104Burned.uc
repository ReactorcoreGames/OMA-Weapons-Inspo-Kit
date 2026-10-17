class DT_AH104Burned extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k sprayed %o with hellfire."
	DeathStrings[1]="%k's AH104 seared the flesh off %o."
	DeathStrings[2]="%o was torched to a crisp by %k's pistol flamer."
	DeathStrings[3]="%o got cooked alive by %k's AH104."
	DeathStrings[4]="%k poured fire all over %o's screaming figure."
	SimpleKillString="AH104 Flamethrower"
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_SKC_Pro.AH104Pistol'
	DeathString="%k sprayed %o with fire."
	FemaleSuicide="%o burned herself."
	MaleSuicide="%o burned himself."
	bDelayedDamage=true
	KDamageImpulse=2000.0000000
	VehicleDamageScaling=0.3500000
}
