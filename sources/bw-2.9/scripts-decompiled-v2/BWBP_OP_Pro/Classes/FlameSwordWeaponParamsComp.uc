class FlameSwordWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		InventorySize=2
		DisplaceDurationMult=0.3300000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.UniversalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.UniversalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=UniversalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeleeEffectParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Fatigue=0.1500000
	TraceRange=(Min=165.0000000,Max=165.0000000)
	Damage=90
	DamageType=Class'BWBP_OP_Pro.DT_FlameSwordChest'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FlameSwordHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FlameSwordChest'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.FlameSword.FlameSword-Swing',Volume=1.0000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.8000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireAnim="Slash1"
	FireEffectParams[0]=MeleeEffectParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.0000000
	AmmoPerFire=0
	FireAnim="SpellShield"
	FireAnimRate=2.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	InventorySize=2
	DisplaceDurationMult=0.3300000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.UniversalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.UniversalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.FlameSwordWeaponParamsComp.ArenaSecondaryFireParams'
end object
