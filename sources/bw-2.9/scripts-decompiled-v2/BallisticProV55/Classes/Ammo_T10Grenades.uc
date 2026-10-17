class Ammo_T10Grenades extends BallisticAmmo;

defaultproperties
{
	// Ref[0]erence: AmmoParams'BallisticProV55.Ammo_T10Grenades.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BallisticProV55.Ammo_T10Grenades.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BallisticProV55.Ammo_T10Grenades.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=RealismParams
	// Reference: AmmoParams'BallisticProV55.Ammo_T10Grenades.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=TacticalParams
	MaxAmmo=2
	InitialAmount=1
	IconFlashMaterial=Shader'BW_Core_WeaponTex.Icons.AmmoIconPageV2Flash'
	PickupClass=Class'BallisticProV55.T10Pickup'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.AmmoIconPageV2'
	IconCoords=(X1=64,Y1=0,X2=127,Y2=63)
	ItemName="T10 Grenade Ammo"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BallisticProV55.Ammo_T10Grenades.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_T10Grenades.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_T10Grenades.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_T10Grenades.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
