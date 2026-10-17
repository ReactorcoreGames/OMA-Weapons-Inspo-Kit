class DTMRS138TazerLine extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o got shocked by %k's MRS-138 tazer."
	DeathStrings[1]="%k defibrillated %o with a MRS-138 tazer."
	DeathStrings[2]="%o got zapped hard by %k's shotgun tazer."
	SimpleKillString="MRS-138 Taser"
	BloodManagerName="BallisticProV55.BloodMan_NovaLightning"
	FlashThreshold=0
	FlashV=(X=0.0000000,Y=0.0000000,Z=350.0000000)
	FlashF=0.7000000
	ShieldDamage=15
	bIgniteFires=true
	InvasionDamageScaling=4.0000000
	DamageIdent="Sidearm"
	DamageDescription=",Electro,"
	WeaponClass=Class'BallisticProV55.MRS138Shotgun'
	DeathString="%o got shocked by %k's MRS-138 tazer."
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
