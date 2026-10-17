class DTM50GrenadeRadius extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o lost a few teeth to %k's M900 grenade."
	DeathStrings[1]="%k's M900 grenade turned %o into chunky red ash."
	DeathStrings[2]="%o found %k's M900 grenade."
	SimpleKillString="M50 Grenade"
	InvasionDamageScaling=2.0000000
	WeaponClass=Class'BallisticProV55.M50AssaultRifle'
	DeathString="%o lost a few teeth to %k's M900 grenade."
	FemaleSuicide="%o found one of her M900 grenades."
	MaleSuicide="%o found one of his M900 grenades."
	bDelayedDamage=true
}
