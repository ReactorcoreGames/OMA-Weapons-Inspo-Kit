class DTFG50Overheat extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	MaleSuicides[0]="%o fatally overheated his FG50 Machinegun."
	MaleSuicides[1]="%o fused his hands to an overheating gun."
	MaleSuicides[2]="%o's FG50 Machinegun burned through his hands."
	SimpleSuicideString="FG50 Machinegun Overheat"
	InvasionDamageScaling=2.0000000
	DamageIdent="Assault"
	DamageDescription=",Flame,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.FG50MachineGun'
	DeathString="%k somehow managed to burn %o with his overheating FG50."
	FemaleSuicide="%o's FG50 Machinegun burned through her hands."
	MaleSuicide="%o's FG50 Machinegun burned through his hands."
	bArmorStops=false
	bCausesBlood=false
	VehicleDamageScaling=0.2000000
	VehicleMomentumScaling=0.0500000
}
