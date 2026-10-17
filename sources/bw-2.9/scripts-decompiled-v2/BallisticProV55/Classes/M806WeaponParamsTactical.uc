class M806WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M806WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Laser Sight"
		InventorySize=2
		WeaponPrice=800
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.1700000
		SightOffset=(X=-13.0000000,Y=-4.2000000,Z=37.5000000)
		SightPivot=(Pitch=-110,Yaw=0,Roll=-675)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3500,Roll=0)
		RootAdjust=(Pitch=3500,Yaw=-375,Roll=0)
		ViewOffset=(X=0.0000000,Y=30.0000000,Z=-20.0000000)
		DisplaceDurationMult=0.5000000
		MagAmmo=12
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BallisticProV55.M806WeaponParamsTactical.TacticalParams_Scope'
	begin object name="TacticalParams_Scope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Scoped"
		LayoutTags="scope"
		InventorySize=2
		WeaponPrice=1000
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.3200000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=18.0000000)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
		MaxZoom=4.0000000
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.M806.M806_Main-SD',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'ONSstructureTextures.CoreGroup.Invisible',MaterialName="",Index=2,pIndex=0,AIndex=0)
		ViewOffset=(X=0.0000000,Y=20.0000000,Z=-20.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_PistolRail',BoneName="Muzzle",Scale=0.3500000,AugmentOffset=(X=-60.0000000,Y=0.0000000,Z=-50.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_4XScope',BoneName="Muzzle",Scale=0.2750000,AugmentOffset=(X=-140.0000000,Y=0.0000000,Z=30.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=0))
		DisplaceDurationMult=0.5000000
		MagAmmo=12
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsTactical.TacticalRecoilParams_Scope'
		AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsTactical.TacticalAimParams_Scope'
		FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	end object
	Layouts[1]=TacticalParams_Scope
	// Reference: WeaponParams'BallisticProV55.M806WeaponParamsTactical.TacticalParams_Shotgun'
	begin object name="TacticalParams_Shotgun" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Shotgun"
		LayoutTags="shotgun"
		InventorySize=2
		WeaponPrice=1200
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2200000
		SightOffset=(X=-5.0000000,Y=0.0000000,Z=4.5000000)
		ViewOffset=(X=0.0000000,Y=30.0000000,Z=-20.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M806SG_FPm'
		DisplaceDurationMult=0.5000000
		MagAmmo=12
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsTactical.TacticalPrimaryFireParams_Underbarrel'
		AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsTactical.TacticalSecondaryFireParams_Shotgun'
	end object
	Layouts[2]=TacticalParams_Shotgun
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsTactical.M806_Gray'
	begin object name="M806_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=M806_Gray
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsTactical.M806_Black'
	begin object name="M806_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainBlackShine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=M806_Black
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsTactical.M806_Desert'
	begin object name="M806_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainDesert",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=M806_Desert
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsTactical.M806_Tiger'
	begin object name="M806_Tiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainTigerShine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=M806_Tiger
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsTactical.M806_Dragon'
	begin object name="M806_Dragon" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Dragon"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.Dragon_Main-SD",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=M806_Dragon
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsTactical.M806_Gold'
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
// Reference: AimParams'BallisticProV55.M806WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=768)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.3200000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BallisticProV55.M806WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0600000
	DeclineTime=0.7500000
	DeclineDelay=0.2500000
	EscapeMultiplier=1.2000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.5000000
	MaxMoveMultiplier=1.2500000
end object
// Reference: FireParams'BallisticProV55.M806WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1700000
	FireEndAnim="None"
	FireAnimRate=1.5000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M806WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.M806WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=1050.0000000,Max=3150.0000000)
	RangeAtten=0.5000000
	Damage=37
	HeadMult=3.5000000
	DamageType=Class'BallisticProV55.DTM806Pistol'
	DamageTypeHead=Class'BallisticProV55.DTM806PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTM806Pistol'
	PenetrationEnergy=16.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M806FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Fire',Volume=0.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=412.0000000
	Chaos=0.2000000
	Inaccuracy=(X=72,Y=72)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BallisticProV55.M806WeaponParamsTactical.TacticalPrimaryEffectParams_Underbarrel'
begin object name="TacticalPrimaryEffectParams_Underbarrel" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=1050.0000000,Max=3150.0000000)
	RangeAtten=0.5000000
	Damage=37
	HeadMult=3.5000000
	DamageType=Class'BallisticProV55.DTM806Pistol'
	DamageTypeHead=Class'BallisticProV55.DTM806PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTM806Pistol'
	PenetrationEnergy=16.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M806FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Fire',Volume=0.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=152.0000000
	Chaos=0.6000000
	Inaccuracy=(X=72,Y=72)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.M806WeaponParamsTactical.TacticalPrimaryFireParams_Underbarrel'
begin object name="TacticalPrimaryFireParams_Underbarrel" class=BCoreProV55.FireParams
	FireInterval=0.1700000
	FireAnim="SightFire"
	FireEndAnim="None"
	FireAnimRate=1.5000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M806WeaponParamsTactical.TacticalPrimaryEffectParams_Underbarrel'
end object
// Reference: FireEffectParams'BallisticProV55.M806WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
	EffectString="Laser sight"
end object
// Reference: FireParams'BallisticProV55.M806WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.M806WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: ShotgunEffectParams'BallisticProV55.M806WeaponParamsTactical.TacticalSecondaryEffectParams_Shotgun'
begin object name="TacticalSecondaryEffectParams_Shotgun" class=BCoreProV55.ShotgunEffectParams
	TraceCount=7
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
// Reference: FireParams'BallisticProV55.M806WeaponParamsTactical.TacticalSecondaryFireParams_Shotgun'
begin object name="TacticalSecondaryFireParams_Shotgun" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	TargetState="Shotgun"
	PreFireAnim="None"
	FireAnim="FireAlt"
	FireAnimRate=1.1000000
	AimedFireAnim="'"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.M806WeaponParamsTactical.TacticalSecondaryEffectParams_Shotgun'
end object
// Reference: FireEffectParams'BallisticProV55.M806WeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
begin object name="TacticalSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.M806WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
begin object name="TacticalSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.M806WeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
end object
// Reference: RecoilParams'BallisticProV55.M806WeaponParamsTactical.TacticalRecoilParams_Scope'
begin object name="TacticalRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0600000
	DeclineTime=0.7500000
	DeclineDelay=0.2500000
	ViewBindFactor=0.1500000
	MaxMoveMultiplier=1.2500000
end object
// Reference: AimParams'BallisticProV55.M806WeaponParamsTactical.TacticalAimParams_Scope'
begin object name="TacticalAimParams_Scope" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=768)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ChaosDeclineTime=0.3200000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.M806WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Laser Sight"
	InventorySize=2
	WeaponPrice=800
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.1700000
	SightOffset=(X=-13.0000000,Y=-4.2000000,Z=37.5000000)
	SightPivot=(Pitch=-110,Yaw=0,Roll=-675)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3500,Roll=0)
	RootAdjust=(Pitch=3500,Yaw=-375,Roll=0)
	ViewOffset=(X=0.0000000,Y=30.0000000,Z=-20.0000000)
	DisplaceDurationMult=0.5000000
	MagAmmo=12
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.M806WeaponParamsTactical.TacticalParams_Scope'
begin object name="TacticalParams_Scope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Scoped"
	LayoutTags="scope"
	InventorySize=2
	WeaponPrice=1000
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.3200000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=18.0000000)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
	MaxZoom=4.0000000
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.M806.M806_Main-SD',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'ONSstructureTextures.CoreGroup.Invisible',MaterialName="",Index=2,pIndex=0,AIndex=0)
	ViewOffset=(X=0.0000000,Y=20.0000000,Z=-20.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_PistolRail',BoneName="Muzzle",Scale=0.3500000,AugmentOffset=(X=-60.0000000,Y=0.0000000,Z=-50.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_4XScope',BoneName="Muzzle",Scale=0.2750000,AugmentOffset=(X=-140.0000000,Y=0.0000000,Z=30.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=0))
	DisplaceDurationMult=0.5000000
	MagAmmo=12
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsTactical.TacticalRecoilParams_Scope'
	AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsTactical.TacticalAimParams_Scope'
	FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.M806WeaponParamsTactical.TacticalParams_Shotgun'
begin object name="TacticalParams_Shotgun" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Shotgun"
	LayoutTags="shotgun"
	InventorySize=2
	WeaponPrice=1200
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2200000
	SightOffset=(X=-5.0000000,Y=0.0000000,Z=4.5000000)
	ViewOffset=(X=0.0000000,Y=30.0000000,Z=-20.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M806SG_FPm'
	DisplaceDurationMult=0.5000000
	MagAmmo=12
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsTactical.TacticalPrimaryFireParams_Underbarrel'
	AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsTactical.TacticalSecondaryFireParams_Shotgun'
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsTactical.M806_Gray'
begin object name="M806_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsTactical.M806_Black'
begin object name="M806_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainBlackShine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsTactical.M806_Desert'
begin object name="M806_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainDesert",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsTactical.M806_Tiger'
begin object name="M806_Tiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainTigerShine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsTactical.M806_Dragon'
begin object name="M806_Dragon" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Dragon"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.Dragon_Main-SD",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsTactical.M806_Gold'
begin object name="M806_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainGoldShine",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
