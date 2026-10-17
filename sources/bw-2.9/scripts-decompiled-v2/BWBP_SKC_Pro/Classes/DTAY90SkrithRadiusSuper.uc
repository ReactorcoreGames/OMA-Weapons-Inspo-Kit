class DTAY90SkrithRadiusSuper extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's fully charged AY90 boltcaster obliterated %o."
	DeathStrings[1]="%o was reduced to atoms by %k's charged AY90 boltcaster."
	DeathStrings[2]="%k let loose the full force of %kh AY90 Wyvern on %o."
	SimpleKillString="AY90 BFG Radius"
	BloodManagerName="BallisticProV55.BloodMan_A73Burn"
	bIgniteFires=true
	DamageDescription=",Flame,Plasma,"
	WeaponClass=Class'BWBP_SKC_Pro.AY90SkrithBoltcaster'
	DeathString="%k's fully charged boltcaster obliterated %o."
	FemaleSuicide="%o took flight with a fully charged Wyvern."
	MaleSuicide="%o took flight with a fully charged Wyvern."
	bDelayedDamage=true
	GibModifier=3.0000000
	GibPerterbation=0.6000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.9000000
}
