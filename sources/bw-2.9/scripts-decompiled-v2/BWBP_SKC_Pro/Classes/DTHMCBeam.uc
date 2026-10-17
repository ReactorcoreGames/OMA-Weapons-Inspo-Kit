class DTHMCBeam extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was sliced up by %k's sweeping HMC laser."
	DeathStrings[1]="%k field tested %kh HMC laser on %o."
	DeathStrings[2]="%o tested %k's new laser prototype."
	DeathStrings[3]="%k gave %o a fairly lethal shock with %kh HMC laser."
	BloodManagerName="BWBP_SKC_Pro.BloodMan_HMCLaser"
	ShieldDamage=3
	bIgniteFires=true
	bPowerPush=true
	DamageIdent="Energy"
	WeaponClass=Class'BWBP_SKC_Pro.HMCBeamCannon'
	DeathString="%o was sliced up by %k's sweeping HMC laser."
	FemaleSuicide="%o tripped and thrashed through her own death-beam."
	MaleSuicide="%o tripped and thrashed through his own death-beam."
	bInstantHit=true
	GibModifier=4.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=2.0000000
}
