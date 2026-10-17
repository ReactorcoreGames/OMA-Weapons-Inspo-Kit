class AY90WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=8
		SightMoveSpeedFactor=0.4500000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalPrimaryFireParamsNoCharge'
		FireParams[1]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalPrimaryFireParamsHalfCharge'
		FireParams[2]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalPrimaryFireParamsMaxCharge'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalSecondaryFireParamsNoCharge'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalSecondaryFireParams'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=10
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90BoltProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=6000.0000000
	MaxSpeed=35000.0000000
	AccelSpeed=90000.0000000
	Damage=150.0000000
	DamageRadius=230.0000000
	MomentumTransfer=30000.0000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltShot',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=512.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=9,Y=6)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalPrimaryFireParamsNoCharge'
begin object name="TacticalPrimaryFireParamsNoCharge" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=10
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalPrimaryChargedEffectParams'
begin object name="TacticalPrimaryChargedEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90BoltProjectileFast'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=10000.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=90000.0000000
	Damage=250.0000000
	DamageRadius=250.0000000
	MomentumTransfer=30000.0000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltBlast',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=768.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=9,Y=6)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalPrimaryFireParamsHalfCharge'
begin object name="TacticalPrimaryFireParamsHalfCharge" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=20
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalPrimaryChargedEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalPrimaryMaxEffectParams'
begin object name="TacticalPrimaryMaxEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90BoltProjectileSuper'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=10000.0000000
	MaxSpeed=1000000.0000000
	AccelSpeed=90000.0000000
	Damage=400.0000000
	DamageRadius=832.0000000
	MomentumTransfer=30000.0000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltBlastMax',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=2048.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=9,Y=6)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalPrimaryFireParamsMaxCharge'
begin object name="TacticalPrimaryFireParamsMaxCharge" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=40
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalPrimaryMaxEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90WaveProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=85.0000000
	MaxSpeed=4500.0000000
	AccelSpeed=70000.0000000
	Damage=40.0000000
	DamageRadius=96.0000000
	MomentumTransfer=150.0000000
	HeadMult=2.5000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-WaveFire',Volume=1.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	Inaccuracy=(X=200,Y=10)
	WarnTargetPct=0.5000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalSecondaryEffectParamsNoCharge'
begin object name="TacticalSecondaryEffectParamsNoCharge" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90WaveProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=85.0000000
	MaxSpeed=4500.0000000
	AccelSpeed=70000.0000000
	Damage=20.0000000
	DamageRadius=96.0000000
	MomentumTransfer=150.0000000
	HeadMult=2.5000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-WaveFire',Volume=1.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	Inaccuracy=(X=150,Y=10)
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalSecondaryFireParamsNoCharge'
begin object name="TacticalSecondaryFireParamsNoCharge" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=10
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalSecondaryEffectParamsNoCharge'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.1500000,OutVal=0.1000000),(InVal=0.2500000,OutVal=0.2000000),(InVal=0.6000000,OutVal=-0.2000000),(InVal=0.7000000,OutVal=-0.2500000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0900000),(InVal=0.1500000,OutVal=0.1500000),(InVal=0.2500000,OutVal=0.1200000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.7000000,OutVal=0.0500000),(InVal=500000.0000000,OutVal=0.5000000)))
	PitchFactor=0.8000000
	YawFactor=0.8000000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=8192.0000000
	ClimbTime=0.1500000
	DeclineTime=1.5000000
	ViewBindFactor=0.1500000
	HipMultiplier=2.0000000
	CrouchMultiplier=0.6000000
end object
// Reference: AimParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2560)
	AimAdjustTime=0.8000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.2000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=8
	SightMoveSpeedFactor=0.4500000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalPrimaryFireParamsNoCharge'
	FireParams[1]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalPrimaryFireParamsHalfCharge'
	FireParams[2]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalPrimaryFireParamsMaxCharge'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalSecondaryFireParamsNoCharge'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalSecondaryFireParams'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsTactical.TacticalSecondaryFireParams'
end object
