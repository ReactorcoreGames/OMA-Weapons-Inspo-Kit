class DTCYLOShotgun extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o didn't realize %k's CYLO had a shotgun."
	DeathStrings[1]="%k finished off %o with %kh CYLO shotgun."
	DeathStrings[2]="%o was maimed by %k's CYLO 12 gauge."
	SimpleKillString="CYLO UAW Shotgun"
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BWBP_SKC_Pro.CYLOUAW'
	DeathString="%o didn't realize %k's CYLO had a shotgun."
	FemaleSuicide="%o perforated herself with the CYLO."
	MaleSuicide="%o perforated himself with the CYLO."
	bExtraMomentumZ=true
	GibPerterbation=0.4000000
	KDamageImpulse=15000.0000000
}
