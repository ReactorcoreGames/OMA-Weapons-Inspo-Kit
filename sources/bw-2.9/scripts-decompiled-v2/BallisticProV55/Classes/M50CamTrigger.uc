class M50CamTrigger extends Triggers;

function UsedBy(Pawn User)
{
	// End:0x36
	if((Owner != none) && M50AssaultRifle(Owner) != none)
	{
		M50AssaultRifle(Owner).TryUse(User);
	}
	//return;	
}

defaultproperties
{
	bOnlyAffectPawns=true
	bHardAttach=true
	CollisionRadius=64.0000000
	CollisionHeight=96.0000000
}
