class G51WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticParams_Chaff'
	begin object name="RealisticParams_Chaff" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Adv Holo + Chaff"
		WeaponPrice=1200
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2200000
		SightOffset=(X=-0.5000000,Y=-0.0100000,Z=3.1000000)
		WeaponBoneScales[0]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="HoloSightLower",Slot=55,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		WeaponName="G51 5.56mm Carbine"
		bMagPlusOne=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryFireParams_Chaff'
	end object
	Layouts[0]=RealisticParams_Chaff
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticParams_Sensor'
	begin object name="RealisticParams_Sensor" class=BCoreProV55.WeaponParams
		Weight=3
		LayoutName="Adv Holo + Sensor"
		WeaponPrice=1200
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2200000
		SightOffset=(X=-0.5000000,Y=0.0000000,Z=-0.1200000)
		WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=-1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=1.0000000)
		WeaponName="G51 5.56mm Carbine"
		bMagPlusOne=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryFireParams_Sensor'
	end object
	Layouts[1]=RealisticParams_Sensor
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticParams_HE'
	begin object name="RealisticParams_HE" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Iron Sights + HE"
		WeaponPrice=1200
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2200000
		SightOffset=(X=-0.5000000,Y=0.0000000,Z=1.0000000)
		WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		WeaponName="G51 5.56mm Carbine"
		bMagPlusOne=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryFireParams_HE'
	end object
	Layouts[2]=RealisticParams_HE
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticParams_4XScope'
	begin object name="RealisticParams_4XScope" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="4X Scope"
		WeaponPrice=1200
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=-0.5000000,Y=-0.0100000,Z=3.1000000)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		WeaponName="G51 5.56mm Carbine (4X)"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ACOG',BoneName="tip",Scale=0.1000000,AugmentOffset=(X=-25.0000000,Y=-4.6000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		bMagPlusOne=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticRecoilParams_Scope'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
		bNoaltfire=true
	end object
	Layouts[3]=RealisticParams_4XScope
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticParams_IRScope'
	begin object name="RealisticParams_IRScope" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="IR Scope"
		LayoutTags="IR"
		WeaponPrice=1200
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=3.0000000,Y=-0.0100000,Z=0.5000000)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-IRScope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=-1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		WeaponName="G51 5.56mm Carbine (IR)"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_IRScope',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-27.0000000,Y=-2.6000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=-16384))
		bMagPlusOne=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticRecoilParams_Scope'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[4]=RealisticParams_IRScope
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticParams_Suppressed'
	begin object name="RealisticParams_Suppressed" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Suppressed"
		LayoutTags="silencer"
		WeaponPrice=1200
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2300000
		SightOffset=(X=-0.5000000,Y=0.0000000,Z=1.0000000)
		WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		WeaponName="G51 5.56mm Carbine (Sil)"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.1500000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		bMagPlusOne=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimarySuppressedFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[5]=RealisticParams_Suppressed
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsRealistic.G51_Black'
	begin object name="G51_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=G51_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsRealistic.G51_Green'
	begin object name="G51_Green" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainGreen",Index=1,pIndex=1,AIndex=0)
		Index=1
	end object
	Camos[1]=G51_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsRealistic.G51_GreenHex'
	begin object name="G51_GreenHex" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hex Green"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainHexG",Index=1,pIndex=1,AIndex=0)
		Index=2
	end object
	Camos[2]=G51_GreenHex
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsRealistic.G51_BlueHex'
	begin object name="G51_BlueHex" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hex Blue"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainHexB",Index=1,pIndex=1,AIndex=0)
		Index=3
	end object
	Camos[3]=G51_BlueHex
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsRealistic.G51_Desert'
	begin object name="G51_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainDesert",Index=1,pIndex=1,AIndex=0)
		Index=4
	end object
	Camos[4]=G51_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsRealistic.G51_UTC'
	begin object name="G51_UTC" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="UTC"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.UTCG51Tex",Index=1,pIndex=1,AIndex=0)
		Index=5
	end object
	Camos[5]=G51_UTC
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsRealistic.G51_Inferno'
	begin object name="G51_Inferno" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Inferno"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainRed",Index=1,pIndex=1,AIndex=0)
		Index=6
	end object
	Camos[6]=G51_Inferno
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsRealistic.G51_Gold'
	begin object name="G51_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainGold",Index=1,pIndex=1,AIndex=0)
		Index=7
	end object
	Camos[7]=G51_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=12,Max=1400)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-4000,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.4500000
	ChaosSpeedThreshold=550
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0630000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.2500000),(InVal=0.6000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.3500000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.1500000
	XRandFactor=0.1500000
	YRandFactor=0.1500000
	MaxRecoil=2800.0000000
	DeclineTime=0.6250000
	DeclineDelay=0.0750000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
begin object name="RealisticSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticRecoilParams_Scope'
begin object name="RealisticRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.2500000),(InVal=0.6000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.3500000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.1500000
	XRandFactor=0.1500000
	YRandFactor=0.1500000
	MaxRecoil=2800.0000000
	DeclineTime=0.7250000
	DeclineDelay=0.0750000
	ViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5200.0000000,Max=5200.0000000)
	WaterTraceRange=5000.0000000
	DecayRange=(Min=1400.0000000,Max=5200.0000000)
	RangeAtten=0.5000000
	Damage=43
	HeadMult=2.1500000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_G51Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_G51AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_G51AssaultLimb'
	PenetrationEnergy=18.0000000
	PenetrateForce=50
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51FlashEmitter'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ55A3Carbine-Fire',Volume=1.1000000,Radius=512.0000000,Slot=3,Pitch=1.1500000,bAtten=false,bNoOverride=false)
	Recoil=700.0000000
	Chaos=0.0500000
	Inaccuracy=(X=12,Y=12)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimarySuppressedEffectParams'
begin object name="RealisticPrimarySuppressedEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5200.0000000,Max=5200.0000000)
	WaterTraceRange=5000.0000000
	DecayRange=(Min=1400.0000000,Max=5200.0000000)
	RangeAtten=0.5000000
	Damage=43
	HeadMult=2.1500000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_G51Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_G51AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_G51AssaultLimb'
	PenetrationEnergy=18.0000000
	PenetrateForce=50
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51FlashEmitter'
	FlashScaleFactor=0.0500000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-Silenced',Volume=1.5000000,Radius=192.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=650.0000000
	Chaos=0.0500000
	Inaccuracy=(X=12,Y=12)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimarySuppressedFireParams'
begin object name="RealisticPrimarySuppressedFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0630000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimarySuppressedEffectParams'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryEffectParams_HE'
begin object name="RealisticSecondaryEffectParams_HE" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=240.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.G51Grenade_HE'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3600.0000000
	Damage=200.0000000
	DamageRadius=400.0000000
	MomentumTransfer=30000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51AltFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=600.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=128,Y=128)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=1.2500000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryFireParams_HE'
begin object name="RealisticSecondaryFireParams_HE" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	FireAnim="FireGrenade"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryEffectParams_HE'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryEffectParams_Chaff'
begin object name="RealisticSecondaryEffectParams_Chaff" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=100.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.G51Grenade_Chaff'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3600.0000000
	Damage=65.0000000
	DamageRadius=192.0000000
	MomentumTransfer=30000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51AltFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=600.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=128,Y=128)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=1.2500000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryFireParams_Chaff'
begin object name="RealisticSecondaryFireParams_Chaff" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	FireAnim="FireGrenade"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryEffectParams_Chaff'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryEffectParams_Sensor'
begin object name="RealisticSecondaryEffectParams_Sensor" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=100.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.G51Grenade_Sensor'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3600.0000000
	Damage=25.0000000
	DamageRadius=10.0000000
	MomentumTransfer=30000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51AltFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=600.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=128,Y=128)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=1.2500000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryFireParams_Sensor'
begin object name="RealisticSecondaryFireParams_Sensor" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	FireAnim="FireGrenade"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryEffectParams_Sensor'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
begin object name="RealisticSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticParams_Chaff'
begin object name="RealisticParams_Chaff" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Adv Holo + Chaff"
	WeaponPrice=1200
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2200000
	SightOffset=(X=-0.5000000,Y=-0.0100000,Z=3.1000000)
	WeaponBoneScales[0]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="HoloSightLower",Slot=55,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	WeaponName="G51 5.56mm Carbine"
	bMagPlusOne=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryFireParams_Chaff'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticParams_Sensor'
begin object name="RealisticParams_Sensor" class=BCoreProV55.WeaponParams
	Weight=3
	LayoutName="Adv Holo + Sensor"
	WeaponPrice=1200
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2200000
	SightOffset=(X=-0.5000000,Y=0.0000000,Z=-0.1200000)
	WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=-1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=1.0000000)
	WeaponName="G51 5.56mm Carbine"
	bMagPlusOne=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryFireParams_Sensor'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticParams_HE'
begin object name="RealisticParams_HE" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Iron Sights + HE"
	WeaponPrice=1200
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2200000
	SightOffset=(X=-0.5000000,Y=0.0000000,Z=1.0000000)
	WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	WeaponName="G51 5.56mm Carbine"
	bMagPlusOne=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryFireParams_HE'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticParams_4XScope'
begin object name="RealisticParams_4XScope" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="4X Scope"
	WeaponPrice=1200
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=-0.5000000,Y=-0.0100000,Z=3.1000000)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	WeaponName="G51 5.56mm Carbine (4X)"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ACOG',BoneName="tip",Scale=0.1000000,AugmentOffset=(X=-25.0000000,Y=-4.6000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	bMagPlusOne=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticRecoilParams_Scope'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	bNoaltfire=true
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticParams_IRScope'
begin object name="RealisticParams_IRScope" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="IR Scope"
	LayoutTags="IR"
	WeaponPrice=1200
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=3.0000000,Y=-0.0100000,Z=0.5000000)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-IRScope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=-1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	WeaponName="G51 5.56mm Carbine (IR)"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_IRScope',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-27.0000000,Y=-2.6000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=-16384))
	bMagPlusOne=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticRecoilParams_Scope'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticParams_Suppressed'
begin object name="RealisticParams_Suppressed" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Suppressed"
	LayoutTags="silencer"
	WeaponPrice=1200
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2300000
	SightOffset=(X=-0.5000000,Y=0.0000000,Z=1.0000000)
	WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	WeaponName="G51 5.56mm Carbine (Sil)"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.1500000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	bMagPlusOne=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticPrimarySuppressedFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsRealistic.G51_Black'
begin object name="G51_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsRealistic.G51_Green'
begin object name="G51_Green" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainGreen",Index=1,pIndex=1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsRealistic.G51_GreenHex'
begin object name="G51_GreenHex" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hex Green"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainHexG",Index=1,pIndex=1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsRealistic.G51_BlueHex'
begin object name="G51_BlueHex" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hex Blue"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainHexB",Index=1,pIndex=1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsRealistic.G51_Desert'
begin object name="G51_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainDesert",Index=1,pIndex=1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsRealistic.G51_UTC'
begin object name="G51_UTC" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.UTCG51Tex",Index=1,pIndex=1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsRealistic.G51_Inferno'
begin object name="G51_Inferno" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Inferno"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainRed",Index=1,pIndex=1,AIndex=0)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsRealistic.G51_Gold'
begin object name="G51_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainGold",Index=1,pIndex=1,AIndex=0)
	Index=7
end object
