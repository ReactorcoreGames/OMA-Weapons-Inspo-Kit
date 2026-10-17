class DTT9CNHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o took a hail of %k's T9CN bullets to the face."
	DeathStrings[1]="%k wiped the smile off %o's face with %kh T9CN."
	DeathStrings[2]="%o lost %vh dopey head to %k's T9CN burst."
	EffectChance=0.5000000
	bHeaddie=true
	WeaponClass=Class'BWBP_SKC_Pro.T9CNMachinePistol'
	DeathString="%o took a hail of %k's T9CN bullets to the face."
	FemaleSuicide="%o silenced herself."
	MaleSuicide="%o silenced himself."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
