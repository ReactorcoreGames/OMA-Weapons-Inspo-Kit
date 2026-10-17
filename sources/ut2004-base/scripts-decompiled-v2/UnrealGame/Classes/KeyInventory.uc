class KeyInventory extends Inventory;

var KeyPickup myPickUp;

function UnLock(LockedObjective O)
{
	// End:0x40
	if(!UnrealMPGameInfo(Level.Game).CanDisableObjective(O))
	{
		O.DisableObjective(Pawn(Owner));
	}
	//return;	
}

function Destroyed()
{
	myPickUp.GotoState('Pickup');
	super.Destroyed();
	//return;	
}

