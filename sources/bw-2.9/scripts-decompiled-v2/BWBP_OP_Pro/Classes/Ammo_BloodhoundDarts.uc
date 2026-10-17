class Ammo_BloodhoundDarts extends BallisticAmmo;

var Ammo_BloodhoundTazer Tazers;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x159
	if(Item.IsA('AP_leMat'))
	{
		// End:0x8E
		if(Tazers == none)
		{
			Tazers = Ammo_BloodhoundTazer(Pawn(Owner).FindInventoryType(Class'BWBP_OP_Pro.Ammo_BloodhoundTazer'));
			// End:0x8E
			if(Tazers == none)
			{
				Tazers = Spawn(Class'BWBP_OP_Pro.Ammo_BloodhoundTazer', Owner,,, rot(0, 0, 0));
				Tazers.GiveTo(Pawn(Owner), Item);
			}
		}
		// End:0x102
		if(Tazers != none)
		{
			// End:0x102
			if(Tazers.AmmoAmount < Tazers.MaxAmmo)
			{
				Tazers.AddAmmo(5);
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
	MaxAmmo=90
	InitialAmount=45
	IconFlashMaterial=Shader'BWBP_OP_Tex.Bloodhound.AmmoIcon_BloodhoundFlash'
	PickupClass=Class'BWBP_OP_Pro.AP_BloodhoundDrum'
	IconMaterial=Texture'BWBP_OP_Tex.Bloodhound.AmmoIcon_Bloodhound'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName="Bloodhound Darts"
}
