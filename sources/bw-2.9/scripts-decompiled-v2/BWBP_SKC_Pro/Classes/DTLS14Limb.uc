class DTLS14Limb extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k accurately lasered off %o's arms with %kh LS-14."
	DeathStrings[1]="%k's precise LS-14 aiming turned %o into an amputee."
	DeathStrings[2]="%o lost an arm and a leg to %k and the LS-14."
	SimpleKillString="LS-14 Single Barrel"
	BloodManagerName="BloodMan_HMCLaser"
	MinMotionBlurDamage=5.0000000
	MotionBlurDamageRange=20.0000000
	MotionBlurFactor=2.0000000
	ShieldDamage=3
	bIgniteFires=true
	DamageIdent="Sniper"
	DamageDescription=",Laser,"
	WeaponClass=Class'BWBP_SKC_Pro.LS14Carbine'
	DeathString="%k accurately lasered off %o's arms with %kh LS-14."
	FemaleSuicide="%o cannot use a carbine effectively."
	MaleSuicide="%o stinks at using laser carbines."
	bInstantHit=true
	GibModifier=1.5000000
	GibPerterbation=0.2000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.6000000
}
