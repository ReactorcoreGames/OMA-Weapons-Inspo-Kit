class DTZ250FireTrap extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o dipped %vh toes into %k's puddle of hellfire before being cremated."
	DeathStrings[1]="%k laid %kh trap for %o to fall into perfectly, shame %ve got overcooked."
	DeathStrings[2]="%o tripped into %k's patch of fire, what a clumsy fool."
	DeathStrings[3]="%k's Z250 managed to transform %o into a roasted turkey after burning %vm."
	SimpleKillString="Z250 Gas Explode"
	BloodManagerName="BallisticProV55.BloodMan_FireExploded"
	bOnlySeverLimbs=true
	bIgnoredOnLifts=true
	InvasionDamageScaling=1.5000000
	DamageIdent="Machinegun"
	WeaponClass=Class'BWBP_OP_Pro.Z250Minigun'
	DeathString="%o swam in %k's fire."
	FemaleSuicide="%o ran into a fire."
	MaleSuicide="%o ran into a fire."
	bDelayedDamage=true
	KDamageImpulse=2000.0000000
}
