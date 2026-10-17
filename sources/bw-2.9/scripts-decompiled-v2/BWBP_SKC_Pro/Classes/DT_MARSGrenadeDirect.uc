class DT_MARSGrenadeDirect extends DT_BWExplode
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k whipped a MARS grenade at %o's face."
	DeathStrings[1]="%o took %k's grenade to the face."
	DeathStrings[2]="%o successfully caught %k's MARS grenade."
	SimpleKillString="MARS Grenade Direct"
	WeaponClass=Class'BWBP_SKC_Pro.MARSAssaultRifle'
	DeathString="%k whipped a MARS2 grenade at %o's face."
	FemaleSuicide="%o amazingly caught her own MARS grenade."
	MaleSuicide="%o amazingly caught his own MARS grenade."
	bDelayedDamage=true
	VehicleDamageScaling=0.5000000
}
