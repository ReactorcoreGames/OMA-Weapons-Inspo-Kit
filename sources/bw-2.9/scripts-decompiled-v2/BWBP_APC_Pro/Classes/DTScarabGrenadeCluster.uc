class DTScarabGrenadeCluster extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o had a plague of explosive scarabs brought down by %k."
	DeathStrings[1]="%k's swarm of scarabs devoured %o alive."
	DeathStrings[2]="%o couldn't outrun %k's swarm and was eaten up as a result."
	DeathStrings[3]="%k caught %o in a storm of cluster bombs, the hidden 11th plague."
	DeathStrings[4]="%o had %vh shins shredded by %k's cluster bombs."
	BloodManagerName="BallisticProV55.BloodMan_BluntSmall"
	bDetonatesBombs=false
	DamageIdent="Grenade"
	DamageDescription=",Blunt,Hazard,"
	WeaponClass=Class'BWBP_APC_Pro.ScarabGrenade'
	DeathString="%k rammed a pineapple down %k's throat."
	FemaleSuicide="%o held onto their explosive treasure a bit too long."
	MaleSuicide="%o became a meal for their own swarm of Scarabs."
	bDelayedDamage=true
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
}
