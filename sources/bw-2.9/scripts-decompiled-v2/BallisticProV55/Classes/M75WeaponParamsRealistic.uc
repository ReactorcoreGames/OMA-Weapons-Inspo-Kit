class M75WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M75WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=70
		LayoutName="X-Ray Scope"
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=10
		SightMoveSpeedFactor=0.5000000
		SightingTime=1.0000000
		ZoomType=2
		ScopeViewTex=Texture'BW_Core_WeaponTex.M75.M75ScopeView'
		WeaponName="M75-TIC 20mm Infantry Railgun"
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		MagAmmo=3
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M75WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M75WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.M75WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M75WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.M75WeaponParamsRealistic.RealisticParams_Proto'
	begin object name="RealisticParams_Proto" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="X75 Prototype"
		PlayerSpeedFactor=0.7700000
		PlayerJumpFactor=0.7700000
		InventorySize=10
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=15.0000000,Y=0.0000000,Z=0.0000000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=1,Scale=0.0000000)
		WeaponName="X75-TIC 20mm Infantry Railgun"
		AllowedCamos[0]=2
		MagAmmo=3
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M75WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M75WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.M75WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M75WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_Proto
	// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsRealistic.M75_Standard'
	begin object name="M75_Standard" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=M75_Standard
	// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsRealistic.M75_Winter'
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
	// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsRealistic.M75_Prototype'
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
// Reference: AimParams'BallisticProV55.M75WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=900,Max=2308)
	AimAdjustTime=0.4500000
	OffsetAdjustTime=0.5000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-4096,Yaw=-5120,Roll=0)
	JumpOffset=(Pitch=2000,Yaw=-5000,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.2000000
	ChaosTurnThreshold=100000
end object
// Reference: RecoilParams'BallisticProV55.M75WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=3072.0000000
	DeclineTime=1.0000000
	DeclineDelay=0.3500000
	ViewBindFactor=0.7500000
	ADSViewBindFactor=0.7500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BallisticProV55.M75WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.M75WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.M75WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	TargetState="FullChargedRail"
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireAnimRate=0.3000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M75WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.M75WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=200000.0000000,Max=200000.0000000)
	Damage=325
	LimbMult=0.5000000
	DamageType=Class'BallisticProV55.DTM75Railgun'
	DamageTypeHead=Class'BallisticProV55.DTM75RailgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM75Railgun'
	PenetrationEnergy=2560.0000000
	PenetrateForce=600
	bPenetrate=true
	PDamageFactor=0.9500000
	WallPDamageFactor=0.7000000
	MuzzleFlashClass=Class'BallisticProV55.M75FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75Fire',Volume=1.0000000,Radius=350.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=3072.0000000
	PushbackForce=920.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1,Y=1)
	BotRefireRate=1.0000000
	WarnTargetPct=0.0500000
end object
// Reference: FireEffectParams'BallisticProV55.M75WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BallisticProV55.M75WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=70
	LayoutName="X-Ray Scope"
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=10
	SightMoveSpeedFactor=0.5000000
	SightingTime=1.0000000
	ZoomType=2
	ScopeViewTex=Texture'BW_Core_WeaponTex.M75.M75ScopeView'
	WeaponName="M75-TIC 20mm Infantry Railgun"
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	MagAmmo=3
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M75WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M75WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.M75WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M75WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.M75WeaponParamsRealistic.RealisticParams_Proto'
begin object name="RealisticParams_Proto" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="X75 Prototype"
	PlayerSpeedFactor=0.7700000
	PlayerJumpFactor=0.7700000
	InventorySize=10
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=15.0000000,Y=0.0000000,Z=0.0000000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=1,Scale=0.0000000)
	WeaponName="X75-TIC 20mm Infantry Railgun"
	AllowedCamos[0]=2
	MagAmmo=3
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M75WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M75WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.M75WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M75WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsRealistic.M75_Standard'
begin object name="M75_Standard" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsRealistic.M75_Winter'
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
// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsRealistic.M75_Prototype'
begin object name="M75_Prototype" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Prototype"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BW_Core_WeaponTex.M75.M75_SKPart1_Shine",Index=3,pIndex=2,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BW_Core_WeaponTex.M75.M75_SKPart2_Shine",Index=4,pIndex=0,AIndex=0)
	Index=2
end object
