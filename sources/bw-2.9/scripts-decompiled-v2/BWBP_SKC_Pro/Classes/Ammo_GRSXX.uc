class Ammo_GRSXX extends BallisticAmmo;

defaultproperties
{
	// Ref[0]erence: AmmoParams'BWBP_SKC_Pro.Ammo_GRSXX.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_GRSXX.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_GRSXX.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=RealismParams
	// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_GRSXX.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=TacticalParams
	InitialAmount=90
	IconFlashMaterial=Shader'BW_Core_WeaponTex.Glock.AmmoIcon_GlockClipsFlash'
	PickupClass=Class'BWBP_SKC_Pro.AP_GRSXXClip'
	IconMaterial=Texture'BW_Core_WeaponTex.Glock.AmmoIcon_GlockClips'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName="9mm JHP Bullets"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_GRSXX.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_GRSXX.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_GRSXX.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BWBP_SKC_Pro.Ammo_GRSXX.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
