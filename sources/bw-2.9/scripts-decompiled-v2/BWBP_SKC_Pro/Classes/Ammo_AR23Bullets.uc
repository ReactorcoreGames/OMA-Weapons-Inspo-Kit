class Ammo_AR23Bullets extends BallisticAmmo;

var Ammo_AR23Grenades Grenades;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x158
	if(Item.IsA('AP_AR23Clip'))
	{
		// End:0x8E
		if(Grenades == none)
		{
			Grenades = Ammo_AR23Grenades(Pawn(Owner).FindInventoryType(Class'BWBP_SKC_Pro.Ammo_AR23Grenades'));
			// End:0x8E
			if(Grenades == none)
			{
				Grenades = Spawn(Class'BWBP_SKC_Pro.Ammo_AR23Grenades', Owner,,, rot(0, 0, 0));
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
	MaxAmmo=90
	InitialAmount=36
	IconFlashMaterial=Shader'BWBP_SKC_Tex.LK05.AmmoIcon_LK05Flash'
	PickupClass=Class'BWBP_SKC_Pro.AP_AR23Clip'
	IconMaterial=Texture'BWBP_SKC_Tex.LK05.AmmoIcon_LK05'
	IconCoords=(X1=64,Y1=0,X2=127,Y2=63)
	ItemName=".50 Bullets"
}
