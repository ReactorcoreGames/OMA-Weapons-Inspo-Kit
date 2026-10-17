class MARSWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicParams_Marksman'
	begin object name="ClassicParams_Marksman" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Marksman"
		LayoutTags="IRNV,tracker"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		SightOffset=(X=6.5000000,Y=0.0100000,Z=3.8000000)
		ZoomType=2
		ViewOffset=(X=3.0000000,Y=7.0000000,Z=-4.5000000)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.MARS2_FPm'
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicRecoilParams_HeavyBarrel'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicAimParams_HeavyBarrel'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicPrimaryFireParams_HeavyBarrel'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[0]=ClassicParams_Marksman
	// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicParams_Smoker'
	begin object name="ClassicParams_Smoker" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Smoker"
		LayoutTags="IRNV"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		SightOffset=(X=6.5000000,Y=0.0100000,Z=0.8000000)
		ZoomType=2
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.MARS.F2000-LensShineAltGreen',MaterialName="",Index=3,pIndex=2,AIndex=3)
		ViewOffset=(X=3.0000000,Y=7.0000000,Z=-2.5000000)
		WeaponName="MARS-3 Adv Assault Rifle"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.F2000_FPm'
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicPrimaryFireParams_HeavyBarrel'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryFireParams_Smoke'
	end object
	Layouts[1]=ClassicParams_Smoker
	// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicParams_Tracker'
	begin object name="ClassicParams_Tracker" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Tracker"
		LayoutTags="tracker"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		SightOffset=(X=6.5000000,Y=0.0100000,Z=0.8000000)
		ZoomType=2
		ViewOffset=(X=3.0000000,Y=7.0000000,Z=-2.5000000)
		WeaponName="MARS-3 Adv Assault Rifle"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.F2000_FPm'
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicPrimaryFireParams_HeavyBarrel'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryFireParams_Sensor'
	end object
	Layouts[2]=ClassicParams_Tracker
	// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicParams_CQC'
	begin object name="ClassicParams_CQC" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="CQC Bomber"
		LayoutTags="suppressor"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=6.5000000,Y=0.0100000,Z=3.6500000)
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
		ViewOffset=(X=3.0000000,Y=7.0000000,Z=-3.5000000)
		WeaponName="MARS-3 CQB Assault Rifle"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.MARS3_FPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.MARS.MARS3PickupHi'
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryFireParams_HE'
	end object
	Layouts[3]=ClassicParams_CQC
	// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicParams_Shockwave'
	begin object name="ClassicParams_Shockwave" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="CQC Shockwave"
		LayoutTags="suppressor"
		InventorySize=4
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=6.5000000,Y=0.0100000,Z=3.6500000)
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
		ViewOffset=(X=3.0000000,Y=7.0000000,Z=-3.5000000)
		WeaponName="MARS-3 CQB Assault Rifle"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.MARS3_FPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.MARS.MARS3PickupHi'
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryFireParams_Shockwave'
	end object
	Layouts[4]=ClassicParams_Shockwave
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsClassic.MARS_Black'
	begin object name="MARS_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=MARS_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsClassic.MARS_Tan'
	begin object name="MARS_Tan" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Tan"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronsTan",Index=1,pIndex=1,AIndex=0)
		Index=1
	end object
	Camos[1]=MARS_Tan
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsClassic.MARS_Green'
	begin object name="MARS_Green" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Olive Drab"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-MainGreen",Index=1,pIndex=1,AIndex=0)
		Index=2
	end object
	Camos[2]=MARS_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsClassic.MARS_Urban'
	begin object name="MARS_Urban" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-MainSplitter",Index=1,pIndex=1,AIndex=0)
		Index=3
	end object
	Camos[3]=MARS_Urban
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsClassic.MARS_Arctic'
	begin object name="MARS_Arctic" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronArctic",Index=1,pIndex=1,AIndex=0)
		Index=4
	end object
	Camos[4]=MARS_Arctic
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsClassic.MARS_Proto'
	begin object name="MARS_Proto" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Prototype"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronBlack",Index=1,pIndex=1,AIndex=0)
		Index=5
	end object
	Camos[5]=MARS_Proto
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsClassic.MARS_LE'
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
// Reference: RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.1500000),(InVal=0.6000000,OutVal=0.2000000),(InVal=0.8000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.4000000)))
	PitchFactor=1.5000000
	YawFactor=0.1000000
	XRandFactor=0.3500000
	YRandFactor=0.5000000
	MinRandFactor=0.0500000
	MaxRecoil=4800.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.3000000
	JumpChaos=0.3500000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicPrimaryFireParams_HeavyBarrel'
begin object name="ClassicPrimaryFireParams_HeavyBarrel" class=BCoreProV55.FireParams
	FireInterval=0.0857000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicPrimaryEffectParams_HeavyBarrel'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryEffectParams_HE'
begin object name="ClassicSecondaryEffectParams_HE" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.MARSGrenade_HETimed'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=7000.0000000
	MaxSpeed=7000.0000000
	Damage=150.0000000
	DamageRadius=256.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.5000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryEffectParams_Sensor'
begin object name="ClassicSecondaryEffectParams_Sensor" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.MARSGrenade_Sensor'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=7000.0000000
	MaxSpeed=7000.0000000
	Damage=10.0000000
	DamageRadius=10.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0770000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=2.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicPrimaryEffectParams_HeavyBarrel'
begin object name="ClassicPrimaryEffectParams_HeavyBarrel" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=11000.0000000,Max=14000.0000000)
	WaterTraceRange=11200.0000000
	RangeAtten=0.9500000
	Damage=24
	HeadMult=3.1250000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_MARSAssault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MARSAssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MARSAssault'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MARSFlashEmitter_C'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-Fire',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=200.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=16,Y=16)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10500.0000000,Max=12500.0000000)
	WaterTraceRange=10000.0000000
	RangeAtten=0.8500000
	Damage=22
	HeadMult=3.5000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_MARSAssault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MARSAssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MARSAssault'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MARSFlashEmitter_C'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-RapidFire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=220.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=32,Y=32)
	WarnTargetPct=0.2000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryEffectParams_Smoke'
begin object name="ClassicSecondaryEffectParams_Smoke" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.MARSGrenade_Chaff'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=7000.0000000
	MaxSpeed=7000.0000000
	Damage=50.0000000
	DamageRadius=256.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryFireParams_Smoke'
begin object name="ClassicSecondaryFireParams_Smoke" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	PreFireAnim="GLPrepFire"
	FireAnim="GLFire"
	AimedFireAnim="GLSightFireFromPrep"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryEffectParams_Smoke'
end object
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryFireParams_Sensor'
begin object name="ClassicSecondaryFireParams_Sensor" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	PreFireAnim="GLPrepFire"
	FireAnim="GLFire"
	AimedFireAnim="GLSightFireFromPrep"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryEffectParams_Sensor'
end object
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryFireParams_HE'
begin object name="ClassicSecondaryFireParams_HE" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	PreFireAnim="GLPrepFire"
	FireAnim="GLFire"
	AimedFireAnim="GLSightFireFromPrep"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryEffectParams_HE'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryEffectParams_Shockwave'
begin object name="ClassicSecondaryEffectParams_Shockwave" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.MARSGrenade_Shockwave'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=7000.0000000
	MaxSpeed=7000.0000000
	Damage=50.0000000
	DamageRadius=256.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryFireParams_Shockwave'
begin object name="ClassicSecondaryFireParams_Shockwave" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	PreFireAnim="GLPrepFire"
	FireAnim="GLFire"
	AimedFireAnim="GLSightFireFromPrep"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryEffectParams_Shockwave'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
begin object name="ClassicSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryFireParams_Scope'
begin object name="ClassicSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicRecoilParams_HeavyBarrel'
begin object name="ClassicRecoilParams_HeavyBarrel" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.4000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.6500000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.4000000
	XRandFactor=0.3000000
	YRandFactor=0.4000000
	MaxRecoil=3200.0000000
	ViewBindFactor=0.6000000
	CrouchMultiplier=0.5000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicAimParams_HeavyBarrel'
begin object name="ClassicAimParams_HeavyBarrel" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2048)
	CrouchMultiplier=0.5000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.3500000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.5000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicParams_Marksman'
begin object name="ClassicParams_Marksman" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Marksman"
	LayoutTags="IRNV,tracker"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	SightOffset=(X=6.5000000,Y=0.0100000,Z=3.8000000)
	ZoomType=2
	ViewOffset=(X=3.0000000,Y=7.0000000,Z=-4.5000000)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.MARS2_FPm'
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicRecoilParams_HeavyBarrel'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicAimParams_HeavyBarrel'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicPrimaryFireParams_HeavyBarrel'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicParams_Smoker'
begin object name="ClassicParams_Smoker" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Smoker"
	LayoutTags="IRNV"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	SightOffset=(X=6.5000000,Y=0.0100000,Z=0.8000000)
	ZoomType=2
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.MARS.F2000-LensShineAltGreen',MaterialName="",Index=3,pIndex=2,AIndex=3)
	ViewOffset=(X=3.0000000,Y=7.0000000,Z=-2.5000000)
	WeaponName="MARS-3 Adv Assault Rifle"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.F2000_FPm'
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicPrimaryFireParams_HeavyBarrel'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryFireParams_Smoke'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicParams_Tracker'
begin object name="ClassicParams_Tracker" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Tracker"
	LayoutTags="tracker"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	SightOffset=(X=6.5000000,Y=0.0100000,Z=0.8000000)
	ZoomType=2
	ViewOffset=(X=3.0000000,Y=7.0000000,Z=-2.5000000)
	WeaponName="MARS-3 Adv Assault Rifle"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.F2000_FPm'
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicPrimaryFireParams_HeavyBarrel'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryFireParams_Sensor'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicParams_CQC'
begin object name="ClassicParams_CQC" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="CQC Bomber"
	LayoutTags="suppressor"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=6.5000000,Y=0.0100000,Z=3.6500000)
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
	ViewOffset=(X=3.0000000,Y=7.0000000,Z=-3.5000000)
	WeaponName="MARS-3 CQB Assault Rifle"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.MARS3_FPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.MARS.MARS3PickupHi'
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryFireParams_HE'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicParams_Shockwave'
begin object name="ClassicParams_Shockwave" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="CQC Shockwave"
	LayoutTags="suppressor"
	InventorySize=4
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=6.5000000,Y=0.0100000,Z=3.6500000)
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
	ViewOffset=(X=3.0000000,Y=7.0000000,Z=-3.5000000)
	WeaponName="MARS-3 CQB Assault Rifle"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.MARS3_FPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.MARS.MARS3PickupHi'
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsClassic.ClassicSecondaryFireParams_Shockwave'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsClassic.MARS_Black'
begin object name="MARS_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsClassic.MARS_Tan'
begin object name="MARS_Tan" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Tan"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronsTan",Index=1,pIndex=1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsClassic.MARS_Green'
begin object name="MARS_Green" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Olive Drab"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-MainGreen",Index=1,pIndex=1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsClassic.MARS_Urban'
begin object name="MARS_Urban" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-MainSplitter",Index=1,pIndex=1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsClassic.MARS_Arctic'
begin object name="MARS_Arctic" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronArctic",Index=1,pIndex=1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsClassic.MARS_Proto'
begin object name="MARS_Proto" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Prototype"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronBlack",Index=1,pIndex=1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsClassic.MARS_LE'
begin object name="MARS_LE" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Limited Edition"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronWhite",Index=1,pIndex=1,AIndex=0)
	Index=6
end object
