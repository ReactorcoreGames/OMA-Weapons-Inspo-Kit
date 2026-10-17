class Ammo_Z250GasGrenades extends BallisticAmmo;

defaultproperties
{
	// Ref[0]erence: AmmoParams'BWBP_OP_Pro.Ammo_Z250GasGrenades.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.5100000
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BWBP_OP_Pro.Ammo_Z250GasGrenades.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.5100000
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BWBP_OP_Pro.Ammo_Z250GasGrenades.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=RealismParams
	// Reference: AmmoParams'BWBP_OP_Pro.Ammo_Z250GasGrenades.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=TacticalParams
	MaxAmmo=3
	InitialAmount=2
	IconFlashMaterial=Shader'BW_Core_WeaponTex.Icons.AmmoIconsFlashing'
	PickupClass=Class'BallisticProV55.AP_M900Grenades'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.AmmoIconPage'
	IconCoords=(X1=128,Y1=0,X2=191,Y2=63)
	ItemName="Z250 Gas Grenades"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_Z250GasGrenades.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.5100000
end object
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_Z250GasGrenades.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.5100000
end object
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_Z250GasGrenades.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_Z250GasGrenades.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
