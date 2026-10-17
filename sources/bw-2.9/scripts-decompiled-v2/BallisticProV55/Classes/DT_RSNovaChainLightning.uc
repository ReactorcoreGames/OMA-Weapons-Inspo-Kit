class DT_RSNovaChainLightning extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k fried %o to a crisp with chain lightning."
	DeathStrings[1]="%o was one of the links in %k's chain lightning attack."
	DeathStrings[2]="%k incinerated %o with Nova lightning."
	SimpleKillString="Nova Chain Lightning"
	BloodManagerName="BallisticProV55.BloodMan_NovaLightning"
	FlashThreshold=0
	FlashV=(X=2000.0000000,Y=2000.0000000,Z=800.0000000)
	FlashF=0.3000000
	ShieldDamage=15
	bIgniteFires=true
	DamageIdent="Energy"
	DamageDescription=",Electro,NovaStaff,"
	WeaponClass=Class'BallisticProV55.RSNovaStaff'
	DeathString="%k fried %o to a crisp with chain lightning."
	FemaleSuicide="%o did her Zeus impression on herself."
	MaleSuicide="%o did his Zeus impression on himself."
	bInstantHit=true
	bCauseConvulsions=true
	bNeverSevers=true
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.2500000
	KDamageImpulse=20000.0000000
}
