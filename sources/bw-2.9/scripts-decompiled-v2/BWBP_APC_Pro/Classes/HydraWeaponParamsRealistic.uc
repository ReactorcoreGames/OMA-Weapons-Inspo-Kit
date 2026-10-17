class HydraWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=10
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.6500000
		SightOffset=(X=-30.0000000,Y=-0.7500000,Z=16.0000000)
		SightPivot=(Pitch=512,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=100,Scale=0.0000000)
		WeaponName="M11-X Hydra 90mm Multiple Missile Launcher"
		DisplaceDurationMult=1.2500000
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticPrimarySFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticSecondarySFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.HydraRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=8000.0000000
	MaxSpeed=45000.0000000
	AccelSpeed=10000.0000000
	Damage=240.0000000
	DamageRadius=340.0000000
	MomentumTransfer=75000.0000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.HydraFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.Launcher.Launcher-Fire',Volume=1.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticPrimarySEffectParams'
begin object name="RealisticPrimarySEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.HydraSeekerRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=8000.0000000
	MaxSpeed=45000.0000000
	AccelSpeed=10000.0000000
	Damage=240.0000000
	DamageRadius=340.0000000
	MomentumTransfer=75000.0000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.HydraFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.Launcher.Launcher-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticPrimarySFireParams'
begin object name="RealisticPrimarySFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticPrimarySEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.HydraSwoopRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=8000.0000000
	MaxSpeed=45000.0000000
	AccelSpeed=10000.0000000
	Damage=240.0000000
	DamageRadius=340.0000000
	MomentumTransfer=75000.0000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.HydraFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.Launcher.Launcher-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticSecondarySEffectParams'
begin object name="RealisticSecondarySEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.HydraSeekerRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=8000.0000000
	MaxSpeed=45000.0000000
	AccelSpeed=10000.0000000
	Damage=240.0000000
	DamageRadius=340.0000000
	MomentumTransfer=75000.0000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.HydraFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.Launcher.Launcher-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticSecondarySFireParams'
begin object name="RealisticSecondarySFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticSecondarySEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.2000000
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=8192.0000000
	ViewBindFactor=0.5000000
	ADSViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=1536,Max=3072)
	AimAdjustTime=0.6000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-7000,Yaw=-3500,Roll=0)
	JumpOffset=(Pitch=-7000,Yaw=0,Roll=0)
	ViewBindFactor=0.4000000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=4.0000000
end object
// Reference: WeaponParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=10
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.6500000
	SightOffset=(X=-30.0000000,Y=-0.7500000,Z=16.0000000)
	SightPivot=(Pitch=512,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=100,Scale=0.0000000)
	WeaponName="M11-X Hydra 90mm Multiple Missile Launcher"
	DisplaceDurationMult=1.2500000
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticPrimarySFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_APC_Pro.HydraWeaponParamsRealistic.RealisticSecondarySFireParams'
end object
