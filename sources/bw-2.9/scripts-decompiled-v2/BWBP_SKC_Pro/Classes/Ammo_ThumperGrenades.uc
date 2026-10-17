class Ammo_ThumperGrenades extends BallisticAmmo;

defaultproperties
{
	// Ref[0]erence: AmmoParams'BWBP_SKC_Pro.Ammo_ThumperGrenades.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_ThumperGrenades.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_ThumperGrenades.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=RealismParams
	// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_ThumperGrenades.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=TacticalParams
	MaxAmmo=45
	InitialAmount=15
	IconFlashMaterial=Shader'BW_Core_WeaponTex.BOGP.AmmoIcon_BOGPFlash'
	PickupClass=Class'BWBP_SKC_Pro.AP_ThumperGrenades'
	IconMaterial=Texture'BW_Core_WeaponTex.BOGP.AmmoIcon_BOGP'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName="35mm Caseless Grenades"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_ThumperGrenades.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_ThumperGrenades.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_ThumperGrenades.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_ThumperGrenades.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
