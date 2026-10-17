class BX5WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.BX5WeaponParamsComp.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		InventorySize=2
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.BX5WeaponParamsComp.UniversalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.BX5WeaponParamsComp.UniversalAimParams'
		FireParams[0]=FireParams'BallisticProV55.BX5WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.BX5WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=UniversalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BallisticProV55.BX5WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.BX5VehicleMine'
	SpawnOffset=(X=15.0000000,Y=-10.0000000,Z=-5.0000000)
	Damage=70.0000000
	DamageRadius=256.0000000
	MomentumTransfer=90000.0000000
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.BX5WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	FireAnim="Deploy"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.BX5WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.BX5WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	EffectString="Spring mode"
end object
// Reference: FireParams'BallisticProV55.BX5WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.BX5WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.BX5WeaponParamsComp.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=0.7500000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BallisticProV55.BX5WeaponParamsComp.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BallisticProV55.BX5WeaponParamsComp.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	InventorySize=2
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.BX5WeaponParamsComp.UniversalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.BX5WeaponParamsComp.UniversalAimParams'
	FireParams[0]=FireParams'BallisticProV55.BX5WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.BX5WeaponParamsComp.ArenaSecondaryFireParams'
end object
