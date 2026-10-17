class DT_AK490BulletHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's face was rearranged by Comrade %k's AK490."
	DeathStrings[1]="%k executed a rebellious %o with an AK headshot."
	DeathStrings[2]="%k blew the Borscht out of %o's head with an AK490."
	bHeaddie=true
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_SKC_Pro.AK490BattleRifle'
	DeathString="%o's face was rearranged by Comrade %k's AK490."
	FemaleSuicide="%o shot heads with bullets."
	MaleSuicide="%o exploded in a shower of laser."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.0000000
}
