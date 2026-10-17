class MDKWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.MDKWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		InventorySize=5
		CockAnimRate=1.2500000
		SightingTime=0.2500000
		SightOffset=(X=-10.0000000,Y=-0.0500000,Z=41.0000000)
		SightPivot=(Pitch=16,Yaw=0,Roll=0)
		ViewOffset=(X=15.0000000,Y=12.0000000,Z=-30.0000000)
		DisplaceDurationMult=0.7500000
		MagAmmo=35
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.MDKWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.MDKWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.MDKWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SWC_Pro.MDKWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1200.0000000,Max=4800.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.1000000
	Damage=30
	HeadMult=2.6000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SWC_Pro.DTMDKSMG'
	DamageTypeHead=Class'BWBP_SWC_Pro.DTMDKSMGHead'
	DamageTypeArm=Class'BWBP_SWC_Pro.DTMDKSMG'
	PenetrationEnergy=11.0000000
	PenetrateForce=15
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SWC_Pro.MDKFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SWC_Sounds.MDK.MDK-Fire',Volume=1.0000000,Radius=384.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=440.0000000
	Chaos=0.0250000
	Inaccuracy=(X=10,Y=10)
end object
// Reference: FireParams'BWBP_SWC_Pro.MDKWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SWC_Pro.MDKWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SWC_Pro.MDKWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.1600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1500000
	YRandFactor=0.1500000
	DeclineTime=0.5000000
	DeclineDelay=0.1500000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.1500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SWC_Pro.MDKWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=596,Max=1380)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3536,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.3000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.6000000
	ChaosSpeedThreshold=600
	ChaosTurnThreshold=140000
end object
// Reference: WeaponParams'BWBP_SWC_Pro.MDKWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	InventorySize=5
	CockAnimRate=1.2500000
	SightingTime=0.2500000
	SightOffset=(X=-10.0000000,Y=-0.0500000,Z=41.0000000)
	SightPivot=(Pitch=16,Yaw=0,Roll=0)
	ViewOffset=(X=15.0000000,Y=12.0000000,Z=-30.0000000)
	DisplaceDurationMult=0.7500000
	MagAmmo=35
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.MDKWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.MDKWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.MDKWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
