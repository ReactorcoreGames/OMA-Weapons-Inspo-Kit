class AH250WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicParams_Laser'
	begin object name="ClassicParams_Laser" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName=".44 Laser"
		LayoutTags="laser"
		InventorySize=4
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=-11.0000000,Y=0.0000000,Z=1.3900000)
		WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
		ViewOffset=(X=1.0000000,Y=5.0000000,Z=-2.0000000)
		MagAmmo=8
		bNeedCock=true
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicPrimaryFireParams'
	end object
	Layouts[0]=ClassicParams_Laser
	// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicParams_RDS'
	begin object name="ClassicParams_RDS" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName=".44 RDS"
		InventorySize=4
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=-11.0000000,Y=0.0000000,Z=2.7800000)
		WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
		ViewOffset=(X=1.0000000,Y=5.0000000,Z=-1.8000000)
		MagAmmo=8
		bNeedCock=true
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicPrimaryFireParams'
	end object
	Layouts[1]=ClassicParams_RDS
	// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicParams_ScopeComp'
	begin object name="ClassicParams_ScopeComp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName=".44 Marksman"
		InventorySize=4
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=18.5000000,Y=0.0000000,Z=2.7500000)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
		MaxZoom=3.0000000
		WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=1.0000000)
		WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=1.0000000)
		ViewOffset=(X=1.0000000,Y=5.0000000,Z=-1.8000000)
		MagAmmo=8
		bNeedCock=true
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicRecoilParams_Compensated'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicAimParams_Compensated'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicPrimaryFireParams_Compensated'
	end object
	Layouts[2]=ClassicParams_ScopeComp
	// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicParams_50'
	begin object name="ClassicParams_50" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName=".50"
		InventorySize=4
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=-11.0000000,Y=0.0000000,Z=1.3900000)
		WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
		ViewOffset=(X=1.0000000,Y=5.0000000,Z=-2.0000000)
		MagAmmo=7
		bNeedCock=true
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicPrimaryFireParams_50'
	end object
	Layouts[3]=ClassicParams_50
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsClassic.Eagle_Silver'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsClassic.Eagle_Black'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsClassic.Eagle_TwoTone'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsClassic.Eagle_Chromed'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsClassic.Eagle_Gold'
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
// Reference: RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.4000000
	MaxRecoil=8192.0000000
	DeclineTime=0.6000000
	DeclineDelay=0.2000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.3000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=96,Max=2900)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.1500000
	JumpChaos=0.2500000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.9000000
	ChaosSpeedThreshold=950
end object
// Reference: FireParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.5500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicPrimaryEffectParams_Compensated'
begin object name="ClassicPrimaryEffectParams_Compensated" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=9000.0000000)
	WaterTraceRange=7200.0000000
	RangeAtten=0.8500000
	Damage=65
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
	FlashScaleFactor=0.3000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Eagle.Eagle-Fire3',Volume=4.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=4,Y=4)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicPrimaryFireParams_Compensated'
begin object name="ClassicPrimaryFireParams_Compensated" class=BCoreProV55.FireParams
	FireInterval=0.5500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicPrimaryEffectParams_Compensated'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=9000.0000000)
	WaterTraceRange=7200.0000000
	RangeAtten=0.8000000
	Damage=65
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
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Eagle.Eagle-Fire4',Volume=4.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=4096.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=8,Y=8)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicPrimaryEffectParams_50'
begin object name="ClassicPrimaryEffectParams_50" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=9000.0000000,Max=10000.0000000)
	WaterTraceRange=7200.0000000
	RangeAtten=0.8500000
	Damage=80
	HeadMult=1.5000000
	LimbMult=0.3750000
	DamageType=Class'BWBP_SKC_Pro.DTAH250Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTAH250PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTAH250Pistol'
	PenetrationEnergy=32.0000000
	PenetrateForce=250
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.Eagle.Eagle50-Fire',Volume=5.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=5000.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=8,Y=8)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicPrimaryFireParams_50'
begin object name="ClassicPrimaryFireParams_50" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicPrimaryEffectParams_50'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicRecoilParams_Compensated'
begin object name="ClassicRecoilParams_Compensated" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.6000000
	YRandFactor=0.9000000
	MaxRecoil=7168.0000000
	DeclineTime=1.6000000
	DeclineDelay=0.2000000
	ViewBindFactor=0.5500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicAimParams_Compensated'
begin object name="ClassicAimParams_Compensated" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=2900)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.1500000
	JumpChaos=0.3000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.4000000
	ChaosSpeedThreshold=950
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicParams_Laser'
begin object name="ClassicParams_Laser" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName=".44 Laser"
	LayoutTags="laser"
	InventorySize=4
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=-11.0000000,Y=0.0000000,Z=1.3900000)
	WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
	ViewOffset=(X=1.0000000,Y=5.0000000,Z=-2.0000000)
	MagAmmo=8
	bNeedCock=true
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicPrimaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicParams_RDS'
begin object name="ClassicParams_RDS" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName=".44 RDS"
	InventorySize=4
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=-11.0000000,Y=0.0000000,Z=2.7800000)
	WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
	ViewOffset=(X=1.0000000,Y=5.0000000,Z=-1.8000000)
	MagAmmo=8
	bNeedCock=true
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicPrimaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicParams_ScopeComp'
begin object name="ClassicParams_ScopeComp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName=".44 Marksman"
	InventorySize=4
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=18.5000000,Y=0.0000000,Z=2.7500000)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
	MaxZoom=3.0000000
	WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=1.0000000)
	WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=1.0000000)
	ViewOffset=(X=1.0000000,Y=5.0000000,Z=-1.8000000)
	MagAmmo=8
	bNeedCock=true
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicRecoilParams_Compensated'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicAimParams_Compensated'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicPrimaryFireParams_Compensated'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicParams_50'
begin object name="ClassicParams_50" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName=".50"
	InventorySize=4
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=-11.0000000,Y=0.0000000,Z=1.3900000)
	WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
	ViewOffset=(X=1.0000000,Y=5.0000000,Z=-2.0000000)
	MagAmmo=7
	bNeedCock=true
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsClassic.ClassicPrimaryFireParams_50'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsClassic.Eagle_Silver'
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
// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsClassic.Eagle_Black'
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
// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsClassic.Eagle_TwoTone'
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
// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsClassic.Eagle_Chromed'
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
// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsClassic.Eagle_Gold'
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
