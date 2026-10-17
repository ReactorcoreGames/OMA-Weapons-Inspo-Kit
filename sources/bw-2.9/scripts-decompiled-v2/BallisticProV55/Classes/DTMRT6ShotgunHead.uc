class DTMRT6ShotgunHead extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o saw eye to eye with %k's MRT-6."
	DeathStrings[1]="%k's MRT-6 went off in %o's face."
	DeathStrings[2]="%o's head exploded with %k's MRT-6 pellets."
	DeathStrings[3]="%k showed %o the light at the end of two tunnels."
	bHeaddie=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Sidearm"
	WeaponClass=Class'BallisticProV55.MRT6Shotgun'
	DeathString="%o saw eye to eye with %k's MRT-6."
	FemaleSuicide="%o blasted herself with the MRT-6."
	MaleSuicide="%o blasted himself with the MRT-6."
	bAlwaysSevers=true
	bSpecial=true
	GibPerterbation=0.4000000
	KDamageImpulse=10000.0000000
	VehicleDamageScaling=0.2000000
	VehicleMomentumScaling=0.7000000
}
