class SkrithStaffWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		InventorySize=7
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.5500000
		SightOffset=(X=-20.0000000,Y=0.3100000,Z=12.5000000)
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		ViewOffset=(X=9.0000000,Y=4.0000000,Z=-7.0000000)
		MagAmmo=80
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticRapidPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticSlowPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticRapidPrimaryEffectParams'
begin object name="RealisticRapidPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SWC_Pro.SkrithStaffProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=85.0000000
	MaxSpeed=4500.0000000
	AccelSpeed=100000.0000000
	Damage=40.0000000
	DamageRadius=96.0000000
	MomentumTransfer=150.0000000
	HeadMult=2.2000000
	LimbMult=0.5000000
	MuzzleFlashClass=Class'BWBP_SWC_Pro.SkrithStaffBoltFlashEmitter'
	FlashScaleFactor=0.2000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A73E.A73E-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=102.0000000
	Chaos=0.0050000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticRapidPrimaryFireParams'
begin object name="RealisticRapidPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1570000
	AmmoPerFire=2
	FireEndAnim="None"
	AimedFireAnim="FireSight"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticRapidPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticSlowPrimaryEffectParams'
begin object name="RealisticSlowPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SWC_Pro.SkrithStaffPower'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=90.0000000
	MaxSpeed=2000.0000000
	AccelSpeed=16000.0000000
	Damage=90.0000000
	DamageRadius=270.0000000
	MomentumTransfer=150.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_SWC_Pro.SkrithStaffBoltFlashEmitter'
	FlashScaleFactor=0.2000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A73E.A73E-Power',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=241.0000000
	Chaos=0.0200000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticSlowPrimaryFireParams'
begin object name="RealisticSlowPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	AmmoPerFire=8
	FireAnim="FireBomb"
	FireEndAnim="None"
	AimedFireAnim="FireSight"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticSlowPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=10000.0000000)
	Damage=8
	DamageType=Class'BWBP_SWC_Pro.DT_SkrithStaff'
	DamageTypeHead=Class'BWBP_SWC_Pro.DT_SkrithStaffHead'
	DamageTypeArm=Class'BWBP_SWC_Pro.DT_SkrithStaff'
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.XM20FlashEmitter'
	FlashScaleFactor=0.1000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1.0000000
	Chaos=0.0100000
	BotRefireRate=0.9900000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0850000
	FireAnim="None"
	FireLoopAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	AimedFireAnim="SecFireLoopSight"
	FireEffectParams[0]=InstantEffectParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.1500000,OutVal=0.1000000),(InVal=0.2500000,OutVal=0.2000000),(InVal=0.6000000,OutVal=-0.2000000),(InVal=0.7000000,OutVal=-0.2500000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0900000),(InVal=0.1500000,OutVal=0.1500000),(InVal=0.2500000,OutVal=0.1200000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.7000000,OutVal=0.0500000),(InVal=500000.0000000,OutVal=0.5000000)))
	PitchFactor=0.8000000
	YawFactor=0.8000000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=1024.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.4500000
	CrouchMultiplier=0.6000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2048)
	CrouchMultiplier=0.6000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.3500000
	SprintChaos=0.4000000
	AimDamageThreshold=75
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=600
end object
// Reference: WeaponParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	InventorySize=7
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.5500000
	SightOffset=(X=-20.0000000,Y=0.3100000,Z=12.5000000)
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	ViewOffset=(X=9.0000000,Y=4.0000000,Z=-7.0000000)
	MagAmmo=80
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticRapidPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticSlowPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
