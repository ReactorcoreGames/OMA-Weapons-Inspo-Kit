class DTAM67Pistol extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k shot %o to the ground with %kh AM67."
	DeathStrings[1]="%k ploughed a hole through %o with %kh AM67."
	DeathStrings[2]="%o was bullied out of the way by %k's AM67."
	DeathStrings[3]="%k negotiated %o into a corner with AM67 rounds."
	DamageIdent="Pistol"
	WeaponClass=Class'BallisticProV55.AM67Pistol'
	DeathString="%k shot %o to the ground with %kh AM67."
	FemaleSuicide="%o nailed herself with the AM67."
	MaleSuicide="%o nailed himself with the AM67."
	VehicleDamageScaling=0.1000000
	VehicleMomentumScaling=0.1000000
}
