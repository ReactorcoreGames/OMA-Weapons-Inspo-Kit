class DefibWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.DefibWeaponParamsComp.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		InventorySize=2
		MagAmmo=100
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.DefibWeaponParamsComp.UniversalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.DefibWeaponParamsComp.UniversalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.DefibWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.DefibWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=UniversalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_OP_Pro.DefibWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=0
	PreFireAnim="UppercutPrep"
	FireAnim="Uppercut"
	FireAnimRate=1.5000000
	FireEffectParams[0]=MeleeEffectParams'BWBP_OP_Pro.DefibWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_OP_Pro.DefibWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Fatigue=0.0150000
	TraceRange=(Min=130.0000000,Max=130.0000000)
	Damage=40
	DamageType=Class'BWBP_OP_Pro.DTShockGauntlet'
	DamageTypeHead=Class'BWBP_OP_Pro.DTShockGauntlet'
	DamageTypeArm=Class'BWBP_OP_Pro.DTShockGauntlet'
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.MRS38.RSS-ElectroSwing',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_OP_Pro.DefibWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	AmmoPerFire=0
	FireAnim="PunchL1"
	FireAnimRate=1.2500000
	FireEffectParams[0]=MeleeEffectParams'BWBP_OP_Pro.DefibWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_OP_Pro.DefibWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Fatigue=0.0300000
	TraceRange=(Min=130.0000000,Max=130.0000000)
	Damage=65
	DamageType=Class'BWBP_OP_Pro.DTShockGauntletAlt'
	DamageTypeHead=Class'BWBP_OP_Pro.DTShockGauntletAlt'
	DamageTypeArm=Class'BWBP_OP_Pro.DTShockGauntletAlt'
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.MRS38.RSS-ElectroSwing',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: RecoilParams'BWBP_OP_Pro.DefibWeaponParamsComp.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BWBP_OP_Pro.DefibWeaponParamsComp.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_OP_Pro.DefibWeaponParamsComp.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	InventorySize=2
	MagAmmo=100
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.DefibWeaponParamsComp.UniversalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.DefibWeaponParamsComp.UniversalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.DefibWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.DefibWeaponParamsComp.ArenaSecondaryFireParams'
end object
