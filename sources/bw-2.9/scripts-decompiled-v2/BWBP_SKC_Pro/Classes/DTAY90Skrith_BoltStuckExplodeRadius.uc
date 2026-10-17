class DTAY90Skrith_BoltStuckExplodeRadius extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k got one victim plus an oblivious %o for free with a sticky explosive bolt."
	DeathStrings[1]="%o found out why %ve should stay 6 feet from %k's Wyvern victim."
	DeathStrings[2]="%k's Wyvern took %o alongside its intended target."
	DeathStrings[3]="%o was just another number to %k's boltcaster."
	SimpleKillString="AY90 Sticky Bonus"
	BloodManagerName="BallisticProV55.BloodMan_A73Burn"
	bOnlySeverLimbs=true
	bIgniteFires=true
	DamageDescription=",Flame,Plasma,"
	WeaponClass=Class'BWBP_SKC_Pro.AY90SkrithBoltcaster'
	DeathString="%k got one victim plus an oblivious %o for free with a sticky explosive bolt."
	FemaleSuicide="%o's stuck target came back to haunt her."
	MaleSuicide="%o's stuck target came back to haunt him."
	bDelayedDamage=true
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.9000000
}
