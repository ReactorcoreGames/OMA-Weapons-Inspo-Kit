class DTA800Skrith_BoltStuckExplodeRadius extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's original hyperblaster target spread the fun to %o."
	DeathStrings[1]="%o should have run away from the soldier covered in %k's homing bombs."
	DeathStrings[2]="%k's hyperblaster got a free kill off of %o."
	DeathStrings[3]="%o was just another number to %k's hyperblaster."
	SimpleKillString="Hyperblaster Sticky Bonus"
	BloodManagerName="BallisticProV55.BloodMan_A73Burn"
	bOnlySeverLimbs=true
	bIgniteFires=true
	DamageDescription=",Flame,Plasma,"
	WeaponClass=Class'BWBP_SWC_Pro.A800SkrithMinigun'
	DeathString="%o was just another number to %k's hyperblaster."
	FemaleSuicide="%o's stuck target came back to haunt her."
	MaleSuicide="%o's stuck target came back to haunt him."
	bDelayedDamage=true
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.9000000
}
