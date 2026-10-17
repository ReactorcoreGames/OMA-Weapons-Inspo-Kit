class DT_SkrithStaff extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o got a night light from %k as he fell to eternal sleep."
	DeathStrings[1]="%k lit up %o in the dark, all without being seen."
	DeathStrings[2]="%o became a corpse candle thanks to %k."
	DeathStrings[3]="%k fired up %o with plasma bolts."
	BloodManagerName="BWBP_SWC_Pro.BloodMan_A73B"
	bOnlySeverLimbs=true
	bIgniteFires=true
	DamageDescription=",Flame,Plasma,"
	WeaponClass=Class'BWBP_SWC_Pro.SkrithStaff'
	DeathString="%k fused parts of %o with the Shillelagh."
	FemaleSuicide="%o's Shillelagh turned on her."
	MaleSuicide="%o's Shillelagh turned on him."
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
}
