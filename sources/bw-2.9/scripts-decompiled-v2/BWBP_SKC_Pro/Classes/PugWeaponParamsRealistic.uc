class PugWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.8500000
		PlayerJumpFactor=0.8500000
		InventorySize=7
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.4500000
		SightPivot=(Pitch=512,Yaw=0,Roll=0)
		DisplaceDurationMult=1.2500000
		MagAmmo=10
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=7
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2560.0000000,Max=2560.0000000)
	RangeAtten=0.2500000
	Damage=11
	DamageType=Class'BWBP_SKC_Pro.DTPugCannon'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTPugCannonHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTPugCannon'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.PUG.PUG-Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=450.0000000
	Chaos=0.3000000
	Inaccuracy=(X=175,Y=175)
	BotRefireRate=0.8000000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PUGRocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=7000.0000000
	MaxSpeed=7000.0000000
	Damage=110.0000000
	DamageRadius=512.0000000
	MomentumTransfer=60000.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.PUG.PUG-FireSlug',Volume=2.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=1.0000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.5000000
	AmmoPerFire=0
	PreFireTime=0.6000000
	PreFireAnim="GrenadePrep"
	FireAnim="GrenadeFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.3500000
	YRandFactor=0.3500000
	MaxRecoil=6144.0000000
	DeclineTime=1.5000000
	DeclineDelay=0.4000000
	ViewBindFactor=0.2500000
end object
// Reference: AimParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=1024)
	ADSMultiplier=0.3000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=550
end object
// Reference: WeaponParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.8500000
	PlayerJumpFactor=0.8500000
	InventorySize=7
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.4500000
	SightPivot=(Pitch=512,Yaw=0,Roll=0)
	DisplaceDurationMult=1.2500000
	MagAmmo=10
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.PugWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
