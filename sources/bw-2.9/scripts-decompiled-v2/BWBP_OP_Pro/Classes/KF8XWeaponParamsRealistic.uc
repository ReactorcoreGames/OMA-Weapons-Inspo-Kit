class KF8XWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.4000000
		ZoomType=2
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.KF8XToxicBolt'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=15000.0000000
	Damage=30.0000000
	HeadMult=4.0000000
	LimbMult=0.8500000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XBow.XBow-Fire',Volume=1.0000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=0.1500000
	BotRefireRate=0.5000000
	WarnTargetPct=0.1500000
end object
// Reference: FireParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.5000000
	PreFireAnim="None"
	FireAnim="FireCycleRotate"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	MaxRecoil=1024.0000000
	DeclineTime=1.5000000
	DeclineDelay=0.5000000
	ViewBindFactor=0.5000000
end object
// Reference: AimParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=480,Max=1292)
	AimAdjustTime=0.3500000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.3000000
	FallingChaos=0.3000000
	SprintChaos=0.3000000
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=575
end object
// Reference: WeaponParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.4000000
	ZoomType=2
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.KF8XWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
