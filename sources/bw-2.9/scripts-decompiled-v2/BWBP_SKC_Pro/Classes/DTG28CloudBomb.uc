class DTG28CloudBomb extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k brought %o's healing to a fiery end."
	DeathStrings[1]="%o's gas huffing was brought to an end by %k's fiery intervention."
	DeathStrings[2]="%k turned up the heat on %o's healing party."
	WeaponClass=Class'BWBP_SKC_Pro.G28Grenade'
	DeathString="%k bombed %o with fire."
	FemaleSuicide="%o didn't read the flammable label on her G28."
	MaleSuicide="%o didn't read the flammable label on his G28."
	bDelayedDamage=true
	KDamageImpulse=2000.0000000
	VehicleDamageScaling=0.8000000
}
