class R9000EWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		InventorySize=7
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.5500000
		SightOffset=(X=0.0000000,Y=-0.5400000,Z=22.4000000)
		ZoomType=2
		MagAmmo=6
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicPrimarySTDFireParams'
		FireParams[1]=FireParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicPrimaryINCFireParams'
		FireParams[2]=FireParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicPrimaryRADFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicPrimarySTDEffectParams'
begin object name="ClassicPrimarySTDEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=100
	HeadMult=1.5000000
	LimbMult=0.9000000
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
// Reference: FireParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicPrimarySTDFireParams'
begin object name="ClassicPrimarySTDFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9500000
	bCockAfterFire=true
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicPrimarySTDEffectParams'
end object
// Reference: InstantEffectParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicPrimaryINCEffectParams'
begin object name="ClassicPrimaryINCEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=65
	HeadMult=1.5000000
	LimbMult=0.9000000
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
// Reference: FireParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicPrimaryINCFireParams'
begin object name="ClassicPrimaryINCFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9500000
	bCockAfterFire=true
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicPrimaryINCEffectParams'
end object
// Reference: InstantEffectParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicPrimaryRADEffectParams'
begin object name="ClassicPrimaryRADEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=50
	HeadMult=1.5000000
	LimbMult=0.9000000
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
// Reference: FireParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicPrimaryRADFireParams'
begin object name="ClassicPrimaryRADFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9500000
	bCockAfterFire=true
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicPrimaryRADEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1200000),(InVal=0.2000000,OutVal=0.1600000),(InVal=0.4000000,OutVal=0.2500000),(InVal=0.5000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=0.3700000),(InVal=0.7000000,OutVal=0.4000000),(InVal=0.8000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.5500000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	DeclineTime=1.0000000
	DeclineDelay=1.2500000
	ViewBindFactor=0.2000000
	CrouchMultiplier=0.6000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=512)
	AimAdjustTime=0.7000000
	ADSMultiplier=0.2500000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
end object
// Reference: WeaponParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	InventorySize=7
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.5500000
	SightOffset=(X=0.0000000,Y=-0.5400000,Z=22.4000000)
	ZoomType=2
	MagAmmo=6
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicPrimarySTDFireParams'
	FireParams[1]=FireParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicPrimaryINCFireParams'
	FireParams[2]=FireParams'BWBP_APC_Pro.R9000EWeaponParamsClassic.ClassicPrimaryRADFireParams'
end object
