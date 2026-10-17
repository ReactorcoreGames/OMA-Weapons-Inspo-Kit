class DT_RSDarkFast extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k burned down %o with a Dark Star."
	DeathStrings[1]="%o was torn into tatters by %k's fiery Dark Star."
	DeathStrings[2]="%o found %vs being incinerated by %k's DarkStar."
	DeathStrings[3]="%k sprayed %o with burning hot Dark Star shots."
	BloodManagerName="BallisticProV55.BloodMan_DarkSlow"
	bOnlySeverLimbs=true
	bIgniteFires=true
	DamageIdent="Energy"
	DamageDescription=",DarkStar,"
	WeaponClass=Class'BallisticProV55.RSDarkStar'
	DeathString="%k burned down %o with a Dark Star."
	FemaleSuicide="%o destroyed herself with her Dark Star."
	MaleSuicide="%o destroyed himself with his Dark Star."
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.6000000
	VehicleMomentumScaling=0.2000000
}
