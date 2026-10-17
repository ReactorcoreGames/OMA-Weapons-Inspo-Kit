class Ammo_MX32Rockets extends BallisticAmmo;

var MX32Weapon Gun;

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x2A
	if(super(Ammunition).HandlePickupQuery(Item))
	{
		// End:0x28
		if(Gun != none)
		{
			Gun.RocketsPickedUp();
		}
		return true;
	}
	return false;
	//return;	
}

defaultproperties
{
	// Ref[0]erence: AmmoParams'BWBP_OP_Pro.Ammo_MX32Rockets.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BWBP_OP_Pro.Ammo_MX32Rockets.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BWBP_OP_Pro.Ammo_MX32Rockets.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=RealismParams
	// Reference: AmmoParams'BWBP_OP_Pro.Ammo_MX32Rockets.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=TacticalParams
	MaxAmmo=32
	InitialAmount=16
	IconFlashMaterial=Shader'BW_Core_WeaponTex.Icons.AmmoIconsFlashing'
	PickupClass=Class'BWBP_OP_Pro.AP_MX32Rockets'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.AmmoIconPage'
	IconCoords=(X1=128,Y1=0,X2=191,Y2=63)
	ItemName="MX-32 Rockets"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_MX32Rockets.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
end object
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_MX32Rockets.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
end object
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_MX32Rockets.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_MX32Rockets.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
