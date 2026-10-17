class M75WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M75WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=70
		LayoutName="X-Ray Scope"
		PlayerSpeedFactor=0.8500000
		PlayerJumpFactor=0.7500000
		InventorySize=14
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.8000000
		ZoomType=2
		ScopeViewTex=Texture'BW_Core_WeaponTex.M75.M75ScopeView'
		ViewOffset=(X=-6.0000000,Y=8.0000000,Z=-3.0000000)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		MagAmmo=7
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M75WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M75WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.M75WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M75WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BallisticProV55.M75WeaponParamsClassic.ClassicParams-Irons'
	begin object name="ClassicParams-Irons" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="X75 Irons"
		PlayerSpeedFactor=0.8500000
		PlayerJumpFactor=0.7500000
		InventorySize=14
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=15.0000000,Y=0.0000000,Z=0.0000000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=1,Scale=0.0000000)
		ViewOffset=(X=-6.0000000,Y=8.0000000,Z=-3.0000000)
		AllowedCamos[0]=2
		MagAmmo=7
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M75WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M75WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.M75WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M75WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams-Irons
	// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsClassic.M75_Standard'
	begin object name="M75_Standard" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=M75_Standard
	// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsClassic.M75_Winter'
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
	// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsClassic.M75_Prototype'
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
// Reference: AimParams'BallisticProV55.M75WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=8,Max=2560)
	AimAdjustTime=0.8000000
	CrouchMultiplier=0.4000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-8000,Yaw=-10000,Roll=0)
	JumpOffset=(Pitch=2000,Yaw=-5000,Roll=0)
	ViewBindFactor=0.3000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.5000000
	ChaosTurnThreshold=100000
end object
// Reference: RecoilParams'BallisticProV55.M75WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=3072.0000000
	DeclineTime=1.0000000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.4000000
	bViewDecline=true
end object
// Reference: FireParams'BallisticProV55.M75WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.M75WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.M75WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	TargetState="ClassicRail"
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M75WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.M75WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=20000.0000000,Max=20000.0000000)
	WaterTraceRange=5000.0000000
	Damage=325
	HeadMult=1.1000000
	LimbMult=0.5000000
	DamageType=Class'BallisticProV55.DTM75Railgun'
	DamageTypeHead=Class'BallisticProV55.DTM75RailgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM75Railgun'
	PenetrationEnergy=1280.0000000
	PenetrateForce=700
	bPenetrate=true
	PDamageFactor=0.9500000
	WallPDamageFactor=0.7000000
	MuzzleFlashClass=Class'BallisticProV55.M75FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75Fire',Volume=1.0000000,Radius=350.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=3072.0000000
	PushbackForce=1300.0000000
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.0500000
end object
// Reference: FireEffectParams'BallisticProV55.M75WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BallisticProV55.M75WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=70
	LayoutName="X-Ray Scope"
	PlayerSpeedFactor=0.8500000
	PlayerJumpFactor=0.7500000
	InventorySize=14
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.8000000
	ZoomType=2
	ScopeViewTex=Texture'BW_Core_WeaponTex.M75.M75ScopeView'
	ViewOffset=(X=-6.0000000,Y=8.0000000,Z=-3.0000000)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	MagAmmo=7
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M75WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M75WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.M75WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M75WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.M75WeaponParamsClassic.ClassicParams-Irons'
begin object name="ClassicParams-Irons" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="X75 Irons"
	PlayerSpeedFactor=0.8500000
	PlayerJumpFactor=0.7500000
	InventorySize=14
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=15.0000000,Y=0.0000000,Z=0.0000000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=1,Scale=0.0000000)
	ViewOffset=(X=-6.0000000,Y=8.0000000,Z=-3.0000000)
	AllowedCamos[0]=2
	MagAmmo=7
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M75WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M75WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.M75WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M75WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsClassic.M75_Standard'
begin object name="M75_Standard" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsClassic.M75_Winter'
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
// Reference: WeaponCamo'BallisticProV55.M75WeaponParamsClassic.M75_Prototype'
begin object name="M75_Prototype" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Prototype"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BW_Core_WeaponTex.M75.M75_SKPart1_Shine",Index=3,pIndex=2,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BW_Core_WeaponTex.M75.M75_SKPart2_Shine",Index=4,pIndex=0,AIndex=0)
	Index=2
end object
