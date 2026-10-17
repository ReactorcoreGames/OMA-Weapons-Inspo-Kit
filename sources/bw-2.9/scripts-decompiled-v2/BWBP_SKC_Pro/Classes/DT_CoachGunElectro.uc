class DT_CoachGunElectro extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k electrocuted %o with %kh modified trenchgun."
	DeathStrings[1]="%k's skeletized shotgun zapped %o to death."
	DeathStrings[2]="%k's electric shot exorcised a convulsing %o."
	SimpleKillString="Trenchgun Electroshock Shell"
	FlashThreshold=0
	FlashV=(X=128.0000000,Y=128.0000000,Z=128.0000000)
	DisplacementType=2
	AimDisplacementDamageThreshold=10
	AimDisplacementDuration=0.1000000
	InvasionDamageScaling=2.0000000
	DamageIdent="Shotgun"
	DamageDescription=",Shell,Electro,"
	WeaponClass=Class'BWBP_SKC_Pro.CoachGun'
	DeathString="%k electrocuted %o with %kh modified trenchgun."
	FemaleSuicide="%o put the fork in the power outlet."
	MaleSuicide="%o put the spoon in the power outlet."
	bCauseConvulsions=true
	bNeverSevers=true
	bExtraMomentumZ=true
	PawnDamageSounds[0]=Sound'BWBP_SKC_Sounds.Misc.XM84-StunEffect'
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.4000000
	KDamageImpulse=15000.0000000
	VehicleDamageScaling=1.2500000
}
