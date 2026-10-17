class DTSRXRifle_Incendiary extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o had their bones broken by %k's explosive SRK."
	DeathStrings[1]="%k brought some 7.62 dynamite on %o, they went boom in response."
	DeathStrings[2]="%o couldn't dance even after %k gave them some explosive encouragement."
	DeathStrings[3]="%k blew off %o's bad kneecaps, doing them a solid."
	AimedString="Scoped"
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	bIgniteFires=true
	DamageIdent="Sniper"
	DamageDescription=",Bullet,Flame,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.SRXRifle'
	DeathString="%k assasinated %o with %kh SRK-650."
	FemaleSuicide="%o found that using an explosive SRK as toenail clippers is a bad idea."
	MaleSuicide="%o couldn't use the SRK as a rocket jump tool, found that out the hard way."
	bFastInstantHit=true
	GibModifier=1.5000000
	GibPerterbation=0.5000000
	KDamageImpulse=3000.0000000
}
