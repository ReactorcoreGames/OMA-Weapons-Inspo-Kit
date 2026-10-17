class DT_MACSelf extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	SimpleKillString="HAMR Self-Damage"
	DamageIdent="Ordnance"
	WeaponClass=Class'BallisticProV55.MACWeapon'
	DeathString="Damagetype bug - HAMR self damage killed another player."
	FemaleSuicide="%o's HAMR knocked her shoulder out."
	MaleSuicide="%o's HAMR knocked his shoulder out."
	bDelayedDamage=true
	VehicleDamageScaling=1.0000000
	VehicleMomentumScaling=1.0000000
}
