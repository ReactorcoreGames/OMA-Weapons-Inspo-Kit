class GASCPistolWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		InventorySize=3
		SightingTime=0.1500000
		SightOffset=(X=-5.0000000,Y=-6.3230000,Z=9.7100000)
		ViewOffset=(X=4.0000000,Y=10.0000000,Z=-7.0000000)
		WeaponName="GP-X22 10mm Incendiary Pistol"
		MagAmmo=16
		bMagPlusOne=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst of Four",bUnavailable=false,ModeID="WM_BigBurst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Semi-Auto",bUnavailable=true,ModeID="WM_BigBurst",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticPrimaryFireParamsBurst'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=900.0000000,Max=4000.0000000)
	WaterTraceRange=4000.0000000
	Damage=35
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BWBP_APC_Pro.DTGASCPistol'
	DamageTypeHead=Class'BWBP_APC_Pro.DTGASCPistolHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTGASCPistol'
	PenetrationEnergy=11.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_APC_Pro.GASCFlashEmitter'
	FlashScaleFactor=0.1000000
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.GASC.Gaucho-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=700.0000000
	Chaos=0.0600000
	Inaccuracy=(X=16,Y=16)
	BotRefireRate=0.9000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	FireEndAnim="None"
	FireAnimRate=1.4500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticPrimaryBurstEffectParams'
begin object name="RealisticPrimaryBurstEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=900.0000000,Max=4000.0000000)
	WaterTraceRange=4000.0000000
	Damage=35
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BWBP_APC_Pro.DTGASCPistol'
	DamageTypeHead=Class'BWBP_APC_Pro.DTGASCPistolHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTGASCPistol'
	PenetrationEnergy=11.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_APC_Pro.GASCFlashEmitter'
	FlashScaleFactor=0.1000000
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.GASC.Gaucho-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=725.0000000
	Chaos=0.1200000
	Inaccuracy=(X=16,Y=16)
	BotRefireRate=0.9000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticPrimaryFireParamsBurst'
begin object name="RealisticPrimaryFireParamsBurst" class=BCoreProV55.FireParams
	FireInterval=0.0950000
	FireEndAnim="None"
	FireAnimRate=1.4500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticPrimaryBurstEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.7000000)))
	PitchFactor=0.1000000
	YawFactor=0.1000000
	XRandFactor=1.0000000
	YRandFactor=1.0000000
	MaxRecoil=2048.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.0000000
	ViewBindFactor=0.1000000
	ADSViewBindFactor=0.1000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=768,Max=1280)
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-4000,Roll=0)
	ViewBindFactor=0.0500000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.6500000
	ChaosSpeedThreshold=600
end object
// Reference: WeaponParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	InventorySize=3
	SightingTime=0.1500000
	SightOffset=(X=-5.0000000,Y=-6.3230000,Z=9.7100000)
	ViewOffset=(X=4.0000000,Y=10.0000000,Z=-7.0000000)
	WeaponName="GP-X22 10mm Incendiary Pistol"
	MagAmmo=16
	bMagPlusOne=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst of Four",bUnavailable=false,ModeID="WM_BigBurst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Semi-Auto",bUnavailable=true,ModeID="WM_BigBurst",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_APC_Pro.GASCPistolWeaponParamsRealistic.RealisticPrimaryFireParamsBurst'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
