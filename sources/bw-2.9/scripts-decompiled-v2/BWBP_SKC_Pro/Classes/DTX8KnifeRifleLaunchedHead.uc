class DTX8KnifeRifleLaunchedHead extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's knife defied all odds to enter %o's vodka-blurred eye."
	DeathStrings[1]="%k drunkenly launched a knife into %o's face."
	DeathStrings[2]="%o took a knife to the eye from %k's AK490 launcher."
	SimpleKillString="AK-490 Bayonet Launched"
	bCanBeBlocked=false
	DisplacementType=0
	bHeaddie=true
	WeaponClass=Class'BWBP_SKC_Pro.AK490BattleRifle'
	DeathString="%k's knife defied all odds to enter %o's vodka-blurred eye."
	FemaleSuicide="%o's AK490 bayonet gave her a surprise."
	MaleSuicide="%o's AK490 bayonet gave him a surprise."
	bArmorStops=false
	bNeverSevers=true
	KDamageImpulse=1000.0000000
}
