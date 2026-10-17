class DamTypeGBU57Bomb extends DT_BWExplode
	abstract
	config(BallisticProV55);

defaultproperties
{
	SimpleKillString="GBU-43 Massive Ordnance Penetrator"
	WeaponClass=Class'BWBPAirstrikesPro.TargetDesignator'
	DeathString="%k dropped a MOP on %o's head. "
	FemaleSuicide="%o dropped a MOP on her own head."
	MaleSuicide="%o dropped a MOB on his own head."
	bSuperWeapon=true
	KDamageImpulse=40000.0000000
	VehicleDamageScaling=2.0000000
}
