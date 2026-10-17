class M50WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M50WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Grenadier"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=-8.0000000,Y=0.0800000,Z=2.7000000)
		SightPivot=(Pitch=200,Yaw=0,Roll=0)
		ViewOffset=(X=9.0000000,Y=7.0000000,Z=-2.0000000)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.M50WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M50WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BallisticProV55.M50WeaponParamsClassic.ClassicParams_AdvStealth'
	begin object name="ClassicParams_AdvStealth" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="A3 Suppressed"
		LayoutTags="no_grenade, suppressed"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=3.4000000)
		SightPivot=(Pitch=80,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Sights",Slot=0,Scale=0.0000000)
		ViewOffset=(X=9.0000000,Y=7.0000000,Z=-2.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_FPm'
		AttachmentMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_TPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.2000000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		AllowedCamos[0]=4
		AllowedCamos[1]=5
		AllowedCamos[2]=6
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.M50WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M50WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicPrimaryFireParams_Sil'
		AltFireParams[0]=FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[1]=ClassicParams_AdvStealth
	// Reference: WeaponParams'BallisticProV55.M50WeaponParamsClassic.ClassicParams_AdvHolo'
	begin object name="ClassicParams_AdvHolo" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="A3 Holo"
		LayoutTags="no_grenade, lam"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=3.3500000)
		SightPivot=(Pitch=0,Yaw=1,Roll=0)
		WeaponBoneScales[0]=(BoneName="Irons",Slot=0,Scale=0.0000000)
		ViewOffset=(X=9.0000000,Y=7.0000000,Z=-2.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_FPm'
		AttachmentMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_TPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Holo',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-39.0000000,Y=-1.4000000,Z=-0.1250000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_LAM',BoneName="tip",Scale=0.0400000,AugmentOffset=(X=-20.0000000,Y=0.0000000,Z=-1.5000000),AugmentRot=(Pitch=0,Yaw=0,Roll=32768))
		AllowedCamos[0]=4
		AllowedCamos[1]=5
		AllowedCamos[2]=6
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.M50WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M50WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicPrimaryFireParams_Long'
		AltFireParams[0]=FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[2]=ClassicParams_AdvHolo
	// Reference: WeaponParams'BallisticProV55.M50WeaponParamsClassic.ClassicParams_AdvScope'
	begin object name="ClassicParams_AdvScope" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="A3 4X Scope"
		LayoutTags="no_grenade"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=3.5000000)
		SightPivot=(Pitch=0,Yaw=1,Roll=0)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="Irons",Slot=0,Scale=0.0000000)
		ViewOffset=(X=9.0000000,Y=7.0000000,Z=-2.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_FPm'
		AttachmentMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_TPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="tip",Scale=0.0650000,AugmentOffset=(X=-43.0000000,Y=-1.7500000,Z=-0.1250000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		AllowedCamos[0]=4
		AllowedCamos[1]=5
		AllowedCamos[2]=6
		bNeedCock=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.M50WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M50WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicPrimaryFireParams_Long'
		AltFireParams[0]=FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[3]=ClassicParams_AdvScope
	// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsClassic.M50_Silver'
	begin object name="M50_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=M50_Silver
	// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsClassic.M50_Black'
	begin object name="M50_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinA-D',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinB-D',MaterialName="",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=Texture'BW_Core_WeaponTex.M50.M50Laser',MaterialName="",Index=4,pIndex=4,AIndex=3)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50Gren-D',MaterialName="",Index=5,pIndex=3,AIndex=4)
		WeaponMaterialSwaps[5]=(Material=Texture'BW_Core_WeaponTex.M50.M900Grenade',MaterialName="",Index=6,pIndex=-1,AIndex=-1)
		Index=1
	end object
	Camos[1]=M50_Black
	// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsClassic.M50_Jungle'
	begin object name="M50_Jungle" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M30A2-SATiger",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M30A2-SBTiger",Index=2,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=M50_Jungle
	// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsClassic.M50_Gold'
	begin object name="M50_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M50_Main1_S1",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M50_Main2_S1",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M50_Laser_S1",Index=4,pIndex=4,AIndex=3)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M50_Main3_S1",Index=5,pIndex=3,AIndex=4)
		Index=3
	end object
	Camos[3]=M50_Gold
	// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsClassic.M50A3_Black'
	begin object name="M50A3_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinA-D',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinB-D',MaterialName="",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-CoverBlack',MaterialName="",Index=3,pIndex=-1,AIndex=4)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-MainBlack',MaterialName="",Index=4,pIndex=-1,AIndex=2)
		WeaponMaterialSwaps[5]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Barrel',MaterialName="",Index=5,pIndex=-1,AIndex=5)
		WeaponMaterialSwaps[6]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Misc',MaterialName="",Index=6,pIndex=-1,AIndex=3)
		Index=4
	end object
	Camos[4]=M50A3_Black
	// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsClassic.M50A3_Desert'
	begin object name="M50A3_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinA-D',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinB-D',MaterialName="",Index=2,pIndex=-1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M50A3.M50A3-CoverTan",Index=3,pIndex=-1,AIndex=4)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M50A3.M50A3-MainTan",Index=4,pIndex=-1,AIndex=2)
		WeaponMaterialSwaps[5]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Barrel',MaterialName="",Index=5,pIndex=-1,AIndex=5)
		WeaponMaterialSwaps[6]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Misc',MaterialName="",Index=6,pIndex=-1,AIndex=3)
		Index=5
	end object
	Camos[5]=M50A3_Desert
	// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsClassic.M50A3_Red'
	begin object name="M50A3_Red" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinA-D',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinB-D',MaterialName="",Index=2,pIndex=-1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M50A3.M50A3-CoverRed",Index=3,pIndex=-1,AIndex=4)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-MainBlack',MaterialName="",Index=4,pIndex=-1,AIndex=2)
		WeaponMaterialSwaps[5]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Barrel',MaterialName="",Index=5,pIndex=-1,AIndex=5)
		WeaponMaterialSwaps[6]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Misc',MaterialName="",Index=6,pIndex=-1,AIndex=3)
		Index=6
	end object
	Camos[6]=M50A3_Red
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BallisticProV55.M50WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.3000000),(InVal=0.6000000,OutVal=0.4000000),(InVal=0.8000000,OutVal=-0.5000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1500000),(InVal=0.2500000,OutVal=0.5000000),(InVal=0.3000000,OutVal=0.7000000),(InVal=0.6000000,OutVal=0.8000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2000000
	YRandFactor=0.3000000
	MaxRecoil=2048.0000000
	ViewBindFactor=0.6000000
	CrouchMultiplier=0.5000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.M50WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	CrouchMultiplier=0.5000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
begin object name="ClassicSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.M50WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
end object
// Reference: FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicPrimaryFireParams_Long'
begin object name="ClassicPrimaryFireParams_Long" class=BCoreProV55.FireParams
	FireInterval=0.1050000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M50WeaponParamsClassic.ClassicPrimaryEffectParams_Long'
end object
// Reference: InstantEffectParams'BallisticProV55.M50WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=25
	HeadMult=3.5000000
	LimbMult=0.4500000
	DamageType=Class'BallisticProV55.DTM50Assault'
	DamageTypeHead=Class'BallisticProV55.DTM50AssaultHead'
	DamageTypeArm=Class'BallisticProV55.DTM50AssaultLimb'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter_C'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Fire2',Volume=0.9000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=72.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=2,Y=2)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M50WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.M50WeaponParamsClassic.ClassicPrimaryEffectParams_Long'
begin object name="ClassicPrimaryEffectParams_Long" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=25
	HeadMult=3.5000000
	LimbMult=0.4500000
	DamageType=Class'BallisticProV55.DTM50Assault'
	DamageTypeHead=Class'BallisticProV55.DTM50AssaultHead'
	DamageTypeArm=Class'BallisticProV55.DTM50AssaultLimb'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter_C'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Fire3',Volume=1.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=52.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1,Y=1)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BallisticProV55.M50WeaponParamsClassic.ClassicPrimaryEffectParams_Sil'
begin object name="ClassicPrimaryEffectParams_Sil" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=25
	HeadMult=3.5000000
	LimbMult=0.4500000
	DamageType=Class'BallisticProV55.DTM50Assault'
	DamageTypeHead=Class'BallisticProV55.DTM50AssaultHead'
	DamageTypeArm=Class'BallisticProV55.DTM50AssaultLimb'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50FireSil',Volume=1.1000000,Radius=192.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=72.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=2,Y=2)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicPrimaryFireParams_Sil'
begin object name="ClassicPrimaryFireParams_Sil" class=BCoreProV55.FireParams
	FireInterval=0.1050000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M50WeaponParamsClassic.ClassicPrimaryEffectParams_Sil'
end object
// Reference: ProjectileEffectParams'BallisticProV55.M50WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.M50Grenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=4000.0000000
	Damage=120.0000000
	DamageRadius=240.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50GrenFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	PreFireAnim="GrenadePrepFire"
	FireAnim="GrenadeFire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.M50WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.M50WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
begin object name="ClassicSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BallisticProV55.M50WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Grenadier"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=-8.0000000,Y=0.0800000,Z=2.7000000)
	SightPivot=(Pitch=200,Yaw=0,Roll=0)
	ViewOffset=(X=9.0000000,Y=7.0000000,Z=-2.0000000)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.M50WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M50WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.M50WeaponParamsClassic.ClassicParams_AdvStealth'
begin object name="ClassicParams_AdvStealth" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="A3 Suppressed"
	LayoutTags="no_grenade, suppressed"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=3.4000000)
	SightPivot=(Pitch=80,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Sights",Slot=0,Scale=0.0000000)
	ViewOffset=(X=9.0000000,Y=7.0000000,Z=-2.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_FPm'
	AttachmentMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_TPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.2000000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	AllowedCamos[0]=4
	AllowedCamos[1]=5
	AllowedCamos[2]=6
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.M50WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M50WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicPrimaryFireParams_Sil'
	AltFireParams[0]=FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.M50WeaponParamsClassic.ClassicParams_AdvHolo'
begin object name="ClassicParams_AdvHolo" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="A3 Holo"
	LayoutTags="no_grenade, lam"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=3.3500000)
	SightPivot=(Pitch=0,Yaw=1,Roll=0)
	WeaponBoneScales[0]=(BoneName="Irons",Slot=0,Scale=0.0000000)
	ViewOffset=(X=9.0000000,Y=7.0000000,Z=-2.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_FPm'
	AttachmentMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_TPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Holo',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-39.0000000,Y=-1.4000000,Z=-0.1250000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_LAM',BoneName="tip",Scale=0.0400000,AugmentOffset=(X=-20.0000000,Y=0.0000000,Z=-1.5000000),AugmentRot=(Pitch=0,Yaw=0,Roll=32768))
	AllowedCamos[0]=4
	AllowedCamos[1]=5
	AllowedCamos[2]=6
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.M50WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M50WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicPrimaryFireParams_Long'
	AltFireParams[0]=FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.M50WeaponParamsClassic.ClassicParams_AdvScope'
begin object name="ClassicParams_AdvScope" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="A3 4X Scope"
	LayoutTags="no_grenade"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=3.5000000)
	SightPivot=(Pitch=0,Yaw=1,Roll=0)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="Irons",Slot=0,Scale=0.0000000)
	ViewOffset=(X=9.0000000,Y=7.0000000,Z=-2.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_FPm'
	AttachmentMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_TPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="tip",Scale=0.0650000,AugmentOffset=(X=-43.0000000,Y=-1.7500000,Z=-0.1250000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	AllowedCamos[0]=4
	AllowedCamos[1]=5
	AllowedCamos[2]=6
	bNeedCock=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.M50WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M50WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicPrimaryFireParams_Long'
	AltFireParams[0]=FireParams'BallisticProV55.M50WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsClassic.M50_Silver'
begin object name="M50_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsClassic.M50_Black'
begin object name="M50_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinA-D',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinB-D',MaterialName="",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=Texture'BW_Core_WeaponTex.M50.M50Laser',MaterialName="",Index=4,pIndex=4,AIndex=3)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50Gren-D',MaterialName="",Index=5,pIndex=3,AIndex=4)
	WeaponMaterialSwaps[5]=(Material=Texture'BW_Core_WeaponTex.M50.M900Grenade',MaterialName="",Index=6,pIndex=-1,AIndex=-1)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsClassic.M50_Jungle'
begin object name="M50_Jungle" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M30A2-SATiger",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M30A2-SBTiger",Index=2,pIndex=1,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsClassic.M50_Gold'
begin object name="M50_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M50_Main1_S1",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M50_Main2_S1",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M50_Laser_S1",Index=4,pIndex=4,AIndex=3)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M50_Main3_S1",Index=5,pIndex=3,AIndex=4)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsClassic.M50A3_Black'
begin object name="M50A3_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinA-D',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinB-D',MaterialName="",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-CoverBlack',MaterialName="",Index=3,pIndex=-1,AIndex=4)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-MainBlack',MaterialName="",Index=4,pIndex=-1,AIndex=2)
	WeaponMaterialSwaps[5]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Barrel',MaterialName="",Index=5,pIndex=-1,AIndex=5)
	WeaponMaterialSwaps[6]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Misc',MaterialName="",Index=6,pIndex=-1,AIndex=3)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsClassic.M50A3_Desert'
begin object name="M50A3_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinA-D',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinB-D',MaterialName="",Index=2,pIndex=-1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M50A3.M50A3-CoverTan",Index=3,pIndex=-1,AIndex=4)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M50A3.M50A3-MainTan",Index=4,pIndex=-1,AIndex=2)
	WeaponMaterialSwaps[5]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Barrel',MaterialName="",Index=5,pIndex=-1,AIndex=5)
	WeaponMaterialSwaps[6]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Misc',MaterialName="",Index=6,pIndex=-1,AIndex=3)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsClassic.M50A3_Red'
begin object name="M50A3_Red" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinA-D',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinB-D',MaterialName="",Index=2,pIndex=-1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M50A3.M50A3-CoverRed",Index=3,pIndex=-1,AIndex=4)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-MainBlack',MaterialName="",Index=4,pIndex=-1,AIndex=2)
	WeaponMaterialSwaps[5]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Barrel',MaterialName="",Index=5,pIndex=-1,AIndex=5)
	WeaponMaterialSwaps[6]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Misc',MaterialName="",Index=6,pIndex=-1,AIndex=3)
	Index=6
end object
