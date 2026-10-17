class DTCYLOShotgunHead extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o got a face full of loving courtesy of %k's CYLO."
	DeathStrings[1]="%k blew %o's face off with %kh CYLO shotgun."
	DeathStrings[2]="%o wondered what the bottom barrel of %k's CYLO did."
	SimpleKillString="CYLO UAW Shotgun"
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BWBP_SKC_Pro.CYLOUAW'
	DeathString="%o got a face full of loving courtesy of %k's CYLO."
	FemaleSuicide="%o perforated herself with the CYLO."
	MaleSuicide="%o perforated himself with the CYLO."
	bAlwaysSevers=true
	bSpecial=true
	bExtraMomentumZ=true
	GibPerterbation=0.4000000
	KDamageImpulse=10000.0000000
}
