class DT_HVCOverheat extends DT_BWMiscDamage
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
	BloodManagerName="BallisticProV55.BloodMan_Lightning"
	FlashThreshold=0
	FlashV=(X=2000.0000000,Y=600.0000000,Z=600.0000000)
	FlashF=0.1000000
	ShieldDamage=15
	bIgniteFires=true
	DamageDescription=",Electro,Hazard,"
	WeaponClass=Class'BallisticProV55.HVCMk9LightningGun'
	DeathString="%o was overheated by %k."
	FemaleSuicide="%o forgot to release the trigger of her HVC."
	MaleSuicide="%o forgot to release the trigger of his HVC."
	bInstantHit=true
	bCauseConvulsions=true
	bCausesBlood=false
	bFlaming=true
	GibModifier=1.5000000
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.PlayerTransRed'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.4000000
	KDamageImpulse=20000.0000000
}
