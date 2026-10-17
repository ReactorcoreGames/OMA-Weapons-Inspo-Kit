class R9A1WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Hybrid Scope"
		LayoutTags="hybrid"
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.4000000
		SightOffset=(X=0.0000000,Y=0.3600000,Z=4.7500000)
		SightPivot=(Pitch=0,Yaw=0,Roll=11800)
		ScopeScale=0.7000000
		MinZoom=4.0000000
		MaxZoom=8.0000000
		ZoomStages=1
		WeaponBoneScales[0]=(BoneName="Optics",Slot=55,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="EOTech",Slot=56,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="Scope",Slot=57,Scale=1.0000000)
		MagAmmo=12
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalAimParams_Scope'
		FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalFreezeFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalHeatFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalParams_Holo'
	begin object name="TacticalParams_Holo" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Holosight"
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.4000000
		SightOffset=(X=-5.0000000,Y=-0.0200000,Z=3.1000000)
		ScopeScale=0.7000000
		WeaponBoneScales[0]=(BoneName="RDS",Slot=58,Scale=1.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.R9_FPm'
		MagAmmo=12
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalFreezeFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalHeatFireParams'
	end object
	Layouts[1]=TacticalParams_Holo
	// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalParams_IRONS'
	begin object name="TacticalParams_IRONS" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Iron Sights"
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.4000000
		SightOffset=(X=-5.0000000,Y=0.0000000,Z=2.0000000)
		ScopeScale=0.7000000
		WeaponBoneScales[0]=(BoneName="RDS",Slot=58,Scale=0.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.R9_FPm'
		MagAmmo=12
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalFreezeFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalHeatFireParams'
	end object
	Layouts[2]=TacticalParams_IRONS
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsTactical.R9_IceFire'
	begin object name="R9_IceFire" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Fire & Ice"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_OP_Tex.R9A1.R9_body_SH1",Index=1,pIndex=0,AIndex=0)
	end object
	Camos[0]=R9_IceFire
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsTactical.R9_OrangeShine'
	begin object name="R9_OrangeShine" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Fresh Orange"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH2",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=R9_OrangeShine
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsTactical.R9_Jungle'
	begin object name="R9_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH3",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=R9_Jungle
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsTactical.R9_Orange'
	begin object name="R9_Orange" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Orange"
		Index=3
	end object
	Camos[3]=R9_Orange
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsTactical.R9_Gray'
	begin object name="R9_Gray" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH4",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=R9_Gray
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsTactical.R9_Winter'
	begin object name="R9_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH5",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=R9_Winter
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1000000),(InVal=0.3500000,OutVal=0.2500000),(InVal=0.5000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.3500000),(InVal=0.8500000,OutVal=0.4200000),(InVal=1.0000000,OutVal=0.4500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1750000),(InVal=0.4000000,OutVal=0.4500000),(InVal=0.7000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0800000
	DeclineTime=1.0000000
	DeclineDelay=0.3500000
	ViewBindFactor=0.3500000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalHeatFireParams'
begin object name="TacticalHeatFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalHeatEffectParams'
end object
// Reference: FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalFreezeFireParams'
begin object name="TacticalFreezeFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalFreezeEffectParams'
end object
// Reference: FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireEndAnim="None"
	FireAnimRate=0.9000000
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: AimParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=384,Max=1280)
	AimAdjustTime=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	RangeAtten=0.7500000
	Damage=70
	HeadMult=3.0000000
	DamageType=Class'BWBP_OP_Pro.DTR9A1Rifle'
	DamageTypeHead=Class'BWBP_OP_Pro.DTR9A1RifleHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTR9A1Rifle'
	PenetrationEnergy=48.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.R9FlashEmitter'
	FlashScaleFactor=1.4000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-Fire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.4500000
	BotRefireRate=0.6000000
	WarnTargetPct=0.3500000
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalFreezeEffectParams'
begin object name="TacticalFreezeEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	RangeAtten=0.7500000
	Damage=40
	HeadMult=3.0000000
	DamageType=Class'BWBP_OP_Pro.DTR9A1Rifle_Freeze'
	DamageTypeHead=Class'BWBP_OP_Pro.DTR9A1RifleHead_Freeze'
	DamageTypeArm=Class'BWBP_OP_Pro.DTR9A1Rifle_Freeze'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.R9FlashEmitter'
	FlashScaleFactor=1.4000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-Fire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.4500000
	BotRefireRate=0.6000000
	WarnTargetPct=0.3500000
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalHeatEffectParams'
begin object name="TacticalHeatEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.7500000
	Damage=40
	HeadMult=3.0000000
	DamageType=Class'BWBP_OP_Pro.DTR9A1Rifle_Laser'
	DamageTypeHead=Class'BWBP_OP_Pro.DTR9A1RifleHead_Laser'
	DamageTypeArm=Class'BWBP_OP_Pro.DTR9A1Rifle_Laser'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.R9FlashEmitter'
	FlashScaleFactor=1.4000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-Fire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.4500000
	BotRefireRate=0.6000000
	WarnTargetPct=0.3500000
end object
// Reference: AimParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalAimParams_Scope'
begin object name="TacticalAimParams_Scope" class=BCoreProV55.AimParams
	AimSpread=(Min=384,Max=1280)
	AimAdjustTime=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Hybrid Scope"
	LayoutTags="hybrid"
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.4000000
	SightOffset=(X=0.0000000,Y=0.3600000,Z=4.7500000)
	SightPivot=(Pitch=0,Yaw=0,Roll=11800)
	ScopeScale=0.7000000
	MinZoom=4.0000000
	MaxZoom=8.0000000
	ZoomStages=1
	WeaponBoneScales[0]=(BoneName="Optics",Slot=55,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="EOTech",Slot=56,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="Scope",Slot=57,Scale=1.0000000)
	MagAmmo=12
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalAimParams_Scope'
	FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalFreezeFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalHeatFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalParams_Holo'
begin object name="TacticalParams_Holo" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Holosight"
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.4000000
	SightOffset=(X=-5.0000000,Y=-0.0200000,Z=3.1000000)
	ScopeScale=0.7000000
	WeaponBoneScales[0]=(BoneName="RDS",Slot=58,Scale=1.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.R9_FPm'
	MagAmmo=12
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalFreezeFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalHeatFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalParams_IRONS'
begin object name="TacticalParams_IRONS" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Iron Sights"
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.4000000
	SightOffset=(X=-5.0000000,Y=0.0000000,Z=2.0000000)
	ScopeScale=0.7000000
	WeaponBoneScales[0]=(BoneName="RDS",Slot=58,Scale=0.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.R9_FPm'
	MagAmmo=12
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalFreezeFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsTactical.TacticalHeatFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsTactical.R9_IceFire'
begin object name="R9_IceFire" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Fire & Ice"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_OP_Tex.R9A1.R9_body_SH1",Index=1,pIndex=0,AIndex=0)
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsTactical.R9_OrangeShine'
begin object name="R9_OrangeShine" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Fresh Orange"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH2",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsTactical.R9_Jungle'
begin object name="R9_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH3",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsTactical.R9_Orange'
begin object name="R9_Orange" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Orange"
	Index=3
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsTactical.R9_Gray'
begin object name="R9_Gray" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH4",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsTactical.R9_Winter'
begin object name="R9_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH5",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
