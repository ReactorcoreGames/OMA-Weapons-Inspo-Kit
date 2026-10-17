class DTXRS10SMGHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k fired %kh XRS-10 into %o's face."
	DeathStrings[1]="%k eliminated %o's head with %kh XRS-10."
	DeathStrings[2]="%o's cranium got liquidized by %k's XRS-10."
	DeathStrings[3]="%k silenced %o's twittering head with a burst of XRS-10 rounds."
	EffectChance=0.5000000
	bHeaddie=true
	InvasionDamageScaling=1.5000000
	DamageIdent="SMG"
	WeaponClass=Class'BallisticProV55.XRS10SubMachinegun'
	DeathString="%k fired %kh XRS-10 into %o's face."
	FemaleSuicide="%o silenced herself."
	MaleSuicide="%o silenced himself."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	VehicleDamageScaling=0.1500000
}
