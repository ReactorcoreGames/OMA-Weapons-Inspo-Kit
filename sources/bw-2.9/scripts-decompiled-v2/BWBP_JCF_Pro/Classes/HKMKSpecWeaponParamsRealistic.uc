class HKMKSpecWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=1.1000000
		PlayerJumpFactor=1.1000000
		InventorySize=4
		WeaponPrice=1000
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=-5.0000000,Y=-4.3000000,Z=11.6000000)
		SightPivot=(Pitch=-70,Yaw=0,Roll=0)
		WeaponName="LPS-8 Directed Energy Pistol"
		MagAmmo=10
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1500000.0000000,Max=1500000.0000000)
	WaterTraceRange=5000.0000000
	Damage=40
	HeadMult=2.7142850
	LimbMult=0.6285710
	DamageType=Class'BWBP_JCF_Pro.DTHKMKSpecPistol'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTHKMKSpecPistolHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTHKMKSpecPistol'
	PenetrationEnergy=64.0000000
	PenetrateForce=400
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.LS14FlashEmitter'
	FlashScaleFactor=0.2000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LS440.LS440-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=25.0000000
	Chaos=-1.0000000
	BotRefireRate=1.0500000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=6
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	RangeAtten=0.7500000
	Damage=6
	DamageType=Class'BWBP_JCF_Pro.DTHKMKSpecPistolAlt'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTHKMKSpecPistolHeadAlt'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTHKMKSpecPistolAlt'
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
// Reference: FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireAnim="FireAlt"
	FireEndAnim="None"
	AimedFireAnim="'"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.1000000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.2000000
	XRandFactor=0.1850000
	YRandFactor=0.1850000
	MaxRecoil=2000.0000000
	DeclineTime=0.9000000
	DeclineDelay=0.1800000
	ViewBindFactor=0.5000000
	ADSViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=24,Max=1224)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.0750000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.7000000
	ChaosSpeedThreshold=700
end object
// Reference: WeaponParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=1.1000000
	PlayerJumpFactor=1.1000000
	InventorySize=4
	WeaponPrice=1000
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=-5.0000000,Y=-4.3000000,Z=11.6000000)
	SightPivot=(Pitch=-70,Yaw=0,Roll=0)
	WeaponName="LPS-8 Directed Energy Pistol"
	MagAmmo=10
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
