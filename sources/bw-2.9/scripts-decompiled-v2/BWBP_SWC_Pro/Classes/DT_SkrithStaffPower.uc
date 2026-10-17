class DT_SkrithStaffPower extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was the epicenter of %k's light show."
	DeathStrings[1]="%k made %o a skeleton with a meat dress."
	DeathStrings[2]="%o's corpse made a nice lantern for %k to see in the dark."
	DeathStrings[3]="%k roasted %o with a plasma bomb."
	BloodManagerName="BWBP_SWC_Pro.BloodMan_A73B"
	bIgniteFires=true
	DamageDescription=",Flame,Hazard,NonSniper,Plasma,"
	WeaponClass=Class'BWBP_SWC_Pro.SkrithStaff'
	DeathString="%k's plasma ball burned through %o."
	FemaleSuicide="%o attempted to shoot her feet."
	MaleSuicide="%o attempted to shoot his feet."
	bDelayedDamage=true
	bFlaming=true
	GibModifier=2.0000000
	GibPerterbation=0.2000000
	KDamageImpulse=2000.0000000
	VehicleDamageScaling=1.5000000
}
