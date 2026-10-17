class DamTypeCBU58Bomb extends DT_BWFire
	abstract
	config(BallisticProV55);

static function GetHitEffects(out Class<xEmitter> HitEffects[4], int VictimHealth)
{
	HitEffects[0] = Class'XEffects.HitFlame';
	HitEffects[1] = Class'XEffects.HitFlameBig';
	HitEffects[2] = Class'XEffects.HitFlame';
	HitEffects[3] = Class'XEffects.HitFlameBig';
	HitEffects[4] = Class'XEffects.HitFlame';
	HitEffects[5] = Class'XEffects.HitFlameBig';
	//return;	
}

defaultproperties
{
	SimpleKillString="CBU-58 Incendiary Cluster Bomb"
	WeaponClass=Class'BWBPAirstrikesPro.TargetDesignator'
	DeathString="%o was caught in %k's napalm strike."
	FemaleSuicide="%o immolated herself."
	MaleSuicide="%o immolated himself."
	bSuperWeapon=true
	KDamageImpulse=40000.0000000
	VehicleDamageScaling=1.5000000
}
