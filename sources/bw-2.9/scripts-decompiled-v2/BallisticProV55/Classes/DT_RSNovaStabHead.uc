class DT_RSNovaStabHead extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k thrust %kh Nova Staff into %o's eye."
	DeathStrings[1]="%o was impaled through the mouth by %k's Nova."
	DeathStrings[2]="%o almost managed to headbutt %k's Nova Staff from %kh hands."
	BlockFatiguePenalty=0.2500000
	AimDisplacementDamageThreshold=60
	bHeaddie=true
	DamageIdent="Melee"
	DamageDescription=",Stab,NovaStaff,"
	WeaponClass=Class'BallisticProV55.RSNovaStaff'
	DeathString="%k thrust %kh Nova Staff into %o's eye."
	FemaleSuicide="%o stabbed her head off with a Nova Staff."
	MaleSuicide="%o stabbed his head off with a Nova Staff."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.NovaStaff.Nova-Flesh'
	KDamageImpulse=2000.0000000
}
