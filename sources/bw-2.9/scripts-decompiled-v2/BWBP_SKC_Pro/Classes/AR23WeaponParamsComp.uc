class AR23WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Adv Holo"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.7000000
		SightingTime=0.5500000
		WeaponBoneScales[0]=(BoneName="IronsFront",Slot=50,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="IronsRear",Slot=51,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="GLIrons",Slot=52,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="Holo",Slot=53,Scale=1.0000000)
		WeaponBoneScales[4]=(BoneName="MuzzleAttachment",Slot=54,Scale=1.0000000)
		DisplaceDurationMult=1.2000000
		MagAmmo=10
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaParams_4X'
	begin object name="ArenaParams_4X" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="4X Scope"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.7000000
		SightingTime=0.6000000
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="IronsFront",Slot=50,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="IronsRear",Slot=51,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="GLIrons",Slot=52,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="Holo",Slot=53,Scale=0.0000000)
		WeaponBoneScales[4]=(BoneName="MuzzleAttachment",Slot=54,Scale=1.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ACOG',BoneName="tip",Scale=0.1200000,AugmentOffset=(X=-25.0000000,Y=0.0000000,Z=-1.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=0))
		DisplaceDurationMult=1.2000000
		MagAmmo=10
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[1]=ArenaParams_4X
	// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaParams_8X'
	begin object name="ArenaParams_8X" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="8X Scope"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.7000000
		SightingTime=0.6500000
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
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_8XScope',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-25.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=0))
		DisplaceDurationMult=1.2000000
		MagAmmo=10
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[2]=ArenaParams_8X
	// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaParams_Supp'
	begin object name="ArenaParams_Supp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Suppressor"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.7000000
		SightingTime=0.5500000
		WeaponBoneScales[0]=(BoneName="IronsFront",Slot=50,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="IronsRear",Slot=51,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="GLIrons",Slot=52,Scale=1.0000000)
		WeaponBoneScales[3]=(BoneName="Holo",Slot=53,Scale=0.0000000)
		WeaponBoneScales[4]=(BoneName="MuzzleAttachment",Slot=54,Scale=0.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.2000000,AugmentOffset=(X=-3.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=32768))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_Holo',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-25.0000000,Y=0.0000000,Z=-1.1000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=32768))
		DisplaceDurationMult=1.2000000
		MagAmmo=10
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaPrimaryFireParams_Supp'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[3]=ArenaParams_Supp
	// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaParams_IRONS'
	begin object name="ArenaParams_IRONS" class=BCoreProV55.WeaponParams
		Weight=3
		LayoutName="Iron Sights"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.7000000
		SightingTime=0.4500000
		WeaponBoneScales[0]=(BoneName="IronsRear",Slot=51,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Holo",Slot=52,Scale=0.0000000)
		DisplaceDurationMult=1.2000000
		MagAmmo=10
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[4]=ArenaParams_IRONS
	// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsComp.AR23_Tan'
	begin object name="AR23_Tan" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Tan"
	end object
	Camos[0]=AR23_Tan
	// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsComp.AR23_Digital'
	begin object name="AR23_Digital" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Digital"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MainDigital",Index=1,pIndex=5,AIndex=0)
		Index=1
	end object
	Camos[1]=AR23_Digital
	// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsComp.AR23_Winter'
	begin object name="AR23_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MainWinterShine",Index=1,pIndex=5,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MiscWinterShine",Index=2,pIndex=6,AIndex=1)
		Index=2
	end object
	Camos[2]=AR23_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsComp.AR23_Meat'
	begin object name="AR23_Meat" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Meat"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MainMeat",Index=1,pIndex=5,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MiscMeat",Index=2,pIndex=6,AIndex=1)
		Index=3
	end object
	Camos[3]=AR23_Meat
	// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsComp.AR23_Gold'
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
// Reference: FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	PreFireAnim="GrenadePrep"
	FireAnim="GrenadeFire"
	AimedFireAnim="GrenadeFireAimed"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.3000000,OutVal=0.0750000),(InVal=0.5000000,OutVal=-0.0750000),(InVal=0.7000000,OutVal=-0.0900000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1200000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.5000000,OutVal=0.5500000),(InVal=0.7500000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0700000
	YRandFactor=0.0700000
	MaxRecoil=5040.0000000
	ClimbTime=0.0600000
	DeclineTime=1.5000000
	ViewBindFactor=0.2000000
	HipMultiplier=1.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=1024)
	AimAdjustTime=0.4500000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-4000,Roll=0)
	ChaosDeclineTime=1.7500000
	ChaosSpeedThreshold=300
end object
// Reference: FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1700000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=62
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DT_AR23HR'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AR23HRHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AR23HR'
	PenetrationEnergy=96.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.8000000
	WallPDamageFactor=0.7500000
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AR23.AR23-HFire',Volume=1.7500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	PushbackForce=250.0000000
	Chaos=0.0800000
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaPrimaryEffectParams_Supp'
begin object name="ArenaPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=62
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DT_AR23HR'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AR23HRHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AR23HR'
	PenetrationEnergy=96.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.8000000
	WallPDamageFactor=0.7500000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AR23.AR23-Sil',Volume=1.5500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	Recoil=1024.0000000
	PushbackForce=250.0000000
	Chaos=0.0800000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaPrimaryFireParams_Supp'
begin object name="ArenaPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.1850000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaPrimaryEffectParams_Supp'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2560.0000000,Max=2560.0000000)
	WaterTraceRange=5000.0000000
	Damage=9
	DamageType=Class'BWBP_SKC_Pro.DT_AR23Flak'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AR23Flak'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AR23Flak'
	PenetrateForce=100
	bPenetrate=true
	MomentumTransfer=50
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.Misc.Flak-Fire',Volume=1.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	PushbackForce=1850.0000000
	Chaos=0.2500000
	Inaccuracy=(X=512,Y=768)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Adv Holo"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.7000000
	SightingTime=0.5500000
	WeaponBoneScales[0]=(BoneName="IronsFront",Slot=50,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="IronsRear",Slot=51,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="GLIrons",Slot=52,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="Holo",Slot=53,Scale=1.0000000)
	WeaponBoneScales[4]=(BoneName="MuzzleAttachment",Slot=54,Scale=1.0000000)
	DisplaceDurationMult=1.2000000
	MagAmmo=10
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaParams_4X'
begin object name="ArenaParams_4X" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="4X Scope"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.7000000
	SightingTime=0.6000000
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="IronsFront",Slot=50,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="IronsRear",Slot=51,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="GLIrons",Slot=52,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="Holo",Slot=53,Scale=0.0000000)
	WeaponBoneScales[4]=(BoneName="MuzzleAttachment",Slot=54,Scale=1.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ACOG',BoneName="tip",Scale=0.1200000,AugmentOffset=(X=-25.0000000,Y=0.0000000,Z=-1.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=0))
	DisplaceDurationMult=1.2000000
	MagAmmo=10
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaParams_8X'
begin object name="ArenaParams_8X" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="8X Scope"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.7000000
	SightingTime=0.6500000
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
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_8XScope',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-25.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=0))
	DisplaceDurationMult=1.2000000
	MagAmmo=10
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaParams_Supp'
begin object name="ArenaParams_Supp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Suppressor"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.7000000
	SightingTime=0.5500000
	WeaponBoneScales[0]=(BoneName="IronsFront",Slot=50,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="IronsRear",Slot=51,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="GLIrons",Slot=52,Scale=1.0000000)
	WeaponBoneScales[3]=(BoneName="Holo",Slot=53,Scale=0.0000000)
	WeaponBoneScales[4]=(BoneName="MuzzleAttachment",Slot=54,Scale=0.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.2000000,AugmentOffset=(X=-3.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=32768))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_Holo',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-25.0000000,Y=0.0000000,Z=-1.1000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=32768))
	DisplaceDurationMult=1.2000000
	MagAmmo=10
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaPrimaryFireParams_Supp'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaParams_IRONS'
begin object name="ArenaParams_IRONS" class=BCoreProV55.WeaponParams
	Weight=3
	LayoutName="Iron Sights"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.7000000
	SightingTime=0.4500000
	WeaponBoneScales[0]=(BoneName="IronsRear",Slot=51,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Holo",Slot=52,Scale=0.0000000)
	DisplaceDurationMult=1.2000000
	MagAmmo=10
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AR23WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsComp.AR23_Tan'
begin object name="AR23_Tan" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Tan"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsComp.AR23_Digital'
begin object name="AR23_Digital" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Digital"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MainDigital",Index=1,pIndex=5,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsComp.AR23_Winter'
begin object name="AR23_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MainWinterShine",Index=1,pIndex=5,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MiscWinterShine",Index=2,pIndex=6,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsComp.AR23_Meat'
begin object name="AR23_Meat" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Meat"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MainMeat",Index=1,pIndex=5,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MiscMeat",Index=2,pIndex=6,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AR23WeaponParamsComp.AR23_Gold'
begin object name="AR23_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MainGold",Index=1,pIndex=5,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AR23Camos.AR23-MiscGold",Index=2,pIndex=6,AIndex=1)
	Index=4
end object
