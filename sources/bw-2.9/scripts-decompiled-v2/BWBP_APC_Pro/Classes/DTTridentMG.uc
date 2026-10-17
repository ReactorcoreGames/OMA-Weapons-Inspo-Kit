class DTTridentMG extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was torn to shreds by %k's Trident."
	DeathStrings[1]="%o was blasted into ribbons by %k's Trident."
	DeathStrings[2]="%o was machinegunned in half by %k's Trident."
	HipString="HIP SPAM"
	DamageIdent="Machinegun"
	WeaponClass=Class'BWBP_APC_Pro.TridentMachinegun'
	DeathString="%o was torn to shreds by %k's Trident."
	FemaleSuicide="%o shot herself in the foot with the Trident."
	MaleSuicide="%o shot himself in the foot with the Trident."
	bFastInstantHit=true
}
