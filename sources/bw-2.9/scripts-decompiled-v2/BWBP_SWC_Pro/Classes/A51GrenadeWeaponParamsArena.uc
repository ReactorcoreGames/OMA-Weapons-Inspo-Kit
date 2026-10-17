class A51GrenadeWeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		ViewOffset=(X=8.0000000,Y=10.0000000,Z=-12.0000000)
		ViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
		MagAmmo=2
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SWC_Pro.A51Thrown'
	SpawnOffset=(X=25.0000000,Y=10.0000000,Z=2.0000000)
	Speed=1400.0000000
	MaxSpeed=1500.0000000
	Damage=100.0000000
	DamageRadius=250.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Throw',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.4000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	PreFireAnim="PrepThrow"
	FireAnim="Throw"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SWC_Pro.A51Rolled'
	SpawnOffset=(X=0.0000000,Y=0.0000000,Z=-14.0000000)
	Speed=1000.0000000
	MaxSpeed=1500.0000000
	Damage=100.0000000
	DamageRadius=250.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Throw',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	PreFireAnim="PrepRoll"
	FireAnim="Roll"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	DeclineTime=1.5000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	ViewOffset=(X=8.0000000,Y=10.0000000,Z=-12.0000000)
	ViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	MagAmmo=2
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsArena.ArenaSecondaryFireParams'
end object
