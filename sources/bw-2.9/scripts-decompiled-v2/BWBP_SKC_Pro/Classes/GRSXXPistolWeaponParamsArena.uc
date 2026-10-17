class GRSXXPistolWeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=1.0500000
		InventorySize=7
		CockAnimRate=1.2000000
		SightingTime=0.2000000
		DisplaceDurationMult=0.5000000
		MagAmmo=45
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	RangeAtten=0.2000000
	Damage=24
	HeadMult=1.4000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTGRSXXPistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.GRSXXFlashEmitter'
	FlashScaleFactor=1.2500000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Glock_Gold.GRSXX-Fire',Volume=1.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=150.0000000
	Chaos=0.1200000
	BotRefireRate=0.9900000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	FireEndAnim="None"
	FireAnimRate=1.7000000
	AimedFireAnim="'"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	RangeAtten=0.2000000
	Damage=18
	DamageType=Class'BWBP_SKC_Pro.DTGRSXXLaser'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTGRSXXLaserHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTGRSXXLaser'
	PenetrateForce=200
	bPenetrate=true
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Glock_Gold.G-Glk-LaserFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	AmmoPerFire=0
	FireAnim="Idle"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1200000),(InVal=0.3000000,OutVal=0.1500000),(InVal=0.4000000,OutVal=0.0200000),(InVal=0.5500000,OutVal=-0.1200000),(InVal=0.7000000,OutVal=0.0500000),(InVal=1.0000000,OutVal=0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4500000,OutVal=0.4500000),(InVal=0.6500000,OutVal=0.7500000),(InVal=0.8000000,OutVal=0.8200000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	MaxRecoil=6144.0000000
	DeclineTime=0.7500000
	DeclineDelay=0.3500000
	ViewBindFactor=0.3500000
	HipMultiplier=1.5000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimAdjustTime=0.3500000
	ADSMultiplier=2.0000000
	SprintChaos=0.0500000
	ChaosDeclineTime=0.4500000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=1.0500000
	InventorySize=7
	CockAnimRate=1.2000000
	SightingTime=0.2000000
	DisplaceDurationMult=0.5000000
	MagAmmo=45
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXPistolWeaponParamsArena.ArenaSecondaryFireParams'
end object
