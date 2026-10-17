class DTLS14Overheat extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was overheated by %k."
	DeathStrings[1]="%k overcharged %kh LS14 in %o's face."
	FemaleSuicides[0]="%o blew the capacitors on her LS14."
	FemaleSuicides[1]="%o pushed her LS14 past its limits."
	FemaleSuicides[2]="%o's LS14 went critical."
	MaleSuicides[0]="%o blew the capacitors on his LS14."
	MaleSuicides[1]="%o pushed his LS14 past its limits."
	MaleSuicides[2]="%o's LS14 went critical."
	SimpleKillString="LS-14 Overheat"
	SimpleSuicideString="LS-14 Overheat"
	BloodManagerName="BallisticProV55.BloodMan_Lightning"
	FlashThreshold=0
	FlashV=(X=400.0000000,Y=400.0000000,Z=800.0000000)
	FlashF=0.1000000
	ShieldDamage=20
	bIgniteFires=true
	DamageDescription=",Electro,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.LS14Carbine'
	DeathString="%o's lungs were turned to ashes by %k's laser carbine."
	FemaleSuicide="%o cannot use a carbine effectively."
	MaleSuicide="%o stinks at using laser carbines."
	bInstantHit=true
	bCauseConvulsions=true
	bCausesBlood=false
	bFlaming=true
	GibModifier=1.5000000
	GibPerterbation=0.4000000
	KDamageImpulse=20000.0000000
}
