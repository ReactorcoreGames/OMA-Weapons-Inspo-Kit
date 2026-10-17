class M2020WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Scoped"
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		ZoomType=4
		WeaponName="M2020 7.92mm Gauss Rifle"
		MagAmmo=10
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Gauss: Online",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Gauss: Full Charge",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Gauss: Offline",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Gauss: Deflecting",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParamsOffline'
		FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParamsOffline'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticParams_Holo'
	begin object name="RealisticParams_Holo" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Holosight"
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=4.0000000,Y=-0.1000000,Z=0.7500000)
		WeaponName="M2020 7.92mm Gauss Rifle"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.M2020Tac_FPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Holo',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-40.0000000,Y=-1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
		MagAmmo=10
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Gauss: Online",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Gauss: Full Charge",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Gauss: Offline",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Gauss: Deflecting",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticRecoilParams_RDS'
		AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParamsOffline'
		FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParamsOffline'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_Holo
	// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticParams_Supp'
	begin object name="RealisticParams_Supp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Suppressor"
		LayoutTags="supp"
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=4.0000000,Y=-0.0800000,Z=0.5500000)
		WeaponName="M2020 7.92mm Gauss Rifle"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.M2020Tac_FPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexRU',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-40.0000000,Y=-1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorOsprey',BoneName="tip",Scale=0.2000000,AugmentOffset=(X=-15.0000000,Y=1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
		MagAmmo=10
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Gauss: Online",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Gauss: Full Charge",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Gauss: Offline",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Gauss: Deflecting",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticRecoilParams_RDS'
		AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
		FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
		FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParamsOffline_Supp'
		FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParamsOffline_Supp'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[2]=RealisticParams_Supp
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsRealistic.M2020_Black'
	begin object name="M2020_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=M2020_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsRealistic.M2020_Aliens'
	begin object name="M2020_Aliens" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Corporate"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainAlien",Index=2,pIndex=2,AIndex=2)
		Index=1
	end object
	Camos[1]=M2020_Aliens
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsRealistic.M2020_Desert'
	begin object name="M2020_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainDesert",Index=2,pIndex=2,AIndex=2)
		Index=2
	end object
	Camos[2]=M2020_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsRealistic.M2020_Winter'
	begin object name="M2020_Winter" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Winter Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainWinter",Index=2,pIndex=2,AIndex=2)
		Index=3
	end object
	Camos[3]=M2020_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsRealistic.M2020_Blue'
	begin object name="M2020_Blue" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Blue Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainBlueHex",Index=2,pIndex=2,AIndex=2)
		Index=4
	end object
	Camos[4]=M2020_Blue
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsRealistic.M2020_Red'
	begin object name="M2020_Red" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainRedTiger",Index=2,pIndex=2,AIndex=2)
		Index=5
	end object
	Camos[5]=M2020_Red
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParamsOffline'
begin object name="RealisticPrimaryFireParamsOffline" class=BCoreProV55.FireParams
	FireInterval=0.1100000
	BurstFireRateFactor=1.0000000
	FireAnim="FireUnPowered"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryEffectParamsOffline'
end object
// Reference: AimParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=820,Max=2136)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.0750000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=475
end object
// Reference: RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticRecoilParams_RDS'
begin object name="RealisticRecoilParams_RDS" class=BCoreProV55.RecoilParams
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3500000),(InVal=0.6000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.1000000
	XRandFactor=1.0000000
	YRandFactor=1.0000000
	MaxRecoil=3096.0000000
	DeclineTime=1.2500000
	DeclineDelay=0.2500000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParamsOffline_Supp'
begin object name="RealisticPrimaryFireParamsOffline_Supp" class=BCoreProV55.FireParams
	FireInterval=0.1100000
	BurstFireRateFactor=1.0000000
	FireAnim="FireUnPowered"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryEffectParamsOffline_Supp'
end object
// Reference: FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
begin object name="RealisticPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryEffectParams_Supp'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=20000.0000000)
	WaterTraceRange=18000.0000000
	RangeAtten=0.9000000
	Damage=100
	HeadMult=2.2000000
	LimbMult=0.7000000
	DamageType=Class'BWBP_SKC_Pro.DT_M2020Pwr'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_M2020HeadPwr'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_M2020LimbPwr'
	PenetrationEnergy=150.0000000
	PenetrateForce=600
	bPenetrate=true
	WallPDamageFactor=0.7500000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.M2020FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.M2020.M2020-FireGaussAlt',Volume=1.7500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1,Y=1)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryEffectParams_Supp'
begin object name="RealisticPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=20000.0000000)
	WaterTraceRange=18000.0000000
	RangeAtten=0.9000000
	Damage=100
	HeadMult=2.2000000
	LimbMult=0.7000000
	DamageType=Class'BWBP_SKC_Pro.DT_M2020Pwr'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_M2020HeadPwr'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_M2020LimbPwr'
	PenetrationEnergy=150.0000000
	PenetrateForce=600
	bPenetrate=true
	WallPDamageFactor=0.7500000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.M2020FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.M2020.M2020-FireGaussAlt',Volume=1.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2000.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1,Y=1)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryEffectParamsOffline'
begin object name="RealisticPrimaryEffectParamsOffline" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1800.0000000,Max=9000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.1000000
	Damage=55
	HeadMult=2.2000000
	LimbMult=0.7000000
	DamageType=Class'BWBP_SKC_Pro.DT_M2020Off'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_M2020HeadOff'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_M2020Off'
	PenetrationEnergy=24.0000000
	PenetrateForce=125
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M2020.M2020-FireAlt',Volume=1.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=600.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1,Y=1)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryEffectParamsOffline_Supp'
begin object name="RealisticPrimaryEffectParamsOffline_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1800.0000000,Max=9000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.1000000
	Damage=55
	HeadMult=2.2000000
	LimbMult=0.7000000
	DamageType=Class'BWBP_SKC_Pro.DT_M2020Off'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_M2020HeadOff'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_M2020Off'
	PenetrationEnergy=24.0000000
	PenetrateForce=125
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.Mk781.Mk781-FireSupp',Volume=0.8000000,Radius=192.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=570.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1,Y=1)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3500000),(InVal=0.6000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.1000000
	XRandFactor=1.0000000
	YRandFactor=1.0000000
	MaxRecoil=3096.0000000
	DeclineTime=1.2500000
	DeclineDelay=0.2500000
	ViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Scoped"
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	ZoomType=4
	WeaponName="M2020 7.92mm Gauss Rifle"
	MagAmmo=10
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Gauss: Online",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Gauss: Full Charge",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Gauss: Offline",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Gauss: Deflecting",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParamsOffline'
	FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParamsOffline'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticParams_Holo'
begin object name="RealisticParams_Holo" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Holosight"
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=4.0000000,Y=-0.1000000,Z=0.7500000)
	WeaponName="M2020 7.92mm Gauss Rifle"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.M2020Tac_FPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Holo',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-40.0000000,Y=-1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
	MagAmmo=10
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Gauss: Online",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Gauss: Full Charge",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Gauss: Offline",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Gauss: Deflecting",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticRecoilParams_RDS'
	AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParamsOffline'
	FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParamsOffline'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticParams_Supp'
begin object name="RealisticParams_Supp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Suppressor"
	LayoutTags="supp"
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=4.0000000,Y=-0.0800000,Z=0.5500000)
	WeaponName="M2020 7.92mm Gauss Rifle"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.M2020Tac_FPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexRU',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-40.0000000,Y=-1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorOsprey',BoneName="tip",Scale=0.2000000,AugmentOffset=(X=-15.0000000,Y=1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
	MagAmmo=10
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Gauss: Online",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Gauss: Full Charge",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Gauss: Offline",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Gauss: Deflecting",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticRecoilParams_RDS'
	AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
	FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
	FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParamsOffline_Supp'
	FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsRealistic.RealisticPrimaryFireParamsOffline_Supp'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsRealistic.M2020_Black'
begin object name="M2020_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsRealistic.M2020_Aliens'
begin object name="M2020_Aliens" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Corporate"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainAlien",Index=2,pIndex=2,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsRealistic.M2020_Desert'
begin object name="M2020_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainDesert",Index=2,pIndex=2,AIndex=2)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsRealistic.M2020_Winter'
begin object name="M2020_Winter" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Winter Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainWinter",Index=2,pIndex=2,AIndex=2)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsRealistic.M2020_Blue'
begin object name="M2020_Blue" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Blue Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainBlueHex",Index=2,pIndex=2,AIndex=2)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsRealistic.M2020_Red'
begin object name="M2020_Red" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainRedTiger",Index=2,pIndex=2,AIndex=2)
	Index=5
end object
