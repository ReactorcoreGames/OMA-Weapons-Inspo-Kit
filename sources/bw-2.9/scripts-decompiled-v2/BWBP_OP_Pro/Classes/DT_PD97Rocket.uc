class DT_PD97Rocket extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k made a night-light out of %o's stomach with a rocket."
	DeathStrings[1]="%o tried to catch %k's rocket in a lapse of judgement."
	DeathStrings[2]="%k lodged a rocket down %o's throat."
	DeathStrings[3]="%k launched a rocket right up %o's nostril."
	SimpleKillString="PD97 Rocket"
	InvasionDamageScaling=2.0000000
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_OP_Pro.PD97Bloodhound'
	DeathString="%k made a night-light out of %o's stomach with a rocket."
	FemaleSuicide="%o had her heart set aflame by a PD97 rocket."
	MaleSuicide="%o had his heart set aflame by a PD97 rocket."
	bDelayedDamage=true
	bExtraMomentumZ=true
}
