class ProtonWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.ProtonWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=4
		SightingTime=0.2000000
		MagAmmo=100
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.PD97WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.ProtonWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.ProtonWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.ProtonWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_OP_Pro.ProtonWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	Damage=6
	DamageType=Class'BWBP_OP_Pro.DTProtonStreamer'
	DamageTypeHead=Class'BWBP_OP_Pro.DTProtonStreamer'
	MuzzleFlashClass=Class'BWBP_OP_Pro.ProtonFlashEmitter'
end object
// Reference: FireParams'BWBP_OP_Pro.ProtonWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	FireAnim="FireLoop"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.ProtonWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.ProtonWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	Damage=2
	DamageType=Class'BWBP_OP_Pro.DTProtonStreamer'
	DamageTypeHead=Class'BWBP_OP_Pro.DTProtonStreamer'
	MuzzleFlashClass=Class'BWBP_OP_Pro.ProtonFlashEmitterAlt'
end object
// Reference: FireParams'BWBP_OP_Pro.ProtonWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	FireAnim="FireLoop"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.ProtonWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: AimParams'BWBP_OP_Pro.ProtonWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	ADSMultiplier=0.0000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=15000
end object
// Reference: WeaponParams'BWBP_OP_Pro.ProtonWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=4
	SightingTime=0.2000000
	MagAmmo=100
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.PD97WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.ProtonWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.ProtonWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.ProtonWeaponParamsComp.ArenaSecondaryFireParams'
end object
