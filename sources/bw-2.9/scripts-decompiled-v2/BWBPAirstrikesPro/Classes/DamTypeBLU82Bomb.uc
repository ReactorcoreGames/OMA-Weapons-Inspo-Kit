class DamTypeBLU82Bomb extends DT_BWExplode
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
	SimpleKillString="BLU-82 'Daisy Cutter'"
	InvasionDamageScaling=15.0000000
	WeaponClass=Class'BWBPAirstrikesPro.TargetDesignator'
	DeathString="%o didn't notice %k's BLU82 drifting towards him. "
	FemaleSuicide="%o forgot to get out of the way of her BLU82."
	MaleSuicide="%o forgot to get out of the way of his BLU82."
	bSuperWeapon=true
	KDamageImpulse=40000.0000000
	VehicleDamageScaling=15.0000000
}
