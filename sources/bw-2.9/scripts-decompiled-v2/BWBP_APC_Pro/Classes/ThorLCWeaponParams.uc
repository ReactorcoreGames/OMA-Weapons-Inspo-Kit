class ThorLCWeaponParams extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.ThorLCWeaponParams.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=7
		SightingTime=0.2000000
		MagAmmo=100
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.ThorLCWeaponParams.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.ThorLCWeaponParams.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.ThorLCWeaponParams.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.ThorLCWeaponParams.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	Damage=8
	HeadMult=1.0000000
	LimbMult=1.0000000
	DamageType=Class'BallisticProV55.DT_HVCLightning'
	DamageTypeHead=Class'BallisticProV55.DT_HVCLightning'
	DamageTypeArm=Class'BallisticProV55.DT_HVCLightning'
	MuzzleFlashClass=Class'BallisticProV55.HVCMk9MuzzleFlash'
	FlashScaleFactor=1.2000000
	Recoil=4.0000000
	BotRefireRate=0.1500000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_APC_Pro.ThorLCWeaponParams.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="FireLoop"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.ThorLCWeaponParams.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_APC_Pro.ThorLCWeaponParams.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	Damage=0
	HeadMult=1.0000000
	LimbMult=1.0000000
	DamageType=Class'BWBP_OP_Pro.DTProtonStreamer'
	DamageTypeHead=Class'BWBP_OP_Pro.DTProtonStreamer'
	DamageTypeArm=Class'BWBP_OP_Pro.DTProtonStreamer'
	MuzzleFlashClass=Class'BallisticProV55.HVCMk9MuzzleFlash'
	FlashScaleFactor=1.2000000
	Recoil=2.0000000
	BotRefireRate=0.1500000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_APC_Pro.ThorLCWeaponParams.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="FireLoop"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.ThorLCWeaponParams.ArenaSecondaryEffectParams'
end object
// Reference: AimParams'BWBP_APC_Pro.ThorLCWeaponParams.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	ADSMultiplier=0.0000000
	SprintOffset=(Pitch=-1024,Yaw=-1024,Roll=0)
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=15000
end object
// Reference: WeaponParams'BWBP_APC_Pro.ThorLCWeaponParams.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=7
	SightingTime=0.2000000
	MagAmmo=100
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.ThorLCWeaponParams.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.ThorLCWeaponParams.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.ThorLCWeaponParams.ArenaSecondaryFireParams'
end object
