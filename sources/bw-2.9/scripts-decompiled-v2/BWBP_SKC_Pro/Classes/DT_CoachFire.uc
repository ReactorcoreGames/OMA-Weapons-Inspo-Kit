class DT_CoachFire extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="It wasnâ€™t the burn that got %o, it was the impact from %kâ€™s Trenchgun that did them in."
	DeathStrings[1]="%k reduced %o to cinders after shooting them with some good olâ€™ phosphorus."
	DeathStrings[2]="%o took %kâ€™s phosphorous point blank in the chest, searing the flesh off their ribcage."
	DeathStrings[3]="%k started a fire using their trenchgun and %o as their fleshy tinder."
	DeathStrings[4]="To say %o was overheated by %kâ€™s dragonâ€™s breath would be an understatement."
	bIgniteFires=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	WeaponClass=Class'BWBP_SKC_Pro.CoachGun'
	DeathString="It wasnâ€™t the burn that got %o, it was the impact from %kâ€™s Trenchgun that did them in."
	FemaleSuicide="%o roasted themselves with a dragonâ€™s breath shell."
	MaleSuicide="%o roasted themselves with a dragonâ€™s breath shell."
	bExtraMomentumZ=true
	GibPerterbation=0.4000000
	KDamageImpulse=25000.0000000
	VehicleMomentumScaling=0.2000000
}
