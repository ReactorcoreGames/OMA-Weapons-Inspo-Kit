class MRT6WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=3
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2000000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		DisplaceDurationMult=0.3300000
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ShotgunEffectParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=20
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2048.0000000,Max=2048.0000000)
	DecayRange=(Min=525.0000000,Max=1838.0000000)
	RangeAtten=0.2000000
	Damage=10
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BallisticProV55.DTMRT6Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTMRT6ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTMRT6Shotgun'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	PushbackForce=1200.0000000
	Chaos=0.4500000
	Inaccuracy=(X=768,Y=512)
	BotRefireRate=0.7000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=2
	bCockAfterFire=true
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	DecayRange=(Min=525.0000000,Max=1838.0000000)
	RangeAtten=0.2000000
	Damage=10
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BallisticProV55.DTMRT6Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTMRT6ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTMRT6Shotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6SingleFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	PushbackForce=600.0000000
	Chaos=0.2000000
	Inaccuracy=(X=512,Y=512)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	bCockAfterFire=true
	FireAnim="FireRight"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	ClimbTime=0.0800000
	DeclineTime=0.7500000
	DeclineDelay=0.2500000
	EscapeMultiplier=1.1000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.5000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.0000000
end object
// Reference: AimParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=512)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	JumpChaos=1.0000000
	ChaosDeclineTime=0.3200000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=3
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2000000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	DisplaceDurationMult=0.3300000
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.MRT6WeaponParamsTactical.TacticalSecondaryFireParams'
end object
