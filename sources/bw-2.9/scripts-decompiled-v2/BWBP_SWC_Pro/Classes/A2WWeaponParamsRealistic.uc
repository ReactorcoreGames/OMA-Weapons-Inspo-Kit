class A2WWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.A2WWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		InventorySize=5
		SightingTime=0.4000000
		SightOffset=(X=-24.0000000,Y=-0.5000000,Z=18.0000000)
		SightPivot=(Pitch=512,Yaw=0,Roll=0)
		ViewOffset=(X=10.0000000,Y=7.0000000,Z=-11.0000000)
		DisplaceDurationMult=0.5000000
		MagAmmo=36
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A2WWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.A2WWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.A2WWeaponParamsRealistic.RealisticPrimaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SWC_Pro.A2WWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=8000.0000000)
	Damage=50
	DamageType=Class'BallisticProV55.DTA42SkrithBeam'
	DamageTypeHead=Class'BallisticProV55.DTA42SkrithBeam'
	DamageTypeArm=Class'BallisticProV55.DTA42SkrithBeam'
	PenetrationEnergy=8.0000000
	PenetrateForce=150
	MomentumTransfer=80000
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	FlashScaleFactor=0.1000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-SecFire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SWC_Pro.A2WWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SWC_Pro.A2WWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SWC_Pro.A2WWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0500000),(InVal=0.4000000,OutVal=0.0800000),(InVal=0.6000000,OutVal=0.0200000),(InVal=0.7000000,OutVal=0.1000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.4000000,OutVal=0.3500000),(InVal=0.5500000,OutVal=0.5500000),(InVal=0.7000000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	DeclineTime=0.5000000
	DeclineDelay=0.2000000
	ViewBindFactor=0.5000000
	HipMultiplier=1.5000000
end object
// Reference: AimParams'BWBP_SWC_Pro.A2WWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=128)
	ADSMultiplier=2.0000000
	ChaosDeclineTime=0.4500000
end object
// Reference: WeaponParams'BWBP_SWC_Pro.A2WWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	InventorySize=5
	SightingTime=0.4000000
	SightOffset=(X=-24.0000000,Y=-0.5000000,Z=18.0000000)
	SightPivot=(Pitch=512,Yaw=0,Roll=0)
	ViewOffset=(X=10.0000000,Y=7.0000000,Z=-11.0000000)
	DisplaceDurationMult=0.5000000
	MagAmmo=36
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A2WWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.A2WWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.A2WWeaponParamsRealistic.RealisticPrimaryFireParams'
end object
