class DT_RSDarkBacklash extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's underworld fire erupted under %o's feet."
	DeathStrings[1]="%o was scorched from below by %k's Dark immolation."
	DeathStrings[2]="%k scourged %o from the map with hellfire."
	SimpleKillString="Dark Star Backlash"
	DamageIdent="Energy"
	DamageDescription=",Flame,Hazard,NonSniper,DarkStar,"
	WeaponClass=Class'BallisticProV55.RSDarkStar'
	DeathString="%k's underworld fire erupted under %o's feet."
	FemaleSuicide="%o angered her Dark Star."
	MaleSuicide="%o angered his Dark Star."
	bSkeletize=true
	KDamageImpulse=2000.0000000
	VehicleDamageScaling=2.0000000
}
