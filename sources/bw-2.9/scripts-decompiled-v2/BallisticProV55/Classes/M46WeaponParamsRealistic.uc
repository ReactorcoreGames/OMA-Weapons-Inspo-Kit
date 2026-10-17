class M46WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M46WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Scoped"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=-1.0000000,Y=0.0500000,Z=3.9000000)
		ZoomType=2
		WeaponBoneScales[0]=(BoneName="RDS",Slot=0,Scale=0.0000000)
		ViewPivot=(Pitch=384,Yaw=0,Roll=0)
		WeaponName="M46A2 .310 Battle Rifle"
		MagAmmo=24
		bMagPlusOne=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.M46WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M46WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.M46WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M46WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.M46WeaponParamsRealistic.RealisticRDSParams'
	begin object name="RealisticRDSParams" class=BCoreProV55.WeaponParams
		Weight=20
		LayoutName="RDS"
		InventorySize=7
		WeaponPrice=2300
		SightingTime=0.2500000
		SightOffset=(X=-2.5000000,Y=0.0400000,Z=3.8500000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=0,Scale=0.0000000)
		WeaponName="M46A2 .310 Battle Rifle (RDS)"
		MagAmmo=24
		bMagPlusOne=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.M46WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M46WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.M46WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M46WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticRDSParams
	// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsRealistic.M46_Tan'
	begin object name="M46_Tan" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Desert"
	end object
	Camos[0]=M46_Tan
	// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsRealistic.M46_Jungle'
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
	// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsRealistic.M46_Blue'
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
	// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsRealistic.M46_Black'
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
// Reference: AimParams'BallisticProV55.M46WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=680,Max=1792)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2560,Yaw=-4096,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.0750000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.6000000
end object
// Reference: RecoilParams'BallisticProV55.M46WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.1000000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.3000000)))
	YawFactor=0.2000000
	XRandFactor=0.1900000
	YRandFactor=0.1900000
	MaxRecoil=3600.0000000
	DeclineTime=1.0000000
	DeclineDelay=0.2000000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BallisticProV55.M46WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.5000000
	BurstFireRateFactor=1.0000000
	PreFireAnim="GrenadePrepFire"
	FireAnim="GrenadeFire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.M46WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.M46WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0550000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M46WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.M46WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	WaterTraceRange=7200.0000000
	DecayRange=(Min=1800.0000000,Max=9000.0000000)
	Damage=60
	HeadMult=2.2000000
	LimbMult=0.6500000
	DamageType=Class'BallisticProV55.DTM46Assault'
	DamageTypeHead=Class'BallisticProV55.DTM46AssaultHead'
	DamageTypeArm=Class'BallisticProV55.DTM46Assault'
	PenetrationEnergy=26.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.SRS900.SRS-Fire',Volume=1.1000000,Radius=512.0000000,Slot=3,Pitch=1.1000000,bAtten=false,bNoOverride=false)
	Recoil=880.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=2,Y=2)
	WarnTargetPct=0.2000000
end object
// Reference: ProjectileEffectParams'BallisticProV55.M46WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.M46Grenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2400.0000000
	Damage=160.0000000
	DamageRadius=340.0000000
	LimbMult=0.5000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-AR.OA-AR_FireGren',Volume=1.7500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: WeaponParams'BallisticProV55.M46WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Scoped"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=-1.0000000,Y=0.0500000,Z=3.9000000)
	ZoomType=2
	WeaponBoneScales[0]=(BoneName="RDS",Slot=0,Scale=0.0000000)
	ViewPivot=(Pitch=384,Yaw=0,Roll=0)
	WeaponName="M46A2 .310 Battle Rifle"
	MagAmmo=24
	bMagPlusOne=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.M46WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M46WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.M46WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M46WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.M46WeaponParamsRealistic.RealisticRDSParams'
begin object name="RealisticRDSParams" class=BCoreProV55.WeaponParams
	Weight=20
	LayoutName="RDS"
	InventorySize=7
	WeaponPrice=2300
	SightingTime=0.2500000
	SightOffset=(X=-2.5000000,Y=0.0400000,Z=3.8500000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=0,Scale=0.0000000)
	WeaponName="M46A2 .310 Battle Rifle (RDS)"
	MagAmmo=24
	bMagPlusOne=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.M46WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M46WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.M46WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M46WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsRealistic.M46_Tan'
begin object name="M46_Tan" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Desert"
end object
// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsRealistic.M46_Jungle'
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
// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsRealistic.M46_Blue'
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
// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsRealistic.M46_Black'
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
