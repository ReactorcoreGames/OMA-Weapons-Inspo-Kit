class DamTypeLinkPlasma extends WeaponDamageType
	abstract;

static function GetHitEffects(out Class<xEmitter> HitEffects[4], int VictemHealth)
{
	HitEffects[0] = Class'XEffects.HitSmoke';
	//return;	
}

defaultproperties
{
	WeaponClass=Class'XWeapons.LinkGun'
	DeathString="%o was served an extra helping of %k's plasma."
	FemaleSuicide="%o fried herself with her own plasma blast."
	MaleSuicide="%o fried himself with his own plasma blast."
	ThemSuicide="%o fried themself with their own plasma blast."
	bDetonatesGoop=true
	bDelayedDamage=true
	FlashFog=(X=700.0000000,Y=0.0000000,Z=0.0000000)
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LinkHit'
	DamageOverlayTime=0.5000000
	VehicleDamageScaling=0.6700000
}
