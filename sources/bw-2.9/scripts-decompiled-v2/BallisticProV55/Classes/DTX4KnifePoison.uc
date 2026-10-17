class DTX4KnifePoison extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's X4 Knife injected %o with a lethal dose of poison."
	DeathStrings[1]="%o suffered an agonizing death from %k's poisoned blade."
	DeathStrings[2]="%k's X4 Knife venom eventually overcame %o's fragile constitution."
	DamageDescription=",Poison,GearSafe,NonSniper,"
	WeaponClass=Class'BallisticProV55.X4Knife'
	DeathString="%k's X4 knife poisoned %o to an agonizing death."
	FemaleSuicide="%o pricked herself with her X4 Knife and was subsequently poisoned to death."
	MaleSuicide="%o pricked himself with his X4 Knife and was subsequently poisoned to death."
	bArmorStops=false
	bLocationalHit=false
	bCauseConvulsions=true
	bCausesBlood=false
	bDelayedDamage=true
	bNeverSevers=true
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LinkHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
	VehicleDamageScaling=0.0000000
}
