class DT_HVCRedLightning extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was torn apart by %k's fiery red lightning."
	DeathStrings[1]="%o's unfortunate head was seared off by %k's red lightning."
	DeathStrings[2]="%k ruthlessly charred %o with red lightning."
	DeathStrings[3]="%k's burning red lightning surged into %o's chest."
	DeathStrings[4]="%k exerted the wrath of Satan on %o."
	SimpleKillString="HVC-Mk9 Lightning Charged"
	BloodManagerName="BallisticProV55.BloodMan_Lightning"
	FlashThreshold=0
	FlashV=(X=2000.0000000,Y=600.0000000,Z=600.0000000)
	FlashF=0.3000000
	ShieldDamage=15
	bIgniteFires=true
	InvasionDamageScaling=3.0000000
	DamageIdent="Streak"
	DamageDescription=",Electro,"
	WeaponClass=Class'BallisticProV55.HVCMk9LightningGun'
	DeathString="%o was torn apart by %k's fiery red lightning."
	FemaleSuicide="%o was struck down by the hand of Satan."
	MaleSuicide="%o was struck down by the hand of Satan."
	bInstantHit=true
	bCauseConvulsions=true
	bExtraMomentumZ=true
	bFlaming=true
	GibModifier=1.5000000
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.PlayerTransRed'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.4000000
	KDamageImpulse=20000.0000000
	VehicleDamageScaling=1.5000000
}
