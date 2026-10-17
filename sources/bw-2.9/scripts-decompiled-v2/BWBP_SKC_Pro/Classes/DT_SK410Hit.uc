class DT_SK410Hit extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k saved Soviet shells and just beat %o to death."
	DeathStrings[1]="%k drunkenly chased down %o with a crude SK410 shaped hammer."
	DeathStrings[2]="%k doesn't need reloads! %ke beats %o with gun!"
	DeathStrings[3]="%o learned that %k's SK-410 makes a GREAT club."
	BlockFatiguePenalty=0.2000000
	DisplacementType=1
	AimDisplacementDamageThreshold=60
	AimDisplacementDuration=0.7500000
	DamageIdent="Melee"
	WeaponClass=Class'BWBP_SKC_Pro.SK410Shotgun'
	DeathString="%k saved Soviet shells and just beat %o to death."
	FemaleSuicide="%o wanted her SK-410 to be closer to her."
	MaleSuicide="%o had explods to smitheroons. :("
}
