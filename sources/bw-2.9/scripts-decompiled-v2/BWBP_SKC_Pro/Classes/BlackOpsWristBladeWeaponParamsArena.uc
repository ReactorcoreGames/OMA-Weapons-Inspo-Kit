class BlackOpsWristBladeWeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=1.1500000
		InventorySize=1
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeleeEffectParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Fatigue=0.0600000
	TraceRange=(Min=100.0000000,Max=100.0000000)
	Damage=60
	DamageType=Class'BWBP_SKC_Pro.DTBOBTorso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTBOBHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTBOBLimb'
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.UZI.Melee',Volume=2.1000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireAnim="Slash1"
	FireAnimRate=0.9000000
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Fatigue=0.2500000
	Damage=75
	DamageType=Class'BWBP_SKC_Pro.DTBOBTorsoLunge'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTBOBHeadLunge'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTBOBTorsoLunge'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.UZI.Melee',Volume=2.5000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=0
	PreFireAnim="PrepHack"
	FireAnim="Hack"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	DeclineTime=1.5000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=1.1500000
	InventorySize=1
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsArena.ArenaSecondaryFireParams'
end object
