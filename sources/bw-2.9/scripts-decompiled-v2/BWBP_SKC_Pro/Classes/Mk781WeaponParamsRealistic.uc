class Mk781WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticParams_Holo'
	begin object name="RealisticParams_Holo" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Holo + LAM"
		LayoutTags="lam,no_suppressor"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=4.2000000,Y=0.0100000,Z=6.9700000)
		WeaponMaterialSwaps[0]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=3,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=4,pIndex=0,AIndex=0)
		WeaponName="Mk 781 12ga Flechette Shotgun (LAM)"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_LAM',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-12.0000000,Y=0.0000000,Z=-1.1000000),AugmentRot=(Pitch=0,Yaw=0,Roll=32768))
		MagAmmo=9
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Semi-Automatic",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="X-007 Loaded",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams_Holo
	// Reference: WeaponParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Suppressed"
		LayoutTags="start_suppressed"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-5.0000000,Y=0.0100000,Z=2.6500000)
		SightPivot=(Pitch=-64,Yaw=10,Roll=0)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
		WeaponName="Mk 781 12ga Flechette Shotgun"
		MagAmmo=9
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Semi-Automatic",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="X-007 Loaded",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimarySuppressedFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryFireParams'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryFireParams'
		AltFireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryBoltFireParams'
	end object
	Layouts[1]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticParams_Dart'
	begin object name="RealisticParams_Dart" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="4X Scope Sabot"
		LayoutTags="no_alt, slug"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=4.0000000,Y=0.0000000,Z=8.6000000)
		SightPivot=(Pitch=0,Yaw=1,Roll=0)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="ShellHolder",Slot=8,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="HShells",Slot=9,Scale=0.0000000)
		WeaponName="Mk 781 12ga Sabot Shotgun"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="tip",Scale=0.1500000,AugmentOffset=(X=-28.0000000,Y=0.0000000,Z=-0.3000000),AugmentRot=(Pitch=0,Yaw=32678,Roll=16384))
		MagAmmo=9
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Semi-Automatic",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="X-007 Loaded",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticRecoilParams_Scope'
		AimParams[0]=AimParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticAimParams_Scope'
		FireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams_Dart'
		FireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams_Dart'
		FireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams_Dart'
		FireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams_DartSupp'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[2]=RealisticParams_Dart
	// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.M781_Gray'
	begin object name="M781_Gray" class=BCoreProV55.WeaponCamo
		Weight=40
		CamoName="Gray"
	end object
	Camos[0]=M781_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.M781_Digital'
	begin object name="M781_Digital" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoDigital",Index=1,pIndex=2,AIndex=1)
		Index=1
	end object
	Camos[1]=M781_Digital
	// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.M781_Desert'
	begin object name="M781_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoDesert",Index=1,pIndex=2,AIndex=1)
		Index=2
	end object
	Camos[2]=M781_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.M781_Jungle'
	begin object name="M781_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle Hex"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoJungle",Index=1,pIndex=2,AIndex=1)
		Index=3
	end object
	Camos[3]=M781_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.M781_Winter'
	begin object name="M781_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoWinter",Index=1,pIndex=2,AIndex=1)
		Index=4
	end object
	Camos[4]=M781_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.M781_Wood'
	begin object name="M781_Wood" class=BCoreProV55.WeaponCamo
		Weight=7
		CamoName="Ol' Trusty"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoWood",Index=1,pIndex=2,AIndex=1)
		Index=5
	end object
	Camos[5]=M781_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.M781_RedTiger'
	begin object name="M781_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoTiger",Index=1,pIndex=2,AIndex=1)
		Index=6
	end object
	Camos[6]=M781_RedTiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.M781_Gold'
	begin object name="M781_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoGold",Index=1,pIndex=2,AIndex=1)
		Index=7
	end object
	Camos[7]=M781_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=0
	TargetState="ElektroShot"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=2.0000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams_Dart'
begin object name="RealisticPrimaryFireParams_Dart" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=2.0000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryEffectParams_Dart'
end object
// Reference: AimParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=1250)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.7000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.0000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=-0.3000000),(InVal=1.0000000,OutVal=0.1000000)))
	YawFactor=0.1200000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=3260.0000000
	DeclineTime=0.8500000
	DeclineDelay=0.1500000
	ViewBindFactor=0.7500000
	ADSViewBindFactor=0.7500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Flechette'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=6500.0000000,Max=6500.0000000)
	WaterTraceRange=5000.0000000
	DecayRange=(Min=2200.0000000,Max=6500.0000000)
	Damage=15
	HeadMult=2.2500000
	LimbMult=0.6660000
	DamageType=Class'BWBP_SKC_Pro.DTM781Shotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTM781ShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTM781Shotgun'
	PenetrationEnergy=14.0000000
	PenetrateForce=36
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Mk781.MK781-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	Chaos=0.1600000
	Inaccuracy=(X=400,Y=400)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimarySuppressedEffectParams'
begin object name="RealisticPrimarySuppressedEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Flechette'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=6500.0000000,Max=6500.0000000)
	WaterTraceRange=5000.0000000
	DecayRange=(Min=2200.0000000,Max=6500.0000000)
	Damage=15
	HeadMult=2.2500000
	LimbMult=0.6660000
	DamageType=Class'BWBP_SKC_Pro.DTM781Shotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTM781ShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTM781Shotgun'
	PenetrationEnergy=14.0000000
	PenetrateForce=36
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.Mk781.Mk781-FireSupp',Volume=2.0500000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=0.1600000
	Inaccuracy=(X=250,Y=250)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimarySuppressedFireParams'
begin object name="RealisticPrimarySuppressedFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=2.0000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimarySuppressedEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryEffectParams_Dart'
begin object name="RealisticPrimaryEffectParams_Dart" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_AP'
	ImpactManager=Class'BallisticProV55.IM_BigBullet'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	WaterTraceRange=3400.0000000
	DecayRange=(Min=3400.0000000,Max=9000.0000000)
	RangeAtten=0.4500000
	Damage=120
	HeadMult=2.2500000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DTM781Shotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTM781ShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTM781Shotgun'
	PenetrationEnergy=32.0000000
	PenetrateForce=200
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Mk781.MK781-FireDart',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1400.0000000
	Chaos=0.1200000
	Inaccuracy=(X=32,Y=32)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryEffectParams_DartSupp'
begin object name="RealisticPrimaryEffectParams_DartSupp" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_AP'
	ImpactManager=Class'BallisticProV55.IM_BigBullet'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	WaterTraceRange=3400.0000000
	DecayRange=(Min=3400.0000000,Max=9000.0000000)
	RangeAtten=0.4500000
	Damage=120
	HeadMult=2.2500000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DTM781Shotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTM781ShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTM781Shotgun'
	PenetrationEnergy=32.0000000
	PenetrateForce=200
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Mk781.Mk781-FireSil',Volume=2.3000000,Radius=386.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	Chaos=1.1200000
	Inaccuracy=(X=32,Y=32)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams_DartSupp'
begin object name="RealisticPrimaryFireParams_DartSupp" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=2.0000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryEffectParams_DartSupp'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=6
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Supercharge'
	ImpactManager=Class'BWBP_SKC_Pro.IM_Supercharge'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=2000.0000000,Max=4000.0000000)
	WaterTraceRange=5000.0000000
	Damage=50
	HeadMult=1.5000000
	LimbMult=0.9000000
	DamageType=Class'BWBP_SKC_Pro.DT_Mk781Electro'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_Mk781Electro'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_Mk781Electro'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.HyperBeamCannon.343Primary-Hit',Volume=1.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=700,Y=750)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryBoltEffectParams'
begin object name="RealisticSecondaryBoltEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.MK781PulseProjectile'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=20000.0000000
	MaxSpeed=35000.0000000
	AccelSpeed=35000.0000000
	Damage=150.0000000
	DamageRadius=350.0000000
	MomentumTransfer=30000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Autolaser.AutoLaser-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.1500000
	Inaccuracy=(X=32,Y=32)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryBoltFireParams'
begin object name="RealisticSecondaryBoltFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=0
	TargetState="ElektroSlug"
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryBoltEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
begin object name="RealisticSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
begin object name="RealisticSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticRecoilParams_Scope'
begin object name="RealisticRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=-0.3000000),(InVal=1.0000000,OutVal=0.1000000)))
	YawFactor=0.1200000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=3260.0000000
	DeclineTime=0.8500000
	DeclineDelay=0.1500000
	ViewBindFactor=0.7500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticAimParams_Scope'
begin object name="RealisticAimParams_Scope" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=1250)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-3000,Roll=0)
	ViewBindFactor=1.0000000
	JumpChaos=0.7000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.0000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Suppressed"
	LayoutTags="start_suppressed"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-5.0000000,Y=0.0100000,Z=2.6500000)
	SightPivot=(Pitch=-64,Yaw=10,Roll=0)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
	WeaponName="Mk 781 12ga Flechette Shotgun"
	MagAmmo=9
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Semi-Automatic",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="X-007 Loaded",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimarySuppressedFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryFireParams'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryFireParams'
	AltFireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryBoltFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticParams_Holo'
begin object name="RealisticParams_Holo" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Holo + LAM"
	LayoutTags="lam,no_suppressor"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=4.2000000,Y=0.0100000,Z=6.9700000)
	WeaponMaterialSwaps[0]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=3,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=4,pIndex=0,AIndex=0)
	WeaponName="Mk 781 12ga Flechette Shotgun (LAM)"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_LAM',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-12.0000000,Y=0.0000000,Z=-1.1000000),AugmentRot=(Pitch=0,Yaw=0,Roll=32768))
	MagAmmo=9
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Semi-Automatic",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="X-007 Loaded",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticParams_Dart'
begin object name="RealisticParams_Dart" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="4X Scope Sabot"
	LayoutTags="no_alt, slug"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=4.0000000,Y=0.0000000,Z=8.6000000)
	SightPivot=(Pitch=0,Yaw=1,Roll=0)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="ShellHolder",Slot=8,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="HShells",Slot=9,Scale=0.0000000)
	WeaponName="Mk 781 12ga Sabot Shotgun"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="tip",Scale=0.1500000,AugmentOffset=(X=-28.0000000,Y=0.0000000,Z=-0.3000000),AugmentRot=(Pitch=0,Yaw=32678,Roll=16384))
	MagAmmo=9
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Semi-Automatic",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="X-007 Loaded",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticRecoilParams_Scope'
	AimParams[0]=AimParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticAimParams_Scope'
	FireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams_Dart'
	FireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams_Dart'
	FireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams_Dart'
	FireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticPrimaryFireParams_DartSupp'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.M781_Gray'
begin object name="M781_Gray" class=BCoreProV55.WeaponCamo
	Weight=40
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.M781_Digital'
begin object name="M781_Digital" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoDigital",Index=1,pIndex=2,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.M781_Desert'
begin object name="M781_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoDesert",Index=1,pIndex=2,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.M781_Jungle'
begin object name="M781_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle Hex"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoJungle",Index=1,pIndex=2,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.M781_Winter'
begin object name="M781_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoWinter",Index=1,pIndex=2,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.M781_Wood'
begin object name="M781_Wood" class=BCoreProV55.WeaponCamo
	Weight=7
	CamoName="Ol' Trusty"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoWood",Index=1,pIndex=2,AIndex=1)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.M781_RedTiger'
begin object name="M781_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoTiger",Index=1,pIndex=2,AIndex=1)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsRealistic.M781_Gold'
begin object name="M781_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoGold",Index=1,pIndex=2,AIndex=1)
	Index=7
end object
