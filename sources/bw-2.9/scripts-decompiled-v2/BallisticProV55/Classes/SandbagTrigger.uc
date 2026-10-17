class SandbagTrigger extends Trigger;

var Sandbag Bags;

event Touch(Actor Other)
{
	// End:0x0D
	if(Bags == none)
	{
		return;
	}
	// End:0x60
	if(Monster(Other) != none)
	{
		Bags.TakeDamage(100, Monster(Other), Location, vect(0.0000000, 0.0000000, 0.0000000), Class'Engine.fell');
		// End:0x5D
		if(Bags == none)
		{
			Destroy();
		}		
	}
	else
	{
		// End:0x9E
		if(BallisticPawn(Other) != none)
		{
			BallisticPawn(Other).CoverAnchors[BallisticPawn(Other).CoverAnchors.Length] = Bags;
		}
	}
	//return;	
}

event UnTouch(Actor Other)
{
	// End:0x29
	if(BallisticPawn(Other) != none)
	{
		BallisticPawn(Other).RemoveCoverAnchor(Bags);
	}
	//return;	
}

function RemoveCoverAnchors()
{
	local BallisticPawn P;

	// End:0x25
	foreach TouchingActors(Class'BallisticProV55.BallisticPawn', P)
	{
		P.RemoveCoverAnchor(Bags);		
	}	
	//return;	
}

event UsedBy(Pawn User)
{
	local Pawn P;

	// End:0x37
	foreach TouchingActors(Class'Engine.Pawn', P)
	{
		// End:0x36
		if(P.GetTeamNum() != User.GetTeamNum())
		{			
			return;
		}		
	}	
	Bags.TakeBag(User);
	// End:0x5A
	if(Bags == none)
	{
		Destroy();
	}
	//return;	
}

defaultproperties
{
	CollisionRadius=72.0000000
	CollisionHeight=48.0000000
}
