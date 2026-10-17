class HB4WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		PlayerJumpFactor=0.9500000
		InventorySize=2
		ReloadAnimRate=1.2500000
		SightingTime=0.4000000
		SightOffset=(X=10.0000000,Y=-5.5150000,Z=10.4200000)
		ViewOffset=(X=5.0000000,Y=12.0000000,Z=-10.0000000)
		MagAmmo=3
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.HB4PulseProjectile'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2500.0000000
	Damage=55.0000000
	DamageRadius=256.0000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.HB4FlashEmitter'
	FlashScaleFactor=0.6500000
	FireSound=(Sound=Sound'BWBP_APC_Sounds.EP110.EP110-Fire',Volume=9.2000000,Radius=512.0000000,Slot=0,Pitch=1.5000000,bAtten=false,bNoOverride=true)
	Inaccuracy=(X=64,Y=64)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	MuzzleFlashClass=Class'BallisticProV55.AM67FlashEmitter'
	FlashScaleFactor=1.3000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-SecFire',Volume=0.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=1.0000000
end object
// Reference: FireParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=10.0000000
	AmmoPerFire=0
	MaxHoldTime=0.5000000
	FireEndAnim="None"
	AimedFireAnim="ToggleFlashLight"
	FireEffectParams[0]=FireEffectParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.4000000
	YRandFactor=0.4000000
	MaxRecoil=6144.0000000
	DeclineDelay=0.5000000
end object
// Reference: AimParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=192,Max=768)
	ChaosDeclineTime=1.0000000
end object
// Reference: WeaponParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	PlayerJumpFactor=0.9500000
	InventorySize=2
	ReloadAnimRate=1.2500000
	SightingTime=0.4000000
	SightOffset=(X=10.0000000,Y=-5.5150000,Z=10.4200000)
	ViewOffset=(X=5.0000000,Y=12.0000000,Z=-10.0000000)
	MagAmmo=3
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.HB4WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
