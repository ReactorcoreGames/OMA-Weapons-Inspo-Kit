class XMV500TW_WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.XMV500TW_WeaponParamsClassic.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.8000000
		PlayerJumpFactor=0.8000000
		InventorySize=12
		SightingTime=0.8000000
		DisplaceDurationMult=1.2500000
		MagAmmo=400
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.XMV500TW_WeaponParamsClassic.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.XMV500TW_WeaponParamsClassic.ArenaAimParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_APC_Pro.XMV500TW_WeaponParamsClassic.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2000000,OutVal=-0.0500000),(InVal=0.3000000,OutVal=-0.0700000),(InVal=0.4000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.1000000),(InVal=0.6000000,OutVal=0.1800000),(InVal=0.7000000,OutVal=0.0500000),(InVal=0.8000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1700000),(InVal=0.3500000,OutVal=0.4000000),(InVal=0.5000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0160000
	YRandFactor=0.0160000
	DeclineTime=1.1000000
end object
// Reference: AimParams'BWBP_APC_Pro.XMV500TW_WeaponParamsClassic.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	AimAdjustTime=1.0000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ViewBindFactor=1.0000000
	AimDamageThreshold=2000
	ChaosSpeedThreshold=350
end object
// Reference: WeaponParams'BWBP_APC_Pro.XMV500TW_WeaponParamsClassic.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.8000000
	PlayerJumpFactor=0.8000000
	InventorySize=12
	SightingTime=0.8000000
	DisplaceDurationMult=1.2500000
	MagAmmo=400
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.XMV500TW_WeaponParamsClassic.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.XMV500TW_WeaponParamsClassic.ArenaAimParams'
end object
