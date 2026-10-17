class A500WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.A500WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		ReloadAnimRate=1.2500000
		SightingTime=0.2500000
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BallisticProV55.A500WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A500WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.A500WeaponParamsComp.ArenaMultiFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.A500WeaponParamsComp.ArenaChargeFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BallisticProV55.A500WeaponParamsComp.ArenaMultiEffectParams'
begin object name="ArenaMultiEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A500Projectile'
	SpawnOffset=(X=20.0000000,Y=6.0000000,Z=-8.0000000)
	Speed=5500.0000000
	MaxSpeed=6500.0000000
	AccelSpeed=3000.0000000
	Damage=34.0000000
	MomentumTransfer=1000.0000000
	MaxDamageGainFactor=0.2000000
	DamageGainEndTime=0.3000000
	MuzzleFlashClass=Class'BallisticProV55.A500FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Reptile.Rep_Fire1',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=450.0000000
	Chaos=0.4000000
	Inaccuracy=(X=220,Y=220)
	BotRefireRate=0.7000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.A500WeaponParamsComp.ArenaMultiFireParams'
begin object name="ArenaMultiFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	FireEndAnim="None"
	FireAnimRate=1.3000000
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A500WeaponParamsComp.ArenaMultiEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A500WeaponParamsComp.ArenaChargeEffectParams'
begin object name="ArenaChargeEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A500AltProjectile'
	SpawnOffset=(X=20.0000000,Y=6.0000000,Z=-8.0000000)
	Speed=6000.0000000
	MaxSpeed=6000.0000000
	Damage=32.0000000
	DamageRadius=768.0000000
	RadiusFallOffType=2
	MuzzleFlashClass=Class'BallisticProV55.A500FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Reptile.Rep_AltFire',Volume=1.8000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Chaos=0.5000000
	SplashDamage=true
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BallisticProV55.A500WeaponParamsComp.ArenaChargeFireParams'
begin object name="ArenaChargeFireParams" class=BCoreProV55.FireParams
	FireInterval=1.5000000
	AmmoPerFire=0
	MaxHoldTime=6.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A500WeaponParamsComp.ArenaChargeEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.A500WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3000000,OutVal=0.2700000),(InVal=0.6000000,OutVal=0.3500000),(InVal=0.7000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.4500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.2000000,OutVal=0.3000000),(InVal=0.3000000,OutVal=0.1700000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.7000000,OutVal=0.1000000),(InVal=1.0000000,OutVal=0.5000000)))
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	DeclineTime=1.0000000
	ViewBindFactor=0.6500000
	HipMultiplier=1.2500000
end object
// Reference: AimParams'BallisticProV55.A500WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=256)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	AimDamageThreshold=75
	ChaosDeclineTime=0.3200000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.A500WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	ReloadAnimRate=1.2500000
	SightingTime=0.2500000
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BallisticProV55.A500WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A500WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.A500WeaponParamsComp.ArenaMultiFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.A500WeaponParamsComp.ArenaChargeFireParams'
end object
