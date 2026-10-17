class DTShockN3XAlt extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k's meaty uppercut knocked %o the hell out."
	DeathStrings[1]="%k's thunderous strike drove %o's jaw into his skull."
	DeathStrings[2]="%k fed %o RAW, CHUNKY VOLTS to the FACE."
	DeathStrings[3]="%k's hellish blow shot %o into the skybox."
	DeathStrings[4]="%k struck down %o with the fist of Thor."
	ImpactManager=Class'BallisticProV55.IM_MRS138TazerHit'
	FlashThreshold=45
	FlashV=(X=400.0000000,Y=400.0000000,Z=1000.0000000)
	FlashF=0.1000000
	bCanBeBlocked=true
	ShieldDamage=15
	DamageIdent="Melee"
	DamageDescription=",Blunt,Electro"
	WeaponClass=Class'BWBP_SKC_Pro.N3XPlaz'
	DeathString="%k administered a healthy dose of ass-whuppin' to %o."
	FemaleSuicide="%o zapped herself."
	MaleSuicide="%o zapped himself."
	bArmorStops=false
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
