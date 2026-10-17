class DamTypeCBU72Bomb extends DT_BWExplode
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
	SimpleKillString="CBU-72 Cluster Bomb"
	WeaponClass=Class'BWBPAirstrikesPro.TargetDesignator'
	DeathString="%o was pulverized by %k's multiple fuel-air explosive shockwaves."
	FemaleSuicide="%o didn't get out of the way of her fuel-air explosives fast enough."
	MaleSuicide="%o didn't get out of the way of his fuel-air explosives fast enough."
	bSuperWeapon=true
	KDamageImpulse=40000.0000000
	VehicleDamageScaling=2.0000000
}
