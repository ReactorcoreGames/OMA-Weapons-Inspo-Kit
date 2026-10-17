class DTGRS9Tazer extends DT_BWMiscDamage
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o was tazed instead of shot by %k."
	DeathStrings[1]="%k stuck a tazer into %o's eye."
	DeathStrings[2]="%o was tazed instead of shot by %k."
	DeathStrings[3]="%k stuck a tazer into %o's eye."
	DeathStrings[4]="%k extracted %o's eyes!!"
	ImpactManager=Class'BallisticProV55.IM_MRS138TazerHit'
	FlashThreshold=0
	FlashV=(X=800.0000000,Y=800.0000000,Z=2000.0000000)
	FlashF=-0.2500000
	bCanBeBlocked=true
	BlockFatiguePenalty=0.3000000
	ShieldDamage=15
	DisplacementType=1
	AimDisplacementDuration=1.0000000
	InvasionDamageScaling=3.0000000
	DamageIdent="Melee"
	DamageDescription=",Blunt,Electro"
	WeaponClass=Class'BallisticProV55.GRS9Pistol'
	DeathString="%o was tazed instead of shot by %k."
	FemaleSuicide="%o zapped herself."
	MaleSuicide="%o zapped himself."
	bInstantHit=true
	bCauseConvulsions=true
	bNeverSevers=true
	bExtraMomentumZ=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.MRS38.RSS-ElectroFlesh'
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.2500000
	VehicleDamageScaling=0.0000000
	VehicleMomentumScaling=0.0500000
}
