class ProtonWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.ProtonWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		InventorySize=4
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2000000
		MagAmmo=100
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.ProtonWeaponParamsRealistic.RealisticAimParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_OP_Pro.ProtonWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	ADSMultiplier=0.0000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_OP_Pro.ProtonWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	InventorySize=4
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2000000
	MagAmmo=100
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.ProtonWeaponParamsRealistic.RealisticAimParams'
end object
