class DTA42SkrithBeam extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was struck down by the hand of %k."
	DeathStrings[1]="%o was speared by %k's plasma lance."
	SimpleKillString="A42 Skrith Charged"
	BloodManagerName="BallisticProV55.BloodMan_A73Burn"
	DamageIdent="Pistol"
	DamageDescription=",Plasma,Laser,"
	WeaponClass=Class'BallisticProV55.A42SkrithPistol'
	DeathString="%k enlightened %o with A42 fire."
	FemaleSuicide="%o's A42 fused her into a corpse."
	MaleSuicide="%o's A42 fused him into a corpse."
	bExtraMomentumZ=true
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.6000000
	VehicleMomentumScaling=0.2000000
}
