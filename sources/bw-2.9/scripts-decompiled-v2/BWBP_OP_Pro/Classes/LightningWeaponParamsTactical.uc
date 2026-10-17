class LightningWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
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
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
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
	Recoil=1024.0000000
	PushbackForce=256.0000000
	Chaos=0.8000000
	BotRefireRate=0.4000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	FireAnim="FireCharged"
	FireAnimRate=0.8000000
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
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
// Reference: FireParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
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
end object
// Reference: AimParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2560)
	AimAdjustTime=0.8000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
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
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.LightningWeaponParamsTactical.TacticalSecondaryFireParams'
end object
