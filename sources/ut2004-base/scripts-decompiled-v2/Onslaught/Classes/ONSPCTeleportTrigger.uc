class ONSPCTeleportTrigger extends Triggers;

function UsedBy(Pawn User)
{
	// End:0x1F
	if(Owner != none)
	{
		Owner.UsedBy(User);
	}
	//return;	
}

function Touch(Actor Other)
{
	local Pawn P;

	P = Pawn(Other);
	// End:0x76
	if(((P != none) && AIController(P.Controller) != none) && P.Controller.RouteGoal == Owner)
	{
		P.Controller.MoveTimer = -1.0000000;
	}
	//return;	
}

defaultproperties
{
	bStasis=true
	CollisionRadius=230.0000000
	CollisionHeight=200.0000000
}
