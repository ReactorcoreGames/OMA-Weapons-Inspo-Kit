class DTMRS138ShotgunFrag extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k fired an explosive slug into %o with the MRS-138."
	DeathStrings[1]="%o took a direct hit from %k's MRS slug."
	DeathStrings[2]="%k tagged %o down with an explosive MRS slug."
	DeathStrings[3]="%k slugged %o out with %kh MRS138's explosive shell."
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun, Ordnance"
	WeaponClass=Class'BallisticProV55.MRS138Shotgun'
	DeathString="%k fired an explosive slug into %o with the MRS-138."
	FemaleSuicide="%o fired a tenner into herself with the MRS-138."
	MaleSuicide="%o fired a tenner into himself with the MRS-138."
	bExtraMomentumZ=true
	GibPerterbation=0.7000000
	KDamageImpulse=25000.0000000
}
