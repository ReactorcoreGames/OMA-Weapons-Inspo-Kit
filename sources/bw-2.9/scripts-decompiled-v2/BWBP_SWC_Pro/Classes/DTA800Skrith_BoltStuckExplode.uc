class DTA800Skrith_BoltStuckExplode extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k fused a sticky bomb to a screaming %o."
	DeathStrings[1]="%o couldn't pull off %k's hyperblaster sticky bombs."
	DeathStrings[2]="%o's limbs were exploded by %k's hyperblaster barrage."
	DeathStrings[3]="%k's seeking hyperblaster bolts hunted down %o."
	DeathStrings[4]="%k tagged a terrified %o with a sticky bomb barrage."
	DeathStrings[5]="%o happily caught several of %k's hyperblaster bombs."
	SimpleKillString="A800 Sticky"
	BloodManagerName="BallisticProV55.BloodMan_A73Burn"
	bOnlySeverLimbs=true
	bIgniteFires=true
	DamageDescription=",Flame,Plasma,"
	WeaponClass=Class'BWBP_SWC_Pro.A800SkrithMinigun'
	DeathString="%k fused parts of %o with the AY90."
	FemaleSuicide="%o masterfully stuck herself."
	MaleSuicide="%o masterfully stuck himself."
	bDelayedDamage=true
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=1.9000000
}
