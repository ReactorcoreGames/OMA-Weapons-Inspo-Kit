class Ammo_HB4Blaster extends BallisticAmmo;

defaultproperties
{
	// Ref[0]erence: AmmoParams'BWBP_APC_Pro.Ammo_HB4Blaster.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
		bResuppliesFromPack=false
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BWBP_APC_Pro.Ammo_HB4Blaster.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BWBP_APC_Pro.Ammo_HB4Blaster.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=RealismParams
	// Reference: AmmoParams'BWBP_APC_Pro.Ammo_HB4Blaster.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
		bResuppliesFromPack=false
	end object
	Params=TacticalParams
	MaxAmmo=15
	InitialAmount=9
	IconFlashMaterial=Shader'BWBP_APC_Tex.HoloBlaster.AmmoIcon_HoloBlasterFlash'
	PickupClass=Class'BWBP_APC_Pro.AP_HB4Batteries'
	IconMaterial=Texture'BWBP_APC_Tex.HoloBlaster.AmmoIcon_HoloBlaster'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName="HB4 Battery Packs"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BWBP_APC_Pro.Ammo_HB4Blaster.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
	bResuppliesFromPack=false
end object
// Reference: AmmoParams'BWBP_APC_Pro.Ammo_HB4Blaster.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BWBP_APC_Pro.Ammo_HB4Blaster.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BWBP_APC_Pro.Ammo_HB4Blaster.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
	bResuppliesFromPack=false
end object
