class DTBOBLimb extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k hacked off %o's arm with %kh X5W."
	DeathStrings[1]="%o is down one limb thanks to %k's X5W."
	DeathStrings[2]="%k used %kh black ops blade to debone %o."
	DeathStrings[3]="%o's exposed limbs were removed by %k's black ops blade."
	WeaponClass=Class'BWBP_SKC_Pro.BlackOpsWristBlade'
	DeathString="%k hacked off %o's arm with %kh X5W."
	FemaleSuicide="%o held her black ops blade the wrong way."
	MaleSuicide="%o held his X5W by the wrong handle."
	bArmorStops=false
	KDamageImpulse=1000.0000000
}
