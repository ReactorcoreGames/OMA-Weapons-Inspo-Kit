class BallisticTurretTrigger extends Triggers;

function UsedBy(Pawn User)
{
	// End:0x29
	if(Vehicle(Owner) != none)
	{
		Vehicle(Owner).TryToDrive(User);
	}
	//return;	
}

defaultproperties
{
	bOnlyAffectPawns=true
	CollisionRadius=96.0000000
	CollisionHeight=96.0000000
}
