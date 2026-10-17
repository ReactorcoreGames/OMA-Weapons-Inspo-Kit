class DTSMATRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was a little too close to %k's Flak 16 test site."
	DeathStrings[1]="%o's spine is flying away thanks to %k's recoilless rifle."
	DeathStrings[2]="%k assasinated %o with heavy SM-AT/AA firepower."
	DeathStrings[3]="%k's recoilless rifle dismantled %o."
	FemaleSuicides[0]="%o targeted herself with a Flak 16."
	FemaleSuicides[1]="%o had a happy SMAT-propelled rocket jump."
	FemaleSuicides[2]="%o looked through her SM-AT/AA's exhaust pipe and fired."
	MaleSuicides[0]="%o targeted himself with a Flak 16."
	MaleSuicides[1]="%o had a happy SMAT-propelled rocket jump."
	MaleSuicides[2]="%o looked through his SM-AT/AA's exhaust pipe and fired."
	WeaponClass=Class'BWBP_SKC_Pro.SMATLauncher'
	DeathString="%o was a little too close to %k's Flak 16 test site."
	FemaleSuicide="%o pointed her SMAT in the wrong direction."
	MaleSuicide="%o pointed his SMAT in the wrong direction."
	bDelayedDamage=true
	VehicleDamageScaling=0.3000000
	VehicleMomentumScaling=0.4000000
}
