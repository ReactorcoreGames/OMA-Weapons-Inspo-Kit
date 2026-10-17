class M75WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M75WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=70
		LayoutName="X-Ray Scope"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=10
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.5500000
		ZoomType=2
		ScopeViewTex=Texture'BW_Core_WeaponTex.M75.M75ScopeView'
		ScopeScale=0.6000000
		MinZoom=5.0000000
		MaxZoom=10.0000000
		ZoomStages=1
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		DisplaceDurationMult=1.2500000
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BallisticProV55.M75WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M75WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.M75WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M75WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BallisticProV55.M75WeaponParamsTactical.TacticalParams_Prototype'
	begin object name="TacticalParams_Prototype" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="X75 Prototype"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=10
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.5000000
		SightOffset=(X=15.0000000,Y=0.0000000,Z=0.0000000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=1,Scale=0.0000000)
		AllowedCamos[0]=2
		DisplaceDurationMult=1.2500000
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BallisticProV55.M75WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M75WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.M75WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M75WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=TacticalParams_Prototype
	// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsTactical.M75_Standard'
	begin object name="M75_Standard" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=M75_Standard
	// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsTactical.M75_Winter'
	begin object name="M75_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M75Camos.M75-Main-S1",Index=3,pIndex=2,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M75Camos.M75-Main2-S1",Index=4,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M75Camos.M75-Clip-D1",Index=2,pIndex=3,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M75Camos.M75-Scope-S1",Index=1,pIndex=1,AIndex=3)
		Index=1
	end object
	Camos[1]=M75_Winter
	// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsTactical.M75_Prototype'
	begin object name="M75_Prototype" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Prototype"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BW_Core_WeaponTex.M75.M75_SKPart1_Shine",Index=3,pIndex=2,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BW_Core_WeaponTex.M75.M75_SKPart2_Shine",Index=4,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=M75_Prototype
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BallisticProV55.M75WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2560)
	AimAdjustTime=0.8000000
	ADSMultiplier=0.7500000
	SprintOffset=(Pitch=-3072,Yaw=-3072,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	JumpChaos=0.8000000
	ChaosDeclineTime=0.8000000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BallisticProV55.M75WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.1500000)))
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MinRandFactor=0.4000000
	ClimbTime=0.1500000
	DeclineTime=0.7500000
	DeclineDelay=0.2500000
	ViewBindFactor=0.1500000
	HipMultiplier=2.0000000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: FireParams'BallisticProV55.M75WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.5000000
	bCockAfterFire=true
	FireEndAnim="'"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M75WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.M75WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.5000000
	TargetState="ChargedRail"
	bCockAfterFire=true
	FireEndAnim="'"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M75WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.M75WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	Damage=200
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BallisticProV55.DTM75Railgun'
	DamageTypeHead=Class'BallisticProV55.DTM75RailgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM75Railgun'
	MuzzleFlashClass=Class'BallisticProV55.M75FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75Fire',Volume=0.7500000,Radius=384.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=3072.0000000
	PushbackForce=350.0000000
	Chaos=0.7500000
	BotRefireRate=0.3000000
	WarnTargetPct=0.7500000
end object
// Reference: InstantEffectParams'BallisticProV55.M75WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	Damage=200
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BallisticProV55.DTM75Railgun'
	DamageTypeHead=Class'BallisticProV55.DTM75RailgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM75Railgun'
	MuzzleFlashClass=Class'BallisticProV55.M75FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75Fire',Volume=1.0000000,Radius=768.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=4096.0000000
	PushbackForce=1300.0000000
	Chaos=0.7500000
	BotRefireRate=0.3000000
	WarnTargetPct=0.7500000
end object
// Reference: WeaponParams'BallisticProV55.M75WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=70
	LayoutName="X-Ray Scope"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=10
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.5500000
	ZoomType=2
	ScopeViewTex=Texture'BW_Core_WeaponTex.M75.M75ScopeView'
	ScopeScale=0.6000000
	MinZoom=5.0000000
	MaxZoom=10.0000000
	ZoomStages=1
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	DisplaceDurationMult=1.2500000
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BallisticProV55.M75WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M75WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.M75WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M75WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.M75WeaponParamsTactical.TacticalParams_Prototype'
begin object name="TacticalParams_Prototype" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="X75 Prototype"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=10
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.5000000
	SightOffset=(X=15.0000000,Y=0.0000000,Z=0.0000000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=1,Scale=0.0000000)
	AllowedCamos[0]=2
	DisplaceDurationMult=1.2500000
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BallisticProV55.M75WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M75WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.M75WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M75WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsTactical.M75_Standard'
begin object name="M75_Standard" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsTactical.M75_Winter'
begin object name="M75_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M75Camos.M75-Main-S1",Index=3,pIndex=2,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M75Camos.M75-Main2-S1",Index=4,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M75Camos.M75-Clip-D1",Index=2,pIndex=3,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M75Camos.M75-Scope-S1",Index=1,pIndex=1,AIndex=3)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsTactical.M75_Prototype'
begin object name="M75_Prototype" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Prototype"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BW_Core_WeaponTex.M75.M75_SKPart1_Shine",Index=3,pIndex=2,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BW_Core_WeaponTex.M75.M75_SKPart2_Shine",Index=4,pIndex=0,AIndex=0)
	Index=2
end object
