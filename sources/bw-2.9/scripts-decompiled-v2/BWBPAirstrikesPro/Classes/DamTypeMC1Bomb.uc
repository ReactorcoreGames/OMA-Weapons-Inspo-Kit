class DamTypeMC1Bomb extends DT_BWMiscDamage
	abstract
	config(BallisticProV55);

defaultproperties
{
	SimpleKillString="MC1 Chemical Bomb"
	WeaponClass=Class'BWBPAirstrikesPro.TargetDesignator'
	DeathString="%o choked on %k's poison gas. "
	FemaleSuicide="%o forgot to check which way the wind was blowing. "
	MaleSuicide="%o forgot to check which way the wind was blowing. "
	bSuperWeapon=true
	KDamageImpulse=40000.0000000
	VehicleDamageScaling=0.0000000
}
