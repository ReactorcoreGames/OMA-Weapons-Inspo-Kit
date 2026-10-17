class MARSWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticParams_AdvScope'
	begin object name="RealisticParams_AdvScope" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Thermal Marksman"
		LayoutTags="IRNV, tracker"
		WeaponPrice=2800
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=6.5000000,Y=0.0100000,Z=3.8000000)
		ZoomType=2
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.MARS.F2000-LensShineAltGreen',MaterialName="",Index=3,pIndex=2,AIndex=3)
		WeaponName="MARS-2 5.56mm Bullpup Rifle"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.MARS2_FPm'
		bMagPlusOne=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticRecoilParams_HeavyBarrel'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticAimParams_HeavyBarrel'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[0]=RealisticParams_AdvScope
	// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticParams_Sensor'
	begin object name="RealisticParams_Sensor" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Sensor Suite"
		LayoutTags="tracker"
		WeaponPrice=2800
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=6.5000000,Y=0.0100000,Z=0.8000000)
		ZoomType=2
		WeaponName="MARS-2 5.56mm Bullpup Rifle"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.F2000_FPm'
		bMagPlusOne=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticRecoilParams_HeavyBarrel'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticSecondaryFireParams_Sensor'
	end object
	Layouts[1]=RealisticParams_Sensor
	// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticParams_Holo'
	begin object name="RealisticParams_Holo" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="CQC Holosight"
		LayoutTags="suppressor"
		WeaponPrice=2800
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2300000
		SightOffset=(X=6.5000000,Y=0.0100000,Z=3.6500000)
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
		WeaponName="MARS-3 5.56mm Bullpup Rifle"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.MARS3_FPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.MARS.MARS3PickupHi'
		bMagPlusOne=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticSecondaryFireParams_HE'
	end object
	Layouts[2]=RealisticParams_Holo
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsRealistic.MARS_Black'
	begin object name="MARS_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=MARS_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsRealistic.MARS_Tan'
	begin object name="MARS_Tan" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Tan"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronsTan",Index=1,pIndex=1,AIndex=0)
		Index=1
	end object
	Camos[1]=MARS_Tan
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsRealistic.MARS_Green'
	begin object name="MARS_Green" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Olive Drab"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-MainGreen",Index=1,pIndex=1,AIndex=0)
		Index=2
	end object
	Camos[2]=MARS_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsRealistic.MARS_Urban'
	begin object name="MARS_Urban" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-MainSplitter",Index=1,pIndex=1,AIndex=0)
		Index=3
	end object
	Camos[3]=MARS_Urban
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsRealistic.MARS_Arctic'
	begin object name="MARS_Arctic" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronArctic",Index=1,pIndex=1,AIndex=0)
		Index=4
	end object
	Camos[4]=MARS_Arctic
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsRealistic.MARS_Proto'
	begin object name="MARS_Proto" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Prototype"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronBlack",Index=1,pIndex=1,AIndex=0)
		Index=5
	end object
	Camos[5]=MARS_Proto
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsRealistic.MARS_LE'
	begin object name="MARS_LE" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Limited Edition"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronWhite",Index=1,pIndex=1,AIndex=0)
		Index=6
	end object
	Camos[6]=MARS_LE
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0792000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.2000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: AimParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=400,Max=1280)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.0600000
	JumpChaos=0.3500000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.2000000
	ChaosSpeedThreshold=565
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticRecoilParams_HeavyBarrel'
begin object name="RealisticRecoilParams_HeavyBarrel" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4500000,OutVal=0.4000000),(InVal=0.6500000,OutVal=0.2000000),(InVal=1.0000000,OutVal=0.1500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.3500000),(InVal=0.7500000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.5000000)))
	YawFactor=0.1500000
	XRandFactor=0.1650000
	YRandFactor=0.1650000
	MaxRecoil=3000.0000000
	DeclineTime=0.8500000
	DeclineDelay=0.1500000
	ViewBindFactor=0.0600000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1400.0000000,Max=6000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.0500000
	Damage=45
	HeadMult=2.1395340
	LimbMult=0.6511620
	DamageType=Class'BWBP_SKC_Pro.DT_MARSAssault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MARSAssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MARSAssault'
	PenetrationEnergy=16.0000000
	PenetrateForce=50
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-Fire',Volume=0.9000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=725.0000000
	Chaos=0.0500000
	Inaccuracy=(X=12,Y=12)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticSecondaryFireParams_HE'
begin object name="RealisticSecondaryFireParams_HE" class=BCoreProV55.FireParams
	FireInterval=2.0000000
	BurstFireRateFactor=1.0000000
	PreFireAnim="GLPrepFire"
	FireAnim="GLFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryEffectParams_HE'
end object
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticSecondaryFireParams_Sensor'
begin object name="RealisticSecondaryFireParams_Sensor" class=BCoreProV55.FireParams
	FireInterval=2.0000000
	BurstFireRateFactor=1.0000000
	PreFireAnim="GLPrepFire"
	FireAnim="GLFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryEffectParams_Sensor'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
begin object name="RealisticSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
begin object name="RealisticSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4500000,OutVal=0.4000000),(InVal=0.6500000,OutVal=0.2000000),(InVal=1.0000000,OutVal=0.1500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.3500000),(InVal=0.7500000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.5000000)))
	YawFactor=0.1500000
	XRandFactor=0.1650000
	YRandFactor=0.1650000
	MaxRecoil=3000.0000000
	DeclineTime=0.7500000
	DeclineDelay=0.1350000
	ViewBindFactor=0.0600000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticAimParams_HeavyBarrel'
begin object name="RealisticAimParams_HeavyBarrel" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1280)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.0600000
	JumpChaos=0.3500000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.2000000
	ChaosSpeedThreshold=565
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticParams_AdvScope'
begin object name="RealisticParams_AdvScope" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Thermal Marksman"
	LayoutTags="IRNV, tracker"
	WeaponPrice=2800
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=6.5000000,Y=0.0100000,Z=3.8000000)
	ZoomType=2
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.MARS.F2000-LensShineAltGreen',MaterialName="",Index=3,pIndex=2,AIndex=3)
	WeaponName="MARS-2 5.56mm Bullpup Rifle"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.MARS2_FPm'
	bMagPlusOne=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticRecoilParams_HeavyBarrel'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticAimParams_HeavyBarrel'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticParams_Sensor'
begin object name="RealisticParams_Sensor" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Sensor Suite"
	LayoutTags="tracker"
	WeaponPrice=2800
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=6.5000000,Y=0.0100000,Z=0.8000000)
	ZoomType=2
	WeaponName="MARS-2 5.56mm Bullpup Rifle"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.F2000_FPm'
	bMagPlusOne=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticRecoilParams_HeavyBarrel'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticSecondaryFireParams_Sensor'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticParams_Holo'
begin object name="RealisticParams_Holo" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="CQC Holosight"
	LayoutTags="suppressor"
	WeaponPrice=2800
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2300000
	SightOffset=(X=6.5000000,Y=0.0100000,Z=3.6500000)
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
	WeaponName="MARS-3 5.56mm Bullpup Rifle"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.MARS3_FPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.MARS.MARS3PickupHi'
	bMagPlusOne=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsRealistic.RealisticSecondaryFireParams_HE'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsRealistic.MARS_Black'
begin object name="MARS_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsRealistic.MARS_Tan'
begin object name="MARS_Tan" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Tan"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronsTan",Index=1,pIndex=1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsRealistic.MARS_Green'
begin object name="MARS_Green" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Olive Drab"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-MainGreen",Index=1,pIndex=1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsRealistic.MARS_Urban'
begin object name="MARS_Urban" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-MainSplitter",Index=1,pIndex=1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsRealistic.MARS_Arctic'
begin object name="MARS_Arctic" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronArctic",Index=1,pIndex=1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsRealistic.MARS_Proto'
begin object name="MARS_Proto" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Prototype"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronBlack",Index=1,pIndex=1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsRealistic.MARS_LE'
begin object name="MARS_LE" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Limited Edition"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronWhite",Index=1,pIndex=1,AIndex=0)
	Index=6
end object
