class BallisticPickupTrigger extends Triggers;

var BallisticWeaponPickup bwPickUp;
var bool bInit;
var string PickupMessage;
var float RefireDelay;
var bool RefireEvent;
var PlayerController PC;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bwPickUp;
}

function UsedBy(Pawn User)
{
	// End:0x1F
	if(bwPickUp != none)
	{
		bwPickUp.Touch(User);
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	// End:0x11
	if(!bInit)
	{
		InitTrigger();
	}
	super(Actor).PostNetBeginPlay();
	//return;	
}

simulated function InitTrigger()
{
	// End:0x13
	if(bwPickUp != none)
	{
		bInit = true;
	}
	//return;	
}

simulated event Tick(float dt)
{
	local Color clrBlue;
	local string clrB, clrW;

	// End:0x13A
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && bInit) && PC == none)
	{
		PC = Level.GetLocalPlayerController();
		// End:0x13A
		if(PC != none)
		{
			clrBlue = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), 0, byte(255));
			clrB = Class'XInterface.GUIComponent'.static.MakeColorCode(clrBlue);
			clrW = Class'XInterface.GUIComponent'.static.MakeColorCode(PC.myHUD.ConsoleColor);
			PickupMessage = ((clrW $ "Press %USE% to pick up the ") $ clrB) $ bwPickUp.InventoryType.default.ItemName;
			PickupMessage = Class'Engine.GameInfo'.static.ParseLoadingHint(PickupMessage, PC, PC.myHUD.ConsoleColor);
		}
	}
	//return;	
}

simulated event Touch(Actor Other)
{
	// End:0x7F
	if(Pawn(Other) != none)
	{
		// End:0x51
		if((PickupMessage != "") && RefireEvent)
		{
			Pawn(Other).ClientMessage(PickupMessage);
			RefireEvent = false;
			SetTimer(RefireDelay, false);
		}
		// End:0x7F
		if(AIController(Pawn(Other).Controller) != none)
		{
			UsedBy(Pawn(Other));
		}
	}
	//return;	
}

simulated function Timer()
{
	RefireEvent = true;
	//return;	
}

defaultproperties
{
	RefireDelay=3.0000000
	RefireEvent=true
	RemoteRole=2
	bNetNotify=true
}
