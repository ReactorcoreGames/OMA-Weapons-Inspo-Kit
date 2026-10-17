class R9A1WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Iron Sights"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=-5.0000000,Y=0.0000000,Z=2.0000000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=58,Scale=0.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.R9_FPm'
		MagAmmo=10
		bNeedCock=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Freeze",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Heat Ray",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicFreezeFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicHeatFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicParams_Holosight'
	begin object name="ClassicParams_Holosight" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Holosight"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=-5.0000000,Y=-0.0200000,Z=3.1000000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=58,Scale=1.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.R9_FPm'
		MagAmmo=10
		bNeedCock=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Freeze",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Heat Ray",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicFreezeFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicHeatFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_Holosight
	// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicParams_Scoped'
	begin object name="ClassicParams_Scoped" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Hybrid Scope"
		LayoutTags="hybrid"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4500000
		SightOffset=(X=0.0000000,Y=0.3600000,Z=4.7500000)
		SightPivot=(Pitch=0,Yaw=0,Roll=11800)
		MinZoom=2.0000000
		MaxZoom=8.0000000
		ZoomStages=1
		WeaponBoneScales[0]=(BoneName="Optics",Slot=55,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="EOTech",Slot=56,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="Scope",Slot=57,Scale=1.0000000)
		MagAmmo=10
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicFreezeFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicHeatFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[2]=ClassicParams_Scoped
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsClassic.R9_Orange'
	begin object name="R9_Orange" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Orange"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.R9.USSRSkin',MaterialName="",Index=1,pIndex=0,AIndex=0)
	end object
	Camos[0]=R9_Orange
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsClassic.R9_OrangeShine'
	begin object name="R9_OrangeShine" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Fresh Orange"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH2",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=R9_OrangeShine
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsClassic.R9_Gray'
	begin object name="R9_Gray" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH4",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=R9_Gray
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsClassic.R9_Jungle'
	begin object name="R9_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH3",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=R9_Jungle
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsClassic.R9_Winter'
	begin object name="R9_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH5",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=R9_Winter
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsClassic.R9_IceFire'
	begin object name="R9_IceFire" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Fire & Ice"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH1",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=R9_IceFire
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=8,Max=3072)
	AimAdjustTime=0.6000000
	CrouchMultiplier=0.3000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.2500000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=600
end object
// Reference: RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=2048.0000000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.3000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicHeatFireParams'
begin object name="ClassicHeatFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicHeatEffectParams'
end object
// Reference: FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicFreezeFireParams'
begin object name="ClassicFreezeFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicFreezeEffectParams'
end object
// Reference: FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=72
	HeadMult=1.7000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_OP_Pro.DTR9A1Rifle'
	DamageTypeHead=Class'BWBP_OP_Pro.DTR9A1RifleHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTR9A1Rifle'
	PenetrationEnergy=48.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-Fire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=128.0000000
	Chaos=-1.0000000
	BotRefireRate=0.1500000
	WarnTargetPct=0.0500000
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicFreezeEffectParams'
begin object name="ClassicFreezeEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	RangeAtten=0.5000000
	Damage=35
	HeadMult=1.5000000
	LimbMult=0.8500000
	DamageType=Class'BWBP_OP_Pro.DTR9A1Rifle_Freeze'
	DamageTypeHead=Class'BWBP_OP_Pro.DTR9A1RifleHead_Freeze'
	DamageTypeArm=Class'BWBP_OP_Pro.DTR9A1Rifle_Freeze'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.R9FlashEmitter'
	FlashScaleFactor=1.4000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-Fire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=192.0000000
	Chaos=0.4500000
	BotRefireRate=0.6000000
	WarnTargetPct=0.3500000
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicHeatEffectParams'
begin object name="ClassicHeatEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.5000000
	Damage=20
	HeadMult=1.5000000
	LimbMult=0.8500000
	DamageType=Class'BWBP_OP_Pro.DTR9A1Rifle_Laser'
	DamageTypeHead=Class'BWBP_OP_Pro.DTR9A1RifleHead_Laser'
	DamageTypeArm=Class'BWBP_OP_Pro.DTR9A1Rifle_Laser'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.R9FlashEmitter'
	FlashScaleFactor=1.4000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-Fire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=192.0000000
	Chaos=0.4500000
	BotRefireRate=0.6000000
	WarnTargetPct=0.3500000
end object
// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Iron Sights"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=-5.0000000,Y=0.0000000,Z=2.0000000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=58,Scale=0.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.R9_FPm'
	MagAmmo=10
	bNeedCock=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Freeze",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Heat Ray",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicFreezeFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicHeatFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicParams_Holosight'
begin object name="ClassicParams_Holosight" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Holosight"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=-5.0000000,Y=-0.0200000,Z=3.1000000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=58,Scale=1.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.R9_FPm'
	MagAmmo=10
	bNeedCock=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Freeze",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Heat Ray",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicFreezeFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicHeatFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicParams_Scoped'
begin object name="ClassicParams_Scoped" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Hybrid Scope"
	LayoutTags="hybrid"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4500000
	SightOffset=(X=0.0000000,Y=0.3600000,Z=4.7500000)
	SightPivot=(Pitch=0,Yaw=0,Roll=11800)
	MinZoom=2.0000000
	MaxZoom=8.0000000
	ZoomStages=1
	WeaponBoneScales[0]=(BoneName="Optics",Slot=55,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="EOTech",Slot=56,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="Scope",Slot=57,Scale=1.0000000)
	MagAmmo=10
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicFreezeFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsClassic.ClassicHeatFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsClassic.R9_Orange'
begin object name="R9_Orange" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Orange"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.R9.USSRSkin',MaterialName="",Index=1,pIndex=0,AIndex=0)
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsClassic.R9_OrangeShine'
begin object name="R9_OrangeShine" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Fresh Orange"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH2",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsClassic.R9_Gray'
begin object name="R9_Gray" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH4",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsClassic.R9_Jungle'
begin object name="R9_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH3",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsClassic.R9_Winter'
begin object name="R9_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH5",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsClassic.R9_IceFire'
begin object name="R9_IceFire" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Fire & Ice"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH1",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
