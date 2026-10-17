class BlackOpsWristBladeWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=1.1500000
		InventorySize=2
		WeaponPrice=1000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeleeEffectParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=100.0000000,Max=100.0000000)
	Damage=95
	HeadMult=2.2000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DTBOBTorso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTBOBHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTBOBLimb'
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.UZI.Melee',Volume=2.1000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireAnim="Slash1"
	FireAnimRate=0.9000000
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Damage=195
	HeadMult=2.2000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DTBOBTorsoLunge'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTBOBHeadLunge'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTBOBTorsoLunge'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.UZI.Melee',Volume=2.5000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=0
	PreFireAnim="PrepHack"
	FireAnim="Hack"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	DeclineTime=1.5000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	SprintOffset=(Pitch=-3000,Yaw=-4000,Roll=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=1.1500000
	InventorySize=2
	WeaponPrice=1000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
