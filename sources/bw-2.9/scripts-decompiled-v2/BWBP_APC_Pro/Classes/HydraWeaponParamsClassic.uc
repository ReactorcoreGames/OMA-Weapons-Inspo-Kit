class HydraWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=14
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.6500000
		SightOffset=(X=-30.0000000,Y=-0.7500000,Z=16.0000000)
		SightPivot=(Pitch=512,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=100,Scale=0.0000000)
		DisplaceDurationMult=1.2500000
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicPrimarySFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicSecondarySFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.HydraRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=2000.0000000
	MaxSpeed=25000.0000000
	AccelSpeed=5000.0000000
	Damage=140.0000000
	DamageRadius=400.0000000
	MomentumTransfer=90000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_APC_Pro.HydraFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.Launcher.Launcher-Fire',Volume=1.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicPrimarySEffectParams'
begin object name="ClassicPrimarySEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.HydraSeekerRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=2000.0000000
	MaxSpeed=25000.0000000
	AccelSpeed=5000.0000000
	Damage=140.0000000
	DamageRadius=400.0000000
	MomentumTransfer=90000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_APC_Pro.HydraFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.Launcher.Launcher-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicPrimarySFireParams'
begin object name="ClassicPrimarySFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicPrimarySEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.HydraSwoopRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=2000.0000000
	MaxSpeed=25000.0000000
	AccelSpeed=5000.0000000
	Damage=140.0000000
	DamageRadius=400.0000000
	MomentumTransfer=90000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_APC_Pro.HydraFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.Launcher.Launcher-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicSecondarySEffectParams'
begin object name="ClassicSecondarySEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.HydraSeekerRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=2000.0000000
	MaxSpeed=25000.0000000
	AccelSpeed=5000.0000000
	Damage=140.0000000
	DamageRadius=400.0000000
	MomentumTransfer=90000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_APC_Pro.HydraFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.Launcher.Launcher-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicSecondarySFireParams'
begin object name="ClassicSecondarySFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicSecondarySEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.2000000
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=8192.0000000
	DeclineTime=3.0000000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2560)
	AimAdjustTime=1.0000000
	OffsetAdjustTime=0.6500000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.4000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	ViewBindFactor=0.4000000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=5.0000000
	ChaosSpeedThreshold=320
end object
// Reference: WeaponParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=14
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.6500000
	SightOffset=(X=-30.0000000,Y=-0.7500000,Z=16.0000000)
	SightPivot=(Pitch=512,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=100,Scale=0.0000000)
	DisplaceDurationMult=1.2500000
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicPrimarySFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_APC_Pro.HydraWeaponParamsClassic.ClassicSecondarySFireParams'
end object
