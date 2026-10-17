class BX5SpringTrigger extends Triggers;

function UsedBy(Pawn User)
{
	// End:0x36
	if((Owner != none) && BX5SpringMine(Owner) != none)
	{
		BX5SpringMine(Owner).TryUse(User);
	}
	//return;	
}

singular function Touch(Actor Other)
{
	// End:0x5E
	if(((Owner != none) && BX5SpringMine(Owner) != none) && Other.bProjTarget || Other.bBlockActors)
	{
		BX5SpringMine(Owner).SteppedOn(Other);
	}
	//return;	
}

defaultproperties
{
	bOnlyAffectPawns=true
	bHardAttach=true
	CollisionRadius=128.0000000
	CollisionHeight=128.0000000
}
