class DTScarabHeld extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o and %k were both eaten alive by %k's horde of Scarabs."
	DeathStrings[1]="%o came too close to Scarab crazy %k."
	DeathStrings[2]="%k shared %kh love of Scarabs with %o, too bad it devoured %vm."
	FemaleSuicides[0]="%o held onto their explosive treasure a bit too long."
	FemaleSuicides[1]="%o became a meal for their own swarm of Scarabs."
	FemaleSuicides[2]="%o walked right into a swarm of clusters, their own to be exact."
	MaleSuicides[0]="%o held onto their explosive treasure a bit too long."
	MaleSuicides[1]="%o became a meal for their own swarm of Scarabs."
	MaleSuicides[2]="%o walked right into a swarm of clusters, their own to be exact."
	bNoSeverStumps=true
	InvasionDamageScaling=3.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BWBP_APC_Pro.ScarabGrenade'
	DeathString="%o got a share of %k's suicide."
	FemaleSuicide="%o forgot to let go of her NRX-82."
	MaleSuicide="%o forgot to let go of his NRX-82."
	bSkeletize=true
	GibModifier=0.5000000
	GibPerterbation=0.9000000
	VehicleDamageScaling=1.5000000
	VehicleMomentumScaling=0.3500000
}
