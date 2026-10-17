class NTOVBandageWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeleeEffectParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Damage=0
end object
// Reference: FireParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.8500000
	AmmoPerFire=0
	FireAnim="UseOnSelf"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Damage=0
end object
// Reference: FireParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.8500000
	AmmoPerFire=0
	FireAnim="UseOnSelf"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	DeclineTime=1.5000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.NTOVBandageWeaponParamsClassic.ClassicSecondaryFireParams'
end object
