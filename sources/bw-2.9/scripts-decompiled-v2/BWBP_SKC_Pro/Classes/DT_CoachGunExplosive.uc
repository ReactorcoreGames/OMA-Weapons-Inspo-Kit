class DT_CoachGunExplosive extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's explosive double barrel shot blasted %o into giblets."
	DeathStrings[1]="%o was served a double helping of %k's explosive shotgun shells."
	DeathStrings[2]="%o was disassembled by %k's trenchgun."
	SimpleKillString="Trenchgun Explosive Rounds"
	InvasionDamageScaling=1.2500000
	DamageDescription=",Shell,Fire,"
	WeaponClass=Class'BWBP_SKC_Pro.CoachGun'
	DeathString="%k's explosive double barrel shot blasted %o into giblets."
	FemaleSuicide="%o got a little too close to her own explosive rounds."
	MaleSuicide="%o got a little too close to his own explosive rounds."
	GibModifier=0.5000000
	GibPerterbation=0.4000000
	KDamageImpulse=15000.0000000
	VehicleDamageScaling=2.0000000
}
