class HydraWeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		InventorySize=8
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.6500000
		SightOffset=(X=-10.0000000,Y=-10.0000000,Z=15.0000000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=100,Scale=0.0000000)
		ViewOffset=(X=7.0000000,Y=11.0000000,Z=-7.0000000)
		DisplaceDurationMult=1.2500000
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaPrimarySFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaSecondarySFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.HydraRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=2000.0000000
	MaxSpeed=25000.0000000
	AccelSpeed=5000.0000000
	Damage=120.0000000
	DamageRadius=768.0000000
	MomentumTransfer=75000.0000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.HydraFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.Launcher.Launcher-Fire',Volume=1.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaPrimarySEffectParams'
begin object name="ArenaPrimarySEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.HydraSeekerRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=2000.0000000
	MaxSpeed=25000.0000000
	AccelSpeed=5000.0000000
	Damage=120.0000000
	DamageRadius=768.0000000
	MomentumTransfer=75000.0000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.HydraFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.Launcher.Launcher-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=384.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaPrimarySFireParams'
begin object name="ArenaPrimarySFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaPrimarySEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.HydraSwoopRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=2000.0000000
	MaxSpeed=25000.0000000
	AccelSpeed=5000.0000000
	Damage=90.0000000
	DamageRadius=448.0000000
	MomentumTransfer=75000.0000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.HydraFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.Launcher.Launcher-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaSecondarySEffectParams'
begin object name="ArenaSecondarySEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.HydraSeekerRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=2000.0000000
	MaxSpeed=25000.0000000
	AccelSpeed=5000.0000000
	Damage=90.0000000
	DamageRadius=448.0000000
	MomentumTransfer=75000.0000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.HydraFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.Launcher.Launcher-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaSecondarySFireParams'
begin object name="ArenaSecondarySFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaSecondarySEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	YawFactor=0.0000000
	DeclineTime=1.0000000
end object
// Reference: AimParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2560)
	AimAdjustTime=1.0000000
	ADSMultiplier=0.4000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	ChaosSpeedThreshold=1000
end object
// Reference: WeaponParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	InventorySize=8
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.6500000
	SightOffset=(X=-10.0000000,Y=-10.0000000,Z=15.0000000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=100,Scale=0.0000000)
	ViewOffset=(X=7.0000000,Y=11.0000000,Z=-7.0000000)
	DisplaceDurationMult=1.2500000
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaPrimarySFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_APC_Pro.HydraWeaponParamsArena.ArenaSecondarySFireParams'
end object
