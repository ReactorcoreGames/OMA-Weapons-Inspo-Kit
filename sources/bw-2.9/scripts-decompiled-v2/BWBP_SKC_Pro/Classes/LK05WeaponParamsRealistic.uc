class LK05WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="5.56mm Holo"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2400000
		SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
		WeaponMaterialSwaps[0]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=8,pIndex=0,AIndex=8)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=9,pIndex=0,AIndex=2)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=0.0000000)
		WeaponName="LK-05 6.8mm Assault Carbine"
		bMagPlusOne=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticParams_68mm'
	begin object name="RealisticParams_68mm" class=BCoreProV55.WeaponParams
		Weight=20
		LayoutName="6.8mm Holosight"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2400000
		SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
		WeaponMaterialSwaps[0]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=8,pIndex=0,AIndex=8)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=9,pIndex=0,AIndex=2)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=0.0000000)
		WeaponName="LK-10 6.8mm Assault Carbine"
		MagAmmo=25
		bMagPlusOne=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticPrimaryFireParams_68mm'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_68mm
	// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticParams_68mmScope'
	begin object name="RealisticParams_68mmScope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="6.8mm 4X Scope"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=-2.0000000)
		WeaponBoneScales[2]=(BoneName="Irons",Slot=57,Scale=-2.0000000)
		WeaponBoneScales[3]=(BoneName="EOTech",Slot=54,Scale=0.0000000)
		WeaponName="LK-10 6.8mm Assault Carbine (4X)"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-20.0000000,Y=-2.3000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=25
		bMagPlusOne=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticRecoilParams_Scope'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticPrimaryFireParams_68mm'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[2]=RealisticParams_68mmScope
	// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticParams_Irons'
	begin object name="RealisticParams_Irons" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="5.56mm Irons"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2000000
		SightOffset=(X=3.0000000,Y=0.0000000,Z=1.5900000)
		SightPivot=(Pitch=64,Yaw=-16,Roll=0)
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponBoneScales[0]=(BoneName="EOTech",Slot=54,Scale=0.0000000)
		WeaponName="LK-05 5.56mm Assault Carbine"
		bMagPlusOne=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[3]=RealisticParams_Irons
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsRealistic.LK05_Tan'
	begin object name="LK05_Tan" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Tan"
	end object
	Camos[0]=LK05_Tan
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsRealistic.LK05_Gray'
	begin object name="LK05_Gray" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-RecShine',MaterialName="",Index=3,pIndex=3,AIndex=4)
		Index=1
	end object
	Camos[1]=LK05_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsRealistic.LK05_Black'
	begin object name="LK05_Black" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-MainBlack",Index=3,pIndex=3,AIndex=4)
		Index=2
	end object
	Camos[2]=LK05_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsRealistic.LK05_Jungle'
	begin object name="LK05_Jungle" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecJungle",Index=3,pIndex=3,AIndex=4)
		Index=3
	end object
	Camos[3]=LK05_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsRealistic.LK05_Winter'
	begin object name="LK05_Winter" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecWinter",Index=3,pIndex=3,AIndex=4)
		Index=4
	end object
	Camos[4]=LK05_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsRealistic.LK05_RedTiger'
	begin object name="LK05_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecRedCamo",Index=3,pIndex=3,AIndex=4)
		Index=5
	end object
	Camos[5]=LK05_RedTiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsRealistic.LK05_Meat'
	begin object name="LK05_Meat" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Meat"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecMeat",Index=3,pIndex=3,AIndex=4)
		Index=6
	end object
	Camos[6]=LK05_Meat
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsRealistic.LK05_Gold'
	begin object name="LK05_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecGold",Index=3,pIndex=3,AIndex=4)
		Index=7
	end object
	Camos[7]=LK05_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=600,Max=1280)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0600000
	JumpChaos=0.3000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.2000000
	ChaosSpeedThreshold=565
end object
// Reference: RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4500000,OutVal=0.3500000),(InVal=0.7500000,OutVal=0.3250000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4750000,OutVal=0.3250000),(InVal=0.7500000,OutVal=0.4250000),(InVal=1.0000000,OutVal=0.4000000)))
	XCurveAlt=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4500000,OutVal=0.3500000),(InVal=0.7500000,OutVal=0.3250000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurveAlt=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4750000,OutVal=0.1250000),(InVal=0.7500000,OutVal=0.4250000),(InVal=1.0000000,OutVal=0.1000000)))
	YawFactor=0.1750000
	XRandFactor=0.1650000
	YRandFactor=0.1650000
	MaxRecoil=3000.0000000
	DeclineTime=0.7750000
	DeclineDelay=0.1800000
	ViewBindFactor=0.0600000
	ADSViewBindFactor=0.0600000
	HipMultiplier=1.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
	bUseAltSightCurve=true
end object
// Reference: FireParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticPrimaryFireParams_68mm'
begin object name="RealisticPrimaryFireParams_68mm" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticPrimaryEffectParams_68mm'
end object
// Reference: FireParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.2000000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=5000.0000000
	DecayRange=(Min=1200.0000000,Max=4800.0000000)
	RangeAtten=0.0500000
	Damage=43
	HeadMult=2.2000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_LK05Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_LK05AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_LK05Assault'
	PenetrationEnergy=16.0000000
	PenetrateForce=50
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LK05.LK05-RapidFire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=300.0000000
	Chaos=0.0500000
	Inaccuracy=(X=12,Y=12)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticPrimaryEffectParams_68mm'
begin object name="RealisticPrimaryEffectParams_68mm" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=7500.0000000,Max=7500.0000000)
	WaterTraceRange=5000.0000000
	DecayRange=(Min=1500.0000000,Max=7500.0000000)
	RangeAtten=0.1000000
	Damage=48
	HeadMult=2.5000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_LK05Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_LK05AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_LK05Assault'
	PenetrationEnergy=19.0000000
	PenetrateForce=55
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.LK05.LK05-HeavyFire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=465.0000000
	Chaos=0.0800000
	Inaccuracy=(X=10,Y=10)
	WarnTargetPct=0.2000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticRecoilParams_Scope'
begin object name="RealisticRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4500000,OutVal=0.3500000),(InVal=0.7500000,OutVal=0.3250000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4750000,OutVal=0.3250000),(InVal=0.7500000,OutVal=0.4250000),(InVal=1.0000000,OutVal=0.4000000)))
	XCurveAlt=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4500000,OutVal=0.3500000),(InVal=0.7500000,OutVal=0.3250000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurveAlt=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4750000,OutVal=0.1250000),(InVal=0.7500000,OutVal=0.4250000),(InVal=1.0000000,OutVal=0.1000000)))
	YawFactor=0.1750000
	XRandFactor=0.1650000
	YRandFactor=0.1650000
	MaxRecoil=3000.0000000
	DeclineTime=0.7750000
	DeclineDelay=0.1800000
	ViewBindFactor=0.0600000
	HipMultiplier=1.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
	bUseAltSightCurve=true
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="5.56mm Holo"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2400000
	SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
	WeaponMaterialSwaps[0]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=8,pIndex=0,AIndex=8)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=9,pIndex=0,AIndex=2)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=0.0000000)
	WeaponName="LK-05 6.8mm Assault Carbine"
	bMagPlusOne=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticParams_68mm'
begin object name="RealisticParams_68mm" class=BCoreProV55.WeaponParams
	Weight=20
	LayoutName="6.8mm Holosight"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2400000
	SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
	WeaponMaterialSwaps[0]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=8,pIndex=0,AIndex=8)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=9,pIndex=0,AIndex=2)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=0.0000000)
	WeaponName="LK-10 6.8mm Assault Carbine"
	MagAmmo=25
	bMagPlusOne=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticPrimaryFireParams_68mm'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticParams_68mmScope'
begin object name="RealisticParams_68mmScope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="6.8mm 4X Scope"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=-2.0000000)
	WeaponBoneScales[2]=(BoneName="Irons",Slot=57,Scale=-2.0000000)
	WeaponBoneScales[3]=(BoneName="EOTech",Slot=54,Scale=0.0000000)
	WeaponName="LK-10 6.8mm Assault Carbine (4X)"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-20.0000000,Y=-2.3000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=25
	bMagPlusOne=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticRecoilParams_Scope'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticPrimaryFireParams_68mm'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticParams_Irons'
begin object name="RealisticParams_Irons" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="5.56mm Irons"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2000000
	SightOffset=(X=3.0000000,Y=0.0000000,Z=1.5900000)
	SightPivot=(Pitch=64,Yaw=-16,Roll=0)
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponBoneScales[0]=(BoneName="EOTech",Slot=54,Scale=0.0000000)
	WeaponName="LK-05 5.56mm Assault Carbine"
	bMagPlusOne=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsRealistic.LK05_Tan'
begin object name="LK05_Tan" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Tan"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsRealistic.LK05_Gray'
begin object name="LK05_Gray" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-RecShine',MaterialName="",Index=3,pIndex=3,AIndex=4)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsRealistic.LK05_Black'
begin object name="LK05_Black" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-MainBlack",Index=3,pIndex=3,AIndex=4)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsRealistic.LK05_Jungle'
begin object name="LK05_Jungle" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecJungle",Index=3,pIndex=3,AIndex=4)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsRealistic.LK05_Winter'
begin object name="LK05_Winter" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecWinter",Index=3,pIndex=3,AIndex=4)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsRealistic.LK05_RedTiger'
begin object name="LK05_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecRedCamo",Index=3,pIndex=3,AIndex=4)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsRealistic.LK05_Meat'
begin object name="LK05_Meat" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Meat"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecMeat",Index=3,pIndex=3,AIndex=4)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsRealistic.LK05_Gold'
begin object name="LK05_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecGold",Index=3,pIndex=3,AIndex=4)
	Index=7
end object
