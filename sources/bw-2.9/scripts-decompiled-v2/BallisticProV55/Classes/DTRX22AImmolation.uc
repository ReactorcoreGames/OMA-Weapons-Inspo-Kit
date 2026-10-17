class DTRX22AImmolation extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was immolated by %k."
	DeathStrings[1]="%k's incineration finally overcame %o."
	DeathStrings[2]="%o ran around sizzling and popping as %k set %vm alight."
	DeathStrings[3]="%k coated %o with flaming gas."
	InvasionDamageScaling=1.5000000
	DamageIdent="Streak"
	WeaponClass=Class'BallisticProV55.RX22AFlamer'
	DeathString="%o was immolated %k."
	FemaleSuicide="%o immolated herself."
	MaleSuicide="%o immolated himself."
	bSkeletize=true
	bDelayedDamage=true
	GibPerterbation=0.1000000
	KDamageImpulse=200.0000000
}
