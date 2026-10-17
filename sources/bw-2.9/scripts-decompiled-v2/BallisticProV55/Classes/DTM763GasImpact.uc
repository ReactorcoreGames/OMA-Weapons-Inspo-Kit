class DTM763GasImpact extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k put down %o's riot with a direct slug shot."
	DeathStrings[1]="%o ate the gas slug %k sent %vh way."
	bNegatesMomentum=true
	InvasionDamageScaling=1.5000000
	DamageIdent="Shotgun"
	DamageDescription=",Bullet,Flame,"
	WeaponClass=Class'BallisticProV55.M763Shotgun'
	DeathString="%k put down %o's riot with a direct slug shot."
	FemaleSuicide="%o ended her own riot"
	MaleSuicide="%o ended his own riot."
	bDelayedDamage=true
	bExtraMomentumZ=true
	GibPerterbation=2.0000000
	KDamageImpulse=3000.0000000
	VehicleDamageScaling=0.6000000
}
