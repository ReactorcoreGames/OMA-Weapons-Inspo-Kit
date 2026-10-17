class DT_RSDarkFireBomb extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's DarkStar fireball destroyed %o."
	DeathStrings[1]="%o was bombarded by %k's Dark hellfire bomb."
	DeathStrings[2]="%k slung a burning hot fireball under %o's legs."
	DeathStrings[3]="%o got scorched in half by %k's unholy fireball."
	DeathStrings[4]="%k's fireball burned a hole through %o's chest."
	SimpleKillString="Dark Star Fireball"
	DamageIdent="Energy"
	DamageDescription=",Flame,Hazard,NonSniper,DarkStar,"
	WeaponClass=Class'BallisticProV55.RSDarkStar'
	DeathString="%k's fireball burned a hole through %o's chest."
	FemaleSuicide="%o bombed herself with a Dark fireball."
	MaleSuicide="%o bombed himself with a Dark fireball."
	bSkeletize=true
	bDelayedDamage=true
	KDamageImpulse=2000.0000000
	VehicleDamageScaling=1.0000000
	VehicleMomentumScaling=0.5000000
}
