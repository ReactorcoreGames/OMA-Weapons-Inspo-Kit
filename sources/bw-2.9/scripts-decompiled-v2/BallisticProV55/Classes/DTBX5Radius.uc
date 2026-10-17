class DTBX5Radius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o jumped onto %k's BX5 mine."
	DeathStrings[1]="%o tried to stamp out %k's BX5."
	DeathStrings[2]="%o was mined by %k."
	DeathStrings[3]="%o didn't quite spot %k's mine."
	WeaponClass=Class'BallisticProV55.BX5Mine'
	DeathString="%o jumped onto %k's BX5 Mine."
	FemaleSuicide="%o tripped on her own mine."
	MaleSuicide="%o tripped on his own mine."
	bDelayedDamage=true
	VehicleDamageScaling=3.0000000
	VehicleMomentumScaling=3.0000000
}
