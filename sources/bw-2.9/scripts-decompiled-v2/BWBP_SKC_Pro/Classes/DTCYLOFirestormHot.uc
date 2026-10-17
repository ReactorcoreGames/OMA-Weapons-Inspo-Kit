class DTCYLOFirestormHot extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's chest was flared by %k's burning hot Firestorm."
	DeathStrings[1]="%k charred %o with %kh overheating Firestorm."
	DeathStrings[2]="%k's scalding Firestorm turned %o into roast meat."
	EffectChance=1.0000000
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=3.0000000
	bUseMotionBlur=true
	bIgniteFires=true
	InvasionDamageScaling=1.2500000
	DamageIdent="Assault"
	DamageDescription=",Bullet,Flame,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.CYLOUAW'
	DeathString="%o's chest was flared by %k's burning hot Firestorm."
	FemaleSuicide="%o melted herself with a CYLO."
	MaleSuicide="%o melted himself with a CYLO?"
	bFastInstantHit=true
	bAlwaysSevers=true
	bFlaming=true
	GibModifier=1.5000000
	GibPerterbation=0.2000000
	KDamageImpulse=3000.0000000
	VehicleDamageScaling=1.1000000
}
