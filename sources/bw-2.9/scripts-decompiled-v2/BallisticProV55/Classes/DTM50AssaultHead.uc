class DTM50AssaultHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's head was brutally gunned off by %k's M50."
	DeathStrings[1]="%o ate too much of %k's M50 lead."
	DeathStrings[2]="%k annihilated %o's head with the M50."
	bHeaddie=true
	DamageIdent="Assault"
	WeaponClass=Class'BallisticProV55.M50AssaultRifle'
	DeathString="%o's head was brutally gunned off by %k with the M50."
	FemaleSuicide="%o saw a bullet coming up the barrel of her M50."
	MaleSuicide="%o saw a bullet coming up the barrel of his M50."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.0000000
}
