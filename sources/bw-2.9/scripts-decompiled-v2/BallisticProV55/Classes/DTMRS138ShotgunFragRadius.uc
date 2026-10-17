class DTMRS138ShotgunFragRadius extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k blasted %o with an explosive MRS-138."
	DeathStrings[1]="%o was put down by %k's explosive combat shotgun."
	DeathStrings[2]="%k stopped %o's riot with an explosive MRS slug."
	DeathStrings[3]="%o was disarmed by %k's MRS-138 frag round."
	SimpleKillString="MRS138 FRAG"
	InvasionDamageScaling=2.0000000
	DamageIdent="Ordnance, Shotgun"
	WeaponClass=Class'BallisticProV55.MRS138Shotgun'
	DeathString="%k's MRS138 fragged %o."
	FemaleSuicide="%o forgot she loaded frag rounds."
	MaleSuicide="%o forgot he loaded frag rounds."
	bDelayedDamage=true
}
