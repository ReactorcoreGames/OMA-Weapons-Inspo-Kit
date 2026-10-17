class DTSRXRifleHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o had their ears ripped apart by %k."
	DeathStrings[1]="%k drilled %o right between their beady little eyes."
	DeathStrings[2]="%o peeked their head out right when %k shot them in the skull."
	DeathStrings[3]="%k's SRK took %o's head off from their shoulders, not clean but it gets the job done."
	AimedString="Scoped"
	bHeaddie=true
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_SKC_Pro.SRXRifle'
	DeathString="%k assasinated %o's head with %kh SRK-650."
	FemaleSuicide="%o saw a bullet coming up the barrel of her SRK-650."
	MaleSuicide="%o saw a bullet coming up the barrel of his SRK-650."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.0000000
}
