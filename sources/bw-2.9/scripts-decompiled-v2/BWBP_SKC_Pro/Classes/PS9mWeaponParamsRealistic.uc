class PS9mWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Neurotoxin"
		LayoutTags="tox"
		InventorySize=2
		WeaponPrice=2000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1100000
		SightPivot=(Pitch=150,Yaw=0,Roll=0)
		WeaponName="PS9 7mm Toxin Pistol"
		MagAmmo=10
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticParams_Auto'
	begin object name="RealisticParams_Auto" class=BCoreProV55.WeaponParams
		Weight=2
		LayoutName="Poison Auto"
		InventorySize=2
		WeaponPrice=2000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1100000
		SightPivot=(Pitch=150,Yaw=0,Roll=0)
		WeaponName="PS9m 7mm Tranq Pistol"
		MagAmmo=10
		bMagPlusOne=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticPrimaryFireParams_Auto'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_Auto
	// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.PS_Gray'
	begin object name="PS_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=PS_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.PS_Black'
	begin object name="PS_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.StealthCamos.Stealth-Black",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=PS_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.PS_Jungle'
	begin object name="PS_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.StealthCamos.Stealth-TigerGreen",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=PS_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.PS_RedTiger'
	begin object name="PS_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Ember"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.StealthCamos.Stealth-Tiger",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=PS_RedTiger
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=1024)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.8200000
	ADSMultiplier=0.7700000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.6000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.4000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.6500000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=2048.0000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="DartFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=500.0000000,Max=3000.0000000)
	WaterTraceRange=5000.0000000
	Damage=30
	HeadMult=4.0000000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DT_PS9MDart'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_PS9MDartHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_PS9MDart'
	PenetrationEnergy=1.0000000
	PenetrateForce=150
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-FireAlt',Volume=1.4000000,Radius=16.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=80.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=24,Y=24)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.5000000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticPrimaryEffectParams_Auto'
begin object name="RealisticPrimaryEffectParams_Auto" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=500.0000000,Max=3000.0000000)
	WaterTraceRange=5000.0000000
	Damage=20
	HeadMult=4.0000000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DT_PS9MDart'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_PS9MDartHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_PS9MDart'
	PenetrationEnergy=1.0000000
	PenetrateForce=150
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-Fire',Volume=0.7500000,Radius=16.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=80.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=24,Y=24)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticPrimaryFireParams_Auto'
begin object name="RealisticPrimaryFireParams_Auto" class=BCoreProV55.FireParams
	FireInterval=0.0750000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.5000000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticPrimaryEffectParams_Auto'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PS9mMedDart'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=6500.0000000
	Damage=30.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-DartFire',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Neurotoxin"
	LayoutTags="tox"
	InventorySize=2
	WeaponPrice=2000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1100000
	SightPivot=(Pitch=150,Yaw=0,Roll=0)
	WeaponName="PS9 7mm Toxin Pistol"
	MagAmmo=10
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticParams_Auto'
begin object name="RealisticParams_Auto" class=BCoreProV55.WeaponParams
	Weight=2
	LayoutName="Poison Auto"
	InventorySize=2
	WeaponPrice=2000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1100000
	SightPivot=(Pitch=150,Yaw=0,Roll=0)
	WeaponName="PS9m 7mm Tranq Pistol"
	MagAmmo=10
	bMagPlusOne=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticPrimaryFireParams_Auto'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.PS_Gray'
begin object name="PS_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.PS_Black'
begin object name="PS_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.StealthCamos.Stealth-Black",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.PS_Jungle'
begin object name="PS_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.StealthCamos.Stealth-TigerGreen",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsRealistic.PS_RedTiger'
begin object name="PS_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Ember"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.StealthCamos.Stealth-Tiger",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
