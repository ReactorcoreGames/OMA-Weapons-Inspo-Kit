class M806WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M806WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Laser + Ext Mags"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		WeaponPrice=800
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2250000
		SightOffset=(X=-13.0000000,Y=-4.2000000,Z=37.5000000)
		SightPivot=(Pitch=-110,Yaw=0,Roll=-675)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3500,Roll=0)
		RootAdjust=(Pitch=3500,Yaw=-375,Roll=0)
		ViewOffset=(X=3.0000000,Y=25.0000000,Z=-23.0000000)
		MagAmmo=12
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicPrimaryFireParamsBurst'
		AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BallisticProV55.M806WeaponParamsClassic.ClassicParams_Scope'
	begin object name="ClassicParams_Scope" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="4X Scope"
		LayoutTags="scope"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		WeaponPrice=800
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=18.0000000)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
		MaxZoom=4.0000000
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.M806.M806_Main-SD',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'ONSstructureTextures.CoreGroup.Invisible',MaterialName="",Index=2,pIndex=0,AIndex=0)
		ViewOffset=(X=3.0000000,Y=25.0000000,Z=-23.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_PistolRail',BoneName="Muzzle",Scale=0.3500000,AugmentOffset=(X=-60.0000000,Y=0.0000000,Z=-50.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_4XScope',BoneName="Muzzle",Scale=0.2750000,AugmentOffset=(X=-140.0000000,Y=0.0000000,Z=30.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=0))
		MagAmmo=8
		bNeedCock=true
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicPrimaryFireParamsBurst'
		AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[1]=ClassicParams_Scope
	// Reference: WeaponParams'BallisticProV55.M806WeaponParamsClassic.ClassicParams_Shotgun'
	begin object name="ClassicParams_Shotgun" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Shotgun"
		LayoutTags="shotgun"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		WeaponPrice=1200
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-5.0000000,Y=0.0000000,Z=4.5000000)
		ViewOffset=(X=-9.0000000,Y=17.0000000,Z=-12.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M806SG_FPm'
		MagAmmo=8
		bNeedCock=true
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicPrimaryFireParamsBurst'
		AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicSecondaryFireParams_Shotgun'
	end object
	Layouts[2]=ClassicParams_Shotgun
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsClassic.M806_Gray'
	begin object name="M806_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=M806_Gray
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsClassic.M806_Black'
	begin object name="M806_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainBlackShine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=M806_Black
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsClassic.M806_Desert'
	begin object name="M806_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainDesert",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=M806_Desert
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsClassic.M806_Tiger'
	begin object name="M806_Tiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainTigerShine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=M806_Tiger
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsClassic.M806_Dragon'
	begin object name="M806_Dragon" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Dragon"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.Dragon_Main-SD",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=M806_Dragon
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsClassic.M806_Gold'
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
// Reference: FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M806WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicPrimaryFireParamsBurst'
begin object name="ClassicPrimaryFireParamsBurst" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=0.7500000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M806WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.M806WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=8192.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.3000000
	HipMultiplier=1.6000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.M806WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=48,Max=1024)
	AimAdjustTime=0.4500000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=1400
	ChaosTurnThreshold=196608
end object
// Reference: InstantEffectParams'BallisticProV55.M806WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5000.0000000,Max=6000.0000000)
	WaterTraceRange=3600.0000000
	RangeAtten=0.8000000
	Damage=35
	HeadMult=3.0000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTM806Pistol'
	DamageTypeHead=Class'BallisticProV55.DTM806PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTM806Pistol'
	PenetrationEnergy=24.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M806FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Fire',Volume=0.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1836.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=4,Y=4)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireEffectParams'BallisticProV55.M806WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	EffectString="Laser sight"
end object
// Reference: FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=FireEffectParams'BallisticProV55.M806WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: ShotgunEffectParams'BallisticProV55.M806WeaponParamsClassic.ClassicSecondaryEffectParams_Shotgun'
begin object name="ClassicSecondaryEffectParams_Shotgun" class=BCoreProV55.ShotgunEffectParams
	TraceCount=12
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	RangeAtten=0.7500000
	Damage=6
	DamageType=Class'BallisticProV55.DTM806Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM806ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM806Shotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-Fire',Volume=1.1000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.5000000
	Inaccuracy=(X=400,Y=400)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicSecondaryFireParams_Shotgun'
begin object name="ClassicSecondaryFireParams_Shotgun" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	TargetState="Shotgun"
	FireAnim="FireAlt"
	FireEndAnim="None"
	AimedFireAnim="'"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.M806WeaponParamsClassic.ClassicSecondaryEffectParams_Shotgun'
end object
// Reference: FireEffectParams'BallisticProV55.M806WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
begin object name="ClassicSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
begin object name="ClassicSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.M806WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.M806WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Laser + Ext Mags"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	WeaponPrice=800
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2250000
	SightOffset=(X=-13.0000000,Y=-4.2000000,Z=37.5000000)
	SightPivot=(Pitch=-110,Yaw=0,Roll=-675)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3500,Roll=0)
	RootAdjust=(Pitch=3500,Yaw=-375,Roll=0)
	ViewOffset=(X=3.0000000,Y=25.0000000,Z=-23.0000000)
	MagAmmo=12
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicPrimaryFireParamsBurst'
	AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.M806WeaponParamsClassic.ClassicParams_Scope'
begin object name="ClassicParams_Scope" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="4X Scope"
	LayoutTags="scope"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	WeaponPrice=800
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=18.0000000)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
	MaxZoom=4.0000000
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.M806.M806_Main-SD',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'ONSstructureTextures.CoreGroup.Invisible',MaterialName="",Index=2,pIndex=0,AIndex=0)
	ViewOffset=(X=3.0000000,Y=25.0000000,Z=-23.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_PistolRail',BoneName="Muzzle",Scale=0.3500000,AugmentOffset=(X=-60.0000000,Y=0.0000000,Z=-50.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_4XScope',BoneName="Muzzle",Scale=0.2750000,AugmentOffset=(X=-140.0000000,Y=0.0000000,Z=30.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=0))
	MagAmmo=8
	bNeedCock=true
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicPrimaryFireParamsBurst'
	AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.M806WeaponParamsClassic.ClassicParams_Shotgun'
begin object name="ClassicParams_Shotgun" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Shotgun"
	LayoutTags="shotgun"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	WeaponPrice=1200
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-5.0000000,Y=0.0000000,Z=4.5000000)
	ViewOffset=(X=-9.0000000,Y=17.0000000,Z=-12.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M806SG_FPm'
	MagAmmo=8
	bNeedCock=true
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicPrimaryFireParamsBurst'
	AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsClassic.ClassicSecondaryFireParams_Shotgun'
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsClassic.M806_Gray'
begin object name="M806_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsClassic.M806_Black'
begin object name="M806_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainBlackShine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsClassic.M806_Desert'
begin object name="M806_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainDesert",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsClassic.M806_Tiger'
begin object name="M806_Tiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainTigerShine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsClassic.M806_Dragon'
begin object name="M806_Dragon" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Dragon"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.Dragon_Main-SD",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsClassic.M806_Gold'
begin object name="M806_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainGoldShine",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
