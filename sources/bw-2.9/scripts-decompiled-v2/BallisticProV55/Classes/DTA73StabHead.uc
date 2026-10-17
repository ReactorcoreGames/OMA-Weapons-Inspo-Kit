class DTA73StabHead extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k rammed the blades of the A73 into %o's head."
	DeathStrings[1]="%o was jabbed in the jaw by %k's A73."
	DeathStrings[2]="%o tried to chew on %k's A73."
	BlockFatiguePenalty=0.2500000
	AimDisplacementDamageThreshold=75
	bHeaddie=true
	DamageIdent="Melee"
	DamageDescription=",Stab,"
	WeaponClass=Class'BallisticProV55.A73SkrithRifle'
	DeathString="%k rammed the blades of the A73 into %o's head."
	FemaleSuicide="%o sliced her own head in half with the A73."
	MaleSuicide="%o sliced his own head in half with the A73."
	bAlwaysSevers=true
	bSpecial=true
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.A73.A73StabFlesh'
	KDamageImpulse=2000.0000000
}
