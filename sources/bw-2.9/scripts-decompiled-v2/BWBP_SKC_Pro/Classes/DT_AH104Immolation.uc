class DT_AH104Immolation extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was sent to hell by %k's hellfire's fire."
	DeathStrings[1]="%k's hellfire cremated %o to ashes, ready to be stuffed in an urn."
	DeathStrings[2]="%k overcooked %o by about thousand degrees."
	DeathStrings[3]="%o couldnâ€™t handle %k's heat, so %ve got doused with flame instead."
	DeathStrings[4]="%k showed off the Hellfire to %o, it's too hot to handle for %vm."
	SimpleKillString="AH104 Flamethrower"
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_SKC_Pro.AH104Pistol'
	DeathString="%o was immolated %k."
	FemaleSuicide="%o immolated herself."
	MaleSuicide="%o immolated himself."
	bSkeletize=true
	bDelayedDamage=true
	GibPerterbation=0.1000000
	KDamageImpulse=200.0000000
	VehicleDamageScaling=0.5000000
}
