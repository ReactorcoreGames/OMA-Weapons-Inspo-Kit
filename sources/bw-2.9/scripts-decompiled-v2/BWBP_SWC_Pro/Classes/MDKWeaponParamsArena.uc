class MDKWeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.MDKWeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=4
		CockAnimRate=1.2500000
		SightingTime=0.2500000
		SightOffset=(X=10.0000000,Y=-0.0500000,Z=41.0000000)
		SightPivot=(Pitch=16,Yaw=0,Roll=0)
		ViewOffset=(X=15.0000000,Y=11.0000000,Z=-33.0000000)
		DisplaceDurationMult=0.7500000
		MagAmmo=35
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.MDKWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.MDKWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.MDKWeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SWC_Pro.MDKWeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4096.0000000,Max=4096.0000000)
	RangeAtten=0.2000000
	Damage=20
	HeadMult=2.2500000
	DamageType=Class'BWBP_SWC_Pro.DTMDKSMG'
	DamageTypeHead=Class'BWBP_SWC_Pro.DTMDKSMGHead'
	DamageTypeArm=Class'BWBP_SWC_Pro.DTMDKSMG'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SWC_Pro.MDKFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SWC_Sounds.MDK.MDK-Fire',Volume=1.0000000,Radius=384.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=72.0000000
	Chaos=0.0250000
end object
// Reference: FireParams'BWBP_SWC_Pro.MDKWeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SWC_Pro.MDKWeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SWC_Pro.MDKWeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.1600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	DeclineTime=0.5000000
	DeclineDelay=0.1500000
	ViewBindFactor=0.4500000
end object
// Reference: AimParams'BWBP_SWC_Pro.MDKWeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=512)
	AimAdjustTime=0.4000000
	ADSMultiplier=0.4000000
	SprintOffset=(Pitch=-3000,Yaw=-4000,Roll=0)
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=7500
end object
// Reference: WeaponParams'BWBP_SWC_Pro.MDKWeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=4
	CockAnimRate=1.2500000
	SightingTime=0.2500000
	SightOffset=(X=10.0000000,Y=-0.0500000,Z=41.0000000)
	SightPivot=(Pitch=16,Yaw=0,Roll=0)
	ViewOffset=(X=15.0000000,Y=11.0000000,Z=-33.0000000)
	DisplaceDurationMult=0.7500000
	MagAmmo=35
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.MDKWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.MDKWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.MDKWeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsArena.ArenaSecondaryFireParams'
end object
