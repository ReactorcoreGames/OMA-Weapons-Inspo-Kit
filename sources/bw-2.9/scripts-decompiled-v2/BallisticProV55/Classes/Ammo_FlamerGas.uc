class Ammo_FlamerGas extends BallisticAmmo;

defaultproperties
{
	// Ref[0]erence: AmmoParams'BallisticProV55.Ammo_FlamerGas.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
		bResuppliesFromPack=false
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BallisticProV55.Ammo_FlamerGas.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BallisticProV55.Ammo_FlamerGas.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.0000000
	end object
	Params=RealismParams
	// Reference: AmmoParams'BallisticProV55.Ammo_FlamerGas.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.2500000
	end object
	Params=TacticalParams
	MaxAmmo=80
	InitialAmount=40
	IconFlashMaterial=Shader'BW_Core_WeaponTex.Icons.AmmoIcon_FlameTankFlash'
	PickupClass=Class'BallisticProV55.AP_FlamerGas'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.AmmoIcon_FlameTank'
	IconCoords=(X1=0,Y1=0,X2=63,Y2=63)
	ItemName="Flamer fuel"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BallisticProV55.Ammo_FlamerGas.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
	bResuppliesFromPack=false
end object
// Reference: AmmoParams'BallisticProV55.Ammo_FlamerGas.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_FlamerGas.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.0000000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_FlamerGas.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.2500000
end object
