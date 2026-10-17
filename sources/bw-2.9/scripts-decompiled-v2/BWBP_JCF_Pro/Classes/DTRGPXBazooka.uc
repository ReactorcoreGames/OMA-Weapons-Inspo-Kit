class DTRGPXBazooka extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k got a bullseye on %o, and was rewarded with chunks of gibs."
	DeathStrings[1]="%o was in the wrong place at the wrong time, getting tagged by %k's bazooka."
	DeathStrings[2]="%k managed to drill %o in the groin before they went boom."
	DeathStrings[3]="%o caught %k's red hot potato just mere seconds before exploding into a modern art piece."
	DeathStrings[4]="%k lodged a rocket into %o's exhaust pipe, exploding them to pieces."
	DeathStrings[5]="%o used to be an adventurer before taking %k's rocket to the knee caps."
	DisplacementType=1
	AimDisplacementDamageThreshold=100
	AimDisplacementDuration=0.7000000
	InvasionDamageScaling=3.0000000
	DamageIdent="Ordnance"
	WeaponClass=Class'BWBP_JCF_Pro.RGPXBazooka'
	DeathString="%o was blown to pieces by %k's Bazooka."
	FemaleSuicide="%o splattered the walls with her gibs using a Bazooka."
	MaleSuicide="%o splattered the walls with his gibs using a Bazooka."
	bDelayedDamage=true
	VehicleDamageScaling=1.5000000
	VehicleMomentumScaling=1.5000000
}
