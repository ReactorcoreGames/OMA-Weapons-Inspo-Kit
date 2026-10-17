class DTBallisticShield extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k bashed %o with %kh shield."
	DeathStrings[1]="%k showed %o the finer points of shield defense."
	DeathStrings[2]="%o didn't realise %k's shield could be so effective."
	DeathStrings[3]="%k's shield cleared a path through %o."
	DeathStrings[4]="%k's shield slam sent %o flying."
	DisplacementType=1
	AimDisplacementDamageThreshold=60
	DamageIdent="Melee"
	WeaponClass=Class'BWBP_OP_Pro.BallisticShieldWeapon'
	DeathString="%k bashed %o with %kh shield."
	FemaleSuicide="%o came back on her shield, not with it."
	MaleSuicide="%o came back on his shield, not with it."
	KDamageImpulse=1000.0000000
}
