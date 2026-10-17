class Ammo_XMK5Clip extends BallisticAmmo;

var Ammo_XMK5Darts Darts;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x159
	if(Item.IsA('AP_XMK5Clip'))
	{
		// End:0x8E
		if(Darts == none)
		{
			Darts = Ammo_XMK5Darts(Pawn(Owner).FindInventoryType(Class'BallisticProV55.Ammo_XMK5Darts'));
			// End:0x8E
			if(Darts == none)
			{
				Darts = Spawn(Class'BallisticProV55.Ammo_XMK5Darts', Owner,,, rot(0, 0, 0));
				Darts.GiveTo(Pawn(Owner), Item);
			}
		}
		// End:0x102
		if(Darts != none)
		{
			// End:0x102
			if(Darts.AmmoAmount < Darts.MaxAmmo)
			{
				Darts.AddAmmo(3);
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
	MaxAmmo=192
	InitialAmount=96
	IconFlashMaterial=Shader'BW_Core_WeaponTex.OA-SMG.AmmoIcon_OASMGFlash'
	PickupClass=Class'BallisticProV55.AP_XMK5Clip'
	IconMaterial=Texture'BW_Core_WeaponTex.OA-SMG.AmmoIcon_OASMG'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName="10mm XMk5 Rounds"
}
