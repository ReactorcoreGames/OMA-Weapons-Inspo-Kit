class M575MachinegunWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.8500000
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		WeaponName="M575 7.62mm Medium Machinegun"
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticRecoilParams_RDS'
		RecoilParams[1]=RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticRecoilParams_Scope'
		AimParams[0]=AimParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[3]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[4]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=2000.0000000,Max=10000.0000000)
	WaterTraceRange=5000.0000000
	Damage=55
	HeadMult=2.2000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_OP_Pro.DTM575MG'
	DamageTypeHead=Class'BWBP_OP_Pro.DTM575MGHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTM575MG'
	PenetrationEnergy=24.0000000
	PenetrateForce=125
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.Fifty9FlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.M575.M575-FireHeavy',Volume=2.3000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=580.0000000
	Chaos=0.0800000
	Inaccuracy=(X=18,Y=18)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.2000000
	Damage=49
	LimbMult=1.0000000
	DamageType=Class'BallisticProV55.DTXK2Freeze'
	DamageTypeHead=Class'BallisticProV55.DTXK2Freeze'
	DamageTypeArm=Class'BallisticProV55.DTXK2Freeze'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SX45CryoFlash'
	FlashScaleFactor=0.2500000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.M575.M575-FireFrost',Volume=1.9000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=470.0000000
	Chaos=0.0500000
	Inaccuracy=(X=16,Y=16)
end object
// Reference: FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	BurstFireRateFactor=1.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticRecoilParams_RDS'
begin object name="RealisticRecoilParams_RDS" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=-0.1000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.2000000),(InVal=0.8000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4500000)))
	PitchFactor=0.4000000
	YawFactor=0.4000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=3260.0000000
	DeclineTime=1.0000000
	DeclineDelay=0.1350000
	ViewBindFactor=0.3500000
	ADSViewBindFactor=0.3500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticRecoilParams_Scope'
begin object name="RealisticRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=-0.1000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.2000000),(InVal=0.8000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4500000)))
	PitchFactor=0.4000000
	YawFactor=0.4000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=3260.0000000
	DeclineTime=1.0000000
	DeclineDelay=0.1350000
	ViewBindFactor=0.3500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=3072)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.1000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.5000000
	ChaosSpeedThreshold=400
end object
// Reference: WeaponParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.8500000
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	WeaponName="M575 7.62mm Medium Machinegun"
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticRecoilParams_RDS'
	RecoilParams[1]=RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticRecoilParams_Scope'
	AimParams[0]=AimParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[3]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[4]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
