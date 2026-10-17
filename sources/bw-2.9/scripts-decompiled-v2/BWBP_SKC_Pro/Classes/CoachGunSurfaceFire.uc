class CoachGunSurfaceFire extends RX22ASurfaceFire;

function Toast(Actor A)
{
	local int Health;

	// End:0x42
	if(((Instigator == none) || Instigator.Controller == none) && InstigatorController != none)
	{
		A.SetDelayedDamageInstigatorController(InstigatorController);
	}
	// End:0x6B
	if(Pawn(A) != none)
	{
		Health = Pawn(A).Health;
	}
	// End:0xF4
	if(((Ignitioneer != none) && (A == Instigator) || BW_FuelPatch(A) != none) || (Instigator == none) && InstigatorController == none)
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(A, Damage, Ignitioneer, A.Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);		
	}
	else
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(A, Damage, Instigator, A.Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
	}
	//return;	
}

defaultproperties
{
	Damage=30.0000000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachBurned'
}
