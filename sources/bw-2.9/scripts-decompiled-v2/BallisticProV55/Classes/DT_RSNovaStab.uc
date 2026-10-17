class DT_RSNovaStab extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o spiked %vs on %k's Nova Staff blades."
	DeathStrings[1]="%o engraved %vs with %k's Nova Staff."
	DeathStrings[2]="%k jammed %kh Nova blades through %o's ribcage."
	DeathStrings[3]="%o walked into %k's Nova Staff."
	BlockFatiguePenalty=0.2500000
	AimDisplacementDamageThreshold=60
	DamageIdent="Melee"
	DamageDescription=",Stab,NovaStaff,"
	WeaponClass=Class'BallisticProV55.RSNovaStaff'
	DeathString="%o spiked %vs on %k's Nova Staff blades."
	FemaleSuicide="%o poked herself with her Nova Staff."
	MaleSuicide="%o poked himself with his Nova Staff."
	bNeverSevers=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.NovaStaff.Nova-Flesh'
	KDamageImpulse=2000.0000000
}
