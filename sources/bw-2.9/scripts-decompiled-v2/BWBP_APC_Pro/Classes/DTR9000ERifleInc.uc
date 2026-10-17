class DTR9000ERifleInc extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was purged in the fire of %k's Chimera without even seeing them."
	DeathStrings[1]="%k can now see %o from a mile away thanks to some fiery bullets."
	DeathStrings[2]="%o had %vh heart roasted by %k's modular rifle."
	DeathStrings[3]="%k reduced %o's kneecaps into ashes from well placed shots with a fiery Chimera."
	DeathStrings[4]="%o not only failed to save the princess, but was burned to cinders by %k."
	DeathStrings[5]="%k lit up %o while abiding by the 6 feet rule."
	AimedString="Scoped"
	DisplacementType=1
	AimDisplacementDamageThreshold=100
	AimDisplacementDuration=0.3000000
	bSnipingDamage=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Sniper"
	WeaponClass=Class'BWBP_APC_Pro.R9000ERifle'
	DeathString="%o was silenced by %k's R9000-E."
	FemaleSuicide="%o held her R9000-E the wrong way around."
	MaleSuicide="%o held his R9000-E the wrong way around."
	VehicleDamageScaling=0.1500000
	VehicleMomentumScaling=0.3000000
}
