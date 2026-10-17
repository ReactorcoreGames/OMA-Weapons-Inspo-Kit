class RS8WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName=".40 Suppressed"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		WeaponPrice=750
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1200000
		SightOffset=(X=-43.0000000,Y=-1.4000000,Z=13.4000000)
		SightPivot=(Pitch=-200,Yaw=0,Roll=-1050)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=3000,Yaw=-290,Roll=0)
		ViewOffset=(X=20.0000000,Y=10.0000000,Z=-8.0000000)
		WeaponName="RS8 .40 Handgun"
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		MagAmmo=14
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticParams_TacKnife'
	begin object name="RealisticParams_TacKnife" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName=".40 Tac Knife"
		LayoutTags="tacknife"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		WeaponPrice=750
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1200000
		SightOffset=(X=-30.0000000,Y=0.2600000,Z=3.5000000)
		ViewOffset=(X=20.0000000,Y=10.0000000,Z=-8.0000000)
		WeaponName="RS8 .40 Handgun (Tac Knife)"
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.RS8Melee_FPm'
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		MagAmmo=14
		bMagPlusOne=true
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticSecondaryFireParams_TacKnife'
	end object
	Layouts[1]=RealisticParams_TacKnife
	// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticParams_10mm'
	begin object name="RealisticParams_10mm" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="10mm RDS"
		LayoutTags="comp"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		WeaponPrice=750
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1200000
		SightOffset=(X=0.0000000,Y=-2.0000000,Z=21.8000000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1050)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=3000,Yaw=-290,Roll=0)
		ViewOffset=(X=0.0000000,Y=10.0000000,Z=-10.0000000)
		WeaponName="RS8 10mm Handgun (RDS)"
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.RS8Heavy_FPm'
		AllowedCamos[0]=5
		AllowedCamos[1]=6
		AllowedCamos[2]=7
		MagAmmo=14
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticPrimaryFireParams_Heavy'
		AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[2]=RealisticParams_10mm
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsRealistic.RS8_Silver'
	begin object name="RS8_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=RS8_Silver
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsRealistic.RS8_Gray'
	begin object name="RS8_Gray" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.M1911-Shiny",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=RS8_Gray
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsRealistic.RS8_Black'
	begin object name="RS8_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-K-Shiney",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=RS8_Black
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsRealistic.RS8_Rainbow'
	begin object name="RS8_Rainbow" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Rainbow"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainRainbowShine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=RS8_Rainbow
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsRealistic.RS8_Gold'
	begin object name="RS8_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainGoldShine",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=RS8_Gold
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsRealistic.RS45_Silver'
	begin object name="RS45_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.RS8.RS8-MainHeavy',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-RDS-GLow',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-Shiney',MaterialName="",Index=3,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=RS45_Silver
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsRealistic.RS45_Black'
	begin object name="RS45_Black" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainHeavyBlack",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-RDS-GLow',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-Shiney',MaterialName="",Index=3,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=RS45_Black
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsRealistic.RS45_Gold'
	begin object name="RS45_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainHeavyGoldShine",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-RDS-GLow',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-Shiney',MaterialName="",Index=3,pIndex=0,AIndex=0)
		Index=7
	end object
	Camos[7]=RS45_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.5000000
	YawFactor=0.1000000
	XRandFactor=0.4000000
	YRandFactor=0.4000000
	MaxRecoil=1536.0000000
	DeclineTime=0.4000000
	DeclineDelay=0.1200000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=1024)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.8200000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-4608,Yaw=-512,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.0250000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.6000000
	ChaosSpeedThreshold=800
	ChaosTurnThreshold=1000000
end object
// Reference: FireParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	BurstFireRateFactor=1.0000000
	FireAnimRate=2.0000000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=3500.0000000,Max=3500.0000000)
	WaterTraceRange=1500.0000000
	DecayRange=(Min=800.0000000,Max=3500.0000000)
	RangeAtten=0.5000000
	Damage=37
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTRS8Pistol'
	DamageTypeHead=Class'BallisticProV55.DTRS8PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTRS8Pistol'
	PenetrationEnergy=9.0000000
	PenetrateForce=35
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-AR.OA-AR_Fire1',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.1000000,bAtten=false,bNoOverride=false)
	Recoil=680.0000000
	Chaos=0.0800000
	Inaccuracy=(X=11,Y=11)
	BotRefireRate=0.7500000
end object
// Reference: InstantEffectParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticPrimaryEffectParams_Heavy'
begin object name="RealisticPrimaryEffectParams_Heavy" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	WaterTraceRange=1500.0000000
	DecayRange=(Min=800.0000000,Max=4000.0000000)
	RangeAtten=0.5000000
	Damage=50
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTRS8Pistol'
	DamageTypeHead=Class'BallisticProV55.DTRS8PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTRS8Pistol'
	PenetrationEnergy=9.0000000
	PenetrateForce=35
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.8500000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.Pistol.RS8-HFire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1000.0000000
	Chaos=0.0800000
	Inaccuracy=(X=11,Y=11)
	BotRefireRate=0.7500000
end object
// Reference: FireParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticPrimaryFireParams_Heavy'
begin object name="RealisticPrimaryFireParams_Heavy" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=1.0000000
	FireAnimRate=1.5000000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticPrimaryEffectParams_Heavy'
end object
// Reference: FireEffectParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	EffectString="Laser sight"
end object
// Reference: FireParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	TargetState="Laser"
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=FireEffectParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
begin object name="RealisticSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
begin object name="RealisticSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: MeleeEffectParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticSecondaryEffectParams_TacKnife'
begin object name="RealisticSecondaryEffectParams_TacKnife" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=96.0000000,Max=96.0000000)
	WaterTraceRange=5000.0000000
	Damage=46
	HeadMult=2.5000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTRS8Stab'
	DamageTypeHead=Class'BallisticProV55.DTRS8Stab'
	DamageTypeArm=Class'BallisticProV55.DTRS8Stab'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.X4.X4_Melee',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticSecondaryFireParams_TacKnife'
begin object name="RealisticSecondaryFireParams_TacKnife" class=BCoreProV55.FireParams
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Stab"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticSecondaryEffectParams_TacKnife'
end object
// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName=".40 Suppressed"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	WeaponPrice=750
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1200000
	SightOffset=(X=-43.0000000,Y=-1.4000000,Z=13.4000000)
	SightPivot=(Pitch=-200,Yaw=0,Roll=-1050)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=3000,Yaw=-290,Roll=0)
	ViewOffset=(X=20.0000000,Y=10.0000000,Z=-8.0000000)
	WeaponName="RS8 .40 Handgun"
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	MagAmmo=14
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticParams_TacKnife'
begin object name="RealisticParams_TacKnife" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName=".40 Tac Knife"
	LayoutTags="tacknife"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	WeaponPrice=750
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1200000
	SightOffset=(X=-30.0000000,Y=0.2600000,Z=3.5000000)
	ViewOffset=(X=20.0000000,Y=10.0000000,Z=-8.0000000)
	WeaponName="RS8 .40 Handgun (Tac Knife)"
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.RS8Melee_FPm'
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	MagAmmo=14
	bMagPlusOne=true
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticSecondaryFireParams_TacKnife'
end object
// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticParams_10mm'
begin object name="RealisticParams_10mm" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="10mm RDS"
	LayoutTags="comp"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	WeaponPrice=750
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1200000
	SightOffset=(X=0.0000000,Y=-2.0000000,Z=21.8000000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1050)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=3000,Yaw=-290,Roll=0)
	ViewOffset=(X=0.0000000,Y=10.0000000,Z=-10.0000000)
	WeaponName="RS8 10mm Handgun (RDS)"
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.RS8Heavy_FPm'
	AllowedCamos[0]=5
	AllowedCamos[1]=6
	AllowedCamos[2]=7
	MagAmmo=14
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticPrimaryFireParams_Heavy'
	AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsRealistic.RS8_Silver'
begin object name="RS8_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsRealistic.RS8_Gray'
begin object name="RS8_Gray" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.M1911-Shiny",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsRealistic.RS8_Black'
begin object name="RS8_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-K-Shiney",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsRealistic.RS8_Rainbow'
begin object name="RS8_Rainbow" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Rainbow"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainRainbowShine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsRealistic.RS8_Gold'
begin object name="RS8_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainGoldShine",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsRealistic.RS45_Silver'
begin object name="RS45_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.RS8.RS8-MainHeavy',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-RDS-GLow',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-Shiney',MaterialName="",Index=3,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsRealistic.RS45_Black'
begin object name="RS45_Black" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainHeavyBlack",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-RDS-GLow',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-Shiney',MaterialName="",Index=3,pIndex=0,AIndex=0)
	Index=6
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsRealistic.RS45_Gold'
begin object name="RS45_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainHeavyGoldShine",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-RDS-GLow',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-Shiney',MaterialName="",Index=3,pIndex=0,AIndex=0)
	Index=7
end object
