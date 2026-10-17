class DamTypeSniperShot extends WeaponDamageType
	abstract;

static function GetHitEffects(out Class<xEmitter> HitEffects[4], int VictemHealth)
{
	HitEffects[0] = Class'XEffects.HitSmoke';
	//return;	
}

defaultproperties
{
	WeaponClass=Class'XWeapons.SniperRifle'
	DeathString="%o rode %k's lightning."
	FemaleSuicide="%o had an electrifying experience."
	MaleSuicide="%o had an electrifying experience."
	bDetonatesGoop=true
	bCauseConvulsions=true
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.2500000
	VehicleDamageScaling=0.8500000
}
