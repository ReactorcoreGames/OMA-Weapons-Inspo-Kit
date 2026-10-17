class DTSRXRifleHead_Incendiary extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o had their skull emptied out of anything vital by %k."
	DeathStrings[1]="%k did a Pollock tribute by using an explosive SRK and %o's blood."
	DeathStrings[2]="%o forgot that explosive bullets are bad, %k reminded them that with one to the head."
	DeathStrings[3]="%k blew up %o's game and their brains with a SRK."
	AimedString="Scoped"
	BloodManagerName="BallisticProV55.BloodMan_GRS9Laser"
	bIgniteFires=true
	bHeaddie=true
	DamageIdent="Sniper"
	DamageDescription=",Bullet,Flame,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.SRXRifle'
	DeathString="%k assasinated %o's head with %kh SRK-650."
	FemaleSuicide="%o found that using an explosive SRK as toenail clippers is a bad idea."
	MaleSuicide="%o couldn't use the SRK as a rocket jump tool, found that out the hard way."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	GibModifier=1.5000000
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.5000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.0000000
}
