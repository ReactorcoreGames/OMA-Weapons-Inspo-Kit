class DamTypeGBU38Bomb extends DT_BWExplode
	abstract
	config(BallisticProV55);

defaultproperties
{
	SimpleKillString="GBU-38 JDAM'"
	WeaponClass=Class'BWBPAirstrikesPro.TargetDesignator'
	DeathString="%o was struck down by %k's JDAM."
	FemaleSuicide="%o forgot where she targeted her JDAM."
	MaleSuicide="%o forgot where she targeted his JDAM."
	bSuperWeapon=true
	KDamageImpulse=40000.0000000
	VehicleDamageScaling=1.5000000
}
