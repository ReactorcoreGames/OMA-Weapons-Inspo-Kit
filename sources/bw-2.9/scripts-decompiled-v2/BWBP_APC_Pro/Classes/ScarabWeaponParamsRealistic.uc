class ScarabWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		ViewOffset=(X=2.0000000,Y=10.0000000,Z=-12.0000000)
		ViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.UniversalRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.UniversalAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=UniversalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.ScarabThrown'
	SpawnOffset=(X=25.0000000,Y=10.0000000,Z=2.0000000)
	Speed=1400.0000000
	MaxSpeed=1500.0000000
	Damage=50.0000000
	DamageRadius=512.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	FireSound=(Sound=Sound'BWBP_APC_Sounds.CruGren.CruGren-Throw',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.4000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	PreFireAnim="PrepThrow"
	FireAnim="Throw"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.ScarabRolled'
	SpawnOffset=(X=0.0000000,Y=0.0000000,Z=-14.0000000)
	Speed=1000.0000000
	MaxSpeed=1500.0000000
	Damage=50.0000000
	DamageRadius=512.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	FireSound=(Sound=Sound'BWBP_APC_Sounds.CruGren.CruGren-Throw',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	PreFireAnim="PrepRoll"
	FireAnim="Roll"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	ViewOffset=(X=2.0000000,Y=10.0000000,Z=-12.0000000)
	ViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.UniversalRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.UniversalAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.ScarabWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
