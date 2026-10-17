class DT_FM13CloudBomb extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k bombed %o with fire."
	DeathStrings[1]="%o got caught up in %k's firestorm."
	DeathStrings[2]="%k's firebomb charred %o into ash."
	InvasionDamageScaling=1.5000000
	DamageIdent="Machinegun"
	WeaponClass=Class'BWBP_OP_Pro.FM13Shotgun'
	DeathString="%k bombed %o with fire."
	FemaleSuicide="%o bombed herself."
	MaleSuicide="%o bombed himself."
	bDelayedDamage=true
	KDamageImpulse=2000.0000000
	VehicleDamageScaling=0.8000000
}
