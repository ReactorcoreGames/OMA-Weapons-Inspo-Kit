class FMPWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Amplifier"
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1850000
		SightPivot=(Pitch=0,Yaw=10,Roll=0)
		WeaponName="FMP-2012 .40 Machine Pistol"
		MagAmmo=28
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticIncRecoilParams'
		RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticCorrosiveRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticIncPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticCorrosivePrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticParams_Supp'
	begin object name="RealisticParams_Supp" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Suppressed"
		LayoutTags="no_amp"
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1850000
		SightPivot=(Pitch=0,Yaw=10,Roll=0)
		WeaponName="FMP-2012 .40 Machine Pistol"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorAK',BoneName="tip",Scale=0.0750000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.1000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=28
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[1]=RealisticParams_Supp
	// Reference: WeaponParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticParams_Holo'
	begin object name="RealisticParams_Holo" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Holosight"
		LayoutTags="no_amp"
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1850000
		SightOffset=(X=-3.5000000,Y=-0.0500000,Z=4.4500000)
		SightPivot=(Pitch=0,Yaw=10,Roll=0)
		WeaponName="FMP-2012 .40 Machine Pistol"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_RifleRail',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-25.0000000,Y=1.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=32768,Roll=16384))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexCircle',BoneName="tip",Scale=0.0350000,AugmentOffset=(X=-25.0000000,Y=-1.7500000,Z=-0.1500000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=28
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[2]=RealisticParams_Holo
	// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsRealistic.MP40_Black'
	begin object name="MP40_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Schwarz"
	end object
	Camos[0]=MP40_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsRealistic.MP40_Rust'
	begin object name="MP40_Rust" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Rost"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainRust",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
		Index=1
	end object
	Camos[1]=MP40_Rust
	// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsRealistic.MP40_Jungle'
	begin object name="MP40_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Dschungel"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainJungle",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
		Index=2
	end object
	Camos[2]=MP40_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsRealistic.MP40_Chrome'
	begin object name="MP40_Chrome" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Chrom"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainChromeShine",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
		Index=3
	end object
	Camos[3]=MP40_Chrome
	// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsRealistic.MP40_Quantum'
	begin object name="MP40_Quantum" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Quantum"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainQuantumShine",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
		Index=4
	end object
	Camos[4]=MP40_Quantum
	// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsRealistic.MP40_Gold'
	begin object name="MP40_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainGoldShine",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
		Index=5
	end object
	Camos[5]=MP40_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=600,Max=1280)
	CrouchMultiplier=0.5000000
	ADSMultiplier=0.6000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.0000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.5000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.1600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.3500000),(InVal=1.0000000,OutVal=0.3500000)))
	PitchFactor=0.6000000
	YawFactor=0.2000000
	XRandFactor=0.7500000
	YRandFactor=0.7500000
	DeclineTime=0.5000000
	DeclineDelay=0.1500000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.5000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
begin object name="RealisticSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1000.0000000,Max=4500.0000000)
	WaterTraceRange=2000.0000000
	RangeAtten=0.1000000
	Damage=44
	HeadMult=2.3181810
	LimbMult=0.5681810
	DamageType=Class'BWBP_SKC_Pro.DT_MP40Chest'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MP40Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MP40Chest'
	PenetrationEnergy=9.0000000
	PenetrateForce=35
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.9000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MP40.MP40-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=80.0000000
	Chaos=0.0600000
	Inaccuracy=(X=28,Y=28)
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticPrimaryEffectParams_Supp'
begin object name="RealisticPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1000.0000000,Max=4500.0000000)
	WaterTraceRange=2000.0000000
	RangeAtten=0.1000000
	Damage=44
	HeadMult=2.3181810
	LimbMult=0.5681810
	DamageType=Class'BWBP_SKC_Pro.DT_MP40Chest'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MP40Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MP40Chest'
	PenetrationEnergy=9.0000000
	PenetrateForce=35
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.9000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AK47.AK490-SilFire',Volume=0.8000000,Radius=256.0000000,Slot=0,Pitch=1.5000000,bAtten=true,bNoOverride=true)
	Recoil=70.0000000
	Chaos=0.0800000
	Inaccuracy=(X=24,Y=24)
end object
// Reference: FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
begin object name="RealisticPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticPrimaryEffectParams_Supp'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticIncPrimaryEffectParams'
begin object name="RealisticIncPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	RangeAtten=0.7000000
	Damage=70
	DamageType=Class'BWBP_SKC_Pro.DT_MP40_Incendiary'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MP40Head_Incendiary'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MP40_Incendiary'
	PenetrateForce=150
	HookStopFactor=0.2000000
	HookPullForce=-10.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=1.1000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.MP40.MP40-HotFire',Volume=1.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.0300000
end object
// Reference: FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticIncPrimaryFireParams'
begin object name="RealisticIncPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2350000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticIncPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticCorrosivePrimaryEffectParams'
begin object name="RealisticCorrosivePrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	RangeAtten=0.7000000
	Damage=35
	DamageType=Class'BWBP_SKC_Pro.DT_MP40_Corrosive'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MP40Head_Corrosive'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MP40_Corrosive'
	PenetrateForce=150
	HookStopFactor=0.2000000
	HookPullForce=-10.0000000
	MuzzleFlashClass=Class'BallisticProV55.A500FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.MP40.MP40-AcidFire',Volume=1.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=70.0000000
	Chaos=0.0300000
end object
// Reference: FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticCorrosivePrimaryFireParams'
begin object name="RealisticCorrosivePrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticCorrosivePrimaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
begin object name="RealisticSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticIncRecoilParams'
begin object name="RealisticIncRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.1600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	DeclineTime=0.5000000
	DeclineDelay=0.4500000
	ViewBindFactor=0.4500000
	CrouchMultiplier=0.8000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticCorrosiveRecoilParams'
begin object name="RealisticCorrosiveRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.1600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	DeclineTime=0.5000000
	DeclineDelay=0.4500000
	ViewBindFactor=0.4500000
	CrouchMultiplier=0.8000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Amplifier"
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1850000
	SightPivot=(Pitch=0,Yaw=10,Roll=0)
	WeaponName="FMP-2012 .40 Machine Pistol"
	MagAmmo=28
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticIncRecoilParams'
	RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticCorrosiveRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticIncPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticCorrosivePrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticParams_Supp'
begin object name="RealisticParams_Supp" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Suppressed"
	LayoutTags="no_amp"
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1850000
	SightPivot=(Pitch=0,Yaw=10,Roll=0)
	WeaponName="FMP-2012 .40 Machine Pistol"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorAK',BoneName="tip",Scale=0.0750000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.1000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=28
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticParams_Holo'
begin object name="RealisticParams_Holo" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Holosight"
	LayoutTags="no_amp"
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1850000
	SightOffset=(X=-3.5000000,Y=-0.0500000,Z=4.4500000)
	SightPivot=(Pitch=0,Yaw=10,Roll=0)
	WeaponName="FMP-2012 .40 Machine Pistol"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_RifleRail',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-25.0000000,Y=1.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=32768,Roll=16384))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexCircle',BoneName="tip",Scale=0.0350000,AugmentOffset=(X=-25.0000000,Y=-1.7500000,Z=-0.1500000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=28
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsRealistic.MP40_Black'
begin object name="MP40_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Schwarz"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsRealistic.MP40_Rust'
begin object name="MP40_Rust" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Rost"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainRust",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsRealistic.MP40_Jungle'
begin object name="MP40_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Dschungel"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainJungle",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsRealistic.MP40_Chrome'
begin object name="MP40_Chrome" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Chrom"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainChromeShine",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsRealistic.MP40_Quantum'
begin object name="MP40_Quantum" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Quantum"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainQuantumShine",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsRealistic.MP40_Gold'
begin object name="MP40_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainGoldShine",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
	Index=5
end object
