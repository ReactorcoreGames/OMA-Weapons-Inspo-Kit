class R9000EWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.5000000
		SightOffset=(X=0.0000000,Y=-0.5400000,Z=22.4000000)
		ZoomType=2
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalPrimarySTDFireParams'
		FireParams[1]=FireParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalPrimaryINCFireParams'
		FireParams[2]=FireParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalPrimaryRADFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalPrimarySTDEffectParams'
begin object name="TacticalPrimarySTDEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=100
	LimbMult=0.8500000
	DamageType=Class'BWBP_APC_Pro.DTR9000ERifle'
	DamageTypeHead=Class'BWBP_APC_Pro.DTR9000ERifleHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTR9000ERifle'
	PDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.R9000EFlashEmitter'
	FireSound=(Sound=Sound'BWBP_APC_Sounds.R9000E.R9000E-Fire1',Volume=2.0000000,Radius=1024.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=378.0000000
	Chaos=0.5000000
	BotRefireRate=0.4000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalPrimarySTDFireParams'
begin object name="TacticalPrimarySTDFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9500000
	bCockAfterFire=true
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalPrimarySTDEffectParams'
end object
// Reference: InstantEffectParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalPrimaryINCEffectParams'
begin object name="TacticalPrimaryINCEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=95
	LimbMult=0.8500000
	DamageType=Class'BWBP_APC_Pro.DTR9000ERifleInc'
	DamageTypeHead=Class'BWBP_APC_Pro.DTR9000ERifleIncHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTR9000ERifleInc'
	PDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.R9000EFlashEmitter'
	FireSound=(Sound=Sound'BWBP_APC_Sounds.R9000E.R9000E-Fire2',Volume=2.0000000,Radius=1024.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=378.0000000
	Chaos=0.5000000
	BotRefireRate=0.4000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalPrimaryINCFireParams'
begin object name="TacticalPrimaryINCFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9500000
	bCockAfterFire=true
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalPrimaryINCEffectParams'
end object
// Reference: InstantEffectParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalPrimaryRADEffectParams'
begin object name="TacticalPrimaryRADEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=95
	LimbMult=0.8500000
	DamageType=Class'BWBP_APC_Pro.DTR9000ERifleRad'
	DamageTypeHead=Class'BWBP_APC_Pro.DTR9000ERifleRadHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTR9000ERifleRad'
	PDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.R9000EFlashEmitterRad'
	FireSound=(Sound=Sound'BWBP_APC_Sounds.R9000E.R9000E-Fire4',Volume=2.0000000,Radius=1024.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=378.0000000
	Chaos=0.5000000
	BotRefireRate=0.4000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalPrimaryRADFireParams'
begin object name="TacticalPrimaryRADFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9500000
	bCockAfterFire=true
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalPrimaryRADEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1200000),(InVal=0.2000000,OutVal=0.1600000),(InVal=0.4000000,OutVal=0.2500000),(InVal=0.5000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=0.3700000),(InVal=0.7000000,OutVal=0.4000000),(InVal=0.8000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.5500000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0800000
	DeclineTime=1.0000000
	DeclineDelay=1.2500000
	ViewBindFactor=0.2000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=424,Max=1380)
	AimAdjustTime=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.5000000
	SightOffset=(X=0.0000000,Y=-0.5400000,Z=22.4000000)
	ZoomType=2
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalPrimarySTDFireParams'
	FireParams[1]=FireParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalPrimaryINCFireParams'
	FireParams[2]=FireParams'BWBP_APC_Pro.R9000EWeaponParamsTactical.TacticalPrimaryRADFireParams'
end object
