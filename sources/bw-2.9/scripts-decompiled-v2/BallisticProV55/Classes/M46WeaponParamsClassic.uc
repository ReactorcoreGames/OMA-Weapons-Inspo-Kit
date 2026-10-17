class M46WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M46WeaponParamsClassic.ClassicParams_Scope'
	begin object name="ClassicParams_Scope" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Scoped"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		SightOffset=(X=-1.0000000,Y=0.0500000,Z=3.9000000)
		SightPivot=(Pitch=600,Yaw=0,Roll=-1024)
		ZoomType=2
		WeaponBoneScales[0]=(BoneName="RDS",Slot=0,Scale=0.0000000)
		ViewOffset=(X=7.0000000,Y=5.0000000,Z=-3.5000000)
		MagAmmo=25
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.M46WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M46WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.M46WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M46WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams_Scope
	// Reference: WeaponParams'BallisticProV55.M46WeaponParamsClassic.ClassicParams_RDS'
	begin object name="ClassicParams_RDS" class=BCoreProV55.WeaponParams
		Weight=20
		LayoutName="RDS"
		InventorySize=7
		SightOffset=(X=-2.5000000,Y=0.0400000,Z=3.8500000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=0,Scale=0.0000000)
		ViewOffset=(X=7.0000000,Y=5.0000000,Z=-3.5000000)
		MagAmmo=25
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.M46WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M46WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.M46WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M46WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_RDS
	// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsClassic.M46_Tan'
	begin object name="M46_Tan" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Desert"
	end object
	Camos[0]=M46_Tan
	// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsClassic.M46_Jungle'
	begin object name="M46_Jungle" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoGreenMain",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoGreenClip",Index=2,pIndex=3,AIndex=3)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoGreenGrenadeLauncher",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Grenade',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.OA-AR.OA-AR_Scope_Shine',MaterialName="",Index=5,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[6]=(Material=FinalBlend'BW_Core_WeaponTex.OA-SMG.OA-SMG_SightFB',MaterialName="",Index=6,pIndex=-1,AIndex=4)
		Index=1
	end object
	Camos[1]=M46_Jungle
	// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsClassic.M46_Blue'
	begin object name="M46_Blue" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Ocean"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoBlueMain",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AL_PulseRifle_Clip",Index=2,pIndex=3,AIndex=3)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoBlueGrenadeLauncher",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Grenade',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.OA-AR.OA-AR_Scope_Shine',MaterialName="",Index=5,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[6]=(Material=FinalBlend'BW_Core_WeaponTex.OA-SMG.OA-SMG_SightFB',MaterialName="",Index=6,pIndex=-1,AIndex=4)
		Index=2
	end object
	Camos[2]=M46_Blue
	// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsClassic.M46_Black'
	begin object name="M46_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Stealth"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-GrayMain",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-GrayClip",Index=2,pIndex=3,AIndex=3)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-GrayGrenadeLauncher",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Grenade',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.OA-AR.OA-AR_Scope_Shine',MaterialName="",Index=5,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[6]=(Material=FinalBlend'BW_Core_WeaponTex.OA-SMG.OA-SMG_SightFB',MaterialName="",Index=6,pIndex=-1,AIndex=4)
		Index=3
	end object
	Camos[3]=M46_Black
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BallisticProV55.M46WeaponParamsClassic.ClassicAimParams'
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
// Reference: RecoilParams'BallisticProV55.M46WeaponParamsClassic.ClassicRecoilParams'
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
// Reference: FireParams'BallisticProV55.M46WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	BurstFireRateFactor=1.0000000
	PreFireAnim="GrenadePrepFire"
	FireAnim="GrenadeFire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.M46WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.M46WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M46WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.M46WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=30
	HeadMult=3.3000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTM46Assault'
	DamageTypeHead=Class'BallisticProV55.DTM46AssaultHead'
	DamageTypeArm=Class'BallisticProV55.DTM46Assault'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter_C'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-AR.OA-AR_Fire1',Volume=1.7500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=85.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1,Y=1)
	WarnTargetPct=0.2000000
end object
// Reference: ProjectileEffectParams'BallisticProV55.M46WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.M46Grenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=1500.0000000
	Damage=160.0000000
	DamageRadius=340.0000000
	LimbMult=0.5000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-AR.OA-AR_FireGren',Volume=1.7500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: WeaponParams'BallisticProV55.M46WeaponParamsClassic.ClassicParams_Scope'
begin object name="ClassicParams_Scope" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Scoped"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	SightOffset=(X=-1.0000000,Y=0.0500000,Z=3.9000000)
	SightPivot=(Pitch=600,Yaw=0,Roll=-1024)
	ZoomType=2
	WeaponBoneScales[0]=(BoneName="RDS",Slot=0,Scale=0.0000000)
	ViewOffset=(X=7.0000000,Y=5.0000000,Z=-3.5000000)
	MagAmmo=25
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.M46WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M46WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.M46WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M46WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.M46WeaponParamsClassic.ClassicParams_RDS'
begin object name="ClassicParams_RDS" class=BCoreProV55.WeaponParams
	Weight=20
	LayoutName="RDS"
	InventorySize=7
	SightOffset=(X=-2.5000000,Y=0.0400000,Z=3.8500000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=0,Scale=0.0000000)
	ViewOffset=(X=7.0000000,Y=5.0000000,Z=-3.5000000)
	MagAmmo=25
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.M46WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M46WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.M46WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M46WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsClassic.M46_Tan'
begin object name="M46_Tan" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Desert"
end object
// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsClassic.M46_Jungle'
begin object name="M46_Jungle" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoGreenMain",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoGreenClip",Index=2,pIndex=3,AIndex=3)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoGreenGrenadeLauncher",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Grenade',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.OA-AR.OA-AR_Scope_Shine',MaterialName="",Index=5,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[6]=(Material=FinalBlend'BW_Core_WeaponTex.OA-SMG.OA-SMG_SightFB',MaterialName="",Index=6,pIndex=-1,AIndex=4)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsClassic.M46_Blue'
begin object name="M46_Blue" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Ocean"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoBlueMain",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AL_PulseRifle_Clip",Index=2,pIndex=3,AIndex=3)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoBlueGrenadeLauncher",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Grenade',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.OA-AR.OA-AR_Scope_Shine',MaterialName="",Index=5,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[6]=(Material=FinalBlend'BW_Core_WeaponTex.OA-SMG.OA-SMG_SightFB',MaterialName="",Index=6,pIndex=-1,AIndex=4)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsClassic.M46_Black'
begin object name="M46_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Stealth"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-GrayMain",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-GrayClip",Index=2,pIndex=3,AIndex=3)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-GrayGrenadeLauncher",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Grenade',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.OA-AR.OA-AR_Scope_Shine',MaterialName="",Index=5,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[6]=(Material=FinalBlend'BW_Core_WeaponTex.OA-SMG.OA-SMG_SightFB',MaterialName="",Index=6,pIndex=-1,AIndex=4)
	Index=3
end object
