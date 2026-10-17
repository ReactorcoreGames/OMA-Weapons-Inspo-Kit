class DTRX22ATankExplode extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k sent %o to hell with a jetpack."
	DeathStrings[1]="%o's flame tanks were erupted by %k."
	DeathStrings[2]="%k rocketed %o into oblivion."
	BloodManagerName="BallisticProV55.BloodMan_FireExploded"
	InvasionDamageScaling=3.0000000
	DamageIdent="Streak"
	WeaponClass=Class'BallisticProV55.RX22AFlamer'
	DeathString="%k sent %o to hell with a jetpack."
	FemaleSuicide="%o's tank exploded."
	MaleSuicide="%o's tank exploded."
	bCausesBlood=true
	bDelayedDamage=true
	bNeverSevers=false
	GibPerterbation=0.1000000
	KDamageImpulse=200.0000000
	VehicleDamageScaling=1.2500000
}
