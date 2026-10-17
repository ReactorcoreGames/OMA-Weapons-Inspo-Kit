class DTShockGauntletWave extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k gave %o shock therapy with his fists of retribution."
	DeathStrings[1]="%k administered a healthy dose of ass-whuppin' to %o."
	DeathStrings[2]="%k prescribed a dose of electro-gauntlet fury for %o."
	DeathStrings[3]="%k operated %o's face off with %vh fists of vengeance."
	DeathStrings[4]="%k surgically removed %o's life with the Combat Defibrillator!"
	ImpactManager=Class'BallisticProV55.IM_MRS138TazerHit'
	FlashThreshold=45
	FlashV=(X=400.0000000,Y=400.0000000,Z=1000.0000000)
	FlashF=0.1000000
	bCanBeBlocked=true
	ShieldDamage=15
	DisplacementType=1
	AimDisplacementDamageThreshold=25
	DamageIdent="Melee"
	DamageDescription=",Blunt,Electro"
	WeaponClass=Class'BWBP_OP_Pro.DefibFists'
	DeathString="%k administered a healthy dose of ass-whuppin' to %o."
	FemaleSuicide="%o zapped herself."
	MaleSuicide="%o zapped himself."
	bInstantHit=true
	bCauseConvulsions=true
	bNeverSevers=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.MRS38.RSS-ElectroFlesh'
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.2500000
	VehicleDamageScaling=0.1000000
	VehicleMomentumScaling=0.0500000
}
