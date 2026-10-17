class LightningWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=7
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4500000
		ZoomType=2
		ScopeScale=0.7000000
		MinZoom=4.0000000
		MaxZoom=8.0000000
		ZoomStages=1
		DisplaceDurationMult=1.2500000
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=80
	HeadMult=1.7500000
	DamageType=Class'BWBP_OP_Pro.DT_LightningRifle'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_LightningHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_LightningRifle'
	PDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.LightningFlashEmitter'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.Lightning.LightningGunShot',Volume=1.6000000,Radius=1024.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=128.0000000
	PushbackForce=256.0000000
	Chaos=0.8000000
	BotRefireRate=0.4000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	FireAnim="FireCharged"
	FireAnimRate=0.8000000
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.LightningProjectile'
	Speed=2000.0000000
	MaxSpeed=2000.0000000
	Damage=70.0000000
	DamageRadius=100.0000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.LightningFlashEmitter'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.LS14-EnergyRocket',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=400.0000000
	PushbackForce=256.0000000
	Chaos=0.8000000
	BotRefireRate=0.4000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	YawFactor=0.1000000
	XRandFactor=0.2000000
	YRandFactor=0.3000000
	ClimbTime=0.0700000
	DeclineTime=0.7500000
	DeclineDelay=0.4000000
	ViewBindFactor=0.5000000
	HipMultiplier=1.5000000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.7500000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=740,Max=2508)
	AimAdjustTime=0.9000000
	OffsetAdjustTime=0.3250000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.4500000
	FallingChaos=0.4500000
	SprintChaos=0.4500000
	ChaosDeclineTime=1.3000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=7
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4500000
	ZoomType=2
	ScopeScale=0.7000000
	MinZoom=4.0000000
	MaxZoom=8.0000000
	ZoomStages=1
	DisplaceDurationMult=1.2500000
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.LightningWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
