class BX5WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.BX5WeaponParamsTactical.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		InventorySize=2
		MaxInventoryCount=1
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.BX5WeaponParamsTactical.UniversalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.BX5WeaponParamsTactical.UniversalAimParams'
		FireParams[0]=FireParams'BallisticProV55.BX5WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.BX5WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=UniversalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BallisticProV55.BX5WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.BX5VehicleMine'
	SpawnOffset=(X=15.0000000,Y=-10.0000000,Z=-5.0000000)
	Damage=70.0000000
	DamageRadius=128.0000000
	MomentumTransfer=90000.0000000
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.BX5WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	FireAnim="Deploy"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.BX5WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.BX5WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	EffectString="Spring mode"
end object
// Reference: FireParams'BallisticProV55.BX5WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.BX5WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.BX5WeaponParamsTactical.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=0.7500000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BallisticProV55.BX5WeaponParamsTactical.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BallisticProV55.BX5WeaponParamsTactical.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	InventorySize=2
	MaxInventoryCount=1
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.BX5WeaponParamsTactical.UniversalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.BX5WeaponParamsTactical.UniversalAimParams'
	FireParams[0]=FireParams'BallisticProV55.BX5WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.BX5WeaponParamsTactical.TacticalSecondaryFireParams'
end object
