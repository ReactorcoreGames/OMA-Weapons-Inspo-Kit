class DTSRXRifle extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's organs got popped one by one due to %k's SRK."
	DeathStrings[1]="%k ripped %o open with some 7.62mm bullets."
	DeathStrings[2]="%o couldn't adapt to %k's tactics and the SRK."
	DeathStrings[3]="%k blew off %o's toes with precise aiming and the SRK."
	DeathStrings[4]="%o's spleen was ruptured by %k."
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_SKC_Pro.SRXRifle'
	DeathString="%k assasinated %o with %kh SRK-650."
	FemaleSuicide="%o nailed herself with the SRK-650."
	MaleSuicide="%o nailed himself with the SRK-650."
	bFastInstantHit=true
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
}
