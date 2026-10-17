class AH250WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticParams_Scope'
	begin object name="RealisticParams_Scope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName=".44 Marksman"
		InventorySize=3
		WeaponPrice=2000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=18.5000000,Y=0.0000000,Z=2.7500000)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
		MaxZoom=3.0000000
		WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=1.0000000)
		WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=1.0000000)
		ViewOffset=(X=1.0000000,Y=5.0000000,Z=-1.8000000)
		WeaponName="AH250 .44 Handgun (3X)"
		MagAmmo=8
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticRecoilParams_Compensated'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticAimParams_Compensated'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticPrimaryFireParams'
	end object
	Layouts[0]=RealisticParams_Scope
	// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticParams_RDS'
	begin object name="RealisticParams_RDS" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName=".44 RDS"
		InventorySize=3
		WeaponPrice=2000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1800000
		SightOffset=(X=-11.0000000,Y=0.0000000,Z=2.7800000)
		WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
		ViewOffset=(X=1.0000000,Y=5.0000000,Z=-1.8000000)
		WeaponName="AH250 .44 Handgun (RDS)"
		MagAmmo=8
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticPrimaryFireParams'
	end object
	Layouts[1]=RealisticParams_RDS
	// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticParams_Laser'
	begin object name="RealisticParams_Laser" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName=".44 Laser"
		LayoutTags="laser"
		InventorySize=3
		WeaponPrice=2000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1800000
		SightOffset=(X=-11.0000000,Y=0.0000000,Z=1.3900000)
		WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
		ViewOffset=(X=1.0000000,Y=5.0000000,Z=-1.8000000)
		WeaponName="AH250 .44 Scoped Handgun"
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticPrimaryFireParams'
	end object
	Layouts[2]=RealisticParams_Laser
	// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticParams_50'
	begin object name="RealisticParams_50" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName=".50"
		InventorySize=3
		WeaponPrice=2000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-11.0000000,Y=0.0000000,Z=1.3900000)
		WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
		ViewOffset=(X=1.0000000,Y=5.0000000,Z=-1.8000000)
		WeaponName="AH250 .50 Handgun"
		MagAmmo=7
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticPrimaryFireParams_50'
	end object
	Layouts[3]=RealisticParams_50
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsRealistic.Eagle_Silver'
	begin object name="Eagle_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-MainShine',MaterialName="",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-Misc',MaterialName="",Index=2,pIndex=-1,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeRed',MaterialName="",Index=3,pIndex=2,AIndex=3)
		WeaponMaterialSwaps[4]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-Front',MaterialName="",Index=4,pIndex=1,AIndex=4)
		WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDot',MaterialName="",Index=5,pIndex=-1,AIndex=5)
	end object
	Camos[0]=Eagle_Silver
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsRealistic.Eagle_Black'
	begin object name="Eagle_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-BlackShine",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-MiscBlack",Index=2,pIndex=-1,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-Scope",Index=3,pIndex=2,AIndex=3)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-FrontBlack",Index=4,pIndex=1,AIndex=4)
		WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen',MaterialName="",Index=5,pIndex=-1,AIndex=5)
		Index=1
	end object
	Camos[1]=Eagle_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsRealistic.Eagle_TwoTone'
	begin object name="Eagle_TwoTone" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Two-Tone"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-TwoToneShine",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-MiscBlack",Index=2,pIndex=-1,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-Scope",Index=3,pIndex=2,AIndex=3)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-FrontBlack",Index=4,pIndex=1,AIndex=4)
		WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen',MaterialName="",Index=5,pIndex=-1,AIndex=5)
		Index=2
	end object
	Camos[2]=Eagle_TwoTone
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsRealistic.Eagle_Chromed'
	begin object name="Eagle_Chromed" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Chromed"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-SilverShine",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-Misc',MaterialName="",Index=2,pIndex=-1,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeRed',MaterialName="",Index=3,pIndex=2,AIndex=3)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-FrontSilver",Index=4,pIndex=1,AIndex=4)
		WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen',MaterialName="",Index=5,pIndex=-1,AIndex=5)
		Index=3
	end object
	Camos[3]=Eagle_Chromed
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsRealistic.Eagle_Gold'
	begin object name="Eagle_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-MainGold-Shine",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-MagGold-Shine",Index=2,pIndex=-1,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-ScopeGold",Index=3,pIndex=2,AIndex=3)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-FrontGold-Shine",Index=4,pIndex=1,AIndex=4)
		WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen',MaterialName="",Index=5,pIndex=-1,AIndex=5)
		Index=4
	end object
	Camos[4]=Eagle_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.3000000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	YawFactor=0.4000000
	XRandFactor=1.0000000
	YRandFactor=1.0000000
	MaxRecoil=8192.0000000
	DeclineTime=0.8000000
	DeclineDelay=0.2000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=650,Max=2900)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.8200000
	ADSMultiplier=0.7700000
	SprintOffset=(Pitch=-4608,Yaw=-512,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.2500000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=1.0000000
	ChaosSpeedThreshold=1400
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=9000.0000000)
	WaterTraceRange=7200.0000000
	Damage=62
	HeadMult=1.5000000
	LimbMult=0.3750000
	DamageType=Class'BWBP_SKC_Pro.DTAH250Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTAH250PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTAH250Pistol'
	PenetrationEnergy=32.0000000
	PenetrateForce=200
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Eagle.Eagle-Fire4',Volume=1.7500000,Radius=512.0000000,Slot=3,Pitch=0.9000000,bAtten=false,bNoOverride=false)
	Recoil=2048.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=4,Y=4)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticPrimaryEffectParams_50'
begin object name="RealisticPrimaryEffectParams_50" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=9000.0000000)
	WaterTraceRange=7200.0000000
	Damage=70
	HeadMult=1.5000000
	LimbMult=0.3750000
	DamageType=Class'BWBP_SKC_Pro.DTAH250Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTAH250PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTAH250Pistol'
	PenetrationEnergy=32.0000000
	PenetrateForce=200
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.Eagle.Eagle50-Fire',Volume=5.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2548.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=4,Y=4)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticPrimaryFireParams_50'
begin object name="RealisticPrimaryFireParams_50" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.1000000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticPrimaryEffectParams_50'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticRecoilParams_Compensated'
begin object name="RealisticRecoilParams_Compensated" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.2000000
	XRandFactor=0.6000000
	YRandFactor=0.9000000
	MaxRecoil=7168.0000000
	DeclineTime=1.6000000
	DeclineDelay=0.2000000
	ViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticAimParams_Compensated'
begin object name="RealisticAimParams_Compensated" class=BCoreProV55.AimParams
	AimSpread=(Min=668,Max=2900)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.8200000
	ADSMultiplier=0.7700000
	SprintOffset=(Pitch=-4608,Yaw=-512,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.3000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=1.4000000
	ChaosSpeedThreshold=1400
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticParams_Scope'
begin object name="RealisticParams_Scope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName=".44 Marksman"
	InventorySize=3
	WeaponPrice=2000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=18.5000000,Y=0.0000000,Z=2.7500000)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
	MaxZoom=3.0000000
	WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=1.0000000)
	WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=1.0000000)
	ViewOffset=(X=1.0000000,Y=5.0000000,Z=-1.8000000)
	WeaponName="AH250 .44 Handgun (3X)"
	MagAmmo=8
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticRecoilParams_Compensated'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticAimParams_Compensated'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticPrimaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticParams_RDS'
begin object name="RealisticParams_RDS" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName=".44 RDS"
	InventorySize=3
	WeaponPrice=2000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1800000
	SightOffset=(X=-11.0000000,Y=0.0000000,Z=2.7800000)
	WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
	ViewOffset=(X=1.0000000,Y=5.0000000,Z=-1.8000000)
	WeaponName="AH250 .44 Handgun (RDS)"
	MagAmmo=8
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticPrimaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticParams_Laser'
begin object name="RealisticParams_Laser" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName=".44 Laser"
	LayoutTags="laser"
	InventorySize=3
	WeaponPrice=2000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1800000
	SightOffset=(X=-11.0000000,Y=0.0000000,Z=1.3900000)
	WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
	ViewOffset=(X=1.0000000,Y=5.0000000,Z=-1.8000000)
	WeaponName="AH250 .44 Scoped Handgun"
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticPrimaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticParams_50'
begin object name="RealisticParams_50" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName=".50"
	InventorySize=3
	WeaponPrice=2000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-11.0000000,Y=0.0000000,Z=1.3900000)
	WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
	ViewOffset=(X=1.0000000,Y=5.0000000,Z=-1.8000000)
	WeaponName="AH250 .50 Handgun"
	MagAmmo=7
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsRealistic.RealisticPrimaryFireParams_50'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsRealistic.Eagle_Silver'
begin object name="Eagle_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-MainShine',MaterialName="",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-Misc',MaterialName="",Index=2,pIndex=-1,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeRed',MaterialName="",Index=3,pIndex=2,AIndex=3)
	WeaponMaterialSwaps[4]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-Front',MaterialName="",Index=4,pIndex=1,AIndex=4)
	WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDot',MaterialName="",Index=5,pIndex=-1,AIndex=5)
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsRealistic.Eagle_Black'
begin object name="Eagle_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-BlackShine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-MiscBlack",Index=2,pIndex=-1,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-Scope",Index=3,pIndex=2,AIndex=3)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-FrontBlack",Index=4,pIndex=1,AIndex=4)
	WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen',MaterialName="",Index=5,pIndex=-1,AIndex=5)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsRealistic.Eagle_TwoTone'
begin object name="Eagle_TwoTone" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Two-Tone"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-TwoToneShine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-MiscBlack",Index=2,pIndex=-1,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-Scope",Index=3,pIndex=2,AIndex=3)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-FrontBlack",Index=4,pIndex=1,AIndex=4)
	WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen',MaterialName="",Index=5,pIndex=-1,AIndex=5)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsRealistic.Eagle_Chromed'
begin object name="Eagle_Chromed" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Chromed"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-SilverShine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-Misc',MaterialName="",Index=2,pIndex=-1,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeRed',MaterialName="",Index=3,pIndex=2,AIndex=3)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-FrontSilver",Index=4,pIndex=1,AIndex=4)
	WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen',MaterialName="",Index=5,pIndex=-1,AIndex=5)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsRealistic.Eagle_Gold'
begin object name="Eagle_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-MainGold-Shine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-MagGold-Shine",Index=2,pIndex=-1,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-ScopeGold",Index=3,pIndex=2,AIndex=3)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-FrontGold-Shine",Index=4,pIndex=1,AIndex=4)
	WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen',MaterialName="",Index=5,pIndex=-1,AIndex=5)
	Index=4
end object
