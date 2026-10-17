class DamTypeCBU100Bomb extends DT_BWExplode
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
	SimpleKillString="CBU-100 Cluster Bomb"
	WeaponClass=Class'BWBPAirstrikesPro.TargetDesignator'
	DeathString="%o didn't see %k's bomblets from his cluster bomb."
	FemaleSuicide="%o cluster bombed herself."
	MaleSuicide="%o cluster bombed himself."
	KDamageImpulse=40000.0000000
	VehicleDamageScaling=2.0000000
}
