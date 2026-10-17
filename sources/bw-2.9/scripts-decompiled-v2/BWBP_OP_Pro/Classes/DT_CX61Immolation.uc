class DT_CX61Immolation extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was immolated by %k."
	DeathStrings[1]="%k's incineration finally overcame %o."
	DeathStrings[2]="%o ran around sizzling and popping as %k set %vm alight."
	DeathStrings[3]="%k coated %o with flaming gas."
	SimpleKillString="CX61 Flamethrower"
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_OP_Pro.CX61AssaultRifle'
	DeathString="%o was immolated %k."
	FemaleSuicide="%o immolated herself."
	MaleSuicide="%o immolated himself."
	bSkeletize=true
	bDelayedDamage=true
	GibPerterbation=0.1000000
	KDamageImpulse=200.0000000
	VehicleDamageScaling=0.5000000
}
