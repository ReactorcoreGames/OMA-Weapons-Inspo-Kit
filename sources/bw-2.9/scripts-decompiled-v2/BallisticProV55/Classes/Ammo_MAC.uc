class Ammo_MAC extends BallisticAmmo;

defaultproperties
{
	// Ref[0]erence: AmmoParams'BallisticProV55.Ammo_MAC.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
		bResuppliesFromPack=false
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BallisticProV55.Ammo_MAC.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BallisticProV55.Ammo_MAC.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=RealismParams
	// Reference: AmmoParams'BallisticProV55.Ammo_MAC.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
		bResuppliesFromPack=false
	end object
	Params=TacticalParams
	MaxAmmo=5
	InitialAmount=5
	IconFlashMaterial=Shader'BW_Core_WeaponTex.Artillery.AmmoIcon_ArtilleryShellsFlash'
	PickupClass=Class'BallisticProV55.AP_MACShells'
	IconMaterial=Texture'BW_Core_WeaponTex.Artillery.AmmoIcon_ArtilleryShells'
	IconCoords=(X1=128,Y1=64,X2=191,Y2=127)
	ItemName="HAMR Shells"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BallisticProV55.Ammo_MAC.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
	bResuppliesFromPack=false
end object
// Reference: AmmoParams'BallisticProV55.Ammo_MAC.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_MAC.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_MAC.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
	bResuppliesFromPack=false
end object
