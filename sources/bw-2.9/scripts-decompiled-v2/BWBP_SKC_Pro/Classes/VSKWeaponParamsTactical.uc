class VSKWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.VSKWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=600,Yaw=0,Roll=-1024)
		ZoomType=4
		WeaponName="VSK-421 7mm Tranq Rifle"
		MagAmmo=10
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Semi-Auto",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Semi-Auto",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.VSKWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.VSKWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.VSKWeaponParamsTactical.TacticalPrimaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.VSKWeaponParamsTactical.VSK_Gray'
	begin object name="VSK_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=VSK_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.VSKWeaponParamsTactical.VSK_UTC'
	begin object name="VSK_UTC" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="UTC"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.VSKCamos.UTCVskShine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=VSK_UTC
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SKC_Pro.VSKWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	WaterTraceRange=5000.0000000
	Damage=60
	HeadMult=2.3000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_VSKTranq'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_VSKTranqHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_VSKTranq'
	PenetrationEnergy=1.0000000
	PenetrateForce=150
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.VSK.VSK-SuperShot',Volume=1.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=32.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=16,Y=16)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.VSKWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.VSKWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.VSKWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.1000000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.4000000
	XRandFactor=0.3500000
	YRandFactor=0.3500000
	MaxRecoil=2048.0000000
	ClimbTime=0.1000000
	DeclineTime=0.6000000
	DeclineDelay=0.1000000
	EscapeMultiplier=1.5000000
	ViewBindFactor=0.1500000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
end object
// Reference: AimParams'BWBP_SKC_Pro.VSKWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=392,Max=1336)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	ViewBindFactor=0.0750000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.6500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.VSKWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=600,Yaw=0,Roll=-1024)
	ZoomType=4
	WeaponName="VSK-421 7mm Tranq Rifle"
	MagAmmo=10
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Semi-Auto",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Semi-Auto",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.VSKWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.VSKWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.VSKWeaponParamsTactical.TacticalPrimaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.VSKWeaponParamsTactical.VSK_Gray'
begin object name="VSK_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.VSKWeaponParamsTactical.VSK_UTC'
begin object name="VSK_UTC" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.VSKCamos.UTCVskShine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
