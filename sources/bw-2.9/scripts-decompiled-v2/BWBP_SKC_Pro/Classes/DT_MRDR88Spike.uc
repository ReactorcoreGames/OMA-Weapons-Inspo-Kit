class DT_MRDR88Spike extends DT_BWBlade
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%o got shanked real good by %k's MR-DR88."
	DeathStrings[1]="%o lost a fist fight to %k's spiked knuckle."
	DeathStrings[2]="%k punched a couple holes into %o."
	DeathStrings[3]="%k got medieval on %o's ass."
	BlockFatiguePenalty=0.1500000
	DamageIdent="Melee"
	DamageDescription=",Stab,"
	WeaponClass=Class'BWBP_SKC_Pro.MRDRMachinePistol'
	DeathString="%o got shanked real good by %k's MR-DR88."
	FemaleSuicide="%o happily stabbed herself to death."
	MaleSuicide="%o happily stabbed himself to death."
	bNeverSevers=true
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.A73.A73StabFlesh'
	KDamageImpulse=2000.0000000
	VehicleDamageScaling=0.5000000
}
