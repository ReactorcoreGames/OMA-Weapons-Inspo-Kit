class A800SkrithMinigunWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Reloadable Cells"
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=10
		ReloadAnimRate=1.3000000
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.6000000
		SightOffset=(X=-15.0000000,Y=-25.0000000,Z=6.5000000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1900)
		ZoomType=2
		ViewOffset=(X=30.0000000,Y=20.0000000,Z=-16.0000000)
		ViewPivot=(Pitch=0,Yaw=0,Roll=-256)
		DisplaceDurationMult=1.5000000
		MagAmmo=100
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalParams_BigBattery'
	begin object name="TacticalParams_BigBattery" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Integrated Cells"
		LayoutTags="no_reload"
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=10
		ReloadAnimRate=1.3000000
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.6000000
		SightOffset=(X=-15.0000000,Y=-25.0000000,Z=6.5000000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1900)
		ZoomType=2
		ViewOffset=(X=30.0000000,Y=20.0000000,Z=-16.0000000)
		ViewPivot=(Pitch=0,Yaw=0,Roll=-256)
		DisplaceDurationMult=1.5000000
		MagAmmo=250
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=TacticalParams_BigBattery
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0750000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	AmmoPerFire=15
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0700000,OutVal=0.0500000),(InVal=0.1000000,OutVal=0.0850000),(InVal=0.1800000,OutVal=0.0600000),(InVal=0.3000000,OutVal=0.1000000),(InVal=0.5000000,OutVal=0.2000000),(InVal=0.6500000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.4500000),(InVal=0.8500000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.5500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0700000),(InVal=0.1000000,OutVal=0.1200000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.5500000,OutVal=0.6500000),(InVal=0.6500000,OutVal=0.7500000),(InVal=0.8000000,OutVal=0.8200000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	MaxRecoil=10240.0000000
	ClimbTime=0.0400000
	DeclineTime=1.0000000
	DeclineDelay=0.1300000
	ViewBindFactor=0.2500000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=3.0000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=768,Max=3072)
	AimAdjustTime=0.7000000
	SprintOffset=(Pitch=-5000,Yaw=-2000,Roll=0)
	ViewBindFactor=0.2000000
	AimDamageThreshold=75
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=300
end object
// Reference: ProjectileEffectParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SWC_Pro.A73NewProjectile'
	SpawnOffset=(X=1.0000000,Y=5.0000000,Z=-5.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=45.0000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FlashScaleFactor=0.1000000
	FireSound=(Sound=SoundGroup'BWBP_SWC_Sounds.SkrithMinigun.A800-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=100.0000000
	Chaos=0.1000000
	WarnTargetPct=0.2000000
end object
// Reference: ProjectileEffectParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SWC_Pro.A800StickyBombProjectile'
	SpawnOffset=(X=400.0000000,Y=7.0000000,Z=-9.0000000)
	Speed=1000.0000000
	MaxSpeed=2000.0000000
	AccelSpeed=8000.0000000
	Damage=75.0000000
	DamageRadius=384.0000000
	MomentumTransfer=50000.0000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SWC_Sounds.SkrithMinigun.A800-AltFire2',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=650.0000000
	Chaos=0.5000000
	WarnTargetPct=0.2000000
end object
// Reference: WeaponParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Reloadable Cells"
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=10
	ReloadAnimRate=1.3000000
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.6000000
	SightOffset=(X=-15.0000000,Y=-25.0000000,Z=6.5000000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1900)
	ZoomType=2
	ViewOffset=(X=30.0000000,Y=20.0000000,Z=-16.0000000)
	ViewPivot=(Pitch=0,Yaw=0,Roll=-256)
	DisplaceDurationMult=1.5000000
	MagAmmo=100
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalParams_BigBattery'
begin object name="TacticalParams_BigBattery" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Integrated Cells"
	LayoutTags="no_reload"
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=10
	ReloadAnimRate=1.3000000
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.6000000
	SightOffset=(X=-15.0000000,Y=-25.0000000,Z=6.5000000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1900)
	ZoomType=2
	ViewOffset=(X=30.0000000,Y=20.0000000,Z=-16.0000000)
	ViewPivot=(Pitch=0,Yaw=0,Roll=-256)
	DisplaceDurationMult=1.5000000
	MagAmmo=250
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsTactical.TacticalSecondaryFireParams'
end object
