class DT_LK05Assault extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's LK05 confirmed a kill on %o."
	DeathStrings[1]="%o was cleanly dropped by %k's LK05."
	DeathStrings[2]="%k engaged and eliminated %o with an LK05."
	DeathStrings[3]="%k removed %o from the battlefield via LK05."
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_SKC_Pro.LK05Carbine'
	DeathString="%k's LK05 confirmed a kill on %o."
	FemaleSuicide="%o took the easy way out with an LK05."
	MaleSuicide="%o took the easy way out with an LK05."
	bFastInstantHit=true
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
}
