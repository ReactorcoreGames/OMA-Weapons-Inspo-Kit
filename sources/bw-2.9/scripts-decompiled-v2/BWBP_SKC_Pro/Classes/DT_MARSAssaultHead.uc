class DT_MARSAssaultHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o's brain shut down under %k's MARS fire."
	DeathStrings[1]="%k terminated a fleeing %o with a MARS headshot."
	DeathStrings[2]="%k tactically disabled %o with a MARS bullet to the head."
	bHeaddie=true
	DamageIdent="Assault"
	WeaponClass=Class'BWBP_SKC_Pro.MARSAssaultRifle'
	DeathString="%o's brain shut down under %k's MARS-2 fire."
	FemaleSuicide="%o HEADSHOT SELF?!"
	MaleSuicide="%o HEADSHOT SELF?!"
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
