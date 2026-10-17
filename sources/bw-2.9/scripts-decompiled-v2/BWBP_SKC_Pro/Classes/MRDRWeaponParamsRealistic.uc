class MRDRWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=1.1000000
		InventorySize=4
		WeaponPrice=1100
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1600000
		SightOffset=(X=20.0000000,Y=3.0000000,Z=2.8000000)
		SightPivot=(Pitch=-2300,Yaw=0,Roll=800)
		bAdjustHands=true
		RootAdjust=(Pitch=2000,Yaw=50,Roll=0)
		WeaponName="MR-DR88 9mm Wrist Pistol"
		MagAmmo=60
		bMagPlusOne=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=900.0000000,Max=4800.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.1000000
	Damage=30
	HeadMult=2.6000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_MRDR88Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MRDR88Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MRDR88Body'
	PenetrationEnergy=11.0000000
	PenetrateForce=15
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MRDR.MRDR-Fire',Volume=1.1000000,Radius=512.0000000,Slot=0,Pitch=1.2500000,bAtten=false,bNoOverride=true)
	Recoil=720.0000000
	Inaccuracy=(X=10,Y=10)
end object
// Reference: FireParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0666660
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=96.0000000,Max=96.0000000)
	WaterTraceRange=5000.0000000
	Damage=35
	HeadMult=2.4285710
	LimbMult=0.7142850
	DamageType=Class'BWBP_SKC_Pro.DT_MRDR88Spike'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MRDR88SpikeHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MRDR88Spike'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Swing',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Melee1"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.0000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=0.8000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.6000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.5000000)))
	PitchFactor=0.5000000
	YawFactor=0.3000000
	XRandFactor=0.6000000
	YRandFactor=0.6000000
	MaxRecoil=2048.0000000
	DeclineTime=0.6000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.1500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=768,Max=1280)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.8200000
	ADSMultiplier=0.7700000
	SprintOffset=(Pitch=-4608,Yaw=-512,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.6500000
	ChaosSpeedThreshold=600
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=1.1000000
	InventorySize=4
	WeaponPrice=1100
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1600000
	SightOffset=(X=20.0000000,Y=3.0000000,Z=2.8000000)
	SightPivot=(Pitch=-2300,Yaw=0,Roll=800)
	bAdjustHands=true
	RootAdjust=(Pitch=2000,Yaw=50,Roll=0)
	WeaponName="MR-DR88 9mm Wrist Pistol"
	MagAmmo=60
	bMagPlusOne=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MRDRWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
