class Ammo_AR23Grenades extends BallisticAmmo;

var AR23HeavyRifle DaM46;
var Ammo_AR23Bullets Bullets;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x159
	if(Item.IsA('AP_AR23Clip'))
	{
		// End:0x8E
		if(Bullets == none)
		{
			Bullets = Ammo_AR23Bullets(Pawn(Owner).FindInventoryType(Class'BWBP_SKC_Pro.Ammo_AR23Bullets'));
			// End:0x8E
			if(Bullets == none)
			{
				Bullets = Spawn(Class'BWBP_SKC_Pro.Ammo_AR23Bullets', Owner,,, rot(0, 0, 0));
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
			if(DaM46 != none)
			{
				DaM46.GrenadePickedUp();
			}
			return true;
		}
	}
	return false;
	//return;	
}

defaultproperties
{
	// Ref[0]erence: AmmoParams'BWBP_SKC_Pro.Ammo_AR23Grenades.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.5100000
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_AR23Grenades.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.5100000
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_AR23Grenades.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=RealismParams
	// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_AR23Grenades.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=TacticalParams
	MaxAmmo=4
	InitialAmount=2
	IconFlashMaterial=Shader'BWBP_SKC_Tex.LK05.AmmoIcon_LK05Flash'
	PickupClass=Class'BWBP_SKC_Pro.AP_AR23Clip'
	IconMaterial=Texture'BWBP_SKC_Tex.LK05.AmmoIcon_LK05'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName="AR23 Shotgun Grenades"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_AR23Grenades.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.5100000
end object
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_AR23Grenades.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.5100000
end object
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_AR23Grenades.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_AR23Grenades.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
