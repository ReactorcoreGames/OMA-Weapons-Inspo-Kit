class LightningWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4500000
		ZoomType=2
		ScopeScale=0.7000000
		DisplaceDurationMult=1.2500000
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=85
	HeadMult=1.5000000
	LimbMult=0.9000000
	DamageType=Class'BWBP_OP_Pro.DT_LightningRifle'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_LightningHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_LightningRifle'
	PDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.LightningFlashEmitter'
	FlashScaleFactor=1.2500000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.Lightning.LightningGunShot',Volume=1.6000000,Radius=1024.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	PushbackForce=256.0000000
	Chaos=0.8000000
	BotRefireRate=0.4000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	FireAnim="FireCharged"
	FireAnimRate=0.8000000
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.LightningProjectile'
	Speed=750.0000000
	MaxSpeed=1500.0000000
	AccelSpeed=1500.0000000
	Damage=80.0000000
	DamageRadius=384.0000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.LightningFlashEmitter'
	FlashScaleFactor=1.2500000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.LS14-EnergyRocket',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=400.0000000
	PushbackForce=256.0000000
	Chaos=0.8000000
	BotRefireRate=0.4000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	YawFactor=0.1000000
	XRandFactor=0.2000000
	YRandFactor=0.3000000
	ClimbTime=0.0700000
	DeclineTime=0.7500000
	DeclineDelay=0.4000000
	ViewBindFactor=0.5000000
	HipMultiplier=1.5000000
	CrouchMultiplier=0.6000000
end object
// Reference: AimParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=1024)
	AimAdjustTime=0.7500000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4500000
	ZoomType=2
	ScopeScale=0.7000000
	DisplaceDurationMult=1.2500000
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.LightningWeaponParamsComp.ArenaSecondaryFireParams'
end object
