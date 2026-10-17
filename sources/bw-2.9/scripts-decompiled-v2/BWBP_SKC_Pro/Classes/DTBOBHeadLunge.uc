class DTBOBHeadLunge extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k shoved %kh black ops blade into %o's eye socket."
	DeathStrings[1]="%k's X5W plunged deep into %o's face."
	DeathStrings[2]="%o's brain was shredded by %k's X5W wrist blade."
	WeaponClass=Class'BWBP_SKC_Pro.BlackOpsWristBlade'
	DeathString="%k shoved %kh black ops blade into %o's eye socket."
	FemaleSuicide="%o licked her X5W blade."
	MaleSuicide="%o licked his X5W blade."
	bArmorStops=false
	bAlwaysSevers=true
	bSpecial=true
	KDamageImpulse=1000.0000000
}
