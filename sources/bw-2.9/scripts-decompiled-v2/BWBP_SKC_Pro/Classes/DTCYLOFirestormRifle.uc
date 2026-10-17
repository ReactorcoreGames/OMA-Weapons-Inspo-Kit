class DTCYLOFirestormRifle extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's chest was given airholes by %k's CYLO Firestorm."
	DeathStrings[1]="%k turned %o into a human clarinet with %kh CYLO Firestorm."
	DeathStrings[2]="%k's CYLO Firestorm made short work of %o."
	DeathStrings[3]="%k's CYLO Firestorm made %o into mincemeat."
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	bIgniteFires=true
	InvasionDamageScaling=1.2500000
	DamageIdent="Assault"
	DamageDescription=",Bullet,Flame,"
	WeaponClass=Class'BWBP_SKC_Pro.CYLOUAW'
	DeathString="%o's chest was given airholes by %k's CYLO Firestorm."
	FemaleSuicide="%o spat fire at her feet."
	MaleSuicide="%o spat fire at his feet."
	bFastInstantHit=true
	bAlwaysSevers=true
	bFlaming=true
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=3000.0000000
	VehicleDamageScaling=0.6000000
}
