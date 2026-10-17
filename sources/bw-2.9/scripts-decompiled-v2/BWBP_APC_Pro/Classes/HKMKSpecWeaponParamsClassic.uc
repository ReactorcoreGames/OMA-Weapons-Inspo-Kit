class HKMKSpecWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=1.1000000
		InventorySize=4
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-5.0000000,Y=-4.3000000,Z=11.6000000)
		SightPivot=(Pitch=-70,Yaw=0,Roll=0)
		MagAmmo=12
		bNeedCock=true
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5000.0000000,Max=6000.0000000)
	WaterTraceRange=3600.0000000
	Damage=40
	HeadMult=1.5000000
	LimbMult=0.5500000
	DamageType=Class'BWBP_APC_Pro.DTHKMKSpecPistol'
	DamageTypeHead=Class'BWBP_APC_Pro.DTHKMKSpecPistolHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTHKMKSpecPistol'
	PenetrationEnergy=24.0000000
	PenetrateForce=135
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.LS14FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Typhon.Typhon-Fire',Volume=1.3000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=2048.0000000
	Chaos=0.0150000
	Inaccuracy=(X=4,Y=4)
	BotRefireRate=0.7500000
end object
// Reference: FireParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=12
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	RangeAtten=0.7500000
	Damage=6
	DamageType=Class'BWBP_APC_Pro.DTHKMKSpecPistolAlt'
	DamageTypeHead=Class'BWBP_APC_Pro.DTHKMKSpecPistolHeadAlt'
	DamageTypeArm=Class'BWBP_APC_Pro.DTHKMKSpecPistolAlt'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-Fire',Volume=1.1000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.5000000
	Inaccuracy=(X=400,Y=400)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireAnim="FireAlt"
	FireEndAnim="None"
	AimedFireAnim="'"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=2048.0000000
	DeclineTime=0.4000000
	DeclineDelay=0.0500000
	ViewBindFactor=0.4000000
	ADSViewBindFactor=0.4000000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=1024)
	AimAdjustTime=0.3500000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.3000000
	ChaosSpeedThreshold=1400
end object
// Reference: WeaponParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=1.1000000
	InventorySize=4
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-5.0000000,Y=-4.3000000,Z=11.6000000)
	SightPivot=(Pitch=-70,Yaw=0,Roll=0)
	MagAmmo=12
	bNeedCock=true
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.HKMKSpecWeaponParamsClassic.ClassicSecondaryFireParams'
end object
