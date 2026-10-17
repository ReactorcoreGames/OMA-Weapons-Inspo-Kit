class DTM7A3Tazer extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o got shocked by %k's M7A3 tazer."
	DeathStrings[1]="%k defibrillated %o with a M7A3 tazer."
	DeathStrings[2]="%o got zapped hard by %k's pistol tazer."
	SimpleKillString="M7A3 Tazer"
	BloodManagerName="BallisticProV55.BloodMan_NovaLightning"
	FlashThreshold=0
	FlashV=(X=0.0000000,Y=0.0000000,Z=350.0000000)
	FlashF=0.7000000
	ShieldDamage=15
	bIgniteFires=true
	DamageIdent="Sidearm"
	DamageDescription=",Electro,"
	WeaponClass=Class'BWBP_JCF_Pro.M7A3AssaultRifle'
	DeathString="%o got shocked by %k's M7A3 tazer."
	FemaleSuicide="%o struck herself."
	MaleSuicide="%o struck himself."
	bInstantHit=true
	bLocationalHit=false
	bCauseConvulsions=true
	bNeverSevers=true
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.2500000
	KDamageImpulse=20000.0000000
}
