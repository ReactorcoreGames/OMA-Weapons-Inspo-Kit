class Ammo_BRINKGrenades extends BallisticAmmo;

var BRINKAssaultRifle DaF2K;
var Ammo_545mmSTANAG Bullets;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x159
	if(Item.IsA('AP_BRINKClip'))
	{
		// End:0x8E
		if(Bullets == none)
		{
			Bullets = Ammo_545mmSTANAG(Pawn(Owner).FindInventoryType(Class'BWBP_SWC_Pro.Ammo_545mmSTANAG'));
			// End:0x8E
			if(Bullets == none)
			{
				Bullets = Spawn(Class'BWBP_SWC_Pro.Ammo_545mmSTANAG', Owner,,, rot(0, 0, 0));
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
			if(DaF2K != none)
			{
				DaF2K.GrenadePickedUp();
			}
			return true;
		}
	}
	return false;
	//return;	
}

defaultproperties
{
	MaxAmmo=3
	InitialAmount=2
	IconFlashMaterial=Shader'BW_Core_WeaponTex.OA-AR.AmmoIcon_OAARFlash'
	PickupClass=Class'BWBP_SWC_Pro.AP_STANAGShockwave'
	IconMaterial=Texture'BW_Core_WeaponTex.OA-AR.AmmoIcon_OAAR'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName="BRINK Grenades"
}
