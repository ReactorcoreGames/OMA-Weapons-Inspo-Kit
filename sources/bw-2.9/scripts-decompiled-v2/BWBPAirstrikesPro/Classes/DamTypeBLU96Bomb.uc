class DamTypeBLU96Bomb extends DT_BWExplode
	abstract
	config(BallisticProV55);

static function GetHitEffects(out Class<xEmitter> HitEffects[4], int VictimHealth)
{
	HitEffects[0] = Class'XEffects.HitFlame';
	HitEffects[1] = Class'XEffects.HitFlameBig';
	//return;	
}

defaultproperties
{
	SimpleKillString="BLU-96 Fuel-Air Bomb'"
	InvasionDamageScaling=15.0000000
	WeaponClass=Class'BWBPAirstrikesPro.TargetDesignator'
	DeathString="%o was obliterated by %k's fuel air bomb. "
	FemaleSuicide="%o was pulverized by her fuel air bomb."
	MaleSuicide="%o was pulverized by his fuel air bomb."
	bSuperWeapon=true
	KDamageImpulse=40000.0000000
	VehicleDamageScaling=15.0000000
}
