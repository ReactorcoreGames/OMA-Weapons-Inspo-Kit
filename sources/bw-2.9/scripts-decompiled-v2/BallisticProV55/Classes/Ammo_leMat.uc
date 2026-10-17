class Ammo_leMat extends BallisticAmmo;

var Ammo_16GaugeleMat Shells;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x159
	if(Item.IsA('AP_leMat'))
	{
		// End:0x8E
		if(Shells == none)
		{
			Shells = Ammo_16GaugeleMat(Pawn(Owner).FindInventoryType(Class'BallisticProV55.Ammo_16GaugeleMat'));
			// End:0x8E
			if(Shells == none)
			{
				Shells = Spawn(Class'BallisticProV55.Ammo_16GaugeleMat', Owner,,, rot(0, 0, 0));
				Shells.GiveTo(Pawn(Owner), Item);
			}
		}
		// End:0x102
		if(Shells != none)
		{
			// End:0x102
			if(Shells.AmmoAmount < Shells.MaxAmmo)
			{
				Shells.AddAmmo(5);
				// End:0x102
				if(AmmoAmount < MaxAmmo)
				{
					Item.AnnouncePickup(Pawn(Owner));
					Item.SetRespawn();
				}
			}
		}
		// End:0x113
		if(AmmoAmount >= MaxAmmo)
		{
			return true;
		}
		Item.AnnouncePickup(Pawn(Owner));
		AddAmmo(Ammo(Item).AmmoAmount);
		Item.SetRespawn();
		return true;		
	}
	else
	{
		return super(Ammunition).HandlePickupQuery(Item);
	}
	//return;	
}

defaultproperties
{
	MaxAmmo=108
	InitialAmount=54
	bTryHeadShot=true
	IconFlashMaterial=Shader'BW_Core_WeaponTex.leMat.AmmoIcon_Wilson41DBFlash'
	PickupClass=Class'BallisticProV55.AP_leMat'
	IconMaterial=Texture'BW_Core_WeaponTex.leMat.AmmoIcon_Wilson41DB'
	IconCoords=(X1=0,Y1=0,X2=63,Y2=63)
	ItemName=".41 Wilson DB Bullets"
}
