class DamTypeIonBlast extends WeaponDamageType
	abstract;

defaultproperties
{
	WeaponClass=Class'XWeapons.Painter'
	DeathString="%o was OBLITERATED by %k!"
	FemaleSuicide="%o was OBLITERATED"
	MaleSuicide="%o was OBLITERATED"
	bArmorStops=false
	bDetonatesGoop=true
	bSkeletize=true
	bSuperWeapon=true
	GibModifier=0.0000000
	DamageOverlayMaterial=Shader'UT2004Weapons.Shaders.ShockHitShader'
	DamageOverlayTime=1.0000000
}
