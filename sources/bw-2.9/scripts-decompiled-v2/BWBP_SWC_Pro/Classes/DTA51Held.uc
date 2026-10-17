class DTA51Held extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o got a share of %k's suicide."
	DeathStrings[1]="%o came too close to acidify crazy %k."
	DeathStrings[2]="%k killed %o with a Self Propelled Grenade."
	FemaleSuicides[0]="%o forgot to let go of her A51."
	FemaleSuicides[1]="%o couldn't part with her A51 so it parted her."
	MaleSuicides[0]="%o forgot to let go of his A51."
	MaleSuicides[1]="%o couldn't part with his A51 so it parted him."
	bNoSeverStumps=true
	WeaponClass=Class'BWBP_SWC_Pro.A51Grenade'
	DeathString="%o got a share of %k's suicide."
	FemaleSuicide="%o forgot to let go of her A51."
	MaleSuicide="%o forgot to let go of his A51."
	bSkeletize=true
	GibModifier=0.5000000
	GibPerterbation=0.9000000
	VehicleDamageScaling=1.5000000
	VehicleMomentumScaling=1.5000000
}
