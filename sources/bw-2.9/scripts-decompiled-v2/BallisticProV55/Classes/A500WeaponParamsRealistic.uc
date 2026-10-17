class A500WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.A500WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2100000
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		ViewPivot=(Pitch=600,Yaw=0,Roll=0)
		WeaponName="A500 'Reptile' Chemical Gun"
		MagAmmo=10
		RecoilParams[0]=RecoilParams'BallisticProV55.A500WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A500WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.A500WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.A500WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BallisticProV55.A500WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A500Projectile'
	Speed=6000.0000000
	MaxSpeed=6000.0000000
	Damage=17.0000000
	DamageRadius=64.0000000
	MomentumTransfer=100.0000000
	HeadMult=2.2352940
	LimbMult=0.5882350
	MuzzleFlashClass=Class'BallisticProV55.A500FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Reptile.Rep_Fire1',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=512.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=900,Y=500)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.A500WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A500WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A500WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A500AltProjectile'
	Speed=2400.0000000
	MaxSpeed=2400.0000000
	Damage=120.0000000
	DamageRadius=96.0000000
	MomentumTransfer=1000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BallisticProV55.A500FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Reptile.Rep_AltFire',Volume=1.8000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Chaos=-1.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.A500WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=2
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A500WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.A500WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.2000000),(InVal=0.6000000,OutVal=0.1000000),(InVal=1.0000000,OutVal=0.4000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.2000000),(InVal=0.7000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.3000000)))
	PitchFactor=0.5000000
	YawFactor=0.2000000
	XRandFactor=0.2750000
	YRandFactor=0.2750000
	MaxRecoil=1536.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.A500WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=768,Max=1792)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-4096,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.4000000
	ChaosSpeedThreshold=550
end object
// Reference: WeaponParams'BallisticProV55.A500WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2100000
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	ViewPivot=(Pitch=600,Yaw=0,Roll=0)
	WeaponName="A500 'Reptile' Chemical Gun"
	MagAmmo=10
	RecoilParams[0]=RecoilParams'BallisticProV55.A500WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A500WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.A500WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.A500WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
