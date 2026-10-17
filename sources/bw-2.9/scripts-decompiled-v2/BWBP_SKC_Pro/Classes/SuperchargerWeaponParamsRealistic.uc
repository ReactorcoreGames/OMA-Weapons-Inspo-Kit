class SuperchargerWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		ZoomType=1
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Mode: Area Charge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Mode: Dolphin",bUnavailable=true,ModeID="WM_FullAuto",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Mode: Precise Charge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticPrimarySpreadFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.Super_Industrial'
	begin object name="Super_Industrial" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Industrial"
	end object
	Camos[0]=Super_Industrial
	// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.Super_Green'
	begin object name="Super_Green" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="OD Green"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SuperchargerCamos.Supercharger-MainGreen",Index=3,pIndex=4,AIndex=4)
		Index=1
	end object
	Camos[1]=Super_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.Super_Black'
	begin object name="Super_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SuperchargerCamos.Supercharger-MainBlack",Index=3,pIndex=4,AIndex=4)
		Index=2
	end object
	Camos[2]=Super_Black
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0631500
	FireAnim="FireLoop"
	FireEndAnim="FireLoopEnd"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	RangeAtten=0.9500000
	Damage=7
	DamageType=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SuperCharger.SC-FireSingle',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=2.0000000
	Chaos=0.0100000
	Heat=0.1500000
	Inaccuracy=(X=2,Y=2)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticPrimarySpreadEffectParams'
begin object name="RealisticPrimarySpreadEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	RangeAtten=0.9500000
	Damage=10
	DamageType=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SuperCharger.SC-FireSingle',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=10.0000000
	Chaos=0.0100000
	Heat=0.2500000
	Inaccuracy=(X=512,Y=512)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticPrimarySpreadFireParams'
begin object name="RealisticPrimarySpreadFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0401500
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticPrimarySpreadEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=160.0000000,Max=160.0000000)
	Damage=20
	DamageType=Class'BWBP_SKC_Pro.DT_SuperchargeChomped'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_SuperchargeChomped'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_SuperchargeChomped'
	HookStopFactor=1.5000000
	HookPullForce=150.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SuperCharger.SC-ChompStart',Volume=0.7500000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="EndReload"
	FireEndAnim="MeleeLoopEnd"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.3000000,OutVal=-0.3000000),(InVal=0.6000000,OutVal=-0.2500000),(InVal=0.7000000,OutVal=0.2500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.2000000,OutVal=-0.2000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.4000000)))
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=3072.0000000
	DeclineTime=1.0000000
	DeclineDelay=0.3500000
	ViewBindFactor=0.7500000
	ADSViewBindFactor=0.7500000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=900,Max=2308)
	AimAdjustTime=0.4500000
	OffsetAdjustTime=0.5000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=1.2000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	ZoomType=1
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Mode: Area Charge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Mode: Dolphin",bUnavailable=true,ModeID="WM_FullAuto",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Mode: Precise Charge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticPrimarySpreadFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.Super_Industrial'
begin object name="Super_Industrial" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Industrial"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.Super_Green'
begin object name="Super_Green" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="OD Green"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SuperchargerCamos.Supercharger-MainGreen",Index=3,pIndex=4,AIndex=4)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsRealistic.Super_Black'
begin object name="Super_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SuperchargerCamos.Supercharger-MainBlack",Index=3,pIndex=4,AIndex=4)
	Index=2
end object
