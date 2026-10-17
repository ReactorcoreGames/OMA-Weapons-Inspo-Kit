class DTR9000ERifle extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o couldn't keep track which form %k's Chimera was in and got a hole for %vh troubles."
	DeathStrings[1]="%k managed to pop %o's spleen from a mile and a half away."
	DeathStrings[2]="%o failed to see %k's bullet headed right towards %vm and died as a result."
	DeathStrings[3]="%k didn't need to amp up the Chimera to put %o in the grave."
	DeathStrings[4]="%o had %vh toes fed to %k's Chimera."
	DeathStrings[5]="%k took off %o's middle finger after getting flipped off."
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
