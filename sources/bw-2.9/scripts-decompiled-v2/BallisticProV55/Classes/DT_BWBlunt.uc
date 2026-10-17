class DT_BWBlunt extends BallisticDamageType
	config(BallisticProV55);

static function DoBloodEffects(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
	// End:0x30
	if(BallisticPawn(Victim) == none)
	{
		super.DoBloodEffects(HitLocation, Damage, Momentum, Victim, bLowDetail);
	}
	//return;	
}

defaultproperties
{
	BloodManagerName="BallisticProV55.BloodMan_Blunt"
	FlashThreshold=50
	bCanBeBlocked=true
	InvasionDamageScaling=3.0000000
	DamageDescription=",Blunt,"
	bInstantHit=true
	bNeverSevers=true
	PawnDamageSounds[0]=Sound'BW_Core_WeaponSound.M763.M763SmashFlesh'
	VehicleDamageScaling=0.0000000
	VehicleMomentumScaling=0.1000000
	TransientSoundVolume=1.5000000
}
