class SuperchargerWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		InventorySize=8
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.9500000
		SightingTime=0.5000000
		ZoomType=1
		MaxZoom=4.0000000
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Mode: Area Charge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Mode: Dolphin",bUnavailable=true,ModeID="WM_FullAuto",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Mode: Precise Charge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaPrimarySpreadFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.Super_Industrial'
	begin object name="Super_Industrial" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Industrial"
	end object
	Camos[0]=Super_Industrial
	// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.Super_Green'
	begin object name="Super_Green" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="OD Green"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SuperchargerCamos.Supercharger-MainGreen",Index=3,pIndex=4,AIndex=4)
		Index=1
	end object
	Camos[1]=Super_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.Super_Black'
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
// Reference: FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0631500
	FireAnim="FireLoop"
	FireEndAnim="FireLoopEnd"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	RangeAtten=0.9500000
	Damage=9
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
// Reference: InstantEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaPrimarySpreadEffectParams'
begin object name="ArenaPrimarySpreadEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	RangeAtten=0.9500000
	Damage=9
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
// Reference: FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaPrimarySpreadFireParams'
begin object name="ArenaPrimarySpreadFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0401500
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaPrimarySpreadEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
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
// Reference: FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="MeleeLoopStart"
	FireEndAnim="MeleeLoopEnd"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	ClimbTime=0.0300000
	ViewBindFactor=0.0000000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=768)
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=1.5000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	InventorySize=8
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.9500000
	SightingTime=0.5000000
	ZoomType=1
	MaxZoom=4.0000000
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Mode: Area Charge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Mode: Dolphin",bUnavailable=true,ModeID="WM_FullAuto",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Mode: Precise Charge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaPrimarySpreadFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.Super_Industrial'
begin object name="Super_Industrial" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Industrial"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.Super_Green'
begin object name="Super_Green" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="OD Green"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SuperchargerCamos.Supercharger-MainGreen",Index=3,pIndex=4,AIndex=4)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SuperchargerWeaponParamsComp.Super_Black'
begin object name="Super_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SuperchargerCamos.Supercharger-MainBlack",Index=3,pIndex=4,AIndex=4)
	Index=2
end object
