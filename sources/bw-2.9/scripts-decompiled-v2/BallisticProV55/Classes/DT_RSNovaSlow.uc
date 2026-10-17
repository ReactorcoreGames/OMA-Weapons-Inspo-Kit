class DT_RSNovaSlow extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k repulsed %o with a Nova Staff."
	DeathStrings[1]="%o annihilated %vs on %k's Nova bolts."
	DeathStrings[2]="%k harshly raged over %o with %kh Nova."
	DeathStrings[3]="%o got dispelled by %k's Nova."
	SimpleKillString="Nova Staff Bolt"
	BloodManagerName="BallisticProV55.BloodMan_NovaSlow"
	bIgniteFires=true
	DamageIdent="Energy"
	DamageDescription=",NovaStaff,"
	WeaponClass=Class'BallisticProV55.RSNovaStaff'
	DeathString="%k repulsed %o with a Nova Staff."
	FemaleSuicide="%o pointed her Nova Staff in the wrong direction."
	MaleSuicide="%o pointed his Nova Staff in the wrong direction."
	bExtraMomentumZ=true
	GibModifier=4.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.6000000
	VehicleMomentumScaling=0.2000000
}
