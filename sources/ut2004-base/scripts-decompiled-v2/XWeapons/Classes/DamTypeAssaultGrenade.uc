class DamTypeAssaultGrenade extends WeaponDamageType
	abstract;

defaultproperties
{
	WeaponClass=Class'XWeapons.AssaultRifle'
	DeathString="%o tried to juggle %k's grenade."
	FemaleSuicide="%o jumped on her own grenade."
	MaleSuicide="%o jumped on his own grenade."
	ThemSuicide="%o jumped on their own grenade."
	bDetonatesGoop=true
	bDelayedDamage=true
}
