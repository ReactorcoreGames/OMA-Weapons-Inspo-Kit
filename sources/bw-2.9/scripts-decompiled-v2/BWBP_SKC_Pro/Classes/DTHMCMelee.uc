class DTHMCMelee extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k cracked %o's skull %kh HMC-117."
	DeathStrings[1]="%o took %k's HMC to the face."
	DeathStrings[2]="%k got medieval on %o with a laser cannon."
	BlockFatiguePenalty=0.2500000
	DisplacementType=1
	AimDisplacementDamageThreshold=60
	AimDisplacementDuration=0.7500000
	DamageIdent="Melee"
	WeaponClass=Class'BWBP_SKC_Pro.HMCBeamCannon'
	DeathString="%k cracked %o's skull %kh HMC-117."
	FemaleSuicide="%o headbutter her HMC."
	MaleSuicide="%o headbutted his HMC."
	bExtraMomentumZ=true
}
