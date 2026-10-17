class AS50WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.8250000
		InventorySize=9
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.6500000
		ZoomType=2
		WeaponName="FSSG-50 12.7mm Anti-Materiel Rifle"
		MagAmmo=10
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticAimParams'
		AimParams[1]=AimParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticControlledAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticPriControlledFireParams'
		FireParams[1]=none
		FireParams[2]=FireParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticPrimaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=155
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_AS50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AS50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AS50Limb'
	PenetrationEnergy=48.0000000
	PenetrateForce=300
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter_C'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AS50.AS50-Fire',Volume=5.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=2600.0000000
	PushbackForce=100.0000000
	Chaos=0.0500000
	Inaccuracy=(X=12,Y=12)
end object
// Reference: FireParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1600000
	BurstFireRateFactor=1.0000000
	FireAnimRate=1.5500000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticPriControlledEffectParams'
begin object name="RealisticPriControlledEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=155
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_AS50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AS50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AS50Limb'
	PenetrationEnergy=48.0000000
	PenetrateForce=300
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.FG50FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AS50.AS50-Fire',Volume=5.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=2000.0000000
	Chaos=0.0700000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticPriControlledFireParams'
begin object name="RealisticPriControlledFireParams" class=BCoreProV55.FireParams
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticPriControlledEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.6000000,OutVal=0.4000000),(InVal=0.8000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.5000000)))
	YawFactor=0.2000000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=4000.0000000
	DeclineTime=1.7500000
	DeclineDelay=0.5000000
	ViewBindFactor=0.3000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=800,Max=3408)
	AimAdjustTime=0.7000000
	OffsetAdjustTime=0.4000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3072,Yaw=-4096,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.4500000
	FallingChaos=0.4500000
	SprintChaos=0.4500000
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=375
end object
// Reference: AimParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticControlledAimParams'
begin object name="RealisticControlledAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=800,Max=2808)
	AimAdjustTime=1.0000000
	OffsetAdjustTime=0.4000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.4000000
	SprintOffset=(Pitch=-3072,Yaw=-4096,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.4500000
	FallingChaos=0.4500000
	SprintChaos=0.4500000
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=350
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.8250000
	InventorySize=9
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.6500000
	ZoomType=2
	WeaponName="FSSG-50 12.7mm Anti-Materiel Rifle"
	MagAmmo=10
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticAimParams'
	AimParams[1]=AimParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticControlledAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticPriControlledFireParams'
	FireParams[1]=none
	FireParams[2]=FireParams'BWBP_SKC_Pro.AS50WeaponParamsRealistic.RealisticPrimaryFireParams'
end object
