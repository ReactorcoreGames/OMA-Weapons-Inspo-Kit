class DTX8KnifeMGLaunchedHead extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k ran out of bullets, but %kh small knife pierced %o's retina."
	DeathStrings[1]="%o stared down the wrong end of %k's MG, should've seen the ballistic knife poking %vh eye."
	DeathStrings[2]="%k had one last surprise for %o, a ballistic knife to the dome."
	SimpleKillString="PKMA - X8 Ballistic Knife"
	bCanBeBlocked=false
	bHeaddie=true
	WeaponClass=Class'BWBP_APC_Pro.PKMMachinegun'
	DeathString="%k's knife defied all odds to enter %o's vodka-blurred eye."
	FemaleSuicide="%o's PKM bayonet gave her a surprise."
	MaleSuicide="%o's PKM bayonet gave him a surprise."
	bArmorStops=false
	bNeverSevers=true
	KDamageImpulse=1000.0000000
}
