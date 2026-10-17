class M763WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M763WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="12ga Shot"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		WeaponName="M763-CS 12ga Combat Shotgun"
		MagAmmo=8
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Single Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.M763WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M763WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.M763WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M763WeaponParamsRealistic.RealisticSecondaryFireParams_Spray'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.M763WeaponParamsRealistic.RealisticParams_Slug'
	begin object name="RealisticParams_Slug" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="12ga Slug"
		LayoutTags="slug"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=0.0000000,Y=-0.0500000,Z=2.0000000)
		WeaponName="M763-CS 12ga Combat Shotgun (Slug)"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="M763",Scale=0.0450000,AugmentOffset=(X=0.0000000,Y=0.6000000,Z=-0.2500000),AugmentRot=(Pitch=32800,Yaw=-16400,Roll=0))
		MagAmmo=8
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Single Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.M763WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M763WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.M763WeaponParamsRealistic.RealisticPrimaryFireParams_Slug'
		AltFireParams[0]=FireParams'BallisticProV55.M763WeaponParamsRealistic.RealisticSecondaryFireParams_Spray'
	end object
	Layouts[1]=RealisticParams_Slug
	// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsRealistic.M763_Gray'
	begin object name="M763_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=M763_Gray
	// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsRealistic.M763_OD'
	begin object name="M763_OD" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Olive Drab"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M763-KShotgunShiney",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M763-KSmallShiney",Index=2,pIndex=1,AIndex=0)
		Index=1
	end object
	Camos[1]=M763_OD
	// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsRealistic.M763_Wood'
	begin object name="M763_Wood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781_LargeShine",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781_SmallShine",Index=2,pIndex=1,AIndex=0)
		Index=2
	end object
	Camos[2]=M763_Wood
	// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsRealistic.M763_Trusty'
	begin object name="M763_Trusty" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Ol' Trusty"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781-OldTrusty",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781Small",Index=2,pIndex=1,AIndex=0)
		Index=3
	end object
	Camos[3]=M763_Trusty
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BallisticProV55.M763WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=1536)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.8000000
	SprintOffset=(Pitch=-3072,Yaw=-3072,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.7000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.0000000
	ChaosSpeedThreshold=600
end object
// Reference: RecoilParams'BallisticProV55.M763WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=-0.3000000),(InVal=1.0000000,OutVal=0.1000000)))
	YawFactor=0.1000000
	XRandFactor=0.2800000
	YRandFactor=0.2800000
	MaxRecoil=2560.0000000
	DeclineTime=0.8000000
	DeclineDelay=0.1900000
	ViewBindFactor=0.8000000
	ADSViewBindFactor=0.8000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BallisticProV55.M763WeaponParamsRealistic.RealisticSecondaryFireParams_Spray'
begin object name="RealisticSecondaryFireParams_Spray" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	TargetState="GasSpray"
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="FireCombinedSight"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M763WeaponParamsRealistic.RealisticSecondaryEffectParams_Spray'
end object
// Reference: ShotgunEffectParams'BallisticProV55.M763WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=8
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=4800.0000000,Max=4800.0000000)
	WaterTraceRange=4800.0000000
	DecayRange=(Min=1200.0000000,Max=4800.0000000)
	Damage=18
	HeadMult=2.2500000
	LimbMult=0.6660000
	DamageType=Class'BallisticProV55.DTM763Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM763ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM763Shotgun'
	PenetrationEnergy=7.0000000
	PenetrateForce=24
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M763FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Fire1',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=920.0000000
	Chaos=0.1200000
	Inaccuracy=(X=300,Y=300)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.M763WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3600000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.5000000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.M763WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BallisticProV55.M763WeaponParamsRealistic.RealisticPrimaryEffectParams_Slug'
begin object name="RealisticPrimaryEffectParams_Slug" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	ImpactManager=Class'BallisticProV55.IM_BigBulletHMG'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=7000.0000000,Max=7000.0000000)
	WaterTraceRange=1200.0000000
	DecayRange=(Min=1200.0000000,Max=7000.0000000)
	RangeAtten=0.1500000
	Damage=150
	HeadMult=2.2500000
	LimbMult=0.6660000
	DamageType=Class'BallisticProV55.DTM763Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM763ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM763Shotgun'
	PenetrationEnergy=32.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M763FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Fire2',Volume=1.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1400.0000000
	Chaos=0.1200000
	Inaccuracy=(X=32,Y=32)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.M763WeaponParamsRealistic.RealisticPrimaryFireParams_Slug'
begin object name="RealisticPrimaryFireParams_Slug" class=BCoreProV55.FireParams
	FireInterval=0.3600000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.5000000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.M763WeaponParamsRealistic.RealisticPrimaryEffectParams_Slug'
end object
// Reference: InstantEffectParams'BallisticProV55.M763WeaponParamsRealistic.RealisticSecondaryEffectParams_Spray'
begin object name="RealisticSecondaryEffectParams_Spray" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=768.0000000,Max=768.0000000)
	RangeAtten=0.2500000
	Damage=35
	DamageType=Class'BallisticProV55.DTM763Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM763ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM763Shotgun'
	PenetrateForce=100
	bPenetrate=true
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Fire1',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.7500000
end object
// Reference: WeaponParams'BallisticProV55.M763WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="12ga Shot"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	WeaponName="M763-CS 12ga Combat Shotgun"
	MagAmmo=8
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Single Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.M763WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M763WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.M763WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M763WeaponParamsRealistic.RealisticSecondaryFireParams_Spray'
end object
// Reference: WeaponParams'BallisticProV55.M763WeaponParamsRealistic.RealisticParams_Slug'
begin object name="RealisticParams_Slug" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="12ga Slug"
	LayoutTags="slug"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=0.0000000,Y=-0.0500000,Z=2.0000000)
	WeaponName="M763-CS 12ga Combat Shotgun (Slug)"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="M763",Scale=0.0450000,AugmentOffset=(X=0.0000000,Y=0.6000000,Z=-0.2500000),AugmentRot=(Pitch=32800,Yaw=-16400,Roll=0))
	MagAmmo=8
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Single Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.M763WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M763WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.M763WeaponParamsRealistic.RealisticPrimaryFireParams_Slug'
	AltFireParams[0]=FireParams'BallisticProV55.M763WeaponParamsRealistic.RealisticSecondaryFireParams_Spray'
end object
// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsRealistic.M763_Gray'
begin object name="M763_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsRealistic.M763_OD'
begin object name="M763_OD" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Olive Drab"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M763-KShotgunShiney",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M763-KSmallShiney",Index=2,pIndex=1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsRealistic.M763_Wood'
begin object name="M763_Wood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781_LargeShine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781_SmallShine",Index=2,pIndex=1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsRealistic.M763_Trusty'
begin object name="M763_Trusty" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Ol' Trusty"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781-OldTrusty",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781Small",Index=2,pIndex=1,AIndex=0)
	Index=3
end object
