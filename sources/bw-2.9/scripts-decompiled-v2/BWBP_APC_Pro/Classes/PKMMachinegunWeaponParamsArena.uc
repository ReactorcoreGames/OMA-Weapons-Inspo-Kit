class PKMMachinegunWeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		CockAnimRate=1.2500000
		SightingTime=0.5500000
		SightOffset=(X=5.0000000,Y=-1.1050000,Z=14.1000000)
		SightPivot=(Pitch=-64,Yaw=0,Roll=0)
		ViewOffset=(X=3.0000000,Y=6.0000000,Z=-12.0000000)
		MagAmmo=75
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	RangeAtten=0.3500000
	Damage=26
	DamageType=Class'BWBP_APC_Pro.DTPKM'
	DamageTypeHead=Class'BWBP_APC_Pro.DTPKMHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTPKM'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_APC_Pro.PKMFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.rpk940.RPK-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=192.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1100000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.PKMKnife'
	SpawnOffset=(X=12.0000000,Y=10.0000000,Z=-15.0000000)
	Speed=8500.0000000
	MaxSpeed=8500.0000000
	Damage=90.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-KnifeFire',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	PreFireTime=0.4500000
	PreFireAnim="KnifeFirePrep"
	FireAnim="KnifeFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.0600000),(InVal=0.3000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.1500000),(InVal=0.5000000,OutVal=0.1700000),(InVal=0.6500000,OutVal=0.1000000),(InVal=0.7500000,OutVal=0.0500000),(InVal=1.0000000,OutVal=0.0800000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1500000),(InVal=0.3000000,OutVal=0.4000000),(InVal=0.6000000,OutVal=0.6500000),(InVal=0.8000000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1200000
	YRandFactor=0.1200000
	MaxRecoil=12288.0000000
	DeclineTime=0.9000000
	DeclineDelay=0.1500000
	ViewBindFactor=0.2500000
end object
// Reference: AimParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=768)
	SprintOffset=(Pitch=-4000,Yaw=-8000,Roll=0)
	ChaosDeclineTime=1.6000000
end object
// Reference: WeaponParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	CockAnimRate=1.2500000
	SightingTime=0.5500000
	SightOffset=(X=5.0000000,Y=-1.1050000,Z=14.1000000)
	SightPivot=(Pitch=-64,Yaw=0,Roll=0)
	ViewOffset=(X=3.0000000,Y=6.0000000,Z=-12.0000000)
	MagAmmo=75
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsArena.ArenaSecondaryFireParams'
end object
