class MDKWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.MDKWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=5
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2500000
		SightOffset=(X=10.0000000,Y=-0.0500000,Z=41.0000000)
		SightPivot=(Pitch=16,Yaw=0,Roll=0)
		ViewOffset=(X=15.0000000,Y=11.0000000,Z=-33.0000000)
		DisplaceDurationMult=0.7500000
		MagAmmo=35
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.MDKWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.MDKWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.MDKWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SWC_Pro.MDKWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4096.0000000,Max=4096.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=23
	HeadMult=2.7500000
	DamageType=Class'BWBP_SWC_Pro.DTMDKSMG'
	DamageTypeHead=Class'BWBP_SWC_Pro.DTMDKSMGHead'
	DamageTypeArm=Class'BWBP_SWC_Pro.DTMDKSMG'
	PenetrationEnergy=16.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SWC_Pro.MDKFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SWC_Sounds.MDK.MDK-Fire',Volume=1.0000000,Radius=384.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=84.0000000
	Chaos=0.0250000
	Inaccuracy=(X=72,Y=72)
end object
// Reference: FireParams'BWBP_SWC_Pro.MDKWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0720000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SWC_Pro.MDKWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SWC_Pro.MDKWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.1600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1300000
	EscapeMultiplier=1.2500000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.0000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SWC_Pro.MDKWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SWC_Pro.MDKWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=5
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2500000
	SightOffset=(X=10.0000000,Y=-0.0500000,Z=41.0000000)
	SightPivot=(Pitch=16,Yaw=0,Roll=0)
	ViewOffset=(X=15.0000000,Y=11.0000000,Z=-33.0000000)
	DisplaceDurationMult=0.7500000
	MagAmmo=35
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.MDKWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.MDKWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.MDKWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalSecondaryFireParams'
end object
