class DTG28Explode extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k turned %o's G28 into a fuel air explosive."
	DeathStrings[1]="%o's G28 'spontaneously' combusted thanks to %k."
	DeathStrings[2]="%k demonstrated the effects of combustion to %o."
	DeathStrings[3]="%k blew up the G28 %o was busy huffing."
	WeaponClass=Class'BWBP_SKC_Pro.G28Grenade'
	DeathString="%k turned %o's G28 into a fuel air explosive."
	FemaleSuicide="%o didn't read the flammable label on her G28."
	MaleSuicide="%o didn't read the flammable label on his G28."
	bDelayedDamage=true
	VehicleDamageScaling=0.3500000
	VehicleMomentumScaling=0.5000000
}
