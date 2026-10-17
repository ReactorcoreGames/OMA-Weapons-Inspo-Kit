class ZX98WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		PlayerJumpFactor=0.9500000
		InventorySize=7
		CockAnimRate=1.4000000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4500000
		SightOffset=(X=-10.0000000,Y=-0.5000000,Z=12.5000000)
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		ZoomType=1
		ViewOffset=(X=5.0000000,Y=4.0000000,Z=-9.0000000)
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BWBP_APC_Pro.DTZX98Rifle'
	DamageTypeHead=Class'BWBP_APC_Pro.DTZX98RifleHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTZX98Rifle'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_APC_Pro.ZX98FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_APC_Sounds.ZX98.ZX98-Fire',Volume=1.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=180.0000000
	Chaos=0.0320000
	Inaccuracy=(X=32,Y=32)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.5500000
	PreFireAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=20000.0000000)
	RangeAtten=0.3500000
	Damage=80
	HeadMult=3.2500000
	DamageType=Class'BWBP_APC_Pro.DTZX98Gauss'
	DamageTypeHead=Class'BWBP_APC_Pro.DTZX98GaussHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTZX98Gauss'
	PenetrateForce=512
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_APC_Pro.ZX98SFlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-QFire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=180.0000000
	Chaos=0.0320000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=4
	PreFireAnim="None"
	FireAnim="ChargedFire"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0900000),(InVal=0.2000000,OutVal=0.1200000),(InVal=0.2500000,OutVal=0.1300000),(InVal=0.3000000,OutVal=0.1100000),(InVal=0.3500000,OutVal=0.0800000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.5000000,OutVal=-0.0200000),(InVal=0.6000000,OutVal=-0.0400000),(InVal=0.7000000,OutVal=0.0400000),(InVal=0.8000000,OutVal=0.0700000),(InVal=1.0000000,OutVal=0.1300000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2200000),(InVal=0.3000000,OutVal=0.2600000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.5000000,OutVal=0.5500000),(InVal=0.6000000,OutVal=0.6200000),(InVal=0.7500000,OutVal=0.7700000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1500000
	YRandFactor=0.1500000
	ClimbTime=0.0200000
	DeclineTime=0.1600000
	DeclineDelay=0.4000000
	ViewBindFactor=0.3000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
end object
// Reference: AimParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=386,Max=1224)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	PlayerJumpFactor=0.9500000
	InventorySize=7
	CockAnimRate=1.4000000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4500000
	SightOffset=(X=-10.0000000,Y=-0.5000000,Z=12.5000000)
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	ZoomType=1
	ViewOffset=(X=5.0000000,Y=4.0000000,Z=-9.0000000)
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.ZX98WeaponParamsTactical.TacticalSecondaryFireParams'
end object
