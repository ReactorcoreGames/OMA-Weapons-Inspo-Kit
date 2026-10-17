class DT_RSNovaBacklash extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was fried to a crisp by %k's Nova lightning."
	DeathStrings[1]="%k did his Zeus impression on %o."
	DeathStrings[2]="%o found %vs being electrified by %k's Nova storm."
	SimpleKillString="Nova Staff Backlash"
	BloodManagerName="BallisticProV55.BloodMan_NovaLightning"
	FlashThreshold=0
	FlashV=(X=2000.0000000,Y=2000.0000000,Z=800.0000000)
	FlashF=0.3000000
	ShieldDamage=15
	bIgniteFires=true
	DamageIdent="Energy"
	DamageDescription=",Electro,NovaStaff,"
	WeaponClass=Class'BallisticProV55.RSNovaStaff'
	DeathString="%o was fried to a crisp by %k's NovaStaff."
	FemaleSuicide="%o's concentration wandered from her Nova Staff."
	MaleSuicide="%o's concentration wandered from his Nova Staff."
	bInstantHit=true
	bCauseConvulsions=true
	bNeverSevers=true
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.2500000
	KDamageImpulse=20000.0000000
}
