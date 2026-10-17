class DT_M2020Overheat extends DT_BWBullet
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was overheated by %k."
	FemaleSuicides[0]="%o polarized herself."
	FemaleSuicides[1]="%o obliterated herself with her overcharged DMR."
	FemaleSuicides[2]="%o's DMR blew up in her face."
	MaleSuicides[0]="%o polarized himself."
	MaleSuicides[1]="%o obliterated himself with his overcharged DMR."
	MaleSuicides[2]="%o's DMR blew up in his face."
	SimpleKillString="M2020 Gauss DMR Overheat"
	SimpleSuicideString="M2020 Gauss DMR Overheat"
	BloodManagerName="BallisticProV55.BloodMan_Lightning"
	FlashThreshold=0
	FlashV=(X=400.0000000,Y=400.0000000,Z=800.0000000)
	FlashF=0.1000000
	ShieldDamage=30
	bIgniteFires=true
	DamageDescription=",Electro,Hazard,"
	WeaponClass=Class'BWBP_SKC_Pro.M2020GaussDMR'
	DeathString="%o was overheated by %k."
	FemaleSuicide="%o polarized herself."
	MaleSuicide="%o polarized himself."
	bCauseConvulsions=true
	bCausesBlood=false
	bFlaming=true
	GibModifier=1.5000000
	GibPerterbation=0.4000000
	KDamageImpulse=20000.0000000
}
