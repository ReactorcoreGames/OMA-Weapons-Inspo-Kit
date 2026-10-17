class DT_KF8XBoltPoison extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's KF-8X bolt delivered a lethal toxic dose to %o."
	DeathStrings[1]="%o OD'ed on %k's poisonous bolts, failing to take the prescribed dosage."
	DeathStrings[2]="%k and %kh KF-8X forced %o to take a nap thanks to some toxic melatonin."
	DeathStrings[3]="%k injected some toxic bolts into %o's bloodstream, mmmmm... poison."
	DeathStrings[4]="%o drank too much of %k's toxic to the point %vh heart quit."
	SimpleKillString="KF-8X Poison"
	DamageDescription=",Poison,GearSafe,NonSniper,"
	WeaponClass=Class'BWBP_OP_Pro.KF8XCrossbow'
	DeathString="%k's KF-8X bolt delivered a lethal toxic dose to %o."
	FemaleSuicide="%o pricked herself with a KF-8X bolt."
	MaleSuicide="%o pricked himself with a KF-8X dart."
	bArmorStops=false
	bFastInstantHit=true
	bCausesBlood=false
	bDelayedDamage=true
	bNeverSevers=true
	bDirectDamage=true
	PawnDamageSounds[0]=Sound'BWBP_OP_Sounds.XBow.BX85-Poison'
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LinkHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.1000000
	KDamageImpulse=3000.0000000
	VehicleDamageScaling=0.0000000
}
