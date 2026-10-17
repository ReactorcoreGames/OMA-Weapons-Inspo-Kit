class DTMX32PrimaryHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o died due to lead poisoning and decapitation thanks to %k's MX32."
	DeathStrings[1]="%k turned %o's head to stew meat."
	DeathStrings[2]="%o's gray matter was ejected by %k's MX32."
	DeathStrings[3]="%kâ€™s low caliber leadstorm shredded %o's head finely."
	bHeaddie=true
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_OP_Pro.MX32Weapon'
	DeathString="%o died due to lead poisoning and decapitation thanks to %k's MX32."
	FemaleSuicide="%o saw a bullet coming up the barrel of her MX32."
	MaleSuicide="%o saw a bullet coming up the barrel of his MX32."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.0000000
}
