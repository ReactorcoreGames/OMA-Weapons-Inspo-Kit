class BX5VehicleTrigger extends Triggers;

function UsedBy(Pawn User)
{
	// End:0x36
	if((Owner != none) && BX5VehicleMine(Owner) != none)
	{
		BX5VehicleMine(Owner).TryUse(User);
	}
	//return;	
}

singular function Touch(Actor Other)
{
	// End:0xE2
	if(((Owner != none) && BX5VehicleMine(Owner) != none) && Other.bProjTarget || Other.bBlockActors)
	{
		// End:0xC9
		if(((Abs(Other.Location.Z - Location.Z) - Other.CollisionHeight) > float(64)) && (Vehicle(Other) == none) || !Vehicle(Other).bCanHover && !Vehicle(Other).bCanFly)
		{
			return;
		}
		BX5VehicleMine(Owner).SteppedOn(Other);
	}
	//return;	
}

defaultproperties
{
	bOnlyAffectPawns=true
	bHardAttach=true
	CollisionRadius=48.0000000
	CollisionHeight=128.0000000
}
