class DTM50Grenade extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was tagged by %k's M900 grenade."
	DeathStrings[1]="%o played with %k's live M900 grenade."
	SimpleKillString="M50 Grenade"
	InvasionDamageScaling=2.0000000
	DamageIdent="Grenade"
	WeaponClass=Class'BallisticProV55.M50AssaultRifle'
	DeathString="%o was tagged by %k's M900 grenade."
	FemaleSuicide="%o tagged herself with her own grenade."
	MaleSuicide="%o tagged himself with his own grenade."
	bDelayedDamage=true
}
