class DT_Mk781Electro extends DT_BWShell
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k attempted some ranged electrotherapy on %o."
	DeathStrings[1]="%k's Mk.781 charged %o to 1.21 jiggawatts."
	DeathStrings[2]="%k's X-007 showed %o what licking 20 batteries is like."
	SimpleKillString="Mk781 Electroshock Shell"
	FlashThreshold=40
	FlashV=(X=1500.0000000,Y=1500.0000000,Z=1500.0000000)
	FlashF=-0.3000000
	DisplacementType=1
	AimDisplacementDamageThreshold=40
	AimDisplacementDuration=0.7500000
	InvasionDamageScaling=3.0000000
	WeaponClass=Class'BWBP_SKC_Pro.MK781Shotgun'
	DeathString="%k attempted some ranged electrotherapy on %o."
	FemaleSuicide="%o put the fork in the power outlet."
	MaleSuicide="%o put the spoon in the power outlet."
	bCauseConvulsions=true
	bNeverSevers=true
	PawnDamageSounds[0]=Sound'BWBP_SKC_Sounds.Misc.XM84-StunEffect'
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.4000000
	KDamageImpulse=15000.0000000
	VehicleDamageScaling=1.2500000
}
