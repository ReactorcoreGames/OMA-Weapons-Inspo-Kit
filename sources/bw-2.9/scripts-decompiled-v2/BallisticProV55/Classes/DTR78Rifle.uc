class DTR78Rifle extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was silenced by %k's R78."
	DeathStrings[1]="%k picked off %o with %kh sniper rifle."
	DeathStrings[2]="%k's R78 hunted down %o."
	DeathStrings[3]="%k's Raven tucked into some delicious %o."
	DeathStrings[4]="%k's Raven strike ended %o's farcical existence."
	DeathStrings[5]="%o never even saw %k's R78 bullet coming."
	AimedString="Scoped"
	DisplacementType=1
	AimDisplacementDamageThreshold=100
	AimDisplacementDuration=0.3000000
	TagDuration=0.2000000
	bSnipingDamage=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Sniper"
	WeaponClass=Class'BallisticProV55.R78Rifle'
	DeathString="%o was silenced by %k's R78."
	FemaleSuicide="%o held her R78 the wrong way around."
	MaleSuicide="%o held his R78 the wrong way around."
	VehicleDamageScaling=0.1500000
	VehicleMomentumScaling=0.3000000
}
