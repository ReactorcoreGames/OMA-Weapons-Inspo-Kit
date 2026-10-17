class DT_RSNovaOneShotZap extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o felt the wrath of %k's godly lightning strike."
	DeathStrings[1]="%k struck down %o with %kh Nova strike."
	DeathStrings[2]="%o was obliterated by %k's godly lightning."
	DeathStrings[3]="%k invoked %kh heavenly powers to smite %o down."
	SimpleKillString="Nova God Strike"
	BloodManagerName="BallisticProV55.BloodMan_NovaLightning"
	FlashThreshold=0
	FlashV=(X=2000.0000000,Y=2000.0000000,Z=800.0000000)
	FlashF=0.3000000
	ShieldDamage=15
	bIgniteFires=true
	DamageIdent="Energy"
	DamageDescription=",Electro,NovaStaff,"
	WeaponClass=Class'BallisticProV55.RSNovaStaff'
	DeathString="%o felt the wrath of %k's godly lightning strike."
	FemaleSuicide="%o struck herself down with heaven's power."
	MaleSuicide="%o struck himself down with heaven's power."
	bInstantHit=true
	bCauseConvulsions=true
	GibModifier=1.5000000
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.5000000
	KDamageImpulse=20000.0000000
	VehicleMomentumScaling=1.5000000
}
