class DamTypeMK77Bomb extends DT_BWFire
	abstract
	config(BallisticProV55);

defaultproperties
{
	SimpleKillString="MK-77 Incendiary Bomb"
	WeaponClass=Class'BWBPAirstrikesPro.TargetDesignator'
	DeathString="%o ran around covered in %k's burning napalm."
	FemaleSuicide="%o set herself on fire."
	MaleSuicide="%o set himself on fire."
	bSuperWeapon=true
	KDamageImpulse=40000.0000000
	VehicleDamageScaling=1.5000000
}
