class Ammo_M46Clip extends BallisticAmmo;

var Ammo_M46Grenades Grenades;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x158
	if(Item.IsA('AP_M46Clip'))
	{
		// End:0x8E
		if(Grenades == none)
		{
			Grenades = Ammo_M46Grenades(Pawn(Owner).FindInventoryType(Class'BallisticProV55.Ammo_M46Grenades'));
			// End:0x8E
			if(Grenades == none)
			{
				Grenades = Spawn(Class'BallisticProV55.Ammo_M46Grenades', Owner,,, rot(0, 0, 0));
				Grenades.GiveTo(Pawn(Owner), Item);
			}
		}
		// End:0x101
		if(Grenades != none)
		{
			// End:0x101
			if(Grenades.AmmoAmount < Grenades.MaxAmmo)
			{
				Grenades.AddAmmo(1);
				// End:0x101
				if(AmmoAmount < MaxAmmo)
				{
					Item.AnnouncePickup(Pawn(Owner));
					Item.SetRespawn();
				}
			}
		}
		// End:0x112
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
	MaxAmmo=144
	InitialAmount=72
	IconFlashMaterial=Shader'BW_Core_WeaponTex.OA-AR.AmmoIcon_OAARFlash'
	PickupClass=Class'BallisticProV55.AP_M46Clip'
	IconMaterial=Texture'BW_Core_WeaponTex.OA-AR.AmmoIcon_OAAR'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName=".310 M46 Rounds"
}
