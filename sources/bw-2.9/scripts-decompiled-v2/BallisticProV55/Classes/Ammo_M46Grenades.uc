class Ammo_M46Grenades extends BallisticAmmo;

var M46AssaultRifle DaM46;
var Ammo_M46Clip Bullets;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x159
	if(Item.IsA('AP_M46Clip'))
	{
		// End:0x8E
		if(Bullets == none)
		{
			Bullets = Ammo_M46Clip(Pawn(Owner).FindInventoryType(Class'BallisticProV55.Ammo_M46Clip'));
			// End:0x8E
			if(Bullets == none)
			{
				Bullets = Spawn(Class'BallisticProV55.Ammo_M46Clip', Owner,,, rot(0, 0, 0));
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
	// Ref[0]erence: AmmoParams'BallisticProV55.Ammo_M46Grenades.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.5100000
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BallisticProV55.Ammo_M46Grenades.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.5100000
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BallisticProV55.Ammo_M46Grenades.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=RealismParams
	// Reference: AmmoParams'BallisticProV55.Ammo_M46Grenades.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=TacticalParams
	MaxAmmo=3
	InitialAmount=2
	IconFlashMaterial=Shader'BW_Core_WeaponTex.OA-AR.AmmoIcon_OAARFlash'
	PickupClass=Class'BallisticProV55.AP_M46Clip'
	IconMaterial=Texture'BW_Core_WeaponTex.OA-AR.AmmoIcon_OAAR'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName="M46 Proximity Grenades"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BallisticProV55.Ammo_M46Grenades.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.5100000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_M46Grenades.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.5100000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_M46Grenades.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_M46Grenades.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
