class PugWeaponParams extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.PugWeaponParams.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.8500000
		PlayerJumpFactor=0.8500000
		InventorySize=8
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.4500000
		SightPivot=(Pitch=512,Yaw=0,Roll=0)
		DisplaceDurationMult=1.2500000
		MagAmmo=10
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PugWeaponParams.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.PugWeaponParams.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.PugWeaponParams.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.PugWeaponParams.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.PugWeaponParams.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
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
	FlashScaleFactor=1.5000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.PUG.PUG-Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=450.0000000
	Chaos=0.3000000
	Inaccuracy=(X=175,Y=175)
	BotRefireRate=0.8000000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PugWeaponParams.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.PugWeaponParams.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PugWeaponParams.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PUGRocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=7000.0000000
	MaxSpeed=7000.0000000
	Damage=110.0000000
	DamageRadius=512.0000000
	MomentumTransfer=60000.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FlashScaleFactor=0.9000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.PUG.PUG-FireSlug',Volume=2.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=1.0000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BWBP_SKC_Pro.PugWeaponParams.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.5000000
	AmmoPerFire=0
	PreFireTime=0.6000000
	PreFireAnim="GrenadePrep"
	FireAnim="GrenadeFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PugWeaponParams.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.PugWeaponParams.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.3500000
	YRandFactor=0.3500000
	MaxRecoil=6144.0000000
	DeclineTime=1.5000000
	DeclineDelay=0.4000000
	ViewBindFactor=0.2500000
end object
// Reference: AimParams'BWBP_SKC_Pro.PugWeaponParams.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=1024)
	ADSMultiplier=0.3000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=550
end object
// Reference: WeaponParams'BWBP_SKC_Pro.PugWeaponParams.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.8500000
	PlayerJumpFactor=0.8500000
	InventorySize=8
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.4500000
	SightPivot=(Pitch=512,Yaw=0,Roll=0)
	DisplaceDurationMult=1.2500000
	MagAmmo=10
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PugWeaponParams.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.PugWeaponParams.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.PugWeaponParams.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.PugWeaponParams.ArenaSecondaryFireParams'
end object
