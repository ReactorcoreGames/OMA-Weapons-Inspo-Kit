class DTPD97Shotgun extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o didn't realize %k's PD97 had a shotgun."
	DeathStrings[1]="%k finished off %o with %kh PD97 shotgun."
	DeathStrings[2]="%o was maimed by %k's PD97 12 gauge."
	SimpleKillString="PD97 Shotgun"
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BWBP_OP_Pro.PD97Bloodhound'
	DeathString="%o didn't realize %k's PD97 had a shotgun."
	FemaleSuicide="%o perforated herself with the PD97."
	MaleSuicide="%o perforated himself with the PD97."
	bExtraMomentumZ=true
	GibPerterbation=0.4000000
	KDamageImpulse=15000.0000000
}
