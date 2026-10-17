class DTXK2Freeze extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's XK2 turned %o's skin into a deathly shade of black."
	DeathStrings[1]="%o made a silly pose at the wrong time, inspiring %k to turn %vm into an ice statue."
	DeathStrings[2]="%k amped up %kh XK2 to trap %o in the freezer."
	DeathStrings[3]="%o got lost in %k's snowstorm, a snowstorm of 9mm lead."
	SimpleKillString="XK2 Freeze Rounds"
	FlashThreshold=0
	FlashV=(X=350.0000000,Y=350.0000000,Z=700.0000000)
	FlashF=0.2500000
	TagMultiplier=0.4000000
	TagDuration=0.4000000
	DamageIdent="SMG"
	WeaponClass=Class'BallisticProV55.XK2SubMachinegun'
	DeathString="%k's cryo grenade put %o on ice."
	FemaleSuicide="%o stayed out in the cold."
	MaleSuicide="%o stayed out in the cold."
	GibModifier=0.5000000
	GibPerterbation=0.4000000
	KDamageImpulse=15000.0000000
	VehicleDamageScaling=1.0000000
}
