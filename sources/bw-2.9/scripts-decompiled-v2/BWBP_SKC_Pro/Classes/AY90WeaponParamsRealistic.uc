class AY90WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticPrimaryFireParamsNoCharge'
		FireParams[1]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticPrimaryFireParamsHalfCharge'
		FireParams[2]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticPrimaryFireParamsMaxCharge'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticSecondaryFireParamsNoCharge'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticSecondaryFireParams'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=10
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90BoltProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=6000.0000000
	MaxSpeed=35000.0000000
	AccelSpeed=90000.0000000
	Damage=150.0000000
	DamageRadius=230.0000000
	MomentumTransfer=30000.0000000
	LimbMult=0.5000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltShot',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=9,Y=6)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticPrimaryFireParamsNoCharge'
begin object name="RealisticPrimaryFireParamsNoCharge" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=10
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticPrimaryChargedEffectParams'
begin object name="RealisticPrimaryChargedEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90BoltProjectileFast'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=10000.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=90000.0000000
	Damage=250.0000000
	DamageRadius=250.0000000
	MomentumTransfer=30000.0000000
	LimbMult=0.5000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltBlast',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=9,Y=6)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticPrimaryFireParamsHalfCharge'
begin object name="RealisticPrimaryFireParamsHalfCharge" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=20
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticPrimaryChargedEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticPrimaryMaxEffectParams'
begin object name="RealisticPrimaryMaxEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90BoltProjectileSuper'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=10000.0000000
	MaxSpeed=1000000.0000000
	AccelSpeed=90000.0000000
	Damage=400.0000000
	DamageRadius=832.0000000
	MomentumTransfer=30000.0000000
	LimbMult=0.5000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltBlastMax',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=9,Y=6)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticPrimaryFireParamsMaxCharge'
begin object name="RealisticPrimaryFireParamsMaxCharge" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=40
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticPrimaryMaxEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90WaveProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=85.0000000
	MaxSpeed=4500.0000000
	AccelSpeed=70000.0000000
	Damage=40.0000000
	DamageRadius=96.0000000
	MomentumTransfer=150.0000000
	HeadMult=2.5000000
	LimbMult=0.5000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-WaveFire',Volume=1.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	Inaccuracy=(X=100,Y=10)
	WarnTargetPct=0.5000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticSecondaryEffectParamsNoCharge'
begin object name="RealisticSecondaryEffectParamsNoCharge" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90WaveProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=85.0000000
	MaxSpeed=4500.0000000
	AccelSpeed=70000.0000000
	Damage=20.0000000
	DamageRadius=96.0000000
	MomentumTransfer=150.0000000
	HeadMult=2.5000000
	LimbMult=0.5000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-WaveFire',Volume=1.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	Inaccuracy=(X=100,Y=10)
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticSecondaryFireParamsNoCharge'
begin object name="RealisticSecondaryFireParamsNoCharge" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=10
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticSecondaryEffectParamsNoCharge'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.1500000,OutVal=0.1000000),(InVal=0.2500000,OutVal=0.2000000),(InVal=0.6000000,OutVal=-0.2000000),(InVal=0.7000000,OutVal=-0.2500000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0900000),(InVal=0.1500000,OutVal=0.1500000),(InVal=0.2500000,OutVal=0.1200000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.7000000,OutVal=0.0500000),(InVal=500000.0000000,OutVal=0.5000000)))
	PitchFactor=0.8000000
	YawFactor=0.8000000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=1024.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.1500000
	CrouchMultiplier=0.6000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1536)
	CrouchMultiplier=0.6000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-5000,Roll=0)
	JumpOffset=(Pitch=-4000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=75
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=550
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticPrimaryFireParamsNoCharge'
	FireParams[1]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticPrimaryFireParamsHalfCharge'
	FireParams[2]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticPrimaryFireParamsMaxCharge'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticSecondaryFireParamsNoCharge'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticSecondaryFireParams'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
