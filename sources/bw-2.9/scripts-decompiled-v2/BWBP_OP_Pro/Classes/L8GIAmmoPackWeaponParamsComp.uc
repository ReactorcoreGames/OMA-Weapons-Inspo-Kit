class L8GIAmmoPackWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.7500000
		InventorySize=2
		ViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.L8GIThrown'
	SpawnOffset=(X=25.0000000,Y=10.0000000,Z=2.0000000)
	Speed=400.0000000
	MaxSpeed=400.0000000
	DamageRadius=250.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Throw',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
end object
// Reference: FireParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	PreFireAnim="PrepThrow"
	FireAnim="Throw"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
end object
// Reference: FireParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.8500000
	AmmoPerFire=0
	FireAnim="putaway"
	FireEffectParams[0]=MeleeEffectParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	DeclineTime=1.5000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.7500000
	InventorySize=2
	ViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp.ArenaSecondaryFireParams'
end object
