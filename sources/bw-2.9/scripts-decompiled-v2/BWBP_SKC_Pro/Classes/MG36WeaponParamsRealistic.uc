class MG36WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticParams_LMG'
	begin object name="RealisticParams_LMG" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="LMG"
		LayoutTags="lmg"
		PlayerSpeedFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		ZoomType=2
		WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="MagDrum",Slot=31,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=0.0000000)
		WeaponName="Mk 88 5.56mm Squad Automatic Weapon"
		MagAmmo=100
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticRecoilParams_Scope'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticAimParams_LMG'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticPrimaryFireParams_LMG'
	end object
	Layouts[0]=RealisticParams_LMG
	// Reference: WeaponParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticParams_AR'
	begin object name="RealisticParams_AR" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Assault Rifle"
		LayoutTags="ar"
		PlayerSpeedFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=-3.0000000,Y=0.3250000,Z=1.4300000)
		WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="MagDrum",Slot=31,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="Scope",Slot=33,Scale=0.0000000)
		WeaponName="Mk 88 5.56mm Squad Automatic Weapon"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-49.5000000,Y=-2.8000000,Z=0.1000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticAimParams_AR'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticPrimaryFireParams_AR'
	end object
	Layouts[1]=RealisticParams_AR
	// Reference: WeaponParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticParams_Gauss'
	begin object name="RealisticParams_Gauss" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Gauss Rifle"
		LayoutTags="gauss"
		PlayerSpeedFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		ZoomType=2
		WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="MagDrum",Slot=31,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=1.0000000)
		WeaponName="Mk 88 5.56mm Gauss Rifle"
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Full-Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Fart-Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticRecoilParams_Scope'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticAimParams_LMG'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticPrimaryFireParams_Gauss'
	end object
	Layouts[2]=RealisticParams_Gauss
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsRealistic.MG36_Gray'
	begin object name="MG36_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=MG36_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsRealistic.MG36_Desert'
	begin object name="MG36_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainDesert",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscDesert",Index=2,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=MG36_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsRealistic.MG36_HexGreen'
	begin object name="MG36_HexGreen" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainJungle",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscJungle",Index=2,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=MG36_HexGreen
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsRealistic.MG36_Hunter'
	begin object name="MG36_Hunter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jaeger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainJaeger",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscJaeger",Index=2,pIndex=1,AIndex=1)
		Index=3
	end object
	Camos[3]=MG36_Hunter
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsRealistic.MG36_Winter'
	begin object name="MG36_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainWinter",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscWinter",Index=2,pIndex=1,AIndex=1)
		Index=4
	end object
	Camos[4]=MG36_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsRealistic.MG36_Pink'
	begin object name="MG36_Pink" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Pink"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainPink",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscPink",Index=2,pIndex=1,AIndex=1)
		Index=5
	end object
	Camos[5]=MG36_Pink
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsRealistic.MG36_Gold'
	begin object name="MG36_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainGold",Index=1,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=MG36_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticAimParams_LMG'
begin object name="RealisticAimParams_LMG" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=2872)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-5000,Roll=0)
	JumpOffset=(Pitch=-4000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.4500000
	FallingChaos=0.4500000
	SprintChaos=0.4500000
	ChaosDeclineTime=1.5000000
	ChaosSpeedThreshold=400
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticRecoilParams_Scope'
begin object name="RealisticRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=-0.1000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.2000000),(InVal=0.8000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4000000)))
	PitchFactor=0.2500000
	YawFactor=0.3000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=3200.0000000
	DeclineTime=0.7500000
	DeclineDelay=0.1450000
	ADSViewBindFactor=0.3500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticPrimaryEffectParams_LMG'
begin object name="RealisticPrimaryEffectParams_LMG" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1600.0000000,Max=8000.0000000)
	WaterTraceRange=5000.0000000
	Damage=45
	HeadMult=2.2500000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_MG36Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MG36AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MG36Assault'
	PenetrationEnergy=18.0000000
	PenetrateForce=55
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.JSOC.JSOC-Fire',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=440.0000000
	Chaos=0.0900000
	Inaccuracy=(X=3,Y=3)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticPrimaryFireParams_LMG'
begin object name="RealisticPrimaryFireParams_LMG" class=BCoreProV55.FireParams
	FireInterval=0.0850000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticPrimaryEffectParams_LMG'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticPrimaryEffectParams_AR'
begin object name="RealisticPrimaryEffectParams_AR" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1600.0000000,Max=8000.0000000)
	WaterTraceRange=5000.0000000
	Damage=45
	HeadMult=2.2500000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_MG36Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MG36AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MG36Assault'
	PenetrationEnergy=18.0000000
	PenetrateForce=55
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.JSOC.JSOC-FireAR',Volume=1.7500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=540.0000000
	Chaos=0.0900000
	Inaccuracy=(X=3,Y=3)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticPrimaryFireParams_AR'
begin object name="RealisticPrimaryFireParams_AR" class=BCoreProV55.FireParams
	FireInterval=0.0850000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticPrimaryEffectParams_AR'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticPrimaryEffectParams_Gauss'
begin object name="RealisticPrimaryEffectParams_Gauss" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1600.0000000,Max=8000.0000000)
	WaterTraceRange=5000.0000000
	Damage=145
	HeadMult=2.2500000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_MG36Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MG36AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MG36Assault'
	PenetrationEnergy=150.0000000
	PenetrateForce=300
	bPenetrate=true
	PDamageFactor=0.8000000
	WallPDamageFactor=0.6000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.JSOC.JSOC-FireGauss',Volume=1.7500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1940.0000000
	PushbackForce=150.0000000
	Chaos=0.0900000
	Inaccuracy=(X=3,Y=3)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticPrimaryFireParams_Gauss'
begin object name="RealisticPrimaryFireParams_Gauss" class=BCoreProV55.FireParams
	FireInterval=0.2850000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticPrimaryEffectParams_Gauss'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=-0.1000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.2000000),(InVal=0.8000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4000000)))
	PitchFactor=0.2500000
	YawFactor=0.3000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=3200.0000000
	DeclineTime=0.7500000
	DeclineDelay=0.1450000
	ViewBindFactor=0.3500000
	ADSViewBindFactor=0.3500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticAimParams_AR'
begin object name="RealisticAimParams_AR" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=1972)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-5000,Roll=0)
	JumpOffset=(Pitch=-4000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.4500000
	ChaosSpeedThreshold=450
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticParams_LMG'
begin object name="RealisticParams_LMG" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="LMG"
	LayoutTags="lmg"
	PlayerSpeedFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	ZoomType=2
	WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="MagDrum",Slot=31,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=0.0000000)
	WeaponName="Mk 88 5.56mm Squad Automatic Weapon"
	MagAmmo=100
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticRecoilParams_Scope'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticAimParams_LMG'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticPrimaryFireParams_LMG'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticParams_AR'
begin object name="RealisticParams_AR" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Assault Rifle"
	LayoutTags="ar"
	PlayerSpeedFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=-3.0000000,Y=0.3250000,Z=1.4300000)
	WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="MagDrum",Slot=31,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="Scope",Slot=33,Scale=0.0000000)
	WeaponName="Mk 88 5.56mm Squad Automatic Weapon"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-49.5000000,Y=-2.8000000,Z=0.1000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticAimParams_AR'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticPrimaryFireParams_AR'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticParams_Gauss'
begin object name="RealisticParams_Gauss" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Gauss Rifle"
	LayoutTags="gauss"
	PlayerSpeedFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	ZoomType=2
	WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="MagDrum",Slot=31,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=1.0000000)
	WeaponName="Mk 88 5.56mm Gauss Rifle"
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Full-Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Fart-Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticRecoilParams_Scope'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticAimParams_LMG'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MG36WeaponParamsRealistic.RealisticPrimaryFireParams_Gauss'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsRealistic.MG36_Gray'
begin object name="MG36_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsRealistic.MG36_Desert'
begin object name="MG36_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainDesert",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscDesert",Index=2,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsRealistic.MG36_HexGreen'
begin object name="MG36_HexGreen" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainJungle",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscJungle",Index=2,pIndex=1,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsRealistic.MG36_Hunter'
begin object name="MG36_Hunter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jaeger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainJaeger",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscJaeger",Index=2,pIndex=1,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsRealistic.MG36_Winter'
begin object name="MG36_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainWinter",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscWinter",Index=2,pIndex=1,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsRealistic.MG36_Pink'
begin object name="MG36_Pink" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Pink"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainPink",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscPink",Index=2,pIndex=1,AIndex=1)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsRealistic.MG36_Gold'
begin object name="MG36_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainGold",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
