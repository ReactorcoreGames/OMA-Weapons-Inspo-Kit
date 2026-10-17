class DTXMK5SubMachinegunHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o had %vh head hollowed out by %k's XMk5."
	DeathStrings[1]="%k drilled various XMk5 SMG rounds into %o's head."
	DeathStrings[2]="%k eventually split %o's thick skull with %kh SMG."
	bHeaddie=true
	InvasionDamageScaling=1.5000000
	DamageIdent="SMG"
	WeaponClass=Class'BallisticProV55.XMK5SubMachinegun'
	DeathString="%o had %vh head hollowed out by %k's XMk5."
	FemaleSuicide="%o annihilated her head with an XMk5."
	MaleSuicide="%o annihilated his head with an XMk5."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.1500000
}
