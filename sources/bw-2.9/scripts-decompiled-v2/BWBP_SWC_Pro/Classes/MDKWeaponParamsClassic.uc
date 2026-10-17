class MDKWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.MDKWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		InventorySize=5
		CockAnimRate=1.2500000
		SightingTime=0.2500000
		SightOffset=(X=-10.0000000,Y=-0.0500000,Z=41.0000000)
		SightPivot=(Pitch=16,Yaw=0,Roll=0)
		ViewOffset=(X=12.0000000,Y=15.0000000,Z=-34.0000000)
		DisplaceDurationMult=0.7500000
		MagAmmo=26
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.MDKWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.MDKWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.MDKWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SWC_Pro.MDKWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=2500.0000000
	RangeAtten=0.5000000
	Damage=15
	HeadMult=4.0000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SWC_Pro.DTMDKSMG'
	DamageTypeHead=Class'BWBP_SWC_Pro.DTMDKSMGHead'
	DamageTypeArm=Class'BWBP_SWC_Pro.DTMDKSMG'
	PenetrationEnergy=24.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SWC_Pro.MDKFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SWC_Sounds.MDK.MDK-Fire',Volume=1.0000000,Radius=384.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=72.0000000
	Chaos=0.0250000
end object
// Reference: FireParams'BWBP_SWC_Pro.MDKWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SWC_Pro.MDKWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SWC_Pro.MDKWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.1600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	DeclineTime=0.5000000
	DeclineDelay=0.1500000
	ViewBindFactor=0.4500000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SWC_Pro.MDKWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=512)
	AimAdjustTime=0.4000000
	ADSMultiplier=0.4000000
	SprintOffset=(Pitch=-3000,Yaw=-4000,Roll=0)
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=7500
end object
// Reference: WeaponParams'BWBP_SWC_Pro.MDKWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	InventorySize=5
	CockAnimRate=1.2500000
	SightingTime=0.2500000
	SightOffset=(X=-10.0000000,Y=-0.0500000,Z=41.0000000)
	SightPivot=(Pitch=16,Yaw=0,Roll=0)
	ViewOffset=(X=12.0000000,Y=15.0000000,Z=-34.0000000)
	DisplaceDurationMult=0.7500000
	MagAmmo=26
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.MDKWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.MDKWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.MDKWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicSecondaryFireParams'
end object
