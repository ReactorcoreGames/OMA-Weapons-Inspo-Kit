class G51WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicParams_HoloChaff'
	begin object name="ClassicParams_HoloChaff" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Adv Holo + Chaff"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=-0.5000000,Y=-0.0100000,Z=3.1000000)
		WeaponBoneScales[0]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="HoloSightLower",Slot=55,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		ViewOffset=(X=5.0000000,Y=6.0000000,Z=-2.5000000)
		bNeedCock=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryFireParams_Chaff'
	end object
	Layouts[0]=ClassicParams_HoloChaff
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicParams_NoCarrySensor'
	begin object name="ClassicParams_NoCarrySensor" class=BCoreProV55.WeaponParams
		Weight=3
		LayoutName="Adv Holo + Sensor"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=-0.5000000,Y=0.0000000,Z=-0.1200000)
		WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=-1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=1.0000000)
		ViewOffset=(X=5.0000000,Y=6.0000000,Z=-2.5000000)
		bNeedCock=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryFireParams_Sensor'
	end object
	Layouts[1]=ClassicParams_NoCarrySensor
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicParams_IronsHE'
	begin object name="ClassicParams_IronsHE" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Iron Sights + HE"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-0.5000000,Y=0.0000000,Z=1.0000000)
		WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		ViewOffset=(X=5.0000000,Y=6.0000000,Z=-2.5000000)
		bNeedCock=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryFireParams_HE'
	end object
	Layouts[2]=ClassicParams_IronsHE
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicParams_4XScope'
	begin object name="ClassicParams_4XScope" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="4X Scope"
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.3000000
		SightOffset=(X=-0.5000000,Y=-0.0100000,Z=3.1000000)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		ViewOffset=(X=5.0000000,Y=6.0000000,Z=-2.5000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ACOG',BoneName="tip",Scale=0.1000000,AugmentOffset=(X=-25.0000000,Y=-4.6000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		bNeedCock=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
		bNoaltfire=true
	end object
	Layouts[3]=ClassicParams_4XScope
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicParams_IRScope'
	begin object name="ClassicParams_IRScope" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="IR Scope"
		LayoutTags="IR"
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=3.0000000,Y=-0.0100000,Z=0.5000000)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-IRScope'
		MaxZoom=3.0000000
		WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=-1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		ViewOffset=(X=5.0000000,Y=6.0000000,Z=-2.5000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_IRScope',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-27.0000000,Y=-2.6000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=-16384))
		bNeedCock=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[4]=ClassicParams_IRScope
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicParams_Suppressed'
	begin object name="ClassicParams_Suppressed" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Suppressed"
		LayoutTags="silencer"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-0.5000000,Y=0.0000000,Z=0.9000000)
		WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		ViewOffset=(X=5.0000000,Y=6.0000000,Z=-2.5000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.1500000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		bNeedCock=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimarySuppressedFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[5]=ClassicParams_Suppressed
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsClassic.G51_Black'
	begin object name="G51_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=G51_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsClassic.G51_Green'
	begin object name="G51_Green" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainGreen",Index=1,pIndex=1,AIndex=0)
		Index=1
	end object
	Camos[1]=G51_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsClassic.G51_GreenHex'
	begin object name="G51_GreenHex" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hex Green"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainHexG",Index=1,pIndex=1,AIndex=0)
		Index=2
	end object
	Camos[2]=G51_GreenHex
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsClassic.G51_BlueHex'
	begin object name="G51_BlueHex" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hex Blue"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainHexB",Index=1,pIndex=1,AIndex=0)
		Index=3
	end object
	Camos[3]=G51_BlueHex
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsClassic.G51_Desert'
	begin object name="G51_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainDesert",Index=1,pIndex=1,AIndex=0)
		Index=4
	end object
	Camos[4]=G51_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsClassic.G51_UTC'
	begin object name="G51_UTC" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="UTC"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.UTCG51Tex",Index=1,pIndex=1,AIndex=0)
		Index=5
	end object
	Camos[5]=G51_UTC
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsClassic.G51_Inferno'
	begin object name="G51_Inferno" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Inferno"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainRed",Index=1,pIndex=1,AIndex=0)
		Index=6
	end object
	Camos[6]=G51_Inferno
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsClassic.G51_Gold'
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
// Reference: AimParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2050)
	CrouchMultiplier=0.5000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-4000,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.0000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.4000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.6500000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=1.5000000
	YawFactor=0.4000000
	XRandFactor=1.0000000
	YRandFactor=0.2000000
	MaxRecoil=2048.0000000
	DeclineTime=1.5000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.6000000
	CrouchMultiplier=0.5000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0750000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
begin object name="ClassicSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=13000.0000000)
	WaterTraceRange=10400.0000000
	RangeAtten=0.9000000
	Damage=24
	HeadMult=3.1250000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_G51Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_G51AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_G51AssaultLimb'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51FlashEmitter'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.MJ51.SCAR-Fire',Volume=1.5000000,Radius=192.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=128.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=8,Y=8)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimarySuppressedEffectParams'
begin object name="ClassicPrimarySuppressedEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=13000.0000000)
	WaterTraceRange=10400.0000000
	RangeAtten=0.9000000
	Damage=24
	HeadMult=3.1250000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_G51Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_G51AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_G51AssaultLimb'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51FlashEmitter'
	FlashScaleFactor=0.0100000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-Silenced',Volume=2.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=110.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=8,Y=8)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimarySuppressedFireParams'
begin object name="ClassicPrimarySuppressedFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0750000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimarySuppressedEffectParams'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryEffectParams_Chaff'
begin object name="ClassicSecondaryEffectParams_Chaff" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=100.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.G51Grenade_Chaff'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3750.0000000
	MaxSpeed=4500.0000000
	Damage=65.0000000
	DamageRadius=192.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51AltFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryFireParams_Chaff'
begin object name="ClassicSecondaryFireParams_Chaff" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	BurstFireRateFactor=1.0000000
	FireAnim="FireGrenade"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryEffectParams_Chaff'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryEffectParams_HE'
begin object name="ClassicSecondaryEffectParams_HE" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=240.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.G51Grenade_HE'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3750.0000000
	MaxSpeed=4500.0000000
	Damage=200.0000000
	DamageRadius=240.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51AltFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryFireParams_HE'
begin object name="ClassicSecondaryFireParams_HE" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	BurstFireRateFactor=1.0000000
	FireAnim="FireGrenade"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryEffectParams_HE'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryEffectParams_Sensor'
begin object name="ClassicSecondaryEffectParams_Sensor" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=100.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.G51Grenade_Sensor'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3750.0000000
	MaxSpeed=4500.0000000
	Damage=15.0000000
	DamageRadius=10.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51AltFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryFireParams_Sensor'
begin object name="ClassicSecondaryFireParams_Sensor" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	BurstFireRateFactor=1.0000000
	FireAnim="FireGrenade"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryEffectParams_Sensor'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
begin object name="ClassicSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicParams_HoloChaff'
begin object name="ClassicParams_HoloChaff" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Adv Holo + Chaff"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=-0.5000000,Y=-0.0100000,Z=3.1000000)
	WeaponBoneScales[0]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="HoloSightLower",Slot=55,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	ViewOffset=(X=5.0000000,Y=6.0000000,Z=-2.5000000)
	bNeedCock=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryFireParams_Chaff'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicParams_NoCarrySensor'
begin object name="ClassicParams_NoCarrySensor" class=BCoreProV55.WeaponParams
	Weight=3
	LayoutName="Adv Holo + Sensor"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=-0.5000000,Y=0.0000000,Z=-0.1200000)
	WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=-1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=1.0000000)
	ViewOffset=(X=5.0000000,Y=6.0000000,Z=-2.5000000)
	bNeedCock=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryFireParams_Sensor'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicParams_IronsHE'
begin object name="ClassicParams_IronsHE" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Iron Sights + HE"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-0.5000000,Y=0.0000000,Z=1.0000000)
	WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	ViewOffset=(X=5.0000000,Y=6.0000000,Z=-2.5000000)
	bNeedCock=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryFireParams_HE'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicParams_4XScope'
begin object name="ClassicParams_4XScope" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="4X Scope"
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.3000000
	SightOffset=(X=-0.5000000,Y=-0.0100000,Z=3.1000000)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	ViewOffset=(X=5.0000000,Y=6.0000000,Z=-2.5000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ACOG',BoneName="tip",Scale=0.1000000,AugmentOffset=(X=-25.0000000,Y=-4.6000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	bNeedCock=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	bNoaltfire=true
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicParams_IRScope'
begin object name="ClassicParams_IRScope" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="IR Scope"
	LayoutTags="IR"
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=3.0000000,Y=-0.0100000,Z=0.5000000)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-IRScope'
	MaxZoom=3.0000000
	WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=-1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	ViewOffset=(X=5.0000000,Y=6.0000000,Z=-2.5000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_IRScope',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-27.0000000,Y=-2.6000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=-16384))
	bNeedCock=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicParams_Suppressed'
begin object name="ClassicParams_Suppressed" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Suppressed"
	LayoutTags="silencer"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-0.5000000,Y=0.0000000,Z=0.9000000)
	WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	ViewOffset=(X=5.0000000,Y=6.0000000,Z=-2.5000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.1500000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	bNeedCock=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicPrimarySuppressedFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsClassic.G51_Black'
begin object name="G51_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsClassic.G51_Green'
begin object name="G51_Green" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainGreen",Index=1,pIndex=1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsClassic.G51_GreenHex'
begin object name="G51_GreenHex" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hex Green"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainHexG",Index=1,pIndex=1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsClassic.G51_BlueHex'
begin object name="G51_BlueHex" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hex Blue"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainHexB",Index=1,pIndex=1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsClassic.G51_Desert'
begin object name="G51_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainDesert",Index=1,pIndex=1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsClassic.G51_UTC'
begin object name="G51_UTC" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.UTCG51Tex",Index=1,pIndex=1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsClassic.G51_Inferno'
begin object name="G51_Inferno" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Inferno"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainRed",Index=1,pIndex=1,AIndex=0)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsClassic.G51_Gold'
begin object name="G51_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainGold",Index=1,pIndex=1,AIndex=0)
	Index=7
end object
