class ZX98WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		PlayerJumpFactor=0.9500000
		InventorySize=7
		WeaponPrice=3200
		SightingTime=0.4500000
		SightOffset=(X=-10.0000000,Y=-0.4300000,Z=12.3750000)
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		ZoomType=1
		ViewOffset=(X=5.0000000,Y=4.0000000,Z=-9.0000000)
		WeaponName="ZX-98 7.62mm Gauss Rifle"
		MagAmmo=20
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1700.0000000,Max=8000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.1000000
	Damage=50
	HeadMult=2.1272720
	LimbMult=0.6545450
	DamageType=Class'BWBP_APC_Pro.DTZX98Rifle'
	DamageTypeHead=Class'BWBP_APC_Pro.DTZX98RifleHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTZX98Rifle'
	PenetrationEnergy=28.0000000
	PenetrateForce=125
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_APC_Sounds.ZX98.ZX98-Fire',Volume=1.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=825.0000000
	Chaos=0.1000000
	Inaccuracy=(X=3,Y=3)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.5500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=3000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	RangeAtten=0.1000000
	Damage=146
	HeadMult=2.1232870
	LimbMult=0.6301360
	DamageType=Class'BWBP_APC_Pro.DTZX98Gauss'
	DamageTypeHead=Class'BWBP_APC_Pro.DTZX98GaussHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTZX98Gauss'
	PenetrationEnergy=30.0000000
	PenetrateForce=350
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-QFire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1792.0000000
	Chaos=0.8000000
	Inaccuracy=(X=1,Y=1)
	BotRefireRate=0.2500000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	BurstFireRateFactor=1.0000000
	FireAnim="ChargedFire"
	FireEndAnim="None"
	FireAnimRate=0.7500000
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.1000000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.3500000)))
	YawFactor=0.1500000
	XRandFactor=0.2850000
	YRandFactor=0.2850000
	MaxRecoil=4000.0000000
	DeclineTime=0.9000000
	DeclineDelay=0.1400000
	ViewBindFactor=0.5000000
	ADSViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=620,Max=1336)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.0750000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=550
end object
// Reference: WeaponParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	PlayerJumpFactor=0.9500000
	InventorySize=7
	WeaponPrice=3200
	SightingTime=0.4500000
	SightOffset=(X=-10.0000000,Y=-0.4300000,Z=12.3750000)
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	ZoomType=1
	ViewOffset=(X=5.0000000,Y=4.0000000,Z=-9.0000000)
	WeaponName="ZX-98 7.62mm Gauss Rifle"
	MagAmmo=20
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.ZX98WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
