class NEXWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		PlayerJumpFactor=0.9500000
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		MagAmmo=100
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeleeEffectParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=128.0000000,Max=128.0000000)
	WaterTraceRange=5000.0000000
	Damage=35
	HeadMult=1.8571420
	LimbMult=0.5714280
	DamageType=Class'BWBP_SKC_Pro.DTNEXSlash'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTNEXSlashHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTNEXSlashLimb'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.NEX.NEX-SlashAttack',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Swing1"
	FireAnimRate=0.7000000
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=128.0000000,Max=128.0000000)
	WaterTraceRange=5000.0000000
	HeadMult=1.7000000
	LimbMult=0.8000000
	DamageType=Class'BWBP_SKC_Pro.DTNEXSlash'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTNEXSlashHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTNEXSlashLimb'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.8000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	PreFireAnim="PrepHack"
	FireAnim="Hack"
	FireAnimRate=0.8000000
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=2048.0000000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.5000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	PlayerJumpFactor=0.9500000
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	MagAmmo=100
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.NEXWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
