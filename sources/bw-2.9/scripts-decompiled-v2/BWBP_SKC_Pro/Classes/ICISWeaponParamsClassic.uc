class ICISWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.ICISWeaponParamsClassic.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.ICISWeaponParamsClassic.UniversalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.ICISWeaponParamsClassic.UniversalAimParams'
	end object
	Layouts[0]=UniversalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_SKC_Pro.ICISWeaponParamsClassic.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BWBP_SKC_Pro.ICISWeaponParamsClassic.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.ICISWeaponParamsClassic.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.ICISWeaponParamsClassic.UniversalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.ICISWeaponParamsClassic.UniversalAimParams'
end object
