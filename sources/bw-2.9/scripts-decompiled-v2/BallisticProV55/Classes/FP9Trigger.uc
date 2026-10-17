class FP9Trigger extends Triggers;

var float TriggerStartTime;

function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	TriggerStartTime = Level.TimeSeconds + float(1);
	//return;	
}

function UsedBy(Pawn User)
{
	// End:0x50
	if(((Owner != none) && FP9Bomb(Owner) != none) && TriggerStartTime < Level.TimeSeconds)
	{
		FP9Bomb(Owner).TryUse(User);
	}
	//return;	
}

defaultproperties
{
	bOnlyAffectPawns=true
	bHardAttach=true
	CollisionRadius=50.0000000
	CollisionHeight=80.0000000
}
