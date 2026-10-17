class Ammo_BloodhoundTazer extends BallisticAmmo;

var Ammo_BloodhoundDarts Bullets;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x159
	if(Item.IsA('AP_leMat'))
	{
		// End:0x8E
		if(Bullets == none)
		{
			Bullets = Ammo_BloodhoundDarts(Pawn(Owner).FindInventoryType(Class'BWBP_OP_Pro.Ammo_BloodhoundDarts'));
			// End:0x8E
			if(Bullets == none)
			{
				Bullets = Spawn(Class'BWBP_OP_Pro.Ammo_BloodhoundDarts', Owner,,, rot(0, 0, 0));
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
	MaxAmmo=10
	InitialAmount=3
	IconFlashMaterial=Shader'BWBP_OP_Tex.Bloodhound.AmmoIcon_BloodhoundFlash'
	PickupClass=Class'BWBP_OP_Pro.AP_BloodhoundDrum'
	IconMaterial=Texture'BWBP_OP_Tex.Bloodhound.AmmoIcon_Bloodhound'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName="Bloodhound Tazers"
}
