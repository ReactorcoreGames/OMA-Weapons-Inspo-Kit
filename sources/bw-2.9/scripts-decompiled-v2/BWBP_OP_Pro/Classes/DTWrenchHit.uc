class DTWrenchHit extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k permanently adjusted %o's attitude."
	DeathStrings[1]="%k engineered %o's demise."
	DeathStrings[2]="%k loosened a few of %o's nuts."
	DeathStrings[3]="%k made sure %o no longer has a screw loose."
	DeathStrings[4]="%k 'fixed' %o."
	DeathStrings[5]="%k realigned %o's anatomy."
	BlockPenetration=0.2500000
	BlockFatiguePenalty=0.4000000
	DisplacementType=1
	AimDisplacementDamageThreshold=60
	AimDisplacementDuration=0.7500000
	DamageIdent="Melee"
	WeaponClass=Class'BWBP_OP_Pro.WrenchWarpDevice'
	DeathString="%k permanently adjusted %o's attitude."
	FemaleSuicide="%o adjusted her own attitude."
	MaleSuicide="%o adjusted his own attitude."
	VehicleDamageScaling=4.0000000
}
