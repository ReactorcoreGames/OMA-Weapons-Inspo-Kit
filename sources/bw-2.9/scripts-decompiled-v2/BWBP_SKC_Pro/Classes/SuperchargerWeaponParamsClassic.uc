class SuperchargerWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=11
		SightingTime=0.3000000
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		ZoomType=1
		ViewOffset=(X=1.0000000,Y=10.0000000,Z=0.0000000)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.Super_Industrial'
	begin object name="Super_Industrial" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Industrial"
	end object
	Camos[0]=Super_Industrial
	// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.Super_Green'
	begin object name="Super_Green" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="OD Green"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SuperchargerCamos.Supercharger-MainGreen",Index=3,pIndex=4,AIndex=4)
		Index=1
	end object
	Camos[1]=Super_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.Super_Black'
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
// Reference: InstantEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	RangeAtten=0.9500000
	Damage=3
	DamageType=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SuperCharger.SC-FireSingle',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=35.0000000
	Chaos=0.0100000
	Inaccuracy=(X=32,Y=32)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0631500
	FireAnim="None"
	FireLoopAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=160.0000000,Max=160.0000000)
	Damage=75
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
// Reference: FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="MeleeLoopStart"
	FireEndAnim="MeleeLoopEnd"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.3000000,OutVal=-0.3000000),(InVal=0.6000000,OutVal=-0.2500000),(InVal=0.7000000,OutVal=0.2500000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.2000000,OutVal=-0.2000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.7000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=-0.4000000)))
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=1600.0000000
	ViewBindFactor=0.4000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=2048)
	AimAdjustTime=1.0000000
	OffsetAdjustTime=0.5000000
	CrouchMultiplier=0.8500000
	ADSMultiplier=0.8500000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=0.8000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=11
	SightingTime=0.3000000
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	ZoomType=1
	ViewOffset=(X=1.0000000,Y=10.0000000,Z=0.0000000)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.Super_Industrial'
begin object name="Super_Industrial" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Industrial"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.Super_Green'
begin object name="Super_Green" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="OD Green"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SuperchargerCamos.Supercharger-MainGreen",Index=3,pIndex=4,AIndex=4)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsClassic.Super_Black'
begin object name="Super_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SuperchargerCamos.Supercharger-MainBlack",Index=3,pIndex=4,AIndex=4)
	Index=2
end object
