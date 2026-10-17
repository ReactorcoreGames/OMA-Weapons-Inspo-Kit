class Ammo_BOGPGrenades extends BallisticAmmo;

defaultproperties
{
	// Ref[0]erence: AmmoParams'BallisticProV55.Ammo_BOGPGrenades.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.4000000
	end object
	Params=ArenaParams
	// Reference: AmmoParams'BallisticProV55.Ammo_BOGPGrenades.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.4000000
	end object
	Params=ClassicParams
	// Reference: AmmoParams'BallisticProV55.Ammo_BOGPGrenades.RealismParams'
	begin object name="RealismParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.2000000
	end object
	Params=RealismParams
	// Reference: AmmoParams'BallisticProV55.Ammo_BOGPGrenades.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.AmmoParams
		KillInitialAmmoMult=0.2000000
	end object
	Params=TacticalParams
	MaxAmmo=20
	InitialAmount=10
	IconFlashMaterial=Shader'BW_Core_WeaponTex.BOGP.AmmoIcon_BOGPFlash'
	PickupClass=Class'BallisticProV55.AP_BOGPGrenades'
	IconMaterial=Texture'BW_Core_WeaponTex.BOGP.AmmoIcon_BOGP'
	IconCoords=(X1=0,Y1=0,X2=64,Y2=64)
	ItemName="BORT-85 Grenades"
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AmmoParams'BallisticProV55.Ammo_BOGPGrenades.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.4000000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_BOGPGrenades.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.4000000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_BOGPGrenades.RealismParams'
begin object name="RealismParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.2000000
end object
// Reference: AmmoParams'BallisticProV55.Ammo_BOGPGrenades.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.AmmoParams
	KillInitialAmmoMult=0.2000000
end object
