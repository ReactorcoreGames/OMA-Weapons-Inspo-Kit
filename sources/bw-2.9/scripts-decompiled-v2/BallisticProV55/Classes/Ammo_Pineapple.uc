class Ammo_Pineapple extends BallisticAmmo;

defaultproperties
{
	// Ref[0]erence: AmmoParams'BallisticProV55.Ammo_Pineapple.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BallisticProV55.Ammo_Pineapple.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BallisticProV55.Ammo_Pineapple.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=RealismParams
	// Reference: AmmoParams'BallisticProV55.Ammo_Pineapple.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=TacticalParams
	MaxAmmo=2
	InitialAmount=1
	IconFlashMaterial=Shader'BW_Core_WeaponTex.Icons.AmmoIconsFlashing'
	PickupClass=Class'BallisticProV55.NRP57Pickup'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.AmmoIconPage'
	IconCoords=(X1=0,Y1=64,X2=63,Y2=127)
	ItemName="NRP57 Pineapple Ammo"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BallisticProV55.Ammo_Pineapple.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_Pineapple.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_Pineapple.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_Pineapple.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
