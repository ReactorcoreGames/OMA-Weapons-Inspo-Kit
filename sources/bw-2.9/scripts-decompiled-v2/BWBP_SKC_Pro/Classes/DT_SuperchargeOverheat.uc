class DT_SuperchargeOverheat extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was overheated by %k."
	DeathStrings[1]="%k overcharged %kh supercharger in %o's face."
	FemaleSuicides[0]="%o shocked herself with a supercharger."
	FemaleSuicides[1]="%o unsafely charged a supercharger."
	FemaleSuicides[2]="%o short circuited her supercharger."
	MaleSuicides[0]="%o shocked himself with a supercharger."
	MaleSuicides[1]="%o unsafely charged a supercharger."
	MaleSuicides[2]="%o short circuited his supercharger."
	BloodManagerName="BallisticProV55.BloodMan_Lightning"
	bDetonatesBombs=false
	DamageDescription=",Electro,Hazard,Plasma,"
	WeaponClass=Class'BWBP_SKC_Pro.Supercharger_AssaultWeapon'
	DeathString="%k stopped %o's heart with a supercharger."
	FemaleSuicide="%o shocked herself with a supercharger."
	MaleSuicide="%o shocked himself with a supercharger."
	bCauseConvulsions=true
	bDelayedDamage=true
	GibModifier=5.0000000
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.2500000
	KDamageImpulse=20000.0000000
	VehicleDamageScaling=0.4000000
}
