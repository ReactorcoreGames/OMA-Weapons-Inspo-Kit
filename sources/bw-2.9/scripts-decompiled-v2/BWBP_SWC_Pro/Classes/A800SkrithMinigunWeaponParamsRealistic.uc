class A800SkrithMinigunWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Replacable Cells"
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=9
		ReloadAnimRate=1.3000000
		SightMoveSpeedFactor=0.5000000
		SightingTime=1.0000000
		SightOffset=(X=-30.0000000,Y=-25.0000000,Z=6.5000000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1900)
		ZoomType=2
		ViewOffset=(X=20.0000000,Y=20.0000000,Z=-15.0000000)
		ViewPivot=(Pitch=0,Yaw=0,Roll=-256)
		MagAmmo=80
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticParams_BigBattery'
	begin object name="RealisticParams_BigBattery" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Integrated Cells"
		LayoutTags="no_reload"
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=9
		ReloadAnimRate=1.3000000
		SightMoveSpeedFactor=0.5000000
		SightingTime=1.0000000
		SightOffset=(X=-30.0000000,Y=-25.0000000,Z=6.5000000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1900)
		ZoomType=2
		ViewOffset=(X=20.0000000,Y=20.0000000,Z=-15.0000000)
		ViewPivot=(Pitch=0,Yaw=0,Roll=-256)
		MagAmmo=200
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_BigBattery
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0750000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	AmmoPerFire=20
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=-0.2000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.5000000,OutVal=0.3500000),(InVal=0.6000000,OutVal=0.4500000),(InVal=0.7000000,OutVal=0.5000000),(InVal=0.8500000,OutVal=0.6500000),(InVal=1.0000000,OutVal=0.7000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=-0.2000000),(InVal=0.3000000,OutVal=0.0500000),(InVal=0.4750000,OutVal=0.2500000),(InVal=0.5750000,OutVal=0.5000000),(InVal=0.6750000,OutVal=0.4000000),(InVal=0.8250000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.3500000)))
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=2096.0000000
	DeclineTime=1.7000000
	DeclineDelay=0.4000000
	ViewBindFactor=0.1500000
	CrouchMultiplier=0.9000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=2048)
	AimAdjustTime=1.0000000
	OffsetAdjustTime=0.6500000
	SprintOffset=(Pitch=-7000,Yaw=-3500,Roll=0)
	JumpOffset=(Pitch=-7000,Yaw=0,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	AimDamageThreshold=75
	ChaosDeclineTime=5.0000000
end object
// Reference: ProjectileEffectParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SWC_Pro.A73NewProjectile'
	SpawnOffset=(X=1.0000000,Y=5.0000000,Z=-5.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=60.0000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=SoundGroup'BWBP_SWC_Sounds.SkrithMinigun.A800-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=120.0000000
	Chaos=0.1000000
	WarnTargetPct=0.2000000
end object
// Reference: ProjectileEffectParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SWC_Pro.A800StickyBombProjectile'
	SpawnOffset=(X=400.0000000,Y=7.0000000,Z=-9.0000000)
	Speed=1000.0000000
	MaxSpeed=2000.0000000
	AccelSpeed=8000.0000000
	Damage=150.0000000
	DamageRadius=384.0000000
	MomentumTransfer=50000.0000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BWBP_SWC_Sounds.SkrithMinigun.A800-AltFire2',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=650.0000000
	Chaos=0.5000000
	WarnTargetPct=0.2000000
end object
// Reference: WeaponParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Replacable Cells"
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=9
	ReloadAnimRate=1.3000000
	SightMoveSpeedFactor=0.5000000
	SightingTime=1.0000000
	SightOffset=(X=-30.0000000,Y=-25.0000000,Z=6.5000000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1900)
	ZoomType=2
	ViewOffset=(X=20.0000000,Y=20.0000000,Z=-15.0000000)
	ViewPivot=(Pitch=0,Yaw=0,Roll=-256)
	MagAmmo=80
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticParams_BigBattery'
begin object name="RealisticParams_BigBattery" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Integrated Cells"
	LayoutTags="no_reload"
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=9
	ReloadAnimRate=1.3000000
	SightMoveSpeedFactor=0.5000000
	SightingTime=1.0000000
	SightOffset=(X=-30.0000000,Y=-25.0000000,Z=6.5000000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1900)
	ZoomType=2
	ViewOffset=(X=20.0000000,Y=20.0000000,Z=-15.0000000)
	ViewPivot=(Pitch=0,Yaw=0,Roll=-256)
	MagAmmo=200
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
