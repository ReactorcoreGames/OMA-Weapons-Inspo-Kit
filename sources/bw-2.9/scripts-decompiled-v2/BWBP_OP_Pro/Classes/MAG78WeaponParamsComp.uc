class MAG78WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.MAG78WeaponParamsComp.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		InventorySize=2
		DisplaceDurationMult=0.3300000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.MAG78WeaponParamsComp.UniversalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.MAG78WeaponParamsComp.UniversalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.MAG78WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.MAG78WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=UniversalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeleeEffectParams'BWBP_OP_Pro.MAG78WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Fatigue=0.0640000
	TraceRange=(Min=175.0000000,Max=175.0000000)
	Damage=90
	DamageType=Class'BWBP_OP_Pro.DT_MAGSAWStab'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_MAGSAWStabHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_MAGSAWStab'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.Chainsword.SawSwing',Volume=1.0000000,Radius=378.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_OP_Pro.MAG78WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=0
	FireAnim="Swing1"
	FireEffectParams[0]=MeleeEffectParams'BWBP_OP_Pro.MAG78WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_OP_Pro.MAG78WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=160.0000000,Max=160.0000000)
	Damage=25
	DamageType=Class'BWBP_OP_Pro.DT_MAGSAWStab'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_MAGSAWStabHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_MAGSAWStab'
	HookStopFactor=1.5000000
	HookPullForce=150.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-SawOpen',Volume=0.7500000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_OP_Pro.MAG78WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="SawStart"
	FireEndAnim="SawEnd"
	FireEffectParams[0]=MeleeEffectParams'BWBP_OP_Pro.MAG78WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.MAG78WeaponParamsComp.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BWBP_OP_Pro.MAG78WeaponParamsComp.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_OP_Pro.MAG78WeaponParamsComp.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	InventorySize=2
	DisplaceDurationMult=0.3300000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.MAG78WeaponParamsComp.UniversalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.MAG78WeaponParamsComp.UniversalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.MAG78WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.MAG78WeaponParamsComp.ArenaSecondaryFireParams'
end object
