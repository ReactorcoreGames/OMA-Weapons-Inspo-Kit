class N3XWeaponParams extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.N3XWeaponParams.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=1.1000000
		InventorySize=5
		WeaponBoneScales[0]=(BoneName="WeldingShield",Slot=1,Scale=0.0000000)
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.N3XWeaponParams.UniversalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.N3XWeaponParams.UniversalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.N3XWeaponParams.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.N3XWeaponParams.ArenaSecondaryFireParams'
	end object
	Layouts[0]=UniversalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeleeEffectParams'BWBP_SKC_Pro.N3XWeaponParams.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Fatigue=0.1200000
	TraceRange=(Min=165.0000000,Max=165.0000000)
	Damage=40
	DamageType=Class'BWBP_SKC_Pro.DTShockN3X'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTShockN3X'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTShockN3X'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.NEX.NEX-SlashAttack',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.N3XWeaponParams.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.5500000
	AmmoPerFire=0
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.N3XWeaponParams.ArenaPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.N3XWeaponParams.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Fatigue=0.3500000
	TraceRange=(Min=165.0000000,Max=165.0000000)
	Damage=75
	DamageType=Class'BWBP_SKC_Pro.DTShockN3XAlt'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTShockN3XAlt'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTShockN3XAlt'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.MRS38.RSS-ElectroSwing',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.9900000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.N3XWeaponParams.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2000000
	AmmoPerFire=0
	PreFireAnim="PrepHack"
	FireAnim="Hack"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.N3XWeaponParams.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.N3XWeaponParams.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BWBP_SKC_Pro.N3XWeaponParams.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.N3XWeaponParams.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=1.1000000
	InventorySize=5
	WeaponBoneScales[0]=(BoneName="WeldingShield",Slot=1,Scale=0.0000000)
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.N3XWeaponParams.UniversalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.N3XWeaponParams.UniversalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.N3XWeaponParams.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.N3XWeaponParams.ArenaSecondaryFireParams'
end object
