class DTSRS900RifleHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's cranium was liberated by %k's battle rifle."
	DeathStrings[1]="%o's head was ruptured by a round from %k's SRS-900."
	DeathStrings[2]="%k's SRS-900 round found its way to %o's shifty eyeballs."
	DeathStrings[3]="%k collapsed %o's potato head with %kh battle rifle."
	DeathStrings[4]="%k sunk a round into %o's tangled bush of hair."
	AimedString="Scoped"
	bHeaddie=true
	DamageIdent="Sniper"
	WeaponClass=Class'BallisticProV55.SRS900Rifle'
	DeathString="%k assasinated %o's head with %kh SRS-900."
	FemaleSuicide="%o saw a bullet coming up the barrel of her SRS-900."
	MaleSuicide="%o saw a bullet coming up the barrel of his SRS-900."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.0000000
}
