class M46GrenadeTrigger extends Triggers;

function UsedBy(Pawn User)
{
	// End:0x36
	if((Owner != none) && M46ProximityMine(Owner) != none)
	{
		M46ProximityMine(Owner).TryUse(User);
	}
	//return;	
}

singular simulated function Touch(Actor Other)
{
	// End:0x5E
	if(((Owner != none) && M46ProximityMine(Owner) != none) && Other.bProjTarget || Other.bBlockActors)
	{
		M46ProximityMine(Owner).SteppedOn(Other);
	}
	//return;	
}

defaultproperties
{
	bOnlyAffectPawns=true
	bHardAttach=true
	CollisionRadius=192.0000000
	CollisionHeight=192.0000000
}
