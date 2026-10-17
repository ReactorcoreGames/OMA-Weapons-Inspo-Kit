class BCGhostWeapon extends Inventory;

var() Class<BallisticWeapon> MyWeaponClass;

function ReviveWeapon()
{
	local Weapon newWeapon;

	// End:0xB5
	if((MyWeaponClass != none) && Instigator.FindInventoryType(MyWeaponClass) == none)
	{
		newWeapon = Spawn(MyWeaponClass,,, Instigator.Location);
		// End:0xB5
		if(newWeapon != none)
		{
			newWeapon.GiveTo(Instigator);
			newWeapon.ConsumeAmmo(0, 9999.0000000, true);
			newWeapon.ConsumeAmmo(1, 9999.0000000, true);
			// End:0xB5
			if(BallisticWeapon(newWeapon) != none)
			{
				BallisticWeapon(newWeapon).MagAmmo = 0;
			}
		}
	}
	Pawn(Owner).DeleteInventory(self);
	Destroy();
	//return;	
}

