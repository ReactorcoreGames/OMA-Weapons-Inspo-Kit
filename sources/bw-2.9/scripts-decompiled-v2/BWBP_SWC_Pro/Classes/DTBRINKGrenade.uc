class DTBRINKGrenade extends DT_BWExplode
	config(BallisticProV55);

var() float ArmorDrain;

defaultproperties
{
	DeathStrings[0]="%o was tagged by %k's M980 Grenade."
	DeathStrings[1]="%o was playing with %k's live M980 Grenade."
	SimpleKillString="BR1-NK Mod-2 Cryo Grenade"
	FlashThreshold=25
	FlashV=(X=350.0000000,Y=350.0000000,Z=700.0000000)
	FlashF=0.2500000
	DamageIdent="Grenade"
	WeaponClass=Class'BWBP_SWC_Pro.BRINKAssaultRifle'
	DeathString="%o was tagged by %k's M980 Grenade."
	FemaleSuicide="%o tagged herself with her own grenade."
	MaleSuicide="%o tagged himself with his own grenade."
	GibModifier=0.5000000
	GibPerterbation=0.4000000
	KDamageImpulse=15000.0000000
	VehicleDamageScaling=2.0000000
}
