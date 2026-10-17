class DTA42Skrith extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k enlightened %o with A42 fire."
	DeathStrings[1]="%k fused %o into a corpse."
	SimpleKillString="A42 Skrith Plasma"
	BloodManagerName="BallisticProV55.BloodMan_A73Burn"
	DamageIdent="Pistol"
	DamageDescription=",Plasma,"
	WeaponClass=Class'BallisticProV55.A42SkrithPistol'
	DeathString="%k enlightened %o with A42 fire."
	FemaleSuicide="%o's A42 fused her into a corpse."
	MaleSuicide="%o's A42 fused him into a corpse."
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.6000000
	VehicleMomentumScaling=0.2000000
}
