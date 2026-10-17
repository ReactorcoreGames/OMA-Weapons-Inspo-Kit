class XMV850TW_WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.7000000
		PlayerJumpFactor=0.7500000
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=700,Yaw=0,Roll=2048)
		WeaponName="Mounted XMV-858 5.56mm Minigun"
		MagAmmo=900
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="1200 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="2400 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="3600 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BallisticProV55.XMV850TW_WeaponParamsRealistic.XMV_Teal'
	begin object name="XMV_Teal" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Teal"
	end object
	Camos[0]=XMV_Teal
	// Reference: WeaponCamo'BallisticProV55.XMV850TW_WeaponParamsRealistic.XMV_Green'
	begin object name="XMV_Green" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV858_Main",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV858_Barrels_SD",Index=2,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=XMV_Green
	// Reference: WeaponCamo'BallisticProV55.XMV850TW_WeaponParamsRealistic.XMV_Black'
	begin object name="XMV_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV500_Main",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV500_Barrels_SD",Index=2,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=XMV_Black
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1600.0000000,Max=8000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.1000000
	Damage=45
	HeadMult=2.2666660
	LimbMult=0.6666660
	DamageType=Class'BallisticProV55.DTXMV850MG'
	DamageTypeHead=Class'BallisticProV55.DTXMV850MGHead'
	DamageTypeArm=Class'BallisticProV55.DTXMV850MG'
	PenetrationEnergy=18.0000000
	PenetrateForce=65
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XMV850FlashEmitter'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.XMV-850.XMV-Fire-1',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=24.0000000
	Chaos=-0.0100000
	Inaccuracy=(X=9,Y=9)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireAnim="Undeploy"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.1000000
	YawFactor=0.1000000
	XRandFactor=0.1500000
	YRandFactor=0.1500000
	MaxRecoil=800.0000000
	DeclineTime=1.0000000
	DeclineDelay=0.0000000
	ViewBindFactor=0.0000000
	ADSViewBindFactor=0.7500000
	CrouchMultiplier=0.9000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=1024)
	AimAdjustTime=1.0000000
	OffsetAdjustTime=0.6500000
	CrouchMultiplier=0.9000000
	SprintChaos=0.4000000
	AimDamageThreshold=2000
	ChaosDeclineTime=1.6500000
	ChaosSpeedThreshold=350
end object
// Reference: WeaponParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.7000000
	PlayerJumpFactor=0.7500000
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=700,Yaw=0,Roll=2048)
	WeaponName="Mounted XMV-858 5.56mm Minigun"
	MagAmmo=900
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="1200 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="2400 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="3600 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.XMV850TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.XMV850TW_WeaponParamsRealistic.XMV_Teal'
begin object name="XMV_Teal" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Teal"
end object
// Reference: WeaponCamo'BallisticProV55.XMV850TW_WeaponParamsRealistic.XMV_Green'
begin object name="XMV_Green" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV858_Main",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV858_Barrels_SD",Index=2,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.XMV850TW_WeaponParamsRealistic.XMV_Black'
begin object name="XMV_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV500_Main",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV500_Barrels_SD",Index=2,pIndex=1,AIndex=1)
	Index=2
end object
