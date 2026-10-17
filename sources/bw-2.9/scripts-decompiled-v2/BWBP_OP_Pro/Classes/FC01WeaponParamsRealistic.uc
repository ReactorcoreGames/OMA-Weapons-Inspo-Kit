class FC01WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticParams_Smart'
	begin object name="RealisticParams_Smart" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="6mm Smart"
		LayoutTags="TargetScope"
		PlayerSpeedFactor=1.1000000
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=0.0000000,Y=-0.9500000,Z=24.4500000)
		ViewOffset=(X=10.0000000,Y=10.0000000,Z=-18.0000000)
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticPrimaryFireParams_Smart'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams_Smart
	// Reference: WeaponParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="5.7mm AP"
		PlayerSpeedFactor=1.1000000
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=0.0000000,Y=-0.9500000,Z=24.4500000)
		ViewOffset=(X=10.0000000,Y=10.0000000,Z=-18.0000000)
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=MeleeEffectParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2500000,OutVal=0.3000000),(InVal=0.4000000,OutVal=-0.1000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.2000000),(InVal=0.6000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.3000000)))
	YawFactor=0.3000000
	XRandFactor=0.2400000
	YRandFactor=0.2400000
	MaxRecoil=3200.0000000
	DeclineTime=0.5500000
	DeclineDelay=0.1400000
	ViewBindFactor=0.1000000
	ADSViewBindFactor=0.1000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=600,Max=1280)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3536,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.7500000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.9000000
	ChaosSpeedThreshold=575
	ChaosTurnThreshold=185000
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticPrimaryEffectParams_Smart'
begin object name="RealisticPrimaryEffectParams_Smart" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.FC01SmartProj'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=10000.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=1000.0000000
	Damage=20.0000000
	DamageRadius=8.0000000
	MomentumTransfer=20000.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=1.3500000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FC01.FC01-SmartShot',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.2000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticPrimaryFireParams_Smart'
begin object name="RealisticPrimaryFireParams_Smart" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	TargetState="SeekerFlechette"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticPrimaryEffectParams_Smart'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=750.0000000,Max=5000.0000000)
	WaterTraceRange=750.0000000
	Damage=25
	HeadMult=2.1200000
	LimbMult=0.6000000
	DamageType=Class'BWBP_OP_Pro.DT_FC01Body'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FC01Head'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FC01Body'
	PenetrationEnergy=7.0000000
	PenetrateForce=14
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.FC01.P90Fire2',Volume=0.9500000,Radius=512.0000000,Slot=0,Pitch=1.2000000,bAtten=false,bNoOverride=true)
	Recoil=480.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=28,Y=28)
end object
// Reference: FireParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=128.0000000,Max=128.0000000)
	WaterTraceRange=5000.0000000
	DamageType=Class'BWBP_OP_Pro.DT_FC01Photon'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FC01PhotonHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FC01Photon'
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
end object
// Reference: WeaponParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticParams_Smart'
begin object name="RealisticParams_Smart" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="6mm Smart"
	LayoutTags="TargetScope"
	PlayerSpeedFactor=1.1000000
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=0.0000000,Y=-0.9500000,Z=24.4500000)
	ViewOffset=(X=10.0000000,Y=10.0000000,Z=-18.0000000)
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticPrimaryFireParams_Smart'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="5.7mm AP"
	PlayerSpeedFactor=1.1000000
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=0.0000000,Y=-0.9500000,Z=24.4500000)
	ViewOffset=(X=10.0000000,Y=10.0000000,Z=-18.0000000)
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
