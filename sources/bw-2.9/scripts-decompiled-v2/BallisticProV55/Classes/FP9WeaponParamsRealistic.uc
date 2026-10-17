class FP9WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.FP9WeaponParamsRealistic.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		InventorySize=2
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.FP9WeaponParamsRealistic.UniversalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.FP9WeaponParamsRealistic.UniversalAimParams'
		FireParams[0]=FireParams'BallisticProV55.FP9WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.FP9WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=UniversalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BallisticProV55.FP9WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.FP9WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.FP9WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.FP9Bomb'
	SpawnOffset=(X=15.0000000,Y=-10.0000000,Z=-5.0000000)
	Speed=600.0000000
	Damage=325.0000000
	DamageRadius=250.0000000
	MomentumTransfer=90000.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.FP9A5.FP9-Throw',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.9000000
end object
// Reference: FireParams'BallisticProV55.FP9WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.5000000
	PreFireAnim="PrepThrow"
	FireAnim="Throw"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.FP9WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.FP9WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
	EffectString="Detonate"
end object
// Reference: RecoilParams'BallisticProV55.FP9WeaponParamsRealistic.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BallisticProV55.FP9WeaponParamsRealistic.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BallisticProV55.FP9WeaponParamsRealistic.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	InventorySize=2
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.FP9WeaponParamsRealistic.UniversalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.FP9WeaponParamsRealistic.UniversalAimParams'
	FireParams[0]=FireParams'BallisticProV55.FP9WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.FP9WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
