class LK05WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicParams_Holo'
	begin object name="ClassicParams_Holo" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Holosight"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
		WeaponMaterialSwaps[0]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=8,pIndex=0,AIndex=8)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=9,pIndex=0,AIndex=2)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Irons",Slot=57,Scale=-2.0000000)
		ViewOffset=(X=5.0000000,Y=5.0000000,Z=-2.0000000)
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams_Holo
	// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicParams_4XScope'
	begin object name="ClassicParams_4XScope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="4X Scope"
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=-2.0000000)
		WeaponBoneScales[2]=(BoneName="Irons",Slot=57,Scale=-2.0000000)
		WeaponBoneScales[3]=(BoneName="EOTech",Slot=54,Scale=0.0000000)
		ViewOffset=(X=5.0000000,Y=5.0000000,Z=-2.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-20.0000000,Y=-2.3000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_4XScope
	// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicParams_68mm'
	begin object name="ClassicParams_68mm" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="6.8mm LK10"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
		WeaponMaterialSwaps[0]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=8,pIndex=0,AIndex=8)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=9,pIndex=0,AIndex=2)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Irons",Slot=57,Scale=-2.0000000)
		ViewOffset=(X=5.0000000,Y=5.0000000,Z=-2.0000000)
		MagAmmo=25
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicPrimaryFireParams_68mm'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[2]=ClassicParams_68mm
	// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicParams_Irons'
	begin object name="ClassicParams_Irons" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Iron Sights"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=3.0000000,Y=0.0000000,Z=1.5900000)
		SightPivot=(Pitch=64,Yaw=-16,Roll=0)
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponBoneScales[0]=(BoneName="EOTech",Slot=54,Scale=0.0000000)
		ViewOffset=(X=5.0000000,Y=5.0000000,Z=-2.0000000)
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[3]=ClassicParams_Irons
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsClassic.LK05_Tan'
	begin object name="LK05_Tan" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Tan"
	end object
	Camos[0]=LK05_Tan
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsClassic.LK05_Gray'
	begin object name="LK05_Gray" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-RecShine',MaterialName="",Index=3,pIndex=3,AIndex=4)
		Index=1
	end object
	Camos[1]=LK05_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsClassic.LK05_Black'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsClassic.LK05_Jungle'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsClassic.LK05_Winter'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsClassic.LK05_RedTiger'
	begin object name="LK05_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecRedCamo",Index=3,pIndex=3,AIndex=4)
		Index=5
	end object
	Camos[5]=LK05_RedTiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsClassic.LK05_Meat'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsClassic.LK05_Gold'
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
// Reference: FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.3000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.4000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.6500000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.8000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=2048.0000000
	DeclineTime=1.7000000
	DeclineDelay=0.1500000
	ViewBindFactor=0.6000000
	CrouchMultiplier=0.4500000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2250)
	CrouchMultiplier=0.4500000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.3000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.0000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=12000.0000000)
	WaterTraceRange=9600.0000000
	RangeAtten=0.8000000
	Damage=24
	HeadMult=3.2000000
	LimbMult=0.5500000
	DamageType=Class'BWBP_SKC_Pro.DT_LK05Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_LK05AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_LK05Assault'
	PenetrationEnergy=32.0000000
	PenetrateForce=75
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	HookStopFactor=0.2000000
	HookPullForce=-10.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter_C'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LK05.LK05-RapidFire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=128.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=96,Y=96)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicPrimaryEffectParams_68mm'
begin object name="ClassicPrimaryEffectParams_68mm" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=12000.0000000)
	WaterTraceRange=9600.0000000
	RangeAtten=0.9000000
	Damage=30
	HeadMult=3.2000000
	LimbMult=0.5500000
	DamageType=Class'BWBP_SKC_Pro.DT_LK05Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_LK05AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_LK05Assault'
	PenetrationEnergy=32.0000000
	PenetrateForce=75
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter_C'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.LK05.LK05-HeavyFire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=96,Y=96)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicPrimaryFireParams_68mm'
begin object name="ClassicPrimaryFireParams_68mm" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicPrimaryEffectParams_68mm'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicParams_Holo'
begin object name="ClassicParams_Holo" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Holosight"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
	WeaponMaterialSwaps[0]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=8,pIndex=0,AIndex=8)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=9,pIndex=0,AIndex=2)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Irons",Slot=57,Scale=-2.0000000)
	ViewOffset=(X=5.0000000,Y=5.0000000,Z=-2.0000000)
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicParams_4XScope'
begin object name="ClassicParams_4XScope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="4X Scope"
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=-2.0000000)
	WeaponBoneScales[2]=(BoneName="Irons",Slot=57,Scale=-2.0000000)
	WeaponBoneScales[3]=(BoneName="EOTech",Slot=54,Scale=0.0000000)
	ViewOffset=(X=5.0000000,Y=5.0000000,Z=-2.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-20.0000000,Y=-2.3000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicParams_Irons'
begin object name="ClassicParams_Irons" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Iron Sights"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=3.0000000,Y=0.0000000,Z=1.5900000)
	SightPivot=(Pitch=64,Yaw=-16,Roll=0)
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponBoneScales[0]=(BoneName="EOTech",Slot=54,Scale=0.0000000)
	ViewOffset=(X=5.0000000,Y=5.0000000,Z=-2.0000000)
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicParams_68mm'
begin object name="ClassicParams_68mm" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="6.8mm LK10"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
	WeaponMaterialSwaps[0]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=8,pIndex=0,AIndex=8)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=9,pIndex=0,AIndex=2)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Irons",Slot=57,Scale=-2.0000000)
	ViewOffset=(X=5.0000000,Y=5.0000000,Z=-2.0000000)
	MagAmmo=25
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicPrimaryFireParams_68mm'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsClassic.LK05_Tan'
begin object name="LK05_Tan" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Tan"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsClassic.LK05_Gray'
begin object name="LK05_Gray" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-RecShine',MaterialName="",Index=3,pIndex=3,AIndex=4)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsClassic.LK05_Black'
begin object name="LK05_Black" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-MainBlack",Index=3,pIndex=3,AIndex=4)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsClassic.LK05_Jungle'
begin object name="LK05_Jungle" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecJungle",Index=3,pIndex=3,AIndex=4)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsClassic.LK05_Winter'
begin object name="LK05_Winter" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecWinter",Index=3,pIndex=3,AIndex=4)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsClassic.LK05_RedTiger'
begin object name="LK05_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecRedCamo",Index=3,pIndex=3,AIndex=4)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsClassic.LK05_Meat'
begin object name="LK05_Meat" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Meat"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecMeat",Index=3,pIndex=3,AIndex=4)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsClassic.LK05_Gold'
begin object name="LK05_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecGold",Index=3,pIndex=3,AIndex=4)
	Index=7
end object
