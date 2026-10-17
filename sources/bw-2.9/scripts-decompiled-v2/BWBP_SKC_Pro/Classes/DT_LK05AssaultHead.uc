class DT_LK05AssaultHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k got a clean LK05 headshot on %o."
	DeathStrings[1]="%k's LK05 headshot reduced %o to a statistic."
	DeathStrings[2]="%k's LK05 turned %o's head into a pink mist."
	bHeaddie=true
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_SKC_Pro.LK05Carbine'
	DeathString="%k got a clean LK05 headshot on %o."
	FemaleSuicide="%o took the easy way out."
	MaleSuicide="%o took the easy way out."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.1500000
}
