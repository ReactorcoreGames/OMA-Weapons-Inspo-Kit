class DT_LS14RocketRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's LS-14 rocket turned %o into a crawler."
	DeathStrings[1]="%k blew off %o's toes with a wild rocket."
	DeathStrings[2]="%k's rocket ignited %o's brains."
	SimpleKillString="LS-14 Rocket"
	InvasionDamageScaling=2.0000000
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_SKC_Pro.LS14Carbine'
	DeathString="%k made %o crawl for %vh life by the LS-14."
	FemaleSuicide="%o blew herself up with an LS-14 rocket."
	MaleSuicide="%o blew himself up with an LS-14 rocket."
	bDelayedDamage=true
	bExtraMomentumZ=true
}
