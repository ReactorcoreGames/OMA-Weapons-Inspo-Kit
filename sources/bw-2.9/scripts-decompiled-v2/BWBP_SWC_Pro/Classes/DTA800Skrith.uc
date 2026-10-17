class DTA800Skrith extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k burned a hole through %o with the Hyperblaster."
	DeathStrings[1]="%o was scorched in half by %k's Hyperblaster."
	DeathStrings[2]="%o saw the light of %k's Hyperblaster."
	DeathStrings[3]="%k lit up %o with the Hyperblaster."
	SimpleKillString="A800 Power Bomb"
	BloodManagerName="BallisticProV55.BloodMan_A73Burn"
	bOnlySeverLimbs=true
	bIgniteFires=true
	DamageDescription=",Plasma,"
	WeaponClass=Class'BWBP_SWC_Pro.A800SkrithMinigun'
	DeathString="%k burned a hole through %o with the Hyperblaster."
	FemaleSuicide="%o's Hyperblaster turned on her."
	MaleSuicide="%o's Hyperblaster turned on him."
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.7500000
}
