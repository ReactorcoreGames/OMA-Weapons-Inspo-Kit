class DTBX5SpringRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's mine jumped into %o's face."
	DeathStrings[1]="%o tried to kick %k's BX5."
	DeathStrings[2]="%k's BX5 attacked %o as %ve tried to sneak past."
	WeaponClass=Class'BallisticProV55.BX5Mine'
	DeathString="%k's mine jumped into %o's face."
	FemaleSuicide="%o caught her own spring mine out of the air."
	MaleSuicide="%o caught his own spring mine out of the air."
	bDelayedDamage=true
	VehicleMomentumScaling=0.5000000
}
