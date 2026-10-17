class DT_BWFire extends BallisticDamageType
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
	DamageBasis=1
	bIgniteFires=true
	DamageDescription=",Flame,Hazard,NonSniper,"
	bLocationalHit=false
	bCausesBlood=false
	bNeverSevers=true
	GibPerterbation=0.5000000
	KDamageImpulse=1000.0000000
	VehicleDamageScaling=0.6000000
	VehicleMomentumScaling=0.0000000
}
