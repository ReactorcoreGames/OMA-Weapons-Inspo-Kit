class DTA73SkrithPowerRadius extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k burned a hole through %o with the A73."
	DeathStrings[1]="%o was scorched in half by %k's A73."
	DeathStrings[2]="%o saw the light of %k's A73."
	DeathStrings[3]="%k lit up %o with the A73."
	DeathStrings[4]="%k's sapphire energy stream effortlessly pierced %o."
	SimpleKillString="A73 Power Shot Radius"
	BloodManagerName="BallisticProV55.BloodMan_A73Burn"
	bOnlySeverLimbs=true
	bIgniteFires=true
	DamageIdent="Energy"
	DamageDescription=",Plasma,"
	WeaponClass=Class'BallisticProV55.A73SkrithRifle'
	DeathString="%k burned a hole through %o with the A73."
	FemaleSuicide="%o's A73 turned on her."
	MaleSuicide="%o's A73 turned on him."
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.6000000
}
