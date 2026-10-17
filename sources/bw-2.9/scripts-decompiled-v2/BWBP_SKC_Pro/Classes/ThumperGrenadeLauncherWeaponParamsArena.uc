class ThumperGrenadeLauncherWeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		SightingTime=0.3000000
		SightPivot=(Pitch=-550,Yaw=0,Roll=0)
		ViewPivot=(Pitch=600,Yaw=0,Roll=0)
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	PreFireAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.ThumperGrenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3500.0000000
	Damage=65.0000000
	DamageRadius=384.0000000
	MomentumTransfer=100000.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-Fire',Volume=3.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=0.7000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	PreFireAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.ThumperSmokeGrenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3500.0000000
	Damage=20.0000000
	DamageRadius=128.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-Fire',Volume=1.7500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=56.0000000
	Chaos=0.7000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3000000,OutVal=0.2700000),(InVal=0.6000000,OutVal=0.3500000),(InVal=0.7000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.4500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.2000000,OutVal=0.3000000),(InVal=0.3000000,OutVal=0.1700000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.7000000,OutVal=0.1000000),(InVal=1.0000000,OutVal=0.5000000)))
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	DeclineTime=1.5000000
	ViewBindFactor=0.6500000
	CrouchMultiplier=0.7500000
end object
// Reference: AimParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=128)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.1500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	AimDamageThreshold=75
	ChaosDeclineTime=0.3200000
	ChaosSpeedThreshold=1000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	SightingTime=0.3000000
	SightPivot=(Pitch=-550,Yaw=0,Roll=0)
	ViewPivot=(Pitch=600,Yaw=0,Roll=0)
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaSecondaryFireParams'
end object
