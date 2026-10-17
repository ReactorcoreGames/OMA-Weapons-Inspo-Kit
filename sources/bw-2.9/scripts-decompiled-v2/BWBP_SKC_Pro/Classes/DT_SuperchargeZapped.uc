class DT_SuperchargeZapped extends DT_BWFire
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k stopped %o's heart with %kh Supercharger."
	DeathStrings[1]="%k's Supercharger shorted out %o."
	DeathStrings[2]="%o was electrocuted by %k's Supercharger."
	DeathStrings[3]="%o got a fatal static shock from %k's Supercharger."
	DeathStrings[4]="%k turned up the voltage on %o."
	BloodManagerName="BallisticProV55.BloodMan_Lightning"
	bDetonatesBombs=false
	DamageDescription=",Electro,Hazard,Plasma,"
	WeaponClass=Class'BWBP_SKC_Pro.Supercharger_AssaultWeapon'
	DeathString="%k stopped %o's heart with a Supercharger."
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
