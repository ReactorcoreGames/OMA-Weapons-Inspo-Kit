class Ammo_CX85Darts extends BallisticAmmo;

var Ammo_556mm Bullets;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x159
	if(Item.IsA('AP_CX85Mag'))
	{
		// End:0x8E
		if(Bullets == none)
		{
			Bullets = Ammo_556mm(Pawn(Owner).FindInventoryType(Class'BallisticProV55.Ammo_556mm'));
			// End:0x8E
			if(Bullets == none)
			{
				Bullets = Spawn(Class'BallisticProV55.Ammo_556mm', Owner,,, rot(0, 0, 0));
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
		return super(Ammunition).HandlePickupQuery(Item);
	}
	//return;	
}

defaultproperties
{
	MaxAmmo=48
	InitialAmount=24
	IconFlashMaterial=Shader'BWBP_OP_Tex.CX85.CX85-AmmoIconFlash'
	PickupClass=Class'BWBP_OP_Pro.AP_CX85Mag'
	IconMaterial=Texture'BWBP_OP_Tex.CX85.CX85-AmmoIcon'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName="CX85 Tracking Darts"
}
