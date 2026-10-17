class DTPD97ShotgunHead extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o got a face full of loving courtesy of %k's PD97."
	DeathStrings[1]="%k blew %o's face off with %kh PD97 shotgun."
	DeathStrings[2]="%o wondered what the bottom barrel of %k's PD97 did."
	SimpleKillString="PD97 Shotgun"
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BWBP_OP_Pro.PD97Bloodhound'
	DeathString="%o got a face full of loving courtesy of %k's PD97."
	FemaleSuicide="%o perforated herself with the PD97."
	MaleSuicide="%o perforated himself with the PD97."
	bAlwaysSevers=true
	bSpecial=true
	bExtraMomentumZ=true
	GibPerterbation=0.4000000
	KDamageImpulse=10000.0000000
}
