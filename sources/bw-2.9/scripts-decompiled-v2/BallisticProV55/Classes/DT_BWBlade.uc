class DT_BWBlade extends BallisticDamageType
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
	BloodManagerName="BallisticProV55.BloodMan_Slash"
	bCanBeBlocked=true
	ShieldDamage=50
	DisplacementType=1
	bMetallic=true
	InvasionDamageScaling=3.0000000
	DamageDescription=",Slash,"
	bInstantHit=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.Knife.KnifeFlesh'
	VehicleDamageScaling=0.0000000
	VehicleMomentumScaling=0.0000000
}
