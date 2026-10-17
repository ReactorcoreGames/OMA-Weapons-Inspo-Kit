class DT_LS440Instagib extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="%k stripped the atoms from %o's bones!"
	DeathStrings[1]="%o was liquified by %k's super shock beam!"
	DeathStrings[2]="%k's super laser atomized helpless %o!"
	DeathStrings[3]="%o's body was completely disintegrated by %k's instagib beam!"
	WeaponClass=Class'BWBP_SKC_Pro.LS14Carbine'
	DeathString="%k stripped the atoms from %o's bones!"
	FemaleSuicide="%o EXPLODED IN ANGER."
	MaleSuicide="%o EXPLODED IN ANGER."
	bAlwaysGibs=true
	bLocationalHit=false
	bAlwaysSevers=true
	GibModifier=4.0000000
	PawnDamageEmitter=Class'BWBP_SKC_Pro.IE_HVPCGeneral'
	PawnDamageSounds[0]=Sound'WeaponSounds.ShockRifle.ShockComboFire'
	GibPerterbation=5.0000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.2000000
	VehicleMomentumScaling=1.3000000
}
