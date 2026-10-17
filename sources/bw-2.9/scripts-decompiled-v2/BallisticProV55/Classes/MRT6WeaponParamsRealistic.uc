class MRT6WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=1.1000000
		InventorySize=4
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2250000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		WeaponName="MRT6 12ga Shotgun Sidearm"
		MagAmmo=6
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ShotgunEffectParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=20
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=500.0000000,Max=2500.0000000)
	WaterTraceRange=5000.0000000
	Damage=20
	HeadMult=2.1500000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTMRT6Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTMRT6ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTMRT6Shotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=10
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=4096.0000000
	Chaos=0.8000000
	Inaccuracy=(X=1600,Y=1200)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=2
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireAnimRate=0.6000000
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=500.0000000,Max=2500.0000000)
	WaterTraceRange=5000.0000000
	Damage=20
	HeadMult=2.1500000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTMRT6Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTMRT6ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTMRT6Shotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=10
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6SingleFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=0.5000000
	Inaccuracy=(X=1200,Y=1200)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireAnim="FireRight"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.3500000
	YRandFactor=0.3500000
	DeclineTime=0.8000000
	ViewBindFactor=0.3000000
	ADSViewBindFactor=0.3000000
	CrouchMultiplier=0.9000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=576,Max=1200)
	CrouchMultiplier=0.9000000
	ADSMultiplier=0.9000000
	SprintOffset=(Pitch=-4608,Yaw=-512,Roll=0)
	JumpOffset=(Pitch=2048,Yaw=-512,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=1.0000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=600
end object
// Reference: WeaponParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=1.1000000
	InventorySize=4
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2250000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	WeaponName="MRT6 12ga Shotgun Sidearm"
	MagAmmo=6
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.MRT6WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
