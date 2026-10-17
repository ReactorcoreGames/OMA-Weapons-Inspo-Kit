class ICISWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.UniversalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.UniversalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=UniversalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireEffectParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.FireEffectParams
	EffectString="Heals over time."
end object
// Reference: FireParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=10
	PreFireTime=0.6500000
	PreFireAnim="PrepHealLoop"
	FireLoopAnim="HealLoopA"
	FireEndAnim="HealLoopEnd"
	PreFireAnimRate=1.5000000
	FireEndAnimRate=1.5000000
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=96.0000000,Max=96.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_ICIS'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_ICIS'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_ICIS'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.X4.X4_Melee',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	AmmoPerFire=0
	PreFireAnim="PrepFriendlyShank"
	FireAnim="FriendlyShank"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.UniversalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.UniversalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.ICISWeaponParamsTactical.TacticalSecondaryFireParams'
end object
