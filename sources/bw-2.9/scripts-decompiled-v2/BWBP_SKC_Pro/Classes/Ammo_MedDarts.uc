class Ammo_MedDarts extends BallisticAmmo;

var Ammo_TranqP Darts;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x159
	if(Item.IsA('AP_TranqP'))
	{
		// End:0x8E
		if(Darts == none)
		{
			Darts = Ammo_TranqP(Pawn(Owner).FindInventoryType(Class'BWBP_SKC_Pro.Ammo_TranqP'));
			// End:0x8E
			if(Darts == none)
			{
				Darts = Spawn(Class'BWBP_SKC_Pro.Ammo_TranqP', Owner,,, rot(0, 0, 0));
				Darts.GiveTo(Pawn(Owner), Item);
			}
		}
		// End:0x113
		if(Darts != none)
		{
			// End:0x113
			if(Darts.AmmoAmount < Darts.MaxAmmo)
			{
				Darts.AddAmmo(Ammo(Item).AmmoAmount);
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
		// End:0x169
		if(super(Ammunition).HandlePickupQuery(Item))
		{
			return true;
		}
	}
	return false;
	//return;	
}

defaultproperties
{
	MaxAmmo=10
	InitialAmount=1
	IconFlashMaterial=Shader'BW_Core_WeaponTex.OA-SMG.AmmoIcon_OASMGFlash'
	PickupClass=Class'BallisticProV55.AP_XMK5Clip'
	IconMaterial=Texture'BW_Core_WeaponTex.OA-SMG.AmmoIcon_OASMG'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName="PS-9m Med Darts"
}
