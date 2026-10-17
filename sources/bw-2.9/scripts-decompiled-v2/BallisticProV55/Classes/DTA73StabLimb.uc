class DTA73StabLimb extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o almost fended off %k's A73 blades."
	DeathStrings[1]="%o tried to kick %k's A73 blades."
	DeathStrings[2]="%k rammed %kh A73 blades into %o's forearm."
	BlockFatiguePenalty=0.2500000
	AimDisplacementDamageThreshold=75
	DamageIdent="Melee"
	DamageDescription=",Stab,"
	WeaponClass=Class'BallisticProV55.A73SkrithRifle'
	DeathString="%o alost fended off %k's A73 blades."
	FemaleSuicide="%o cut herself on her A73."
	MaleSuicide="%o cut himself on his A73."
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.A73.A73StabFlesh'
	KDamageImpulse=2000.0000000
}
