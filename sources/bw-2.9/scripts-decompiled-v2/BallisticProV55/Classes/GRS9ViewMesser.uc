class GRS9ViewMesser extends Actor
	notplaceable;

var PlayerController PC;
var float FlashF;
var Vector FlashV;
var float AltFlashF;
var Vector AltFlashV;

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

simulated function AddImpulse(float Amount)
{
	// End:0x28
	if((PC == none) || xPawn(PC.Pawn) == none)
	{
		return;
	}
	// End:0x62
	if(Class'BCoreProV55.BallisticDamageType'.default.bLessDisruptiveFlash)
	{
		PC.ClientFlash(AltFlashF + (float(1) - Amount), AltFlashV);		
	}
	else
	{
		PC.ClientFlash(FlashF + (float(1) - Amount), FlashV);
	}
	// End:0xC0
	if(Amount > float(0))
	{
		Class'BCoreProV55.BC_MotionBlurActor'.static.DoMotionBlur(PC, 3.0000000 * Amount, 10.0000000 * Amount);
	}
	//return;	
}

defaultproperties
{
	FlashF=-0.6000000
	FlashV=(X=2500.0000000,Y=2500.0000000,Z=2500.0000000)
	AltFlashF=-1.4000000
	AltFlashV=(X=500.0000000,Y=500.0000000,Z=500.0000000)
	bHidden=true
	bOnlyRelevantToOwner=true
	bReplicateMovement=false
	bSkipActorPropertyReplication=true
	RemoteRole=2
	LifeSpan=15.0000000
}
