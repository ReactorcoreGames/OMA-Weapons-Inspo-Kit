class MRT6WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MRT6WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=3
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2500000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		DisplaceDurationMult=0.3300000
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BallisticProV55.MRT6WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MRT6WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.MRT6WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.MRT6WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ShotgunEffectParams'BallisticProV55.MRT6WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=14
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2048.0000000,Max=2048.0000000)
	DecayRange=(Min=500.0000000,Max=2000.0000000)
	RangeAtten=0.2000000
	Damage=12
	DamageType=Class'BallisticProV55.DTMRT6Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTMRT6ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTMRT6Shotgun'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	PushbackForce=1200.0000000
	Chaos=0.4500000
	Inaccuracy=(X=600,Y=378)
	BotRefireRate=0.7000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BallisticProV55.MRT6WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=2
	bCockAfterFire=true
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.MRT6WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BallisticProV55.MRT6WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=7
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	DecayRange=(Min=500.0000000,Max=2000.0000000)
	RangeAtten=0.2000000
	Damage=12
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
	Inaccuracy=(X=378,Y=378)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.MRT6WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	bCockAfterFire=true
	FireAnim="FireRight"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.MRT6WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.MRT6WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.2000000
	ClimbTime=0.0800000
	DeclineTime=0.7500000
	DeclineDelay=0.2500000
	ViewBindFactor=0.5000000
	HipMultiplier=1.2500000
end object
// Reference: AimParams'BallisticProV55.MRT6WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	JumpChaos=1.0000000
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BallisticProV55.MRT6WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=3
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2500000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	DisplaceDurationMult=0.3300000
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BallisticProV55.MRT6WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MRT6WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.MRT6WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.MRT6WeaponParamsComp.ArenaSecondaryFireParams'
end object
