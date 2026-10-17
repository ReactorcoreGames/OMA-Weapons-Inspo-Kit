class Ammo_TranqP extends BallisticAmmo;

var Ammo_MedDarts MedDarts;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x158
	if(Item.IsA('AP_TranqP'))
	{
		// End:0x8E
		if(MedDarts == none)
		{
			MedDarts = Ammo_MedDarts(Pawn(Owner).FindInventoryType(Class'BWBP_SKC_Pro.Ammo_MedDarts'));
			// End:0x8E
			if(MedDarts == none)
			{
				MedDarts = Spawn(Class'BWBP_SKC_Pro.Ammo_MedDarts', Owner,,, rot(0, 0, 0));
				MedDarts.GiveTo(Pawn(Owner), Item);
			}
		}
		// End:0x101
		if(MedDarts != none)
		{
			// End:0x101
			if(MedDarts.AmmoAmount < MedDarts.MaxAmmo)
			{
				MedDarts.AddAmmo(1);
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
	MaxAmmo=100
	InitialAmount=50
	bTryHeadShot=true
	IconFlashMaterial=Shader'BW_Core_WeaponTex.Icons.AmmoIconsFlashing'
	PickupClass=Class'BWBP_SKC_Pro.AP_TranqP'
	IconMaterial=Texture'BWBP_SKC_Tex.M30A2.AmmoIcon_M30A2'
	IconCoords=(X1=128,Y1=0,X2=191,Y2=63)
	ItemName="Toxic Darts"
}
