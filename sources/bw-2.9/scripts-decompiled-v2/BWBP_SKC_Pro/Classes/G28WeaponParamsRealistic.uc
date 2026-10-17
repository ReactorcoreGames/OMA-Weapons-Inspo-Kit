class G28WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.UniversalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.UniversalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=UniversalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.G28Thrown_Exp'
	SpawnOffset=(X=25.0000000,Y=10.0000000,Z=2.0000000)
	Speed=800.0000000
	MaxSpeed=1500.0000000
	Damage=120.0000000
	DamageRadius=300.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Throw',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
end object
// Reference: FireParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	PreFireAnim="PrepThrow"
	FireAnim="Throw"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.G28Rolled_Exp'
	Speed=200.0000000
	MaxSpeed=500.0000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	PreFireAnim="PrepRoll"
	FireAnim="Roll"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.UniversalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.UniversalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G28WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
