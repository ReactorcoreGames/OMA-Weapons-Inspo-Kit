class DamTypeW54Bomb extends DT_BWExplode
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
	SimpleKillString="W54 Nuclear Warhead"
	InvasionDamageScaling=15.0000000
	WeaponClass=Class'BWBPAirstrikesPro.TargetDesignator'
	DeathString="%o was wiped off the map by %k's tactical nuke."
	FemaleSuicide="%o didn't duck and cover."
	MaleSuicide="%o didn't duck and cover."
	bSkeletize=true
	bSuperWeapon=true
	KDamageImpulse=40000.0000000
	VehicleDamageScaling=15.0000000
}
