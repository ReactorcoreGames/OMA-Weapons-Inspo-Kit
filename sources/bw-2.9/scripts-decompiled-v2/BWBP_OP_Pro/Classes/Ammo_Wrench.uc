class Ammo_Wrench extends BallisticAmmo;

defaultproperties
{
	// Ref[0]erence: AmmoParams'BWBP_OP_Pro.Ammo_Wrench.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
		bResuppliesFromPack=false
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BWBP_OP_Pro.Ammo_Wrench.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
		bResuppliesFromPack=false
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BWBP_OP_Pro.Ammo_Wrench.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
		bResuppliesFromPack=false
	end object
	Params=RealismParams
	// Reference: AmmoParams'BWBP_OP_Pro.Ammo_Wrench.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
		bResuppliesFromPack=false
	end object
	Params=TacticalParams
	MaxAmmo=100
	InitialAmount=50
	ItemName="Wrench Energy"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_Wrench.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
	bResuppliesFromPack=false
end object
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_Wrench.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
	bResuppliesFromPack=false
end object
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_Wrench.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
	bResuppliesFromPack=false
end object
// Reference: AmmoParams'BWBP_OP_Pro.Ammo_Wrench.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
	bResuppliesFromPack=false
end object
