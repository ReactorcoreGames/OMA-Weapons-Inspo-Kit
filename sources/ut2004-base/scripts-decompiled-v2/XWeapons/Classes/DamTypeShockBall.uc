class DamTypeShockBall extends WeaponDamageType
	abstract;

static function GetHitEffects(out Class<xEmitter> HitEffects[4], int VictemHealth)
{
	HitEffects[0] = Class'XEffects.HitSmoke';
	//return;	
}

defaultproperties
{
	WeaponClass=Class'XWeapons.ShockRifle'
	DeathString="%o was wasted by %k's shock core."
	FemaleSuicide="%o snuffed herself with the shock core."
	MaleSuicide="%o snuffed himself with the shock core."
	ThemSuicide="%o snuffed themself with the shock core."
	bDetonatesGoop=true
	bDelayedDamage=true
	DamageOverlayMaterial=Shader'UT2004Weapons.Shaders.ShockHitShader'
	DamageOverlayTime=0.8000000
}
