class DTRX22AFireTrap extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o swam in %k's fire."
	DeathStrings[1]="%k's lurking fire found a victim in %o."
	DeathStrings[2]="%o foolishly stumbled into %k's raging inferno."
	DeathStrings[3]="%k left a fiery surprise for %o to find."
	BloodManagerName="BallisticProV55.BloodMan_FireExploded"
	bOnlySeverLimbs=true
	bIgnoredOnLifts=true
	InvasionDamageScaling=1.5000000
	DamageIdent="Streak"
	WeaponClass=Class'BallisticProV55.RX22AFlamer'
	DeathString="%o swam in %k's fire."
	FemaleSuicide="%o ran into a fire."
	MaleSuicide="%o ran into a fire."
	bDelayedDamage=true
	KDamageImpulse=2000.0000000
}
