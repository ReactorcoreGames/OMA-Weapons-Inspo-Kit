class DTR9000ERifleRad extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o didnâ€™t need to be in close proximity for %k to irradiate %vm."
	DeathStrings[1]="%k rearranged %o's DNA from a distance away."
	DeathStrings[2]="%o mutated into a pile of goop from %k's radioactive Chimera."
	DeathStrings[3]="%k forced a evolutionary virus into %o with a rad amped Chimera."
	DeathStrings[4]="%o is pissing neon green from getting shot by %k's Chimera."
	DeathStrings[5]="%k turned %o into a ghoul, then had to put %vm down for going feral."
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
