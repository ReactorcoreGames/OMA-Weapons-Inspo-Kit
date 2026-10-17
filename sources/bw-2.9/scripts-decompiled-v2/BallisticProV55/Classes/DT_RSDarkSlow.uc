class DT_RSDarkSlow extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k obliterated %o with %kh Dark Star."
	DeathStrings[1]="%o was sent to Satan's domain with %k's Dark shots."
	DeathStrings[2]="%k completely annihilated %o in a fiery DarkStar frenzy."
	DeathStrings[3]="%o got %vs smelted by %k's Dark Star."
	SimpleKillString="Dark Star Bolt"
	BloodManagerName="BallisticProV55.BloodMan_DarkSlow"
	bIgniteFires=true
	DamageIdent="Energy"
	DamageDescription=",DarkStar,"
	WeaponClass=Class'BallisticProV55.RSDarkStar'
	DeathString="%k obliterated %o %kh Dark Star."
	FemaleSuicide="%o nebulised herself with a Dark Star."
	MaleSuicide="%o nebulised himself with a Dark Star."
	GibModifier=4.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.6000000
	VehicleMomentumScaling=0.2000000
}
