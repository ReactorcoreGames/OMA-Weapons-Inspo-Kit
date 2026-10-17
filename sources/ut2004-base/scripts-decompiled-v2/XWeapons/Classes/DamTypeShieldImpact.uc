class DamTypeShieldImpact extends WeaponDamageType
	abstract;

defaultproperties
{
	WeaponClass=Class'XWeapons.ShieldGun'
	DeathString="%o was pulverized by %k's shield gun."
	FemaleSuicide="%o threw her weight around once too often."
	MaleSuicide="%o threw his weight around once too often."
	ThemSuicide="%o threw their weight around once too often."
	bDetonatesGoop=true
	bKUseOwnDeathVel=true
	KDeathVel=450.0000000
	KDeathUpKick=300.0000000
	VehicleMomentumScaling=0.3000000
}
