class DT_G51HEGrenade extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was tagged by %k's rifle grenade."
	DeathStrings[1]="%o played with %k's live rifle grenade."
	SimpleKillString="G51 HE Grenade"
	InvasionDamageScaling=2.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BWBP_SKC_Pro.G51Carbine'
	DeathString="%o was tagged by %k's rifle grenade."
	FemaleSuicide="%o tagged herself with her own grenade."
	MaleSuicide="%o tagged himself with his own grenade."
	bDelayedDamage=true
}
