class DTXK2SMGHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was stung in the head by %k's XK2."
	DeathStrings[1]="%k ruined %o's head with %kh XK2."
	EffectChance=0.5000000
	bHeaddie=true
	InvasionDamageScaling=1.5000000
	DamageIdent="SMG"
	WeaponClass=Class'BallisticProV55.XK2SubMachinegun'
	DeathString="%o was stung in the head by %k's XK2."
	FemaleSuicide="%o silenced herself."
	MaleSuicide="%o silenced himself."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
	VehicleDamageScaling=0.0000000
}
