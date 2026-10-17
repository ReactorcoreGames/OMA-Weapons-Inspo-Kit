class ThumperGrenadeLauncherWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		SightingTime=0.3000000
		SightPivot=(Pitch=-550,Yaw=0,Roll=0)
		ViewOffset=(X=5.0000000,Y=9.0000000,Z=-2.0000000)
		ViewPivot=(Pitch=600,Yaw=0,Roll=0)
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4500000
	PreFireAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.ThumperGrenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3500.0000000
	Damage=65.0000000
	DamageRadius=384.0000000
	MomentumTransfer=100000.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-Fire',Volume=3.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=56.0000000
	Chaos=0.7000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.5500000
	PreFireAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.ThumperSmokeGrenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3500.0000000
	Damage=20.0000000
	DamageRadius=128.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-Fire',Volume=1.7500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=56.0000000
	Chaos=0.7000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3000000,OutVal=0.2700000),(InVal=0.6000000,OutVal=0.3500000),(InVal=0.7000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.4500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.2000000,OutVal=0.3000000),(InVal=0.3000000,OutVal=0.1700000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.7000000,OutVal=0.1000000),(InVal=1.0000000,OutVal=0.5000000)))
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	DeclineTime=1.5000000
	ViewBindFactor=0.6500000
	CrouchMultiplier=0.7500000
end object
// Reference: AimParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=128)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.1500000
	SprintOffset=(Pitch=-3000,Yaw=-4000,Roll=0)
	AimDamageThreshold=75
	ChaosDeclineTime=0.3200000
	ChaosSpeedThreshold=1000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	SightingTime=0.3000000
	SightPivot=(Pitch=-550,Yaw=0,Roll=0)
	ViewOffset=(X=5.0000000,Y=9.0000000,Z=-2.0000000)
	ViewPivot=(Pitch=600,Yaw=0,Roll=0)
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicSecondaryFireParams'
end object
