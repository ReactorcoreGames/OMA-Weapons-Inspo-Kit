class DTNEXSlash extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's NEX left glowing lacerations on %o's chest."
	DeathStrings[1]="%k rammed a glowing sword up %o's formerly sunshine-free place."
	DeathStrings[2]="%k disemboweled %o and cauterized the guts."
	DeathStrings[3]="%o was stabbed in the spine by %k's glowing blade."
	DeathStrings[4]="%o was carved right down the middle by %k the swordmaster."
	BloodManagerName="BWBP_SKC_Pro.BloodMan_HMCLaser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=3.0000000
	ShieldDamage=3
	bIgniteFires=true
	DamageDescription=",Plasma,Slash,"
	WeaponClass=Class'BWBP_SKC_Pro.N3XPlaz'
	DeathString="%o's chest now has glowing lacerations by %k."
	FemaleSuicide="%o tripped and died a flamey, burney death."
	MaleSuicide="%o tripped and died a flamey, burney death."
	bArmorStops=false
	GibModifier=4.0000000
	PawnDamageSounds[0]=SoundGroup'BWBP_SKC_Sounds.NEX.Nex-HitBod'
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.1500000
}
