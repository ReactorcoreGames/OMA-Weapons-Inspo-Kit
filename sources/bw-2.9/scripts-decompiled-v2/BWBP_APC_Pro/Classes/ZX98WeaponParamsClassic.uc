class ZX98WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		PlayerJumpFactor=0.9500000
		InventorySize=7
		SightingTime=0.4500000
		SightOffset=(X=-10.0000000,Y=-0.4300000,Z=12.3750000)
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		ZoomType=1
		MagAmmo=20
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	RangeAtten=0.8000000
	Damage=40
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BWBP_APC_Pro.DTZX98Rifle'
	DamageTypeHead=Class'BWBP_APC_Pro.DTZX98RifleHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTZX98Rifle'
	PenetrationEnergy=48.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_APC_Pro.ZX98FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_APC_Sounds.ZX98.ZX98-Fire',Volume=1.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=192.0000000
	Chaos=0.0320000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.5500000
	PreFireAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=20000.0000000)
	RangeAtten=0.3500000
	Damage=100
	HeadMult=1.3500000
	LimbMult=0.6500000
	DamageType=Class'BWBP_APC_Pro.DTZX98Gauss'
	DamageTypeHead=Class'BWBP_APC_Pro.DTZX98GaussHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTZX98Gauss'
	PenetrationEnergy=64.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_APC_Pro.ZX98SFlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-QFire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=0.0320000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	PreFireAnim="None"
	FireAnim="ChargedFire"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.4000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.6500000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.3000000
	YRandFactor=0.2000000
	MaxRecoil=2048.0000000
	ViewBindFactor=0.6000000
	CrouchMultiplier=0.5000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.5000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-5000,Roll=0)
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=7000
end object
// Reference: WeaponParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	PlayerJumpFactor=0.9500000
	InventorySize=7
	SightingTime=0.4500000
	SightOffset=(X=-10.0000000,Y=-0.4300000,Z=12.3750000)
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	ZoomType=1
	MagAmmo=20
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.ZX98WeaponParamsClassic.ClassicSecondaryFireParams'
end object
