class LightningWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=7
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4000000
		ZoomType=2
		ScopeScale=0.7000000
		DisplaceDurationMult=1.2500000
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=85
	HeadMult=1.5000000
	LimbMult=0.9000000
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
// Reference: FireParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.3500000
	FireAnim="FireCharged"
	FireAnimRate=0.8000000
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.LightningProjectile'
	Speed=750.0000000
	MaxSpeed=1500.0000000
	AccelSpeed=1500.0000000
	Damage=80.0000000
	DamageRadius=384.0000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.LightningFlashEmitter'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.LS14-EnergyRocket',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=400.0000000
	PushbackForce=256.0000000
	Chaos=0.8000000
	BotRefireRate=0.4000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	YawFactor=0.1000000
	XRandFactor=0.2000000
	YRandFactor=0.3000000
	ClimbTime=0.0700000
	DeclineTime=0.7500000
	DeclineDelay=0.4000000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.6000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=3072)
	AimAdjustTime=0.7000000
	CrouchMultiplier=0.3000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ViewBindFactor=0.2500000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=7
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4000000
	ZoomType=2
	ScopeScale=0.7000000
	DisplaceDurationMult=1.2500000
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.LightningWeaponParamsClassic.ClassicSecondaryFireParams'
end object
