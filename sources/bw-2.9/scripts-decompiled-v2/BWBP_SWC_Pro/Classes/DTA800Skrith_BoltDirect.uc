class DTA800Skrith_BoltDirect extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's hyperblaster tagged a fleeing %o."
	DeathStrings[1]="%o couldn't escape %k's homing Hyperblaster charge."
	DeathStrings[2]="%o couldn't outrun %k's hyperblaster and %kh homing bolts."
	DeathStrings[3]="%o couldn't hide from $k's hyperblaster homing barrage."
	SimpleKillString="A800 Sticky Impact"
	BloodManagerName="BallisticProV55.BloodMan_A73Burn"
	bOnlySeverLimbs=true
	bIgniteFires=true
	DamageDescription=",Flame,Plasma,"
	WeaponClass=Class'BWBP_SWC_Pro.A800SkrithMinigun'
	DeathString="%k's hyperblaster tagged a fleeing %o."
	FemaleSuicide="%o caught her own A800 sticky bomb."
	MaleSuicide="%o caught his own A800 sticky bomb."
	bDelayedDamage=true
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.9000000
}
