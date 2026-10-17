class DTXM84Hit extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k beaned %o with an XM84, who promptly died."
	DeathStrings[1]="%k bounced a tech grenade off %o's head! Fatality!"
	BloodManagerName="BallisticProV55.BloodMan_BluntSmall"
	bDetonatesBombs=false
	DamageIdent="Grenade"
	DamageDescription=",Blunt,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.XM84Flashbang'
	DeathString="%k beaned %o with an XM84, who promptly died."
	FemaleSuicide="%o tripped on her own XM84."
	MaleSuicide="%o tripped on his own XM84."
	bDelayedDamage=true
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
}
