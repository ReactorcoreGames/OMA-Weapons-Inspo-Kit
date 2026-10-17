class DamTypeShockBeam extends WeaponDamageType
	abstract;

static function GetHitEffects(out Class<xEmitter> HitEffects[4], int VictemHealth)
{
	HitEffects[0] = Class'XEffects.HitSmoke';
	//return;	
}

defaultproperties
{
	WeaponClass=Class'XWeapons.ShockRifle'
	DeathString="%o was fatally enlightened by %k's shock beam."
	FemaleSuicide="%o somehow managed to shoot herself with the shock rifle."
	MaleSuicide="%o somehow managed to shoot himself with the shock rifle."
	ThemSuicide="%o somehow managed to shoot themself with the shock rifle."
	bDetonatesGoop=true
	DamageOverlayMaterial=Shader'UT2004Weapons.Shaders.ShockHitShader'
	DamageOverlayTime=0.8000000
	GibPerterbation=0.7500000
	VehicleDamageScaling=0.8500000
	VehicleMomentumScaling=0.5000000
}
