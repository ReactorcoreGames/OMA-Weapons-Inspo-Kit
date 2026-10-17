class FM14DartViewMesser extends Actor
	notplaceable;

var PlayerController PC;
var Pawn OriginalPawn;
var float FlashF;
var Vector FlashV;

replication
{
	// Pos:0x000
	unreliable if(int(Role) == int(ROLE_Authority))
		AddImpulse;
}

simulated function PostNetBeginPlay()
{
	PC = Level.GetLocalPlayerController();
	// End:0x56
	if((Owner != none) && PlayerController(Owner) != none)
	{
		PC = PlayerController(Owner);
		OriginalPawn = PC.Pawn;
	}
	// End:0x83
	if((int(Role) == int(ROLE_Authority)) && (PC == none) || OriginalPawn == none)
	{
		Destroy();
	}
	//return;	
}

simulated function SetupTimer()
{
	LifeSpan = 5.0000000;
	SetTimer(1.5000000, true);
	//return;	
}

simulated event Timer()
{
	// End:0x7C
	if(((((PC == none) || PC.Pawn == none) || PC.Pawn != OriginalPawn) || PC.Pawn.bDeleteMe) || PC.Pawn.Health <= 0)
	{
		Destroy();
		return;
	}
	AddImpulse(1.0000000);
	//return;	
}

simulated function AddImpulse(float Amount)
{
	// End:0x62
	if((((PC == none) || PC.Pawn == none) || PC.Pawn.bDeleteMe) || PC.Pawn.Health <= 0)
	{
		Destroy();
		return;
	}
	// End:0x7D
	if(xPawn(PC.Pawn) == none)
	{
		return;
	}
	PC.ClientFlash(FlashF + (float(1) - Amount), FlashV);
	// End:0xDB
	if(Amount > float(0))
	{
		Class'BCoreProV55.BC_MotionBlurActor'.static.DoMotionBlur(PC, 5.0000000 * Amount, 2.0000000 * Amount);
	}
	//return;	
}

defaultproperties
{
	FlashF=-0.1500000
	FlashV=(X=128.0000000,Y=128.0000000,Z=128.0000000)
	bHidden=true
	bOnlyRelevantToOwner=true
	bReplicateMovement=false
	bSkipActorPropertyReplication=true
	RemoteRole=2
	LifeSpan=5.0000000
}
