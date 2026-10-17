class Ammo_545mmSTANAG extends BallisticAmmo;

var Ammo_BRINKGrenades Grenades;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x159
	if(Item.IsA('AP_STANAGShockwave'))
	{
		// End:0x8E
		if(Grenades == none)
		{
			Grenades = Ammo_BRINKGrenades(Pawn(Owner).FindInventoryType(Class'BWBP_SWC_Pro.Ammo_BRINKGrenades'));
			// End:0x8E
			if(Grenades == none)
			{
				Grenades = Spawn(Class'BWBP_SWC_Pro.Ammo_BRINKGrenades', Owner,,, rot(0, 0, 0));
				Grenades.GiveTo(Pawn(Owner), Item);
			}
		}
		// End:0x102
		if(Grenades != none)
		{
			// End:0x102
			if(Grenades.AmmoAmount < Grenades.MaxAmmo)
			{
				Grenades.AddAmmo(2);
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
	InitialAmount=90
	IconFlashMaterial=Shader'BWBP_SKC_Tex.M4A1.AmmoIcon_556Flash'
	PickupClass=Class'BWBP_SWC_Pro.AP_STANAGShockwave'
	IconMaterial=Texture'BWBP_SKC_Tex.M4A1.AmmoIcon_556'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName="5.45mm STN Ammo"
}
