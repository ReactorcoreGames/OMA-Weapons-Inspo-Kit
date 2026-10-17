class Ammo_MGL extends BallisticAmmo;

defaultproperties
{
	// Ref[0]erence: AmmoParams'BWBP_SKC_Pro.Ammo_MGL.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
		bResuppliesFromPack=false
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_MGL.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_MGL.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=RealismParams
	// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_MGL.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
		bResuppliesFromPack=false
	end object
	Params=TacticalParams
	MaxAmmo=12
	InitialAmount=6
	IconFlashMaterial=Shader'BW_Core_WeaponTex.BOGP.AmmoIcon_BOGPFlash'
	PickupClass=Class'BallisticProV55.AP_BOGPGrenades'
	IconMaterial=Texture'BW_Core_WeaponTex.BOGP.AmmoIcon_BOGP'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName="Conqueror Grenades"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_MGL.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
	bResuppliesFromPack=false
end object
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_MGL.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_MGL.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_MGL.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
	bResuppliesFromPack=false
end object
