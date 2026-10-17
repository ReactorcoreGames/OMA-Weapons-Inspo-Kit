class ApodCapsuleWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeleeEffectParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Damage=0
end object
// Reference: FireParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.5500000
	AmmoPerFire=0
	FireAnim="UseOnSelf"
	FireAnimRate=1.5000000
	FireEffectParams[0]=MeleeEffectParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Damage=0
end object
// Reference: FireParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.5500000
	AmmoPerFire=0
	FireAnim="UseOnSelf"
	FireAnimRate=1.5000000
	FireEffectParams[0]=MeleeEffectParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	DeclineTime=1.5000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.ApodCapsuleWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
