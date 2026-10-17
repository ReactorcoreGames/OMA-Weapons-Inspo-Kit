class Ammo_G28Grenades extends BallisticAmmo;

defaultproperties
{
	// Ref[0]erence: AmmoParams'BWBP_SKC_Pro.Ammo_G28Grenades.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_G28Grenades.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_G28Grenades.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=RealismParams
	// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_G28Grenades.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=TacticalParams
	MaxAmmo=3
	InitialAmount=1
	IconFlashMaterial=Shader'BWBP_SKC_Tex.G28.AmmoIcon_MedFlash'
	PickupClass=Class'BWBP_SKC_Pro.G28Pickup'
	IconMaterial=Texture'BWBP_SKC_Tex.G28.AmmoIcon_Med'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName="G28 Medicinal Aerosol Ammo"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_G28Grenades.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_G28Grenades.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_G28Grenades.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_G28Grenades.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
