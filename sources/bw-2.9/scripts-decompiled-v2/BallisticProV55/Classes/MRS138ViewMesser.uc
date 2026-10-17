class MRS138ViewMesser extends Actor
	notplaceable;

var PlayerController PC;

replication
{
	// Pos:0x000
	unreliable if(int(Role) == int(ROLE_Authority))
		AddImpulse;
}

simulated function PostNetBeginPlay()
{
	PC = Level.GetLocalPlayerController();
	// End:0x42
	if((Owner != none) && PlayerController(Owner) != none)
	{
		PC = PlayerController(Owner);
	}
	// End:0x62
	if((int(Role) == int(ROLE_Authority)) && PC == none)
	{
		Destroy();
	}
	//return;	
}

simulated function AddImpulse()
{
	// End:0x28
	if((PC == none) || xPawn(PC.Pawn) == none)
	{
		return;
	}
	Class'BCoreProV55.BC_MotionBlurActor'.static.DoMotionBlur(PC, 3.0000000, 15.0000000);
	//return;	
}

defaultproperties
{
	bHidden=true
	bOnlyRelevantToOwner=true
	bReplicateMovement=false
	bSkipActorPropertyReplication=true
	RemoteRole=2
}
