class X8WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.X8WeaponParamsTactical.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		DisplaceDurationMult=0.2500000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X8WeaponParamsTactical.UniversalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.X8WeaponParamsTactical.UniversalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.X8WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.X8WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=UniversalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeleeEffectParams'BWBP_SKC_Pro.X8WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=96.0000000,Max=96.0000000)
	WaterTraceRange=5000.0000000
	Damage=45
	DamageType=Class'BWBP_SKC_Pro.DTX8Knife'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTX8Knife'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTX8Knife'
	HookStopFactor=1.3000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.X4.X4_Melee',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.X8WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=0
	FireAnim="Slash1"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.X8WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.X8WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.X8ProjectileHeld'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=8500.0000000
	MaxSpeed=8500.0000000
	Damage=75.0000000
	HeadMult=3.2500000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-KnifeFire',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Inaccuracy=(X=384,Y=384)
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.X8WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.7000000
	BurstFireRateFactor=1.0000000
	PreFireAnim="PrepShoot"
	FireAnim="Shoot"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.X8WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.X8WeaponParamsTactical.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BWBP_SKC_Pro.X8WeaponParamsTactical.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.X8WeaponParamsTactical.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	DisplaceDurationMult=0.2500000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.X8WeaponParamsTactical.UniversalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.X8WeaponParamsTactical.UniversalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.X8WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.X8WeaponParamsTactical.TacticalSecondaryFireParams'
end object
