class X82WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="NV Scope"
		LayoutTags="nv"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.7000000
		SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
		ZoomType=2
		ScopeScale=0.8000000
		MinZoom=4.0000000
		MaxZoom=8.0000000
		ZoomStages=1
		ViewOffset=(X=1.0000000,Y=3.0000000,Z=-5.0000000)
		DisplaceDurationMult=1.4000000
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalParams_ACOG'
	begin object name="TacticalParams_ACOG" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="4X Scope"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.6000000
		SightOffset=(X=5.0000000,Y=-0.5000000,Z=4.2500000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
		ViewOffset=(X=1.0000000,Y=3.0000000,Z=-5.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="RearSight",Scale=0.0400000,AugmentOffset=(X=3.9000000,Y=-0.2500000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=-16384))
		DisplaceDurationMult=1.4000000
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=TacticalParams_ACOG
	// Reference: WeaponParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalParams_IRONS'
	begin object name="TacticalParams_IRONS" class=BCoreProV55.WeaponParams
		Weight=1
		LayoutName="Irons"
		LayoutTags="irons"
		PlayerSpeedFactor=0.9500000
		PlayerJumpFactor=0.9500000
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.5000000
		SightOffset=(X=3.0000000,Y=0.0000000,Z=4.4300000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
		ViewOffset=(X=1.0000000,Y=3.0000000,Z=-5.0000000)
		DisplaceDurationMult=1.4000000
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[2]=TacticalParams_IRONS
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsTactical.X83_Silver'
	begin object name="X83_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=X83_Silver
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsTactical.X83_Desert'
	begin object name="X83_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainDesert",Index=1,pIndex=-1,AIndex=0)
		Index=1
	end object
	Camos[1]=X83_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsTactical.X83_HexGreen'
	begin object name="X83_HexGreen" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Green Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainHexGreen",Index=1,pIndex=-1,AIndex=0)
		Index=2
	end object
	Camos[2]=X83_HexGreen
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsTactical.X83_Winter'
	begin object name="X83_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainWinter",Index=1,pIndex=-1,AIndex=0)
		Index=3
	end object
	Camos[3]=X83_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsTactical.X83_Superfly'
	begin object name="X83_Superfly" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Superfly"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainFleur",Index=1,pIndex=-1,AIndex=0)
		Index=4
	end object
	Camos[4]=X83_Superfly
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsTactical.X83_Quantum'
	begin object name="X83_Quantum" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Quantum"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainQuantumShine",Index=1,pIndex=-1,AIndex=0)
		Index=5
	end object
	Camos[5]=X83_Quantum
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsTactical.X83_Gold'
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
// Reference: FireParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2500000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.4500000
	YRandFactor=0.2500000
	MinRandFactor=0.4500000
	MaxRecoil=8192.0000000
	ClimbTime=0.1500000
	DeclineTime=1.5000000
	DeclineDelay=0.3500000
	ViewBindFactor=0.1000000
	HipMultiplier=2.0000000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.7500000
end object
// Reference: AimParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2560)
	AimAdjustTime=0.8000000
	ADSMultiplier=0.7500000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ChaosDeclineTime=1.2000000
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=150
	HeadMult=1.7500000
	DamageType=Class'BWBP_SKC_Pro.DT_X82Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_X82Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_X82Torso'
	PenetrationEnergy=128.0000000
	PenetrateForce=450
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.X82.X82-Fire8',Volume=12.1000000,Radius=450.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=3072.0000000
	PushbackForce=255.0000000
	Chaos=0.7000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.7000000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: WeaponParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="NV Scope"
	LayoutTags="nv"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.7000000
	SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
	ZoomType=2
	ScopeScale=0.8000000
	MinZoom=4.0000000
	MaxZoom=8.0000000
	ZoomStages=1
	ViewOffset=(X=1.0000000,Y=3.0000000,Z=-5.0000000)
	DisplaceDurationMult=1.4000000
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalParams_ACOG'
begin object name="TacticalParams_ACOG" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="4X Scope"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.6000000
	SightOffset=(X=5.0000000,Y=-0.5000000,Z=4.2500000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
	ViewOffset=(X=1.0000000,Y=3.0000000,Z=-5.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="RearSight",Scale=0.0400000,AugmentOffset=(X=3.9000000,Y=-0.2500000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=-16384))
	DisplaceDurationMult=1.4000000
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalParams_IRONS'
begin object name="TacticalParams_IRONS" class=BCoreProV55.WeaponParams
	Weight=1
	LayoutName="Irons"
	LayoutTags="irons"
	PlayerSpeedFactor=0.9500000
	PlayerJumpFactor=0.9500000
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.5000000
	SightOffset=(X=3.0000000,Y=0.0000000,Z=4.4300000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
	ViewOffset=(X=1.0000000,Y=3.0000000,Z=-5.0000000)
	DisplaceDurationMult=1.4000000
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsTactical.X83_Silver'
begin object name="X83_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsTactical.X83_Desert'
begin object name="X83_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainDesert",Index=1,pIndex=-1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsTactical.X83_HexGreen'
begin object name="X83_HexGreen" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Green Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainHexGreen",Index=1,pIndex=-1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsTactical.X83_Winter'
begin object name="X83_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainWinter",Index=1,pIndex=-1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsTactical.X83_Superfly'
begin object name="X83_Superfly" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Superfly"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainFleur",Index=1,pIndex=-1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsTactical.X83_Quantum'
begin object name="X83_Quantum" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Quantum"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainQuantumShine",Index=1,pIndex=-1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82WeaponParamsTactical.X83_Gold'
begin object name="X83_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainGoldShine",Index=1,pIndex=-1,AIndex=0)
	Index=6
end object
