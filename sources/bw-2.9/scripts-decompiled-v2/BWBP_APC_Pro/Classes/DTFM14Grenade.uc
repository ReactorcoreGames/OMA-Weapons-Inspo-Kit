class DTFM14Grenade extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was tagged by %k's S900 grenade."
	DeathStrings[1]="%o played with %k's live S900 grenade."
	SimpleKillString="FM14 Grenade"
	InvasionDamageScaling=2.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BWBP_APC_Pro.FM14Shotgun'
	DeathString="%o was tagged by %k's S900 grenade."
	FemaleSuicide="%o tagged herself with her own grenade."
	MaleSuicide="%o tagged himself with his own grenade."
	bDelayedDamage=true
}
