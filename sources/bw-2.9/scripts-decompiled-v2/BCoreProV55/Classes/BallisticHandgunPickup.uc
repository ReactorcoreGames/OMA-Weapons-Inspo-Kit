class BallisticHandgunPickup extends BallisticWeaponPickup;

function Inventory SpawnCopy(Pawn Other)
{
	local Inventory Copy, Inv;
	local Weapon W;
	local int Count;
	local bool bHasTwoAlready;

	// End:0x16
	if(!bDropped)
	{
		OnItemPickedUp(self);
	}
	Inv = Other.Inventory;
	J0x2A:

	// End:0xA5 [Loop If]
	if((Inv != none) && Count < 1000)
	{
		// End:0x87
		if(Inv.Class == InventoryType)
		{
			// End:0x7C
			if(W == none)
			{
				W = Weapon(Inv);				
			}
			else
			{
				bHasTwoAlready = true;
				// [Explicit Break]
				goto J0xA5;
			}
		}
		Count++;
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x2A;
	}
	J0xA5:

	// End:0xCD
	if(bHasTwoAlready && W != none)
	{
		GiveWeaponAmmo(W, Other);
		return none;
	}
	// End:0xED
	if(Inventory != none)
	{
		Copy = Inventory;
		Inventory = none;		
	}
	else
	{
		Copy = Spawn(InventoryType, Other,,, rot(0, 0, 0));
	}
	Copy.GiveTo(Other, self);
	return Copy;
	//return;	
}

