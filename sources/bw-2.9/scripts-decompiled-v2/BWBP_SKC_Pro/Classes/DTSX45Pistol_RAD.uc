class DTSX45Pistol_RAD extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k turned %o into a glowstick made out of radiation."
	DeathStrings[1]="%o's veins are glowing green thanks to %k's radioactive handgun."
	DeathStrings[2]="%k turned %o's DNA strands into a soupy mess."
	DeathStrings[3]="%o's bleeding neon green now due to %k's combat pistol."
	FlashV=(X=1500.0000000,Y=1500.0000000,Z=0.0000000)
	FlashF=0.2000000
	TagMultiplier=0.7000000
	TagDuration=0.1000000
	WeaponClass=Class'BWBP_SKC_Pro.SX45Pistol'
	DeathString="%k shot down %o in %vh prime with his SX45K."
	FemaleSuicide="%o somehow shot herself."
	MaleSuicide="%o managed to shoot himself."
	VehicleDamageScaling=0.5000000
}
