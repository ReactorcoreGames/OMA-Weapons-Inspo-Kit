class NTOVBandageWeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeleeEffectParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Damage=0
end object
// Reference: FireParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.8500000
	AmmoPerFire=0
	FireAnim="UseOnSelf"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Damage=0
end object
// Reference: FireParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.8500000
	AmmoPerFire=0
	FireAnim="UseOnSelf"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	DeclineTime=1.5000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsArena.ArenaSecondaryFireParams'
end object
