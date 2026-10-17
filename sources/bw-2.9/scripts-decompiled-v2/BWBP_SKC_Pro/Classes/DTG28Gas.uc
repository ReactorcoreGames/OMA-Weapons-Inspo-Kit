class DTG28Gas extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	MinMotionBlurDamage=1.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=6.0000000
	bUseMotionBlur=true
	bDetonatesBombs=false
	DamageDescription=",Gas,GearSafe,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.G28Grenade'
	DeathString="%o had an allergic reaction to a health grenade."
	FemaleSuicide="%o overdosed on health grenades."
	MaleSuicide="%o overdosed on health grenades."
	bArmorStops=false
	bLocationalHit=false
	bCausesBlood=false
	bDelayedDamage=true
	bNeverSevers=true
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
	VehicleDamageScaling=0.0000000
}
