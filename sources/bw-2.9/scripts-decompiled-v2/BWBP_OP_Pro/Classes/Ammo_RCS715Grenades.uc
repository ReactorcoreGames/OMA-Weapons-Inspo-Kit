class Ammo_RCS715Grenades extends BallisticAmmo;

defaultproperties
{
	// Ref[0]erence: AmmoParams'BWBP_OP_Pro.Ammo_RCS715Grenades.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BWBP_OP_Pro.Ammo_RCS715Grenades.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BWBP_OP_Pro.Ammo_RCS715Grenades.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=RealismParams
	// Reference: AmmoParams'BWBP_OP_Pro.Ammo_RCS715Grenades.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=TacticalParams
	MaxAmmo=12
	InitialAmount=6
	IconFlashMaterial=Shader'BW_Core_WeaponTex.Icons.AmmoIconsFlashing'
	PickupClass=Class'BWBP_OP_Pro.AP_RCS715Grenades'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.AmmoIconPage'
	IconCoords=(X1=128,Y1=0,X2=191,Y2=63)
	ItemName="RCS Grenades"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_RCS715Grenades.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
end object
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_RCS715Grenades.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
end object
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_RCS715Grenades.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_RCS715Grenades.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
