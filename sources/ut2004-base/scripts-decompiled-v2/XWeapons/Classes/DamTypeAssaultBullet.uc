class DamTypeAssaultBullet extends WeaponDamageType
	abstract;

defaultproperties
{
	WeaponClass=Class'XWeapons.AssaultRifle'
	DeathString="%o was ventilated by %k's assault rifle."
	FemaleSuicide="%o assaulted herself."
	MaleSuicide="%o assaulted himself."
	ThemSuicide="%o assaulted themself."
	bRagdollBullet=true
	bBulletHit=true
	FlashFog=(X=600.0000000,Y=0.0000000,Z=0.0000000)
	KDamageImpulse=2000.0000000
	VehicleDamageScaling=0.7000000
}
