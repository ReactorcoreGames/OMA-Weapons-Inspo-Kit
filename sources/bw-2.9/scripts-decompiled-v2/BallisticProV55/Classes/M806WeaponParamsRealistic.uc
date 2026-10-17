class M806WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M806WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Laser + Ext Mags"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		WeaponPrice=800
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1500000
		SightOffset=(X=-13.0000000,Y=-4.2000000,Z=37.5000000)
		SightPivot=(Pitch=-110,Yaw=0,Roll=-675)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3500,Roll=0)
		RootAdjust=(Pitch=3500,Yaw=-375,Roll=0)
		ViewOffset=(X=0.0000000,Y=20.0000000,Z=-20.0000000)
		WeaponName="M806 .45 Handgun"
		MagAmmo=12
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.M806WeaponParamsRealistic.RealisticParams_Scope'
	begin object name="RealisticParams_Scope" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="4X Scope"
		LayoutTags="scope"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		WeaponPrice=800
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2700000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=18.0000000)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
		MaxZoom=4.0000000
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.M806.M806_Main-SD',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'ONSstructureTextures.CoreGroup.Invisible',MaterialName="",Index=2,pIndex=0,AIndex=0)
		ViewOffset=(X=0.0000000,Y=20.0000000,Z=-20.0000000)
		WeaponName="M806 .45 Handgun (4X)"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_PistolRail',BoneName="Muzzle",Scale=0.3500000,AugmentOffset=(X=-60.0000000,Y=0.0000000,Z=-50.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_4XScope',BoneName="Muzzle",Scale=0.2750000,AugmentOffset=(X=-140.0000000,Y=0.0000000,Z=30.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=0))
		MagAmmo=8
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsRealistic.RealisticRecoilParams_Scope'
		AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[1]=RealisticParams_Scope
	// Reference: WeaponParams'BallisticProV55.M806WeaponParamsRealistic.RealisticParams_Shotgun'
	begin object name="RealisticParams_Shotgun" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Shotgun"
		LayoutTags="shotgun"
		PlayerSpeedFactor=1.0500000
		InventorySize=3
		WeaponPrice=1200
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2000000
		SightOffset=(X=-5.0000000,Y=0.0000000,Z=4.5000000)
		ViewOffset=(X=0.0000000,Y=20.0000000,Z=-20.0000000)
		WeaponName="M806 .45/16ga Handgun"
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M806SG_FPm'
		MagAmmo=8
		bMagPlusOne=true
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsRealistic.RealisticSecondaryFireParams_SG'
	end object
	Layouts[2]=RealisticParams_Shotgun
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsRealistic.M806_Gray'
	begin object name="M806_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=M806_Gray
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsRealistic.M806_Black'
	begin object name="M806_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainBlackShine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=M806_Black
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsRealistic.M806_Desert'
	begin object name="M806_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainDesert",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=M806_Desert
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsRealistic.M806_Tiger'
	begin object name="M806_Tiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainTigerShine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=M806_Tiger
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsRealistic.M806_Dragon'
	begin object name="M806_Dragon" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Dragon"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.Dragon_Main-SD",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=M806_Dragon
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsRealistic.M806_Gold'
	begin object name="M806_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainGoldShine",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=M806_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BallisticProV55.M806WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1700000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=2.7500000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M806WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: AimParams'BallisticProV55.M806WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=1024)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.8200000
	ADSMultiplier=0.7700000
	SprintOffset=(Pitch=-4608,Yaw=-512,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.6500000
	ChaosSpeedThreshold=750
end object
// Reference: RecoilParams'BallisticProV55.M806WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.5500000
	YawFactor=0.0000000
	XRandFactor=0.4000000
	YRandFactor=0.4000000
	MaxRecoil=1536.0000000
	DeclineTime=0.4000000
	DeclineDelay=0.1250000
	ViewBindFactor=0.3000000
	ADSViewBindFactor=0.3000000
	CrouchMultiplier=0.8200000
	bViewDecline=true
end object
// Reference: FireParams'BallisticProV55.M806WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=FireEffectParams'BallisticProV55.M806WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.M806WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	WaterTraceRange=5000.0000000
	DecayRange=(Min=800.0000000,Max=4000.0000000)
	RangeAtten=0.5000000
	Damage=45
	HeadMult=2.3000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTM806Pistol'
	DamageTypeHead=Class'BallisticProV55.DTM806PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTM806Pistol'
	PenetrationEnergy=9.0000000
	PenetrateForce=30
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M806FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Fire',Volume=0.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=640.0000000
	Chaos=0.0800000
	Inaccuracy=(X=15,Y=15)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireEffectParams'BallisticProV55.M806WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	EffectString="Laser sight"
end object
// Reference: ShotgunEffectParams'BallisticProV55.M806WeaponParamsRealistic.RealisticSecondaryEffectParams_SG'
begin object name="RealisticSecondaryEffectParams_SG" class=BCoreProV55.ShotgunEffectParams
	TraceCount=6
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	RangeAtten=0.7500000
	Damage=10
	DamageType=Class'BallisticProV55.DTM806Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM806ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM806Shotgun'
	PenetrationEnergy=4.0000000
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-Fire',Volume=1.1000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=0.5000000
	Inaccuracy=(X=400,Y=400)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.M806WeaponParamsRealistic.RealisticSecondaryFireParams_SG'
begin object name="RealisticSecondaryFireParams_SG" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	TargetState="Shotgun"
	PreFireAnim="None"
	FireAnim="FireAlt"
	FireAnimRate=1.1000000
	AimedFireAnim="'"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.M806WeaponParamsRealistic.RealisticSecondaryEffectParams_SG'
end object
// Reference: FireEffectParams'BallisticProV55.M806WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
begin object name="RealisticSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.M806WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
begin object name="RealisticSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.M806WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: RecoilParams'BallisticProV55.M806WeaponParamsRealistic.RealisticRecoilParams_Scope'
begin object name="RealisticRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.5500000
	YawFactor=0.0000000
	XRandFactor=0.4000000
	YRandFactor=0.4000000
	MaxRecoil=1536.0000000
	DeclineTime=0.4000000
	DeclineDelay=0.1250000
	CrouchMultiplier=0.8200000
	bViewDecline=true
end object
// Reference: WeaponParams'BallisticProV55.M806WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Laser + Ext Mags"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	WeaponPrice=800
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1500000
	SightOffset=(X=-13.0000000,Y=-4.2000000,Z=37.5000000)
	SightPivot=(Pitch=-110,Yaw=0,Roll=-675)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3500,Roll=0)
	RootAdjust=(Pitch=3500,Yaw=-375,Roll=0)
	ViewOffset=(X=0.0000000,Y=20.0000000,Z=-20.0000000)
	WeaponName="M806 .45 Handgun"
	MagAmmo=12
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.M806WeaponParamsRealistic.RealisticParams_Scope'
begin object name="RealisticParams_Scope" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="4X Scope"
	LayoutTags="scope"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	WeaponPrice=800
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2700000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=18.0000000)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
	MaxZoom=4.0000000
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.M806.M806_Main-SD',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'ONSstructureTextures.CoreGroup.Invisible',MaterialName="",Index=2,pIndex=0,AIndex=0)
	ViewOffset=(X=0.0000000,Y=20.0000000,Z=-20.0000000)
	WeaponName="M806 .45 Handgun (4X)"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_PistolRail',BoneName="Muzzle",Scale=0.3500000,AugmentOffset=(X=-60.0000000,Y=0.0000000,Z=-50.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_4XScope',BoneName="Muzzle",Scale=0.2750000,AugmentOffset=(X=-140.0000000,Y=0.0000000,Z=30.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=0))
	MagAmmo=8
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsRealistic.RealisticRecoilParams_Scope'
	AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.M806WeaponParamsRealistic.RealisticParams_Shotgun'
begin object name="RealisticParams_Shotgun" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Shotgun"
	LayoutTags="shotgun"
	PlayerSpeedFactor=1.0500000
	InventorySize=3
	WeaponPrice=1200
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2000000
	SightOffset=(X=-5.0000000,Y=0.0000000,Z=4.5000000)
	ViewOffset=(X=0.0000000,Y=20.0000000,Z=-20.0000000)
	WeaponName="M806 .45/16ga Handgun"
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M806SG_FPm'
	MagAmmo=8
	bMagPlusOne=true
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsRealistic.RealisticSecondaryFireParams_SG'
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsRealistic.M806_Gray'
begin object name="M806_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsRealistic.M806_Black'
begin object name="M806_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainBlackShine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsRealistic.M806_Desert'
begin object name="M806_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainDesert",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsRealistic.M806_Tiger'
begin object name="M806_Tiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainTigerShine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsRealistic.M806_Dragon'
begin object name="M806_Dragon" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Dragon"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.Dragon_Main-SD",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsRealistic.M806_Gold'
begin object name="M806_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainGoldShine",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
