class SuperchargerWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=8
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.5000000
		ZoomType=1
		MaxZoom=4.0000000
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Mode: Area Charge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Mode: Dolphin",bUnavailable=true,ModeID="WM_FullAuto",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Mode: Precise Charge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalPrimarySpreadFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.Super_Industrial'
	begin object name="Super_Industrial" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Industrial"
	end object
	Camos[0]=Super_Industrial
	// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.Super_Green'
	begin object name="Super_Green" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="OD Green"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SuperchargerCamos.Supercharger-MainGreen",Index=3,pIndex=4,AIndex=4)
		Index=1
	end object
	Camos[1]=Super_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.Super_Black'
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
// Reference: FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0631500
	FireAnim="FireLoop"
	FireEndAnim="FireLoopEnd"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	RangeAtten=0.9500000
	Damage=12
	DamageType=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SuperCharger.SC-FireSingle',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=20.0000000
	Chaos=0.0100000
	Inaccuracy=(X=64,Y=64)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalPrimarySpreadEffectParams'
begin object name="TacticalPrimarySpreadEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	RangeAtten=0.9500000
	Damage=12
	DamageType=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_SuperchargeZapped'
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SuperCharger.SC-FireSingle',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=100.0000000
	Chaos=0.0100000
	Inaccuracy=(X=512,Y=512)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalPrimarySpreadFireParams'
begin object name="TacticalPrimarySpreadFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0401500
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalPrimarySpreadEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=160.0000000,Max=160.0000000)
	Damage=35
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
// Reference: FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="EndReload"
	FireEndAnim="MeleeLoopEnd"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	ClimbTime=0.0300000
	ViewBindFactor=0.0000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=384,Max=1280)
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=1.5000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=8
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.5000000
	ZoomType=1
	MaxZoom=4.0000000
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Mode: Area Charge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Mode: Dolphin",bUnavailable=true,ModeID="WM_FullAuto",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Mode: Precise Charge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalPrimarySpreadFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.Super_Industrial'
begin object name="Super_Industrial" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Industrial"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.Super_Green'
begin object name="Super_Green" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="OD Green"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SuperchargerCamos.Supercharger-MainGreen",Index=3,pIndex=4,AIndex=4)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsTactical.Super_Black'
begin object name="Super_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SuperchargerCamos.Supercharger-MainBlack",Index=3,pIndex=4,AIndex=4)
	Index=2
end object
