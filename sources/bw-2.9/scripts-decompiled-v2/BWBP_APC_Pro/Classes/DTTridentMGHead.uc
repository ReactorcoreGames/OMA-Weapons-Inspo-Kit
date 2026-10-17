class DTTridentMGHead extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k furiously machinegunned %o's head off."
	DeathStrings[1]="%o bit the bullet from %k's Trident."
	DeathStrings[2]="%o's head was destroyed by %k's Trident."
	HipString="HIP SPAM"
	bHeaddie=true
	DamageIdent="Machinegun"
	WeaponClass=Class'BWBP_APC_Pro.TridentMachinegun'
	DeathString="%k furiously machinegunned %o's head off."
	FemaleSuicide="%o shot herself in the head with the Trident."
	MaleSuicide="%o shot himself in the head with the Trident."
	bFastInstantHit=true
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.Headshot'
}
