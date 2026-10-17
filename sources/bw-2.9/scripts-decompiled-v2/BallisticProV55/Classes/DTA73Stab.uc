class DTA73Stab extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was impaled on the blades of %k's A73."
	DeathStrings[1]="%o was split like a pear by %k's A73 blades."
	DeathStrings[2]="%k skewered %o with the A73."
	DeathStrings[3]="%k introduced %o to the merits of Skrith-style combat."
	BlockFatiguePenalty=0.2500000
	AimDisplacementDamageThreshold=75
	DamageIdent="Melee"
	DamageDescription=",Stab,"
	WeaponClass=Class'BallisticProV55.A73SkrithRifle'
	DeathString="%o was impaled on the blades of %k's A73."
	FemaleSuicide="%o cut herself on her A73."
	MaleSuicide="%o cut himself on his A73."
	bNeverSevers=true
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.A73.A73StabFlesh'
	KDamageImpulse=2000.0000000
}
