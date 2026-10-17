class DTA49OverHeat extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o shared %k's overloaded A49."
	FemaleSuicides[0]="%o short circuited some Skrith technology."
	FemaleSuicides[1]="%o overheated her A49 one too many times."
	FemaleSuicides[2]="%o happily played with damaged alien equipment."
	MaleSuicides[0]="%o short circuited some Skrith technology."
	MaleSuicides[1]="%o overheated his A49 one too many times."
	MaleSuicides[2]="%o happily played with damaged alien equipment."
	BloodManagerName="BallisticProV55.BloodMan_Lightning"
	FlashThreshold=0
	FlashV=(X=800.0000000,Y=800.0000000,Z=2000.0000000)
	FlashF=0.5000000
	bDetonatesBombs=false
	bIgniteFires=true
	InvasionDamageScaling=1.5000000
	DamageIdent="SMG"
	DamageDescription=",Electro,Hazard"
	WeaponClass=Class'BWBP_SKC_Pro.A49SkrithBlaster'
	DeathString="%o shared %k's overloaded A49."
	FemaleSuicide="%o short circuited some Skrith technology."
	MaleSuicide="%o short circuited some Skrith technology."
	bArmorStops=false
	bInstantHit=true
	bCauseConvulsions=true
	bFlaming=true
	GibModifier=5.0000000
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.4000000
	KDamageImpulse=20000.0000000
}
