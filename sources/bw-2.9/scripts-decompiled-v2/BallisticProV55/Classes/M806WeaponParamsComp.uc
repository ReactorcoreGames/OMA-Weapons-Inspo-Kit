class M806WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M806WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Laser + Ext Mags"
		InventorySize=2
		WeaponPrice=800
		SightingTime=0.2000000
		SightOffset=(X=-13.0000000,Y=-4.2000000,Z=37.5000000)
		SightPivot=(Pitch=-110,Yaw=0,Roll=-675)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3500,Roll=0)
		RootAdjust=(Pitch=3500,Yaw=-375,Roll=0)
		ViewOffset=(X=0.0000000,Y=30.0000000,Z=-20.0000000)
		DisplaceDurationMult=0.5000000
		MagAmmo=12
		RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BallisticProV55.M806WeaponParamsComp.ArenaParams_Scope'
	begin object name="ArenaParams_Scope" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="4X Scope"
		LayoutTags="scope"
		InventorySize=2
		WeaponPrice=800
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4000000
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
		RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsComp.ArenaSecondaryFireParams_Scope'
	end object
	Layouts[1]=ArenaParams_Scope
	// Reference: WeaponParams'BallisticProV55.M806WeaponParamsComp.ArenaParams_SG'
	begin object name="ArenaParams_SG" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Shotgun"
		LayoutTags="shotgun"
		InventorySize=2
		WeaponPrice=1200
		SightingTime=0.2500000
		SightOffset=(X=-5.0000000,Y=0.0000000,Z=4.5000000)
		ViewOffset=(X=0.0000000,Y=30.0000000,Z=-20.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M806SG_FPm'
		DisplaceDurationMult=0.5000000
		MagAmmo=12
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsComp.ArenaSecondaryFireParams_SG'
	end object
	Layouts[2]=ArenaParams_SG
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsComp.M806_Gray'
	begin object name="M806_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=M806_Gray
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsComp.M806_Black'
	begin object name="M806_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainBlackShine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=M806_Black
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsComp.M806_Desert'
	begin object name="M806_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainDesert",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=M806_Desert
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsComp.M806_Tiger'
	begin object name="M806_Tiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainTigerShine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=M806_Tiger
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsComp.M806_Dragon'
	begin object name="M806_Dragon" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Dragon"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.Dragon_Main-SD",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=M806_Dragon
	// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsComp.M806_Gold'
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
// Reference: FireParams'BallisticProV55.M806WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	FireEndAnim="None"
	FireAnimRate=2.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M806WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.M806WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0600000
	DeclineTime=0.7500000
	DeclineDelay=0.2500000
	ViewBindFactor=0.4000000
end object
// Reference: AimParams'BallisticProV55.M806WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimAdjustTime=0.4500000
	ChaosDeclineTime=0.3200000
end object
// Reference: InstantEffectParams'BallisticProV55.M806WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.6700000
	Damage=33
	DamageType=Class'BallisticProV55.DTM806Pistol'
	DamageTypeHead=Class'BallisticProV55.DTM806PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTM806Pistol'
	PenetrationEnergy=16.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M806FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Fire',Volume=0.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.2000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireEffectParams'BallisticProV55.M806WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
	EffectString="Laser sight"
end object
// Reference: FireParams'BallisticProV55.M806WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.M806WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: ShotgunEffectParams'BallisticProV55.M806WeaponParamsComp.ArenaSecondaryEffectParams_SG'
begin object name="ArenaSecondaryEffectParams_SG" class=BCoreProV55.ShotgunEffectParams
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
// Reference: FireParams'BallisticProV55.M806WeaponParamsComp.ArenaSecondaryFireParams_SG'
begin object name="ArenaSecondaryFireParams_SG" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	TargetState="Shotgun"
	FireAnim="FireAlt"
	FireAnimRate=1.1000000
	AimedFireAnim="'"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.M806WeaponParamsComp.ArenaSecondaryEffectParams_SG'
end object
// Reference: FireEffectParams'BallisticProV55.M806WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
begin object name="ArenaSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.M806WeaponParamsComp.ArenaSecondaryFireParams_Scope'
begin object name="ArenaSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.M806WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.M806WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Laser + Ext Mags"
	InventorySize=2
	WeaponPrice=800
	SightingTime=0.2000000
	SightOffset=(X=-13.0000000,Y=-4.2000000,Z=37.5000000)
	SightPivot=(Pitch=-110,Yaw=0,Roll=-675)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3500,Roll=0)
	RootAdjust=(Pitch=3500,Yaw=-375,Roll=0)
	ViewOffset=(X=0.0000000,Y=30.0000000,Z=-20.0000000)
	DisplaceDurationMult=0.5000000
	MagAmmo=12
	RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.M806WeaponParamsComp.ArenaParams_Scope'
begin object name="ArenaParams_Scope" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="4X Scope"
	LayoutTags="scope"
	InventorySize=2
	WeaponPrice=800
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4000000
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
	RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsComp.ArenaSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.M806WeaponParamsComp.ArenaParams_SG'
begin object name="ArenaParams_SG" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Shotgun"
	LayoutTags="shotgun"
	InventorySize=2
	WeaponPrice=1200
	SightingTime=0.2500000
	SightOffset=(X=-5.0000000,Y=0.0000000,Z=4.5000000)
	ViewOffset=(X=0.0000000,Y=30.0000000,Z=-20.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M806SG_FPm'
	DisplaceDurationMult=0.5000000
	MagAmmo=12
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M806WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M806WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.M806WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M806WeaponParamsComp.ArenaSecondaryFireParams_SG'
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsComp.M806_Gray'
begin object name="M806_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsComp.M806_Black'
begin object name="M806_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainBlackShine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsComp.M806_Desert'
begin object name="M806_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainDesert",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsComp.M806_Tiger'
begin object name="M806_Tiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainTigerShine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsComp.M806_Dragon'
begin object name="M806_Dragon" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Dragon"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.Dragon_Main-SD",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.M806WeaponParamsComp.M806_Gold'
begin object name="M806_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M806Camos.M806-MainGoldShine",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
