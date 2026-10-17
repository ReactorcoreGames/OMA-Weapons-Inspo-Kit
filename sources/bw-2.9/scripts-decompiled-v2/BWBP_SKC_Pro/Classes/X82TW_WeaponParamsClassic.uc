class X82TW_WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="NV Scope"
		LayoutTags="nv"
		PlayerSpeedFactor=0.8500000
		PlayerJumpFactor=0.8500000
		InventorySize=12
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.0100000
		ZoomType=2
		DisplaceDurationMult=1.2500000
		MagAmmo=4
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicParams_4XScope'
	begin object name="ClassicParams_4XScope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="4X Scope"
		PlayerSpeedFactor=0.8500000
		PlayerJumpFactor=0.8500000
		InventorySize=12
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.0100000
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="LensCover1",Slot=51,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="LensCover2",Slot=52,Scale=0.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="RRing",Scale=0.1000000,AugmentOffset=(X=0.0000000,Y=-14.7500000,Z=-75.0000000),AugmentRot=(Pitch=-16384,Yaw=0,Roll=-16384))
		DisplaceDurationMult=1.2500000
		MagAmmo=4
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_4XScope
	// Reference: WeaponParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicParams_Irons'
	begin object name="ClassicParams_Irons" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Irons"
		LayoutTags="irons"
		PlayerSpeedFactor=0.8500000
		PlayerJumpFactor=0.8500000
		InventorySize=12
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.0100000
		SightOffset=(X=3.0000000,Y=0.0000000,Z=4.4300000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="LensCover1",Slot=51,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="LensCover2",Slot=52,Scale=0.0000000)
		DisplaceDurationMult=1.2500000
		MagAmmo=4
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[2]=ClassicParams_Irons
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.X83_Silver'
	begin object name="X83_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=X83_Silver
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.X83_Desert'
	begin object name="X83_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainDesert",Index=1,pIndex=-1,AIndex=0)
		Index=1
	end object
	Camos[1]=X83_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.X83_HexGreen'
	begin object name="X83_HexGreen" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Green Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainHexGreen",Index=1,pIndex=-1,AIndex=0)
		Index=2
	end object
	Camos[2]=X83_HexGreen
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.X83_Winter'
	begin object name="X83_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainWinter",Index=1,pIndex=-1,AIndex=0)
		Index=3
	end object
	Camos[3]=X83_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.X83_Superfly'
	begin object name="X83_Superfly" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Superfly"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainFleur",Index=1,pIndex=-1,AIndex=0)
		Index=4
	end object
	Camos[4]=X83_Superfly
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.X83_Quantum'
	begin object name="X83_Quantum" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Quantum"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainQuantumShine",Index=1,pIndex=-1,AIndex=0)
		Index=5
	end object
	Camos[5]=X83_Quantum
	// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.X83_Gold'
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
// Reference: FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.5300000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.3500000
	YawFactor=0.0000000
	YRandFactor=0.2000000
	MaxRecoil=8192.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.1500000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.1000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	AimDamageThreshold=2000
	ChaosDeclineTime=1.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=110
	HeadMult=1.5000000
	LimbMult=0.9000000
	DamageType=Class'BWBP_SKC_Pro.DT_X82Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_X82Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_X82Torso'
	PenetrateForce=450
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.X82.X82-Fire4',Volume=1.0000000,Radius=750.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.7000000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: WeaponParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="NV Scope"
	LayoutTags="nv"
	PlayerSpeedFactor=0.8500000
	PlayerJumpFactor=0.8500000
	InventorySize=12
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.0100000
	ZoomType=2
	DisplaceDurationMult=1.2500000
	MagAmmo=4
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicParams_4XScope'
begin object name="ClassicParams_4XScope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="4X Scope"
	PlayerSpeedFactor=0.8500000
	PlayerJumpFactor=0.8500000
	InventorySize=12
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.0100000
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="LensCover1",Slot=51,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="LensCover2",Slot=52,Scale=0.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="RRing",Scale=0.1000000,AugmentOffset=(X=0.0000000,Y=-14.7500000,Z=-75.0000000),AugmentRot=(Pitch=-16384,Yaw=0,Roll=-16384))
	DisplaceDurationMult=1.2500000
	MagAmmo=4
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicParams_Irons'
begin object name="ClassicParams_Irons" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Irons"
	LayoutTags="irons"
	PlayerSpeedFactor=0.8500000
	PlayerJumpFactor=0.8500000
	InventorySize=12
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.0100000
	SightOffset=(X=3.0000000,Y=0.0000000,Z=4.4300000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="LensCover1",Slot=51,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="LensCover2",Slot=52,Scale=0.0000000)
	DisplaceDurationMult=1.2500000
	MagAmmo=4
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.X83_Silver'
begin object name="X83_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.X83_Desert'
begin object name="X83_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainDesert",Index=1,pIndex=-1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.X83_HexGreen'
begin object name="X83_HexGreen" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Green Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainHexGreen",Index=1,pIndex=-1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.X83_Winter'
begin object name="X83_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainWinter",Index=1,pIndex=-1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.X83_Superfly'
begin object name="X83_Superfly" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Superfly"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainFleur",Index=1,pIndex=-1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.X83_Quantum'
begin object name="X83_Quantum" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Quantum"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainQuantumShine",Index=1,pIndex=-1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.X82TW_WeaponParamsClassic.X83_Gold'
begin object name="X83_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X83Camos.X83-MainGoldShine",Index=1,pIndex=-1,AIndex=0)
	Index=6
end object
