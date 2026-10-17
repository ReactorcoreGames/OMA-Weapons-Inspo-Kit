class DTR78Explosion extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was blasted by %k's explosive R78 round."
	SimpleKillString="R78 Explosive Rounds"
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	bIgniteFires=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Sniper"
	DamageDescription=",Bullet,Flame,"
	WeaponClass=Class'BallisticProV55.R78Rifle'
	DeathString="%o was blasted by %k's explosive R78 round."
	FemaleSuicide="%o trashed herself with her own explosive rounds."
	MaleSuicide="%o trashed himself with his own explosive rounds."
	bFastInstantHit=true
	bAlwaysSevers=true
	bFlaming=true
	GibModifier=1.5000000
	GibPerterbation=0.2000000
	KDamageImpulse=3500.0000000
	VehicleDamageScaling=0.5000000
}
