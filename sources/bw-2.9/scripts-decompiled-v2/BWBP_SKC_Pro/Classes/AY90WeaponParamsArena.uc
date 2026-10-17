class AY90WeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=7
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaPrimaryUnChargedFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaPrimaryChargedFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaPrimaryMaxFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaSecondaryFireParams_NoCharge'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaSecondaryFireParams'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=5
	BurstFireRateFactor=1.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaPrimaryUnChargedEffectParams'
begin object name="ArenaPrimaryUnChargedEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90BoltProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=20.0000000
	DamageRadius=30.0000000
	MomentumTransfer=500.0000000
	HeadMult=1.5000000
	LimbMult=0.9000000
	MaxDamageGainFactor=0.7500000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltShot',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=128.0000000
	Chaos=0.3000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaPrimaryUnChargedFireParams'
begin object name="ArenaPrimaryUnChargedFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=5
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaPrimaryUnChargedEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaPrimaryChargedEffectParams'
begin object name="ArenaPrimaryChargedEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90BoltProjectileFast'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=200.0000000
	DamageRadius=180.0000000
	MomentumTransfer=1000.0000000
	HeadMult=1.5000000
	LimbMult=0.9000000
	MaxDamageGainFactor=1.7500000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltShot',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=0.5000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaPrimaryChargedFireParams'
begin object name="ArenaPrimaryChargedFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=15
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaPrimaryChargedEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaPrimaryMaxEffectParams'
begin object name="ArenaPrimaryMaxEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90BoltProjectileSuper'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=205.0000000
	DamageRadius=768.0000000
	MomentumTransfer=2000.0000000
	HeadMult=1.5000000
	LimbMult=0.9000000
	MaxDamageGainFactor=1.7500000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.SkrithBow.SkrithBow-BoltShot',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=512.0000000
	Chaos=0.5000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaPrimaryMaxFireParams'
begin object name="ArenaPrimaryMaxFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=30
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaPrimaryMaxEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90WaveProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=70000.0000000
	Damage=50.0000000
	DamageRadius=15.0000000
	MomentumTransfer=150.0000000
	HeadMult=1.5000000
	LimbMult=0.9000000
	MaxDamageGainFactor=1.0000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.7000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-WaveFire',Volume=1.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=130.0000000
	Chaos=0.0200000
	Inaccuracy=(X=200,Y=10)
	WarnTargetPct=0.5000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaSecondaryEffectParams_NoCharge'
begin object name="ArenaSecondaryEffectParams_NoCharge" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AY90WaveProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=70000.0000000
	Damage=25.0000000
	DamageRadius=15.0000000
	MomentumTransfer=150.0000000
	HeadMult=1.5000000
	LimbMult=0.9000000
	MaxDamageGainFactor=1.0000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.7000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SkrithBow.SkrithBow-WaveFire',Volume=1.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=130.0000000
	Chaos=0.0200000
	Inaccuracy=(X=200,Y=10)
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaSecondaryFireParams_NoCharge'
begin object name="ArenaSecondaryFireParams_NoCharge" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=5
	BurstFireRateFactor=1.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaSecondaryEffectParams_NoCharge'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
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
// Reference: AimParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=1740)
	CrouchMultiplier=0.6000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-4000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.1000000
	SprintChaos=0.4000000
	AimDamageThreshold=75
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=600
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=7
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaPrimaryUnChargedFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaPrimaryChargedFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaPrimaryMaxFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaSecondaryFireParams_NoCharge'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaSecondaryFireParams'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.AY90WeaponParamsArena.ArenaSecondaryFireParams'
end object
