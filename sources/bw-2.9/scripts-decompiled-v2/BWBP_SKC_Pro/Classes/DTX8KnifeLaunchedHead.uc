class DTX8KnifeLaunchedHead extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's knife defied all odds to enter %o's eye."
	DeathStrings[1]="%k launched a knife into %o's face."
	DeathStrings[2]="%k's ballistic knife gave %o a new piercing."
	SimpleKillString="X8 Ballistic Knife Launched"
	bCanBeBlocked=false
	bHeaddie=true
	WeaponClass=Class'BWBP_SKC_Pro.X8Knife'
	DeathString="%k's knife defied all odds to enter %o's eye."
	FemaleSuicide="%o acupunctured her face."
	MaleSuicide="%o acupunctured his face."
	bNeverSevers=true
	KDamageImpulse=1000.0000000
}
