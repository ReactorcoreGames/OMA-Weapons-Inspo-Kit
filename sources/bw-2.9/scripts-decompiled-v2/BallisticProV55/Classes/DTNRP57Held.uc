class DTNRP57Held extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o got a share of %k's suicide."
	DeathStrings[1]="%o came too close to pinapple crazy %k."
	DeathStrings[2]="%k killed %o with a self propelled grenade."
	FemaleSuicides[0]="%o forgot to let go of her NRP-57."
	FemaleSuicides[1]="%o couldn't part with her NRP-57 so it parted her."
	MaleSuicides[0]="%o forgot to let go of his NRP-57."
	MaleSuicides[1]="%o couldn't part with his NRP-57 so it parted him."
	bNoSeverStumps=true
	InvasionDamageScaling=3.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BallisticProV55.NRP57Grenade'
	DeathString="%o got a share of %k's suicide."
	FemaleSuicide="%o forgot to let go of her NRP-57."
	MaleSuicide="%o forgot to let go of his NRP-57."
	bSkeletize=true
	GibModifier=0.5000000
	GibPerterbation=0.9000000
	VehicleDamageScaling=1.5000000
	VehicleMomentumScaling=0.3500000
}
