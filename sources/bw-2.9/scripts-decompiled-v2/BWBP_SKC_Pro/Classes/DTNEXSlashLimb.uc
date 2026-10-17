class DTNEXSlashLimb extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o is now legless due to %k and the Plas-Edge."
	DeathStrings[1]="%k melted %o's arms off with a sword."
	DeathStrings[2]="%k's burning blade sliced an arm off %o."
	BloodManagerName="BWBP_SKC_Pro.BloodMan_HMCLaser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=2.0000000
	ShieldDamage=3
	bIgniteFires=true
	WeaponClass=Class'BWBP_SKC_Pro.N3XPlaz'
	DeathString="%o is now legless due to %k and the Plas-Edge."
	FemaleSuicide="%o is not very good with fiery swords."
	MaleSuicide="%o is not very good with fiery swords."
	bArmorStops=false
	bAlwaysSevers=true
	GibModifier=1.5000000
	PawnDamageSounds[0]=SoundGroup'BWBP_SKC_Sounds.NEX.Nex-HitBod'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=2.0000000
}
