class X82TW_WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="NV Scope"
		LayoutTags="nv"
		PlayerSpeedFactor=0.8500000
		PlayerJumpFactor=0.8500000
		InventorySize=12
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.0100000
		SightOffset=(X=5.0000000,Y=-0.5000000,Z=4.2500000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
		ZoomType=2
		DisplaceDurationMult=1.2500000
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticParams_ACOG'
	begin object name="RealisticParams_ACOG" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="4X Scope"
		PlayerSpeedFactor=0.8500000
		PlayerJumpFactor=0.8500000
		InventorySize=12
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.0100000
		SightOffset=(X=5.0000000,Y=-0.5000000,Z=4.2500000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="LensCover1",Slot=51,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="LensCover2",Slot=52,Scale=0.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="RRing",Scale=0.1000000,AugmentOffset=(X=0.0000000,Y=-14.7500000,Z=-75.0000000),AugmentRot=(Pitch=-16384,Yaw=0,Roll=-16384))
		DisplaceDurationMult=1.2500000
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_ACOG
	// Reference: WeaponParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticParams_Irons'
	begin object name="RealisticParams_Irons" class=BCoreProV55.WeaponParams
		Weight=1
		LayoutName="Irons"
		LayoutTags="irons"
		PlayerSpeedFactor=0.8500000
		PlayerJumpFactor=0.8500000
		InventorySize=12
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.0100000
		SightOffset=(X=3.0000000,Y=0.0000000,Z=4.4300000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
		DisplaceDurationMult=1.2500000
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[2]=RealisticParams_Irons
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.X83_Silver'
	begin object name="X83_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=X83_Silver
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.X83_Desert'
	begin object name="X83_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainDesert",Index=1,pIndex=-1,AIndex=0)
		Index=1
	end object
	Camos[1]=X83_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.X83_HexGreen'
	begin object name="X83_HexGreen" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Green Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainHexGreen",Index=1,pIndex=-1,AIndex=0)
		Index=2
	end object
	Camos[2]=X83_HexGreen
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.X83_Winter'
	begin object name="X83_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainWinter",Index=1,pIndex=-1,AIndex=0)
		Index=3
	end object
	Camos[3]=X83_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.X83_Superfly'
	begin object name="X83_Superfly" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Superfly"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainFleur",Index=1,pIndex=-1,AIndex=0)
		Index=4
	end object
	Camos[4]=X83_Superfly
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.X83_Quantum'
	begin object name="X83_Quantum" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Quantum"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainQuantumShine",Index=1,pIndex=-1,AIndex=0)
		Index=5
	end object
	Camos[5]=X83_Quantum
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.X83_Gold'
	begin object name="X83_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainGoldShine",Index=1,pIndex=-1,AIndex=0)
		Index=6
	end object
	Camos[6]=X83_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	BurstFireRateFactor=1.0000000
	FireAnimRate=0.9500000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0500000
	YawFactor=0.0500000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=1000.0000000
	DeclineTime=1.1000000
	DeclineDelay=0.0000000
	ViewBindFactor=0.0000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.1000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	AimDamageThreshold=2000
	ChaosDeclineTime=1.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=185
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_X82Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_X82Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_X82Torso'
	PenetrationEnergy=48.0000000
	PenetrateForce=300
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter_C'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.X82.X82-Fire8',Volume=12.1000000,Radius=450.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=200.0000000
	Chaos=0.0500000
	Inaccuracy=(X=12,Y=12)
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: WeaponParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="NV Scope"
	LayoutTags="nv"
	PlayerSpeedFactor=0.8500000
	PlayerJumpFactor=0.8500000
	InventorySize=12
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.0100000
	SightOffset=(X=5.0000000,Y=-0.5000000,Z=4.2500000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
	ZoomType=2
	DisplaceDurationMult=1.2500000
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticParams_ACOG'
begin object name="RealisticParams_ACOG" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="4X Scope"
	PlayerSpeedFactor=0.8500000
	PlayerJumpFactor=0.8500000
	InventorySize=12
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.0100000
	SightOffset=(X=5.0000000,Y=-0.5000000,Z=4.2500000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="LensCover1",Slot=51,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="LensCover2",Slot=52,Scale=0.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="RRing",Scale=0.1000000,AugmentOffset=(X=0.0000000,Y=-14.7500000,Z=-75.0000000),AugmentRot=(Pitch=-16384,Yaw=0,Roll=-16384))
	DisplaceDurationMult=1.2500000
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticParams_Irons'
begin object name="RealisticParams_Irons" class=BCoreProV55.WeaponParams
	Weight=1
	LayoutName="Irons"
	LayoutTags="irons"
	PlayerSpeedFactor=0.8500000
	PlayerJumpFactor=0.8500000
	InventorySize=12
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.0100000
	SightOffset=(X=3.0000000,Y=0.0000000,Z=4.4300000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
	DisplaceDurationMult=1.2500000
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.X83_Silver'
begin object name="X83_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.X83_Desert'
begin object name="X83_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainDesert",Index=1,pIndex=-1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.X83_HexGreen'
begin object name="X83_HexGreen" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Green Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainHexGreen",Index=1,pIndex=-1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.X83_Winter'
begin object name="X83_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainWinter",Index=1,pIndex=-1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.X83_Superfly'
begin object name="X83_Superfly" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Superfly"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainFleur",Index=1,pIndex=-1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.X83_Quantum'
begin object name="X83_Quantum" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Quantum"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainQuantumShine",Index=1,pIndex=-1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsRealistic.X83_Gold'
begin object name="X83_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainGoldShine",Index=1,pIndex=-1,AIndex=0)
	Index=6
end object
