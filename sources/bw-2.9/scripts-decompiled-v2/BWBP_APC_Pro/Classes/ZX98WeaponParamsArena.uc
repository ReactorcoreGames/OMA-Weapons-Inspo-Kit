class ZX98WeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		PlayerJumpFactor=0.9500000
		InventorySize=5
		CockAnimRate=1.4000000
		SightingTime=0.4500000
		SightOffset=(X=-10.0000000,Y=-0.4300000,Z=12.3750000)
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		ZoomType=1
		ViewOffset=(X=7.0000000,Y=5.0000000,Z=-10.5000000)
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=12000.0000000)
	RangeAtten=0.3500000
	Damage=22
	HeadMult=2.5000000
	DamageType=Class'BWBP_APC_Pro.DTZX98Rifle'
	DamageTypeHead=Class'BWBP_APC_Pro.DTZX98RifleHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTZX98Rifle'
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_APC_Pro.ZX98FlashEmitter'
	FlashScaleFactor=1.2500000
	FireSound=(Sound=Sound'BWBP_APC_Sounds.ZX98.ZX98-Fire',Volume=1.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=180.0000000
	Chaos=0.0320000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.5500000
	PreFireAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=20000.0000000)
	RangeAtten=0.3500000
	Damage=80
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
// Reference: FireParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=4
	PreFireAnim="None"
	FireAnim="ChargedFire"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0900000),(InVal=0.2000000,OutVal=0.1200000),(InVal=0.2500000,OutVal=0.1300000),(InVal=0.3000000,OutVal=0.1100000),(InVal=0.3500000,OutVal=0.0800000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.5000000,OutVal=-0.0200000),(InVal=0.6000000,OutVal=-0.0400000),(InVal=0.7000000,OutVal=0.0400000),(InVal=0.8000000,OutVal=0.0700000),(InVal=1.0000000,OutVal=0.1300000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2200000),(InVal=0.3000000,OutVal=0.2600000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.5000000,OutVal=0.5500000),(InVal=0.6000000,OutVal=0.6200000),(InVal=0.7500000,OutVal=0.7700000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1500000
	YRandFactor=0.1500000
	DeclineTime=0.1600000
	DeclineDelay=0.4000000
	ViewBindFactor=0.3000000
end object
// Reference: AimParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=768)
	AimAdjustTime=0.4000000
	SprintOffset=(Pitch=-3000,Yaw=-5000,Roll=0)
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=7000
end object
// Reference: WeaponParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	PlayerJumpFactor=0.9500000
	InventorySize=5
	CockAnimRate=1.4000000
	SightingTime=0.4500000
	SightOffset=(X=-10.0000000,Y=-0.4300000,Z=12.3750000)
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	ZoomType=1
	ViewOffset=(X=7.0000000,Y=5.0000000,Z=-10.5000000)
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.ZX98WeaponParamsArena.ArenaSecondaryFireParams'
end object
