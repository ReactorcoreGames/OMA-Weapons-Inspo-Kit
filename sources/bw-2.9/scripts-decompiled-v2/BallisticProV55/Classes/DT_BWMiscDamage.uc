class DT_BWMiscDamage extends BallisticDamageType
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

