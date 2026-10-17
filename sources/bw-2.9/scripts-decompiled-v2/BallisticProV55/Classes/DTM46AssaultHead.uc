class DTM46AssaultHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's head was ripped off by %k's Jackal rifle."
	DeathStrings[1]="%k pulled out %kh M46A1 and %o's head fell off in terror."
	DeathStrings[2]="%o got %vh head blown clean off by %k's M46A1 assault rifle."
	bHeaddie=true
	DamageIdent="Assault"
	WeaponClass=Class'BallisticProV55.M46AssaultRifle'
	DeathString="%o's head was ripped of by %k's Jackal rifle."
	FemaleSuicide="%o looked down the mouth of her Jackal."
	MaleSuicide="%o looked down the mouth of his Jackal."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
