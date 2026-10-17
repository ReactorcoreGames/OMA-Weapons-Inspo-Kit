class AY90WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		ViewOffset=(X=1.0000000,Y=7.0000000,Z=-6.0000000)
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicPrimaryFireParamsNoCharge'
		FireParams[1]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicPrimaryFireParamsHalfCharge'
		FireParams[2]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicPrimaryFireParamsMaxCharge'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicSecondaryFireParamsNoCharge'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicSecondaryFireParamsHalfCharge'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicSecondaryFireParamsMaxCharge'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90BoltProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2000.0000000
	MaxSpeed=35000.0000000
	AccelSpeed=35000.0000000
	Damage=150.0000000
	DamageRadius=230.0000000
	MomentumTransfer=30000.0000000
	LimbMult=0.5000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltShot',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=9,Y=6)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicPrimaryFireParamsNoCharge'
begin object name="ClassicPrimaryFireParamsNoCharge" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=10
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicPrimaryChargedEffectParams'
begin object name="ClassicPrimaryChargedEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90BoltProjectileFast'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=5000.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=90000.0000000
	Damage=250.0000000
	DamageRadius=250.0000000
	MomentumTransfer=30000.0000000
	LimbMult=0.5000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltBlast',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=9,Y=6)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicPrimaryFireParamsHalfCharge'
begin object name="ClassicPrimaryFireParamsHalfCharge" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=20
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicPrimaryChargedEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicPrimaryMaxEffectParams'
begin object name="ClassicPrimaryMaxEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90BoltProjectileSuper'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=8500.0000000
	MaxSpeed=1000000.0000000
	AccelSpeed=100.0000000
	Damage=500.0000000
	DamageRadius=832.0000000
	MomentumTransfer=30000.0000000
	LimbMult=0.5000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltBlastMax',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=9,Y=6)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicPrimaryFireParamsMaxCharge'
begin object name="ClassicPrimaryFireParamsMaxCharge" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=40
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicPrimaryMaxEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicSecondaryEffectParamsMaxCharge'
begin object name="ClassicSecondaryEffectParamsMaxCharge" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90WaveProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=85.0000000
	MaxSpeed=4500.0000000
	AccelSpeed=70000.0000000
	Damage=60.0000000
	DamageRadius=96.0000000
	MomentumTransfer=150.0000000
	HeadMult=2.5000000
	LimbMult=0.5000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-WaveFire',Volume=1.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	Inaccuracy=(X=200,Y=10)
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicSecondaryFireParamsMaxCharge'
begin object name="ClassicSecondaryFireParamsMaxCharge" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=10
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicSecondaryEffectParamsMaxCharge'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicSecondaryEffectParamsHalfCharge'
begin object name="ClassicSecondaryEffectParamsHalfCharge" class=BCoreProV55.ProjectileEffectParams
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
	Inaccuracy=(X=150,Y=10)
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicSecondaryFireParamsHalfCharge'
begin object name="ClassicSecondaryFireParamsHalfCharge" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=10
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicSecondaryEffectParamsHalfCharge'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicSecondaryEffectParamsNoCharge'
begin object name="ClassicSecondaryEffectParamsNoCharge" class=BCoreProV55.ProjectileEffectParams
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
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicSecondaryFireParamsNoCharge'
begin object name="ClassicSecondaryFireParamsNoCharge" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=10
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicSecondaryEffectParamsNoCharge'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.1500000,OutVal=0.1000000),(InVal=0.2500000,OutVal=0.2000000),(InVal=0.6000000,OutVal=-0.2000000),(InVal=0.7000000,OutVal=-0.2500000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0900000),(InVal=0.1500000,OutVal=0.1500000),(InVal=0.2500000,OutVal=0.1200000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.7000000,OutVal=0.0500000),(InVal=500000.0000000,OutVal=0.5000000)))
	PitchFactor=0.8000000
	YawFactor=0.8000000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=1024.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.4500000
	CrouchMultiplier=0.6000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=1740)
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
	ChaosSpeedThreshold=600
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	ViewOffset=(X=1.0000000,Y=7.0000000,Z=-6.0000000)
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicPrimaryFireParamsNoCharge'
	FireParams[1]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicPrimaryFireParamsHalfCharge'
	FireParams[2]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicPrimaryFireParamsMaxCharge'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicSecondaryFireParamsNoCharge'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicSecondaryFireParamsHalfCharge'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsClassic.ClassicSecondaryFireParamsMaxCharge'
end object
