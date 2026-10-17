class RS8WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Suppressable"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2000000
		SightOffset=(X=-43.0000000,Y=-1.4000000,Z=13.4000000)
		SightPivot=(Pitch=-200,Yaw=0,Roll=-1050)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=3000,Yaw=-290,Roll=0)
		ViewOffset=(X=20.0000000,Y=7.0000000,Z=-8.0000000)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		MagAmmo=14
		bNeedCock=true
		bDualMixing=true
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParamsBurst'
		AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryFireParamsBurst'
		AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsClassic.ClassicParams_TacKnife'
	begin object name="ClassicParams_TacKnife" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Classic Knife"
		LayoutTags="tacknife"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=-30.0000000,Y=0.2600000,Z=3.5000000)
		ViewOffset=(X=21.0000000,Y=6.0000000,Z=-5.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.RS8Melee_FPm'
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		MagAmmo=14
		bNeedCock=true
		bDualBlocked=true
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParamsBurst'
		AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryFireParamsBurst'
		AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicSecondaryFireParams_TacKnife'
	end object
	Layouts[1]=ClassicParams_TacKnife
	// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsClassic.ClassicParams_Heavy'
	begin object name="ClassicParams_Heavy" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="RDS H-Frame"
		LayoutTags="comp"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2000000
		SightOffset=(X=0.0000000,Y=-2.0000000,Z=21.8000000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1050)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=3000,Yaw=-290,Roll=0)
		ViewOffset=(X=0.0000000,Y=10.0000000,Z=-10.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.RS8Heavy_FPm'
		AllowedCamos[0]=5
		AllowedCamos[1]=6
		AllowedCamos[2]=7
		MagAmmo=7
		bNeedCock=true
		bDualMixing=true
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParamsBurst'
		AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryFireParams_Heavy'
		FireParams[1]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryFireParamsBurst'
		AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[2]=ClassicParams_Heavy
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsClassic.RS8_Silver'
	begin object name="RS8_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=RS8_Silver
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsClassic.RS8_Gray'
	begin object name="RS8_Gray" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.M1911-Shiny",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=RS8_Gray
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsClassic.RS8_Black'
	begin object name="RS8_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-K-Shiney",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=RS8_Black
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsClassic.RS8_Rainbow'
	begin object name="RS8_Rainbow" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Rainbow"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainRainbowShine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=RS8_Rainbow
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsClassic.RS8_Gold'
	begin object name="RS8_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainGoldShine",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=RS8_Gold
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsClassic.RS45_Silver'
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
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsClassic.RS45_Black'
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
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsClassic.RS45_Gold'
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
// Reference: FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryFireParamsBurst'
begin object name="ClassicPrimaryFireParamsBurst" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryEffectParamsBurst'
end object
// Reference: RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=8192.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.3000000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParamsBurst'
begin object name="ClassicRecoilParamsBurst" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=8192.0000000
	DeclineTime=1.5000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.3000000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.RS8WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=48,Max=8192)
	AimAdjustTime=0.4500000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.0250000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=11200
	ChaosTurnThreshold=1000000
end object
// Reference: FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1800000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=2250.0000000
	RangeAtten=0.9000000
	Damage=30
	HeadMult=2.3000000
	LimbMult=0.3000000
	DamageType=Class'BallisticProV55.DTRS8Pistol'
	DamageTypeHead=Class'BallisticProV55.DTRS8PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTRS8Pistol'
	PenetrationEnergy=20.0000000
	PenetrateForce=135
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter_C'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Pistol.RSP-Fire',Volume=1.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=0.0150000
	Inaccuracy=(X=8,Y=8)
	BotRefireRate=0.7500000
end object
// Reference: InstantEffectParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryEffectParamsBurst'
begin object name="ClassicPrimaryEffectParamsBurst" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=2250.0000000
	RangeAtten=0.9000000
	Damage=30
	HeadMult=2.3000000
	LimbMult=0.3000000
	DamageType=Class'BallisticProV55.DTRS8Pistol'
	DamageTypeHead=Class'BallisticProV55.DTRS8PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTRS8Pistol'
	PenetrationEnergy=20.0000000
	PenetrateForce=135
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Pistol.RSP-Fire',Volume=1.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.2000000
	Inaccuracy=(X=8,Y=8)
	BotRefireRate=0.7500000
end object
// Reference: InstantEffectParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryEffectParams_Heavy'
begin object name="ClassicPrimaryEffectParams_Heavy" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5000.0000000,Max=6000.0000000)
	WaterTraceRange=2250.0000000
	RangeAtten=0.9000000
	Damage=42
	HeadMult=2.5000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTRS8Pistol'
	DamageTypeHead=Class'BallisticProV55.DTRS8PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTRS8Pistol'
	PenetrationEnergy=20.0000000
	PenetrateForce=135
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter_C'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.Pistol.RS8-HFire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=3600.0000000
	Chaos=0.0150000
	Inaccuracy=(X=8,Y=8)
	BotRefireRate=0.7500000
end object
// Reference: FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryFireParams_Heavy'
begin object name="ClassicPrimaryFireParams_Heavy" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryEffectParams_Heavy'
end object
// Reference: FireEffectParams'BallisticProV55.RS8WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	EffectString="Laser sight"
end object
// Reference: FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	TargetState="Laser"
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=FireEffectParams'BallisticProV55.RS8WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.RS8WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
begin object name="ClassicSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
begin object name="ClassicSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.RS8WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
end object
// Reference: MeleeEffectParams'BallisticProV55.RS8WeaponParamsClassic.ClassicSecondaryEffectParams_TacKnife'
begin object name="ClassicSecondaryEffectParams_TacKnife" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=96.0000000,Max=96.0000000)
	WaterTraceRange=5000.0000000
	Damage=35
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
// Reference: FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicSecondaryFireParams_TacKnife'
begin object name="ClassicSecondaryFireParams_TacKnife" class=BCoreProV55.FireParams
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Stab"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.RS8WeaponParamsClassic.ClassicSecondaryEffectParams_TacKnife'
end object
// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Suppressable"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2000000
	SightOffset=(X=-43.0000000,Y=-1.4000000,Z=13.4000000)
	SightPivot=(Pitch=-200,Yaw=0,Roll=-1050)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=3000,Yaw=-290,Roll=0)
	ViewOffset=(X=20.0000000,Y=7.0000000,Z=-8.0000000)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	MagAmmo=14
	bNeedCock=true
	bDualMixing=true
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParamsBurst'
	AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryFireParamsBurst'
	AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsClassic.ClassicParams_TacKnife'
begin object name="ClassicParams_TacKnife" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Classic Knife"
	LayoutTags="tacknife"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=-30.0000000,Y=0.2600000,Z=3.5000000)
	ViewOffset=(X=21.0000000,Y=6.0000000,Z=-5.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.RS8Melee_FPm'
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	MagAmmo=14
	bNeedCock=true
	bDualBlocked=true
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParamsBurst'
	AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryFireParamsBurst'
	AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicSecondaryFireParams_TacKnife'
end object
// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsClassic.ClassicParams_Heavy'
begin object name="ClassicParams_Heavy" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="RDS H-Frame"
	LayoutTags="comp"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2000000
	SightOffset=(X=0.0000000,Y=-2.0000000,Z=21.8000000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1050)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=3000,Yaw=-290,Roll=0)
	ViewOffset=(X=0.0000000,Y=10.0000000,Z=-10.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.RS8Heavy_FPm'
	AllowedCamos[0]=5
	AllowedCamos[1]=6
	AllowedCamos[2]=7
	MagAmmo=7
	bNeedCock=true
	bDualMixing=true
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParamsBurst'
	AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryFireParams_Heavy'
	FireParams[1]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicPrimaryFireParamsBurst'
	AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsClassic.RS8_Silver'
begin object name="RS8_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsClassic.RS8_Gray'
begin object name="RS8_Gray" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.M1911-Shiny",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsClassic.RS8_Black'
begin object name="RS8_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-K-Shiney",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsClassic.RS8_Rainbow'
begin object name="RS8_Rainbow" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Rainbow"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainRainbowShine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsClassic.RS8_Gold'
begin object name="RS8_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainGoldShine",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsClassic.RS45_Silver'
begin object name="RS45_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.RS8.RS8-MainHeavy',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-RDS-GLow',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-Shiney',MaterialName="",Index=3,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsClassic.RS45_Black'
begin object name="RS45_Black" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainHeavyBlack",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-RDS-GLow',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-Shiney',MaterialName="",Index=3,pIndex=0,AIndex=0)
	Index=6
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsClassic.RS45_Gold'
begin object name="RS45_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainHeavyGoldShine",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-RDS-GLow',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-Shiney',MaterialName="",Index=3,pIndex=0,AIndex=0)
	Index=7
end object
