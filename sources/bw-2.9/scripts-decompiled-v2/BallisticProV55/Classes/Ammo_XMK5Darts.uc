class Ammo_XMK5Darts extends BallisticAmmo;

var XMK5SubMachinegun DaXMK5;
var Ammo_XMK5Clip Bullets;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x159
	if(Item.IsA('AP_XMK5Clip'))
	{
		// End:0x8E
		if(Bullets == none)
		{
			Bullets = Ammo_XMK5Clip(Pawn(Owner).FindInventoryType(Class'BallisticProV55.Ammo_XMK5Clip'));
			// End:0x8E
			if(Bullets == none)
			{
				Bullets = Spawn(Class'BallisticProV55.Ammo_XMK5Clip', Owner,,, rot(0, 0, 0));
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
		AddAmmo(2);
		Item.SetRespawn();
		return true;		
	}
	else
	{
		// End:0x183
		if(super(Ammunition).HandlePickupQuery(Item))
		{
			// End:0x181
			if(DaXMK5 != none)
			{
				DaXMK5.DartPickedUp();
			}
			return true;
		}
	}
	return false;
	//return;	
}

defaultproperties
{
	MaxAmmo=18
	InitialAmount=3
	IconFlashMaterial=Shader'BW_Core_WeaponTex.OA-SMG.AmmoIcon_OASMGFlash'
	PickupClass=Class'BallisticProV55.AP_XMK5Clip'
	IconMaterial=Texture'BW_Core_WeaponTex.OA-SMG.AmmoIcon_OASMG'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName="XMk5 Stun Darts"
}
