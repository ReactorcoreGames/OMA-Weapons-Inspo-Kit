class DamTypeLinkShaft extends WeaponDamageType
	abstract;

static function GetHitEffects(out Class<xEmitter> HitEffects[4], int VictemHealth)
{
	HitEffects[0] = Class'XEffects.HitSmoke';
	//return;	
}

defaultproperties
{
	WeaponClass=Class'XWeapons.LinkGun'
	DeathString="%o was carved up by %k's green shaft."
	FemaleSuicide="%o shafted herself."
	MaleSuicide="%o shafted himself."
	ThemSuicide="%o shafted themself."
	bDetonatesGoop=true
	bSkeletize=true
	bCausesBlood=false
	bLeaveBodyEffect=true
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LinkHit'
	DamageOverlayTime=0.5000000
}
