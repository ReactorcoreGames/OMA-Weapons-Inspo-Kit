class DamTypeBioGlob extends WeaponDamageType
	abstract;

defaultproperties
{
	WeaponClass=Class'XWeapons.BioRifle'
	DeathString="%o was slimed by %k's bio-rifle."
	FemaleSuicide="%o was slimed by her own goop."
	MaleSuicide="%o was slimed by his own goop."
	ThemSuicide="%o was slimed by their own goop."
	bDetonatesGoop=true
	bDelayedDamage=true
	DeathOverlayMaterial=Shader'XGameShaders.PlayerShaders.LinkHit'
}
