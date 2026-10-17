class DTA800MG extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was ripped apart by %k's A800."
	DeathStrings[1]="%k put a hail of energy beams through %o."
	DeathStrings[2]="%o was ribbonized by %k's A800 Hyperblaster."
	DeathStrings[3]="%o was torn asunder by the might of %k's A800."
	BloodManagerName="BallisticProV55.BloodMan_A73Burn"
	DamageDescription=",Plasma,Laser,"
	WeaponClass=Class'BWBP_SWC_Pro.A800SkrithMinigun'
	DeathString="%o was ripped apart by %k's A800."
	FemaleSuicide="%o minigunned her feet into tatters."
	MaleSuicide="%o minigunned his feet into tatters."
	bFastInstantHit=true
	VehicleDamageScaling=0.3000000
	VehicleMomentumScaling=0.5000000
}
