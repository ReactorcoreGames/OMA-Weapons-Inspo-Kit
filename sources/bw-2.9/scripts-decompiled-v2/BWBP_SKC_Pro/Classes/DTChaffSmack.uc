class DTChaffSmack extends DT_BWBlunt
	config(BallisticProV55);

defaultproperties
{
	DeathStrings[0]="A psychotic %k beat %o to death with a grenade."
	DeathStrings[1]="%k taught %o the meaning of an MOA-C 'potato masher'."
	DeathStrings[2]="%o got smacked upside the head by %k's smoke grenade."
	SimpleKillString="MOAC Chaff Melee"
	BlockFatiguePenalty=0.2000000
	WeaponClass=Class'BWBP_SKC_Pro.ChaffGrenadeWeapon'
	DeathString="A psychotic %k beat %o to death with a grenade."
	FemaleSuicide="%o cracked her skull with her own grenade."
	MaleSuicide="%o cracked his skull with his smoke grenade."
	bExtraMomentumZ=true
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.1000000
	VehicleMomentumScaling=1.3000000
}
