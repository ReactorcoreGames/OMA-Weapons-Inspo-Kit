class X4KnifeViewMesser extends Actor
	notplaceable;

var PlayerController PC;
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

simulated function SetupTimer()
{
	LifeSpan = 4.0000000;
	SetTimer(1.0000000, true);
	//return;	
}

simulated event Timer()
{
	// End:0x62
	if((((PC == none) || PC.Pawn == none) || PC.Pawn.bDeleteMe) || PC.Pawn.Health <= 0)
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
	// End:0x8A
	if((PC == none) || xPawn(PC.Pawn) == none)
	{
		return;
	}
	PC.ClientFlash(FlashF + (float(1) - Amount), FlashV);
	// End:0xE8
	if(Amount > float(0))
	{
		Class'BCoreProV55.BC_MotionBlurActor'.static.DoMotionBlur(PC, 2.5000000 * Amount, 1.0000000 * Amount);
	}
	//return;	
}

defaultproperties
{
	FlashF=0.3000000
	FlashV=(X=0.0000000,Y=2000.0000000,Z=0.0000000)
	bHidden=true
	bOnlyRelevantToOwner=true
	bReplicateMovement=false
	bSkipActorPropertyReplication=true
	RemoteRole=2
	LifeSpan=4.0000000
}
