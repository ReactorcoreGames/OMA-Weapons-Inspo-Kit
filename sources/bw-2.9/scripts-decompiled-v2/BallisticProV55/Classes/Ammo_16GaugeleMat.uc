class Ammo_16GaugeleMat extends BallisticAmmo;

var Ammo_leMat Bullets;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x159
	if(Item.IsA('AP_leMat'))
	{
		// End:0x8E
		if(Bullets == none)
		{
			Bullets = Ammo_leMat(Pawn(Owner).FindInventoryType(Class'BallisticProV55.Ammo_leMat'));
			// End:0x8E
			if(Bullets == none)
			{
				Bullets = Spawn(Class'BallisticProV55.Ammo_leMat', Owner,,, rot(0, 0, 0));
				Bullets.GiveTo(Pawn(Owner), Item);
			}
		}
		// End:0x113
		if(Bullets != none)
		{
			// End:0x113
			if(Bullets.AmmoAmount < Bullets.MaxAmmo)
			{
				Bullets.AddAmmo(Ammo(Item).AmmoAmount);
				// End:0x113
				if(AmmoAmount < MaxAmmo)
				{
					Item.AnnouncePickup(Pawn(Owner));
					Item.SetRespawn();
				}
			}
		}
		// End:0x124
		if(AmmoAmount >= MaxAmmo)
		{
			return true;
		}
		Item.AnnouncePickup(Pawn(Owner));
		AddAmmo(5);
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
	MaxAmmo=24
	InitialAmount=12
	IconFlashMaterial=Shader'BW_Core_WeaponTex.leMat.AmmoIcon_Wilson41DBFlash'
	PickupClass=Class'BallisticProV55.AP_leMat'
	IconMaterial=Texture'BW_Core_WeaponTex.leMat.AmmoIcon_Wilson41DB'
	IconCoords=(X1=0,Y1=0,X2=63,Y2=63)
	ItemName="16 Gauge Shells"
}
