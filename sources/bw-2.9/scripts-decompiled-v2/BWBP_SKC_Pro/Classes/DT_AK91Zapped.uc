class DT_AK91Zapped extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k stopped %o's heart with an AK91."
	DeathStrings[1]="%k's AK91 shorted out %o."
	DeathStrings[2]="%o was electrocuted by %k's AK91."
	DeathStrings[3]="%o got a fatal static shock from %k's AK91."
	DeathStrings[4]="%k turned up the voltage on %o."
	BloodManagerName="BallisticProV55.BloodMan_Lightning"
	bDetonatesBombs=false
	DamageDescription=",Electro,Hazard,Plasma,"
	WeaponClass=Class'BWBP_SKC_Pro.AK91ChargeRifle'
	DeathString="%k stopped %o's heart with an AK91."
	FemaleSuicide="%o zapped herself."
	MaleSuicide="%o zapped himself."
	bCauseConvulsions=true
	bDelayedDamage=true
	GibModifier=5.0000000
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.2500000
	KDamageImpulse=20000.0000000
	VehicleDamageScaling=0.4000000
}
