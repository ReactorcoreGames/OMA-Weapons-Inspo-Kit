class X82WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="NV Scope"
		LayoutTags="nv"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.7500000
		InventorySize=9
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.6500000
		SightOffset=(X=5.0000000,Y=-0.5000000,Z=4.2500000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
		ZoomType=2
		ViewOffset=(X=4.0000000,Y=6.0000000,Z=-4.0000000)
		MagAmmo=4
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicParams_4XScope'
	begin object name="ClassicParams_4XScope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="4X Scope"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.7500000
		InventorySize=9
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4500000
		SightOffset=(X=5.0000000,Y=-0.5000000,Z=4.2500000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
		ViewOffset=(X=4.0000000,Y=6.0000000,Z=-4.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="RearSight",Scale=0.0400000,AugmentOffset=(X=3.9000000,Y=-0.2500000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=-16384))
		MagAmmo=4
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_4XScope
	// Reference: WeaponParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicParams_Irons'
	begin object name="ClassicParams_Irons" class=BCoreProV55.WeaponParams
		Weight=1
		LayoutName="Irons"
		LayoutTags="irons"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.7500000
		InventorySize=9
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		SightOffset=(X=3.0000000,Y=0.0000000,Z=4.4300000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
		ViewOffset=(X=4.0000000,Y=6.0000000,Z=-4.0000000)
		MagAmmo=4
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[2]=ClassicParams_Irons
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsClassic.X83_Silver'
	begin object name="X83_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=X83_Silver
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsClassic.X83_Desert'
	begin object name="X83_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainDesert",Index=1,pIndex=-1,AIndex=0)
		Index=1
	end object
	Camos[1]=X83_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsClassic.X83_HexGreen'
	begin object name="X83_HexGreen" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Green Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainHexGreen",Index=1,pIndex=-1,AIndex=0)
		Index=2
	end object
	Camos[2]=X83_HexGreen
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsClassic.X83_Winter'
	begin object name="X83_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainWinter",Index=1,pIndex=-1,AIndex=0)
		Index=3
	end object
	Camos[3]=X83_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsClassic.X83_Superfly'
	begin object name="X83_Superfly" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Superfly"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainFleur",Index=1,pIndex=-1,AIndex=0)
		Index=4
	end object
	Camos[4]=X83_Superfly
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsClassic.X83_Quantum'
	begin object name="X83_Quantum" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Quantum"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainQuantumShine",Index=1,pIndex=-1,AIndex=0)
		Index=5
	end object
	Camos[5]=X83_Quantum
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsClassic.X83_Gold'
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
// Reference: FireParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.5000000
	XRandFactor=0.8500000
	YRandFactor=0.4500000
	MaxRecoil=2048.0000000
	DeclineTime=2.2000000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.8500000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=3840)
	AimAdjustTime=0.9000000
	OffsetAdjustTime=0.3250000
	CrouchMultiplier=0.8500000
	ADSMultiplier=0.8500000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ViewBindFactor=0.3500000
	JumpChaos=0.4500000
	FallingChaos=0.4500000
	SprintChaos=0.4500000
	ChaosDeclineTime=1.8000000
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000000.0000000,Max=10000000.0000000)
	WaterTraceRange=8000000.0000000
	Damage=145
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DT_X82Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_X82Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_X82Torso'
	PenetrationEnergy=72.0000000
	PenetrateForce=450
	bPenetrate=true
	PDamageFactor=0.9000000
	WallPDamageFactor=0.9000000
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter_C'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.X82.X82-Fire3',Volume=12.1000000,Radius=450.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1950.0000000
	PushbackForce=255.0000000
	Chaos=1.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.0500000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="NV Scope"
	LayoutTags="nv"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.7500000
	InventorySize=9
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.6500000
	SightOffset=(X=5.0000000,Y=-0.5000000,Z=4.2500000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
	ZoomType=2
	ViewOffset=(X=4.0000000,Y=6.0000000,Z=-4.0000000)
	MagAmmo=4
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicParams_4XScope'
begin object name="ClassicParams_4XScope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="4X Scope"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.7500000
	InventorySize=9
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4500000
	SightOffset=(X=5.0000000,Y=-0.5000000,Z=4.2500000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
	ViewOffset=(X=4.0000000,Y=6.0000000,Z=-4.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="RearSight",Scale=0.0400000,AugmentOffset=(X=3.9000000,Y=-0.2500000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=-16384))
	MagAmmo=4
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicParams_Irons'
begin object name="ClassicParams_Irons" class=BCoreProV55.WeaponParams
	Weight=1
	LayoutName="Irons"
	LayoutTags="irons"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.7500000
	InventorySize=9
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	SightOffset=(X=3.0000000,Y=0.0000000,Z=4.4300000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
	ViewOffset=(X=4.0000000,Y=6.0000000,Z=-4.0000000)
	MagAmmo=4
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsClassic.X83_Silver'
begin object name="X83_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsClassic.X83_Desert'
begin object name="X83_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainDesert",Index=1,pIndex=-1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsClassic.X83_HexGreen'
begin object name="X83_HexGreen" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Green Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainHexGreen",Index=1,pIndex=-1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsClassic.X83_Winter'
begin object name="X83_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainWinter",Index=1,pIndex=-1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsClassic.X83_Superfly'
begin object name="X83_Superfly" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Superfly"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainFleur",Index=1,pIndex=-1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsClassic.X83_Quantum'
begin object name="X83_Quantum" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Quantum"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainQuantumShine",Index=1,pIndex=-1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsClassic.X83_Gold'
begin object name="X83_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainGoldShine",Index=1,pIndex=-1,AIndex=0)
	Index=6
end object
