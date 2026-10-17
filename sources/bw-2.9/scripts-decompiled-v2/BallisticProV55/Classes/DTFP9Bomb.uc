class DTFP9Bomb extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k slapped a bomb into %o's face."
	DeathStrings[1]="%o was hit over the head by %k's bomb."
	BloodManagerName="BallisticProV55.BloodMan_BluntSmall"
	bDetonatesBombs=false
	DamageIdent="Grenade"
	DamageDescription=",Blunt,Hazard,"
	WeaponClass=Class'BallisticProV55.FP9Explosive'
	DeathString="%k slapped a bomb into %o's face."
	FemaleSuicide="%o stubbed her toe on her own bomb."
	MaleSuicide="%o stubbed his toe on his own bomb."
	bDelayedDamage=true
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
	VehicleDamageScaling=2.0000000
	VehicleMomentumScaling=2.0000000
}
