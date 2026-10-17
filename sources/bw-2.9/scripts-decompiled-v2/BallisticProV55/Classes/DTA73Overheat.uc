class DTA73Overheat extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was overheated by %k."
	DeathStrings[1]="%k overcharged %kh lightning gun in %o's face."
	FemaleSuicides[0]="%o forgot to release the trigger of her HVC."
	FemaleSuicides[1]="%o obliterated herself with her overcharged lightning gun."
	FemaleSuicides[2]="%o's lightning gun blew up in her face."
	MaleSuicides[0]="%o forgot to release the trigger of his HVC."
	MaleSuicides[1]="%o obliterated himself with his overcharged lightning gun."
	MaleSuicides[2]="%o's lightning gun blew up in his face."
	SimpleKillString="A73 Skrith Rifle Overheat"
	SimpleSuicideString="A73 Skrith Rifle Overheat"
	BloodManagerName="BallisticProV55.BloodMan_Lightning"
	FlashThreshold=0
	FlashV=(X=400.0000000,Y=400.0000000,Z=800.0000000)
	FlashF=0.1000000
	ShieldDamage=15
	bIgniteFires=true
	DamageDescription=",Electro,Hazard,"
	WeaponClass=Class'BallisticProV55.A73SkrithRifle'
	DeathString="%o was overheated by %k."
	FemaleSuicide="%o's A73 burnt through her own hands."
	MaleSuicide="%o' A73 burnt through his own hands."
	bInstantHit=true
	bCauseConvulsions=true
	bCausesBlood=false
	bFlaming=true
	GibModifier=1.5000000
	GibPerterbation=0.4000000
	KDamageImpulse=20000.0000000
}
