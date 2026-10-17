class DTShockGauntletAlt extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's meaty uppercut knocked %o the hell out."
	DeathStrings[1]="%k's thunderous strike drove %o's jaw into his skull."
	DeathStrings[2]="%k fed %o RAW, CHUNKY VOLTS to the FACE."
	DeathStrings[3]="%k's hellish blow shot %o into the skybox."
	DeathStrings[4]="%k struck down %o with the fist of Thor."
	ImpactManager=Class'BallisticProV55.IM_MRS138TazerHit'
	FlashThreshold=90
	FlashV=(X=400.0000000,Y=400.0000000,Z=1000.0000000)
	FlashF=0.1000000
	bCanBeBlocked=true
	BlockPenetration=0.2000000
	BlockFatiguePenalty=0.1500000
	ShieldDamage=15
	DisplacementType=1
	AimDisplacementDamageThreshold=40
	AimDisplacementDuration=0.7500000
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
	VehicleDamageScaling=0.3500000
	VehicleMomentumScaling=0.0500000
}
