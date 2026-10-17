class DTMRS138ShotgunHead extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k tore off %o's head with a tenner from %kh shotgun."
	DeathStrings[1]="%k's MRS-138 went off in %o's face."
	DeathStrings[2]="%o got %vh head ventilated by %k's MRS-138."
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BallisticProV55.MRS138Shotgun'
	DeathString="%k tore off %o's head with a tenner from %kh shotgun."
	FemaleSuicide="%o put a tenner in her own head with the MRS-138."
	MaleSuicide="%o put a tenner in his own head with the MRS-138."
	bAlwaysSevers=true
	bSpecial=true
	bExtraMomentumZ=true
	GibPerterbation=0.4000000
	KDamageImpulse=10000.0000000
}
