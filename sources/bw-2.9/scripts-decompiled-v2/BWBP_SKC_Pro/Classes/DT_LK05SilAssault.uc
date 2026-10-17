class DT_LK05SilAssault extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k quietly eliminated %o with the LK05."
	DeathStrings[1]="%o was silenced by %k's LK05 rounds."
	DeathStrings[2]="%k assasinated %o with a suppressed LK05."
	DeathStrings[3]="%o was silently downed by %k's LK05."
	SimpleKillString="LK-05 Advanced Carbine Suppressed"
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_SKC_Pro.LK05Carbine'
	DeathString="%k quietly eliminated %o with the LK05."
	FemaleSuicide="%o is quite horrible with firearms."
	MaleSuicide="%o is quite horrible with firearms."
	bFastInstantHit=true
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
}
