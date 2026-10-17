class FMPWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Amplifier"
		InventorySize=4
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2500000
		WeaponName="FMP-2012 .40 Machine Pistol"
		DisplaceDurationMult=0.7500000
		MagAmmo=28
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalIncRecoilParams'
		RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalCorrosiveRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalIncPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalCorrosivePrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalParams_Supp'
	begin object name="TacticalParams_Supp" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Suppressed"
		LayoutTags="no_amp"
		InventorySize=4
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2500000
		WeaponName="FMP-2012 .40 Machine Pistol"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorAK',BoneName="tip",Scale=0.0750000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.1000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		DisplaceDurationMult=0.7500000
		MagAmmo=28
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalPrimaryFireParams_Supp'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	end object
	Layouts[1]=TacticalParams_Supp
	// Reference: WeaponParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalParams_Holo'
	begin object name="TacticalParams_Holo" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Holosight"
		LayoutTags="no_amp"
		InventorySize=4
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2500000
		SightOffset=(X=-3.5000000,Y=-0.0500000,Z=4.4500000)
		SightPivot=(Pitch=0,Yaw=10,Roll=0)
		WeaponName="FMP-2012 .40 Machine Pistol"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_RifleRail',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-25.0000000,Y=1.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=32768,Roll=16384))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexCircle',BoneName="tip",Scale=0.0350000,AugmentOffset=(X=-25.0000000,Y=-1.7500000,Z=-0.1500000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		DisplaceDurationMult=0.7500000
		MagAmmo=28
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	end object
	Layouts[2]=TacticalParams_Holo
	// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsTactical.MP40_Black'
	begin object name="MP40_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Schwarz"
	end object
	Camos[0]=MP40_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsTactical.MP40_Rust'
	begin object name="MP40_Rust" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Rost"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainRust",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
		Index=1
	end object
	Camos[1]=MP40_Rust
	// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsTactical.MP40_Jungle'
	begin object name="MP40_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Dschungel"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainJungle",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
		Index=2
	end object
	Camos[2]=MP40_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsTactical.MP40_Chrome'
	begin object name="MP40_Chrome" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Chrom"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainChromeShine",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
		Index=3
	end object
	Camos[3]=MP40_Chrome
	// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsTactical.MP40_Quantum'
	begin object name="MP40_Quantum" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Quantum"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainQuantumShine",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
		Index=4
	end object
	Camos[4]=MP40_Quantum
	// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsTactical.MP40_Gold'
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
// Reference: AimParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.8000000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.5000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.1600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.3500000),(InVal=1.0000000,OutVal=0.3500000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1400000
	EscapeMultiplier=1.5000000
	ViewBindFactor=0.3500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
begin object name="TacticalSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4096.0000000,Max=4096.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=30
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DT_MP40Chest'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MP40Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MP40Chest'
	PenetrationEnergy=16.0000000
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.9000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MP40.MP40-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=140.0000000
	Chaos=0.0600000
	Inaccuracy=(X=72,Y=72)
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalPrimaryEffectParams_Supp'
begin object name="TacticalPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4096.0000000,Max=4096.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=30
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DT_MP40Chest'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MP40Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MP40Chest'
	PenetrationEnergy=16.0000000
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.9000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AK47.AK490-SilFire',Volume=0.8000000,Radius=256.0000000,Slot=0,Pitch=1.5000000,bAtten=true,bNoOverride=true)
	Recoil=120.0000000
	Chaos=0.0800000
	Inaccuracy=(X=72,Y=72)
end object
// Reference: FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalPrimaryFireParams_Supp'
begin object name="TacticalPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalPrimaryEffectParams_Supp'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalIncPrimaryEffectParams'
begin object name="TacticalIncPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=3072.0000000,Max=3072.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=60
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DT_MP40_Incendiary'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MP40Head_Incendiary'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MP40_Incendiary'
	PenetrationEnergy=16.0000000
	PenetrateForce=135
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.MP40.MP40-HotFire',Volume=1.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.0300000
	Inaccuracy=(X=28,Y=28)
end object
// Reference: FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalIncPrimaryFireParams'
begin object name="TacticalIncPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2350000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalIncPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalCorrosivePrimaryEffectParams'
begin object name="TacticalCorrosivePrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=3072.0000000,Max=3072.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=35
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DT_MP40_Corrosive'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MP40Head_Corrosive'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MP40_Corrosive'
	MuzzleFlashClass=Class'BallisticProV55.A500FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.MP40.MP40-AcidFire',Volume=1.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=70.0000000
	Chaos=0.0300000
	Inaccuracy=(X=72,Y=72)
end object
// Reference: FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalCorrosivePrimaryFireParams'
begin object name="TacticalCorrosivePrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalCorrosivePrimaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
begin object name="TacticalSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalIncRecoilParams'
begin object name="TacticalIncRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.1600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1400000
	EscapeMultiplier=1.5000000
	ViewBindFactor=0.3500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.0000000
	CrouchMultiplier=0.8500000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalCorrosiveRecoilParams'
begin object name="TacticalCorrosiveRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.1600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1400000
	EscapeMultiplier=1.5000000
	ViewBindFactor=0.3500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.0000000
	CrouchMultiplier=0.8500000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Amplifier"
	InventorySize=4
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2500000
	WeaponName="FMP-2012 .40 Machine Pistol"
	DisplaceDurationMult=0.7500000
	MagAmmo=28
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalIncRecoilParams'
	RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalCorrosiveRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalIncPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalCorrosivePrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalParams_Supp'
begin object name="TacticalParams_Supp" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Suppressed"
	LayoutTags="no_amp"
	InventorySize=4
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2500000
	WeaponName="FMP-2012 .40 Machine Pistol"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorAK',BoneName="tip",Scale=0.0750000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.1000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	DisplaceDurationMult=0.7500000
	MagAmmo=28
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalPrimaryFireParams_Supp'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalParams_Holo'
begin object name="TacticalParams_Holo" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Holosight"
	LayoutTags="no_amp"
	InventorySize=4
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2500000
	SightOffset=(X=-3.5000000,Y=-0.0500000,Z=4.4500000)
	SightPivot=(Pitch=0,Yaw=10,Roll=0)
	WeaponName="FMP-2012 .40 Machine Pistol"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_RifleRail',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-25.0000000,Y=1.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=32768,Roll=16384))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexCircle',BoneName="tip",Scale=0.0350000,AugmentOffset=(X=-25.0000000,Y=-1.7500000,Z=-0.1500000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	DisplaceDurationMult=0.7500000
	MagAmmo=28
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FMPWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsTactical.MP40_Black'
begin object name="MP40_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Schwarz"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsTactical.MP40_Rust'
begin object name="MP40_Rust" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Rost"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainRust",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsTactical.MP40_Jungle'
begin object name="MP40_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Dschungel"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainJungle",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsTactical.MP40_Chrome'
begin object name="MP40_Chrome" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Chrom"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainChromeShine",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsTactical.MP40_Quantum'
begin object name="MP40_Quantum" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Quantum"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainQuantumShine",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FMPWeaponParamsTactical.MP40_Gold'
begin object name="MP40_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FMPCamos.MP40-MainGoldShine",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.MP40.MP40-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=1)
	Index=5
end object
