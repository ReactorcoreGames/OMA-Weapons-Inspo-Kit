class R9A1WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Hybrid Scope"
		LayoutTags="hybrid"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2800000
		SightOffset=(X=0.0000000,Y=0.3600000,Z=4.7500000)
		SightPivot=(Pitch=0,Yaw=0,Roll=11800)
		WeaponBoneScales[0]=(BoneName="Optics",Slot=55,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="EOTech",Slot=56,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="Scope",Slot=57,Scale=1.0000000)
		WeaponName="R9E2 .308 Ranger Rifle"
		MagAmmo=12
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticFreezeFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticHeatFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticParams_Holo'
	begin object name="RealisticParams_Holo" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Holosight"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2300000
		SightOffset=(X=-5.0000000,Y=-0.0200000,Z=3.1000000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=58,Scale=1.0000000)
		WeaponName="R9 .308 Ranger Rifle"
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.R9_FPm'
		MagAmmo=12
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticFreezeFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticHeatFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_Holo
	// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticParams_Irons'
	begin object name="RealisticParams_Irons" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Iron Sights"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2300000
		SightOffset=(X=-5.0000000,Y=0.0000000,Z=2.0000000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=58,Scale=0.0000000)
		WeaponName="R9 .308 Ranger Rifle"
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.R9_FPm'
		MagAmmo=12
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticFreezeFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticHeatFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[2]=RealisticParams_Irons
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsRealistic.R9_Orange'
	begin object name="R9_Orange" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Orange"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.R9.USSRSkin',MaterialName="",Index=1,pIndex=0,AIndex=0)
	end object
	Camos[0]=R9_Orange
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsRealistic.R9_OrangeShine'
	begin object name="R9_OrangeShine" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Fresh Orange"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH2",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=R9_OrangeShine
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsRealistic.R9_Gray'
	begin object name="R9_Gray" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH4",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=R9_Gray
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsRealistic.R9_Jungle'
	begin object name="R9_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH3",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=R9_Jungle
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsRealistic.R9_Winter'
	begin object name="R9_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH5",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=R9_Winter
	// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsRealistic.R9_IceFire'
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
// Reference: AimParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=680,Max=1664)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-4096,Yaw=-3072,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.1250000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.2000000
	ChaosSpeedThreshold=550
end object
// Reference: RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.6000000
	YawFactor=0.1000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=2560.0000000
	DeclineTime=0.8000000
	DeclineDelay=0.1900000
	ViewBindFactor=0.5000000
	ADSViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticHeatFireParams'
begin object name="RealisticHeatFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2250000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticHeatEffectParams'
end object
// Reference: FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticFreezeFireParams'
begin object name="RealisticFreezeFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2250000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticFreezeEffectParams'
end object
// Reference: FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=2.0000000
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=2000.0000000,Max=10000.0000000)
	WaterTraceRange=5000.0000000
	Damage=93
	HeadMult=2.3870960
	LimbMult=0.6774190
	DamageType=Class'BWBP_OP_Pro.DTR9A1Rifle'
	DamageTypeHead=Class'BWBP_OP_Pro.DTR9A1RifleHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTR9A1Rifle'
	PenetrationEnergy=27.0000000
	PenetrateForce=200
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	Chaos=0.1000000
	Inaccuracy=(X=9,Y=9)
	BotRefireRate=0.1500000
	WarnTargetPct=0.0500000
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticFreezeEffectParams'
begin object name="RealisticFreezeEffectParams" class=BCoreProV55.InstantEffectParams
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
// Reference: InstantEffectParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticHeatEffectParams'
begin object name="RealisticHeatEffectParams" class=BCoreProV55.InstantEffectParams
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
// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Hybrid Scope"
	LayoutTags="hybrid"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2800000
	SightOffset=(X=0.0000000,Y=0.3600000,Z=4.7500000)
	SightPivot=(Pitch=0,Yaw=0,Roll=11800)
	WeaponBoneScales[0]=(BoneName="Optics",Slot=55,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="EOTech",Slot=56,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="Scope",Slot=57,Scale=1.0000000)
	WeaponName="R9E2 .308 Ranger Rifle"
	MagAmmo=12
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticFreezeFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticHeatFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticParams_Holo'
begin object name="RealisticParams_Holo" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Holosight"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2300000
	SightOffset=(X=-5.0000000,Y=-0.0200000,Z=3.1000000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=58,Scale=1.0000000)
	WeaponName="R9 .308 Ranger Rifle"
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.R9_FPm'
	MagAmmo=12
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticFreezeFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticHeatFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticParams_Irons'
begin object name="RealisticParams_Irons" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Iron Sights"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2300000
	SightOffset=(X=-5.0000000,Y=0.0000000,Z=2.0000000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=58,Scale=0.0000000)
	WeaponName="R9 .308 Ranger Rifle"
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.R9_FPm'
	MagAmmo=12
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticFreezeFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.R9A1WeaponParamsRealistic.RealisticHeatFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsRealistic.R9_Orange'
begin object name="R9_Orange" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Orange"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.R9.USSRSkin',MaterialName="",Index=1,pIndex=0,AIndex=0)
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsRealistic.R9_OrangeShine'
begin object name="R9_OrangeShine" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Fresh Orange"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH2",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsRealistic.R9_Gray'
begin object name="R9_Gray" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH4",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsRealistic.R9_Jungle'
begin object name="R9_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH3",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsRealistic.R9_Winter'
begin object name="R9_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH5",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_OP_Pro.R9A1WeaponParamsRealistic.R9_IceFire'
begin object name="R9_IceFire" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Fire & Ice"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH1",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
