class DT_MARSMineDet extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o ignored all the warning signs of %k's MARS mine."
	DeathStrings[1]="%o tried to pick up %k's spent MARS mine."
	DeathStrings[2]="%k's MARS mine showed %o its final trick."
	DeathStrings[3]="%o was loitering near %k's MARS shockwave grenade."
	FemaleSuicides[0]="%o tried to fetch her dying MARS mine."
	FemaleSuicides[1]="%o found out why her MARS mine had stopped pulsing."
	MaleSuicides[0]="%o tried to fetch his dying MARS mine."
	MaleSuicides[1]="%o found out why his MARS mine had stopped pulsing."
	SimpleKillString="MARS-2 Pulse Grenade"
	WeaponClass=Class'BWBP_SKC_Pro.MARSAssaultRifle'
	DeathString="%o ignored all the warning signs of %k's MARS mine."
	FemaleSuicide="%o found out why her MARS mine had stopped pulsing."
	MaleSuicide="%o found out why his MARS mine had stopped pulsing."
	bDelayedDamage=true
	VehicleDamageScaling=1.9000000
	VehicleMomentumScaling=0.8000000
}
