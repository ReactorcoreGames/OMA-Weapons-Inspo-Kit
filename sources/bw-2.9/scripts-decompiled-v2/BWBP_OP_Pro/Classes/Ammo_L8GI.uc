class Ammo_L8GI extends BallisticAmmo;

defaultproperties
{
	// Ref[0]erence: AmmoParams'BWBP_OP_Pro.Ammo_L8GI.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
		bResuppliesFromPack=false
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BWBP_OP_Pro.Ammo_L8GI.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
		bResuppliesFromPack=false
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BWBP_OP_Pro.Ammo_L8GI.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
		bResuppliesFromPack=false
	end object
	Params=RealismParams
	// Reference: AmmoParams'BWBP_OP_Pro.Ammo_L8GI.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
		bResuppliesFromPack=false
	end object
	Params=TacticalParams
	MaxAmmo=1
	InitialAmount=1
	IconFlashMaterial=Shader'BWBP_OP_Tex.AmmoPack.AmmoIcon_AmmoPackFlash'
	PickupClass=Class'BWBP_OP_Pro.L8GIPickup'
	IconMaterial=Texture'BWBP_OP_Tex.AmmoPack.AmmoIcon_AmmoPack'
	IconCoords=(X1=0,Y1=64,X2=63,Y2=127)
	ItemName="L8 GI Ammo Pack"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_L8GI.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
	bResuppliesFromPack=false
end object
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_L8GI.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
	bResuppliesFromPack=false
end object
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_L8GI.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
	bResuppliesFromPack=false
end object
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_L8GI.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
	bResuppliesFromPack=false
end object
