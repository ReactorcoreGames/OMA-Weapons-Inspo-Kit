class Ammo_CX85Bullets extends BallisticAmmo;

var Ammo_CX85Darts Darts;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x159
	if(Item.IsA('AP_CX85Mag'))
	{
		// End:0x8E
		if(Darts == none)
		{
			Darts = Ammo_CX85Darts(Pawn(Owner).FindInventoryType(Class'BWBP_OP_Pro.Ammo_CX85Darts'));
			// End:0x8E
			if(Darts == none)
			{
				Darts = Spawn(Class'BWBP_OP_Pro.Ammo_CX85Darts', Owner,,, rot(0, 0, 0));
				Darts.GiveTo(Pawn(Owner), Item);
			}
		}
		// End:0x102
		if(Darts != none)
		{
			// End:0x102
			if(Darts.AmmoAmount < Darts.MaxAmmo)
			{
				Darts.AddAmmo(6);
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
	MaxAmmo=200
	InitialAmount=100
	IconFlashMaterial=Shader'BWBP_OP_Tex.CX85.CX85-AmmoIconFlash'
	PickupClass=Class'BWBP_OP_Pro.AP_CX85Mag'
	IconMaterial=Texture'BWBP_OP_Tex.CX85.CX85-AmmoIcon'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName="CX85 Ammo"
}
