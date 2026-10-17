class DT_RCS715Grenade extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k blasted a RCS-715 grenade directly into %o's helpless body."
	SimpleKillString="RCS-715 Grenade Impact"
	BloodManagerName="BallisticProV55.BloodMan_BluntSmall"
	bDetonatesBombs=false
	bIgnoredOnLifts=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Grenade"
	DamageDescription=",Blunt,Hazard,"
	WeaponClass=Class'BWBP_OP_Pro.RCS715Shotgun'
	DeathString="%k blasted a RCS-715 grenade directly into %o's helpless body."
	FemaleSuicide="%o layed a RCS-715 grenade at her own feet."
	MaleSuicide="%o layed a RCS-715 grenade at his own feet."
	bDelayedDamage=true
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
}
