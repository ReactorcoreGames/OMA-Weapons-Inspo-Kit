class AR23WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Adv Holo"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2700000
		WeaponBoneScales[0]=(BoneName="IronsRear",Slot=51,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="GLIrons",Slot=52,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Holo",Slot=53,Scale=1.0000000)
		WeaponName="AR-23 .50 Heavy Rifle"
		MagAmmo=9
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="2 Shot Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticParams_4X'
	begin object name="RealisticParams_4X" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="4X Scope"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="IronsFront",Slot=50,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="IronsRear",Slot=51,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="GLIrons",Slot=52,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="Holo",Slot=53,Scale=0.0000000)
		WeaponBoneScales[4]=(BoneName="MuzzleAttachment",Slot=54,Scale=1.0000000)
		WeaponName="AR-23 .50 Heavy Rifle (4X)"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ACOG',BoneName="tip",Scale=0.1200000,AugmentOffset=(X=-25.0000000,Y=0.0000000,Z=-1.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=0))
		MagAmmo=9
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="2 Shot Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticRecoilParams_Scope'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_4X
	// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticParams_8X'
	begin object name="RealisticParams_8X" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="8X Scope"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3300000
		ZoomType=2
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MinZoom=4.0000000
		MaxZoom=8.0000000
		ZoomStages=1
		WeaponBoneScales[0]=(BoneName="IronsFront",Slot=50,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="IronsRear",Slot=51,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="GLIrons",Slot=52,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="Holo",Slot=53,Scale=0.0000000)
		WeaponBoneScales[4]=(BoneName="MuzzleAttachment",Slot=54,Scale=1.0000000)
		WeaponName="AR-23 .50 Heavy Rifle (8X)"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_8XScope',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-25.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=0))
		MagAmmo=9
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="2 Shot Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticRecoilParams_Scope'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[2]=RealisticParams_8X
	// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticParams_Supp'
	begin object name="RealisticParams_Supp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Suppressor"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2700000
		WeaponBoneScales[0]=(BoneName="IronsFront",Slot=50,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="IronsRear",Slot=51,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="GLIrons",Slot=52,Scale=1.0000000)
		WeaponBoneScales[3]=(BoneName="Holo",Slot=53,Scale=0.0000000)
		WeaponBoneScales[4]=(BoneName="MuzzleAttachment",Slot=54,Scale=0.0000000)
		WeaponName="AR-23 .50 Heavy Rifle"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.2000000,AugmentOffset=(X=-3.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=32768))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_Holo',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-25.0000000,Y=0.0000000,Z=-1.1000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=32768))
		MagAmmo=9
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="2 Shot Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[3]=RealisticParams_Supp
	// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticParams_Irons'
	begin object name="RealisticParams_Irons" class=BCoreProV55.WeaponParams
		Weight=3
		LayoutName="Iron Sights"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2300000
		WeaponBoneScales[0]=(BoneName="IronsFront",Slot=50,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="IronsRear",Slot=51,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="GLIrons",Slot=52,Scale=1.0000000)
		WeaponBoneScales[3]=(BoneName="Holo",Slot=53,Scale=0.0000000)
		WeaponBoneScales[4]=(BoneName="MuzzleAttachment",Slot=54,Scale=1.0000000)
		WeaponName="AR-23 .50 Heavy Rifle"
		MagAmmo=9
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="2 Shot Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[4]=RealisticParams_Irons
	// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsRealistic.AR23_Tan'
	begin object name="AR23_Tan" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Tan"
	end object
	Camos[0]=AR23_Tan
	// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsRealistic.AR23_Digital'
	begin object name="AR23_Digital" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Digital"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MainDigital",Index=1,pIndex=5,AIndex=0)
		Index=1
	end object
	Camos[1]=AR23_Digital
	// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsRealistic.AR23_Winter'
	begin object name="AR23_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MainWinterShine",Index=1,pIndex=5,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MiscWinterShine",Index=2,pIndex=6,AIndex=1)
		Index=2
	end object
	Camos[2]=AR23_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsRealistic.AR23_Meat'
	begin object name="AR23_Meat" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Meat"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MainMeat",Index=1,pIndex=5,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MiscMeat",Index=2,pIndex=6,AIndex=1)
		Index=3
	end object
	Camos[3]=AR23_Meat
	// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsRealistic.AR23_Gold'
	begin object name="AR23_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MainGold",Index=1,pIndex=5,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MiscGold",Index=2,pIndex=6,AIndex=1)
		Index=4
	end object
	Camos[4]=AR23_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	PreFireAnim="GrenadePrep"
	FireAnim="GrenadeFire"
	AimedFireAnim="GrenadeFireAimed"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: AimParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=680,Max=2560)
	AimAdjustTime=0.6500000
	OffsetAdjustTime=0.3250000
	CrouchMultiplier=0.5000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.4500000
	FallingChaos=0.4500000
	SprintChaos=0.4500000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=550
end object
// Reference: FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1700000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.6000000,OutVal=0.4000000),(InVal=0.8000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.5000000)))
	XRandFactor=0.7000000
	YRandFactor=0.7000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.5000000
	bViewDecline=true
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticRecoilParams_Scope'
begin object name="RealisticRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.6000000,OutVal=0.4000000),(InVal=0.8000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.5000000)))
	XRandFactor=0.7000000
	YRandFactor=0.7000000
	ViewBindFactor=0.2000000
	CrouchMultiplier=0.5000000
	bViewDecline=true
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=125
	HeadMult=2.1000000
	LimbMult=0.6600000
	DamageType=Class'BWBP_SKC_Pro.DT_AR23HR'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AR23HRHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AR23HR'
	PenetrationEnergy=48.0000000
	PenetrateForce=300
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter_C'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AR23.AR23-HFire',Volume=1.7500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	PushbackForce=300.0000000
	Chaos=0.5000000
	Inaccuracy=(X=1,Y=1)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticPrimaryEffectParams_Supp'
begin object name="RealisticPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=125
	HeadMult=2.1000000
	LimbMult=0.6600000
	DamageType=Class'BWBP_SKC_Pro.DT_AR23HR'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AR23HRHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AR23HR'
	PenetrationEnergy=48.0000000
	PenetrateForce=300
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AR23.AR23-Sil',Volume=1.5500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	Recoil=1024.0000000
	PushbackForce=250.0000000
	Chaos=0.5000000
	Inaccuracy=(X=1,Y=1)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
begin object name="RealisticPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.1850000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticPrimaryEffectParams_Supp'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=36
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=2000.0000000,Max=4000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.3000000
	Damage=25
	LimbMult=1.0000000
	DamageType=Class'BWBP_SKC_Pro.DT_AR23Flak'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AR23Flak'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AR23Flak'
	PenetrationEnergy=16.0000000
	PenetrateForce=500
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.Misc.Flak-Fire',Volume=1.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=0.5000000
	Inaccuracy=(X=1600,Y=1600)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Adv Holo"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2700000
	WeaponBoneScales[0]=(BoneName="IronsRear",Slot=51,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="GLIrons",Slot=52,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Holo",Slot=53,Scale=1.0000000)
	WeaponName="AR-23 .50 Heavy Rifle"
	MagAmmo=9
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="2 Shot Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticParams_4X'
begin object name="RealisticParams_4X" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="4X Scope"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="IronsFront",Slot=50,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="IronsRear",Slot=51,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="GLIrons",Slot=52,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="Holo",Slot=53,Scale=0.0000000)
	WeaponBoneScales[4]=(BoneName="MuzzleAttachment",Slot=54,Scale=1.0000000)
	WeaponName="AR-23 .50 Heavy Rifle (4X)"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ACOG',BoneName="tip",Scale=0.1200000,AugmentOffset=(X=-25.0000000,Y=0.0000000,Z=-1.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=0))
	MagAmmo=9
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="2 Shot Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticRecoilParams_Scope'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticParams_8X'
begin object name="RealisticParams_8X" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="8X Scope"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3300000
	ZoomType=2
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MinZoom=4.0000000
	MaxZoom=8.0000000
	ZoomStages=1
	WeaponBoneScales[0]=(BoneName="IronsFront",Slot=50,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="IronsRear",Slot=51,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="GLIrons",Slot=52,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="Holo",Slot=53,Scale=0.0000000)
	WeaponBoneScales[4]=(BoneName="MuzzleAttachment",Slot=54,Scale=1.0000000)
	WeaponName="AR-23 .50 Heavy Rifle (8X)"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_8XScope',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-25.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=0))
	MagAmmo=9
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="2 Shot Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticRecoilParams_Scope'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticParams_Supp'
begin object name="RealisticParams_Supp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Suppressor"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2700000
	WeaponBoneScales[0]=(BoneName="IronsFront",Slot=50,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="IronsRear",Slot=51,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="GLIrons",Slot=52,Scale=1.0000000)
	WeaponBoneScales[3]=(BoneName="Holo",Slot=53,Scale=0.0000000)
	WeaponBoneScales[4]=(BoneName="MuzzleAttachment",Slot=54,Scale=0.0000000)
	WeaponName="AR-23 .50 Heavy Rifle"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.2000000,AugmentOffset=(X=-3.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=32768))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_Holo',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-25.0000000,Y=0.0000000,Z=-1.1000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=32768))
	MagAmmo=9
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="2 Shot Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticParams_Irons'
begin object name="RealisticParams_Irons" class=BCoreProV55.WeaponParams
	Weight=3
	LayoutName="Iron Sights"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2300000
	WeaponBoneScales[0]=(BoneName="IronsFront",Slot=50,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="IronsRear",Slot=51,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="GLIrons",Slot=52,Scale=1.0000000)
	WeaponBoneScales[3]=(BoneName="Holo",Slot=53,Scale=0.0000000)
	WeaponBoneScales[4]=(BoneName="MuzzleAttachment",Slot=54,Scale=1.0000000)
	WeaponName="AR-23 .50 Heavy Rifle"
	MagAmmo=9
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="2 Shot Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsRealistic.AR23_Tan'
begin object name="AR23_Tan" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Tan"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsRealistic.AR23_Digital'
begin object name="AR23_Digital" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Digital"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MainDigital",Index=1,pIndex=5,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsRealistic.AR23_Winter'
begin object name="AR23_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MainWinterShine",Index=1,pIndex=5,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MiscWinterShine",Index=2,pIndex=6,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsRealistic.AR23_Meat'
begin object name="AR23_Meat" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Meat"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MainMeat",Index=1,pIndex=5,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MiscMeat",Index=2,pIndex=6,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsRealistic.AR23_Gold'
begin object name="AR23_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MainGold",Index=1,pIndex=5,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MiscGold",Index=2,pIndex=6,AIndex=1)
	Index=4
end object
