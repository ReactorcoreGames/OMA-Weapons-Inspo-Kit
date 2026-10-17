class DT_MARSAssault extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's MARS riddled %o with bulletholes."
	DeathStrings[1]="%o failed to clear %k's MARS crosshairs."
	DeathStrings[2]="%k savagely lit %o up with MARS fire."
	DeathStrings[3]="%k terminated %o with an accurate MARS burst."
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_SKC_Pro.MARSAssaultRifle'
	DeathString="%k's MARS riddled %o with bulletholes."
	FemaleSuicide="%o tactically missed with the planet Mars."
	MaleSuicide="%o tactically missed with a Mars bar."
	bFastInstantHit=true
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
}
