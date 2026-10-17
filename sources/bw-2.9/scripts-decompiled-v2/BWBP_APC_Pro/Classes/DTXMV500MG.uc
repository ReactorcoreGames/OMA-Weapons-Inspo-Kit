class DTXMV500MG extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was gunned down by %k's XMB-500."
	DeathStrings[1]="%k filled %o with XMB-500 lead."
	DeathStrings[2]="%o was shredded by %k's XMB-500 minigun."
	DeathStrings[3]="%o was at the business end of %k's minigun."
	bIgniteFires=true
	DamageDescription=",Bullet,Flame,"
	WeaponClass=Class'BWBP_APC_Pro.XMV500Minigun'
	DeathString="%o was gunned down by %k's XMB-500."
	FemaleSuicide="%o was rejected by her own minigun."
	MaleSuicide="%o was rejected by his own minigun."
	bFastInstantHit=true
	VehicleDamageScaling=0.1000000
	VehicleMomentumScaling=0.0500000
}
