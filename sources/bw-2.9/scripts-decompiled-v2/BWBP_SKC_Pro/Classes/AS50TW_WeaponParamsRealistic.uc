class AS50TW_WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.8250000
		InventorySize=12
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.0100000
		SightPivot=(Pitch=32,Yaw=0,Roll=0)
		ZoomType=2
		WeaponName="Mounted FSSG-50 AMR"
		MagAmmo=10
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticAimParams'
		AimParams[1]=AimParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticControlledAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticPriControlledFireParams'
		FireParams[1]=none
		FireParams[2]=FireParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=135
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_AS50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AS50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AS50Limb'
	PenetrationEnergy=48.0000000
	PenetrateForce=300
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter_C'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AS50.FG50-HeavyFire',Volume=7.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=160.0000000
	Inaccuracy=(X=12,Y=12)
end object
// Reference: FireParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1600000
	BurstFireRateFactor=1.0000000
	FireAnimRate=1.5500000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticPriControlledEffectParams'
begin object name="RealisticPriControlledEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=135
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_AS50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AS50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AS50Limb'
	PenetrateForce=150
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.FG50FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AR23.AR23-HFire',Volume=6.7500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=80.0000000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticPriControlledFireParams'
begin object name="RealisticPriControlledFireParams" class=BCoreProV55.FireParams
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticPriControlledEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.1000000
	YawFactor=0.1000000
	XRandFactor=0.5500000
	YRandFactor=0.5500000
	MaxRecoil=750.0000000
	DeclineTime=1.0000000
	ViewBindFactor=0.0000000
	ADSViewBindFactor=0.3000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=398,Max=3072)
	CrouchMultiplier=1.0000000
	ADSMultiplier=0.7000000
	SprintChaos=0.4000000
	AimDamageThreshold=2000
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=375
end object
// Reference: AimParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticControlledAimParams'
begin object name="RealisticControlledAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=156,Max=2072)
	AimAdjustTime=1.0000000
	CrouchMultiplier=1.0000000
	ADSMultiplier=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=2000
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=350
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.8250000
	InventorySize=12
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.0100000
	SightPivot=(Pitch=32,Yaw=0,Roll=0)
	ZoomType=2
	WeaponName="Mounted FSSG-50 AMR"
	MagAmmo=10
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticAimParams'
	AimParams[1]=AimParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticControlledAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticPriControlledFireParams'
	FireParams[1]=none
	FireParams[2]=FireParams'BWBP_SKC_Pro.AS50TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
end object
