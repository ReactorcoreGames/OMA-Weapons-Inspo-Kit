class DTCYLOFirestormOverheat extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	MaleSuicides[0]="%o fatally overheated his CYLO Firestorm."
	MaleSuicides[1]="%o fused his hands to an overheating gun."
	MaleSuicides[2]="%o's CYLO Firestorm burned through his hands."
	SimpleSuicideString="CYLO Firestorm V Overheat"
	InvasionDamageScaling=1.2500000
	DamageIdent="Assault"
	DamageDescription=",Flame,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.CYLOUAW'
	DeathString="%k somehow managed to burn %o with his overheating Firestorm."
	FemaleSuicide="%o's CYLO Firestorm burned through her hands."
	MaleSuicide="%o's CYLO Firestorm burned through his hands."
	bArmorStops=false
	bCausesBlood=false
	VehicleDamageScaling=0.2000000
	VehicleMomentumScaling=0.0500000
}
