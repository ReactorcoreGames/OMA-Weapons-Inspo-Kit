class GASCPistolWeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.GASCPistolWeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=3
		SightingTime=0.1500000
		SightOffset=(X=-5.0000000,Y=-6.3230000,Z=9.7100000)
		ViewOffset=(X=6.5000000,Y=7.0000000,Z=-9.0000000)
		MagAmmo=16
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.GASCPistolWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.GASCPistolWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.GASCPistolWeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsTactical.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.GASCPistolWeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	RangeAtten=0.2000000
	Damage=22
	HeadMult=2.5000000
	DamageType=Class'BWBP_APC_Pro.DTGASCPistol'
	DamageTypeHead=Class'BWBP_APC_Pro.DTGASCPistolHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTGASCPistol'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_APC_Pro.GASCFlashEmitter'
	FlashScaleFactor=0.1000000
	FireSound=(Sound=Sound'BWBP_APC_Sounds.GASC.GASC-Fire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=0.1000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_APC_Pro.GASCPistolWeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0950000
	FireEndAnim="None"
	FireAnimRate=1.4500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.GASCPistolWeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.GASCPistolWeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0500000),(InVal=0.4000000,OutVal=0.1000000),(InVal=0.5500000,OutVal=0.1200000),(InVal=0.8000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1700000),(InVal=0.4000000,OutVal=0.4200000),(InVal=0.6000000,OutVal=0.6500000),(InVal=0.8000000,OutVal=0.8000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1500000
	YRandFactor=0.3000000
	DeclineTime=0.5000000
	DeclineDelay=0.3500000
	ViewBindFactor=0.6000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_APC_Pro.GASCPistolWeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=512)
	AimAdjustTime=0.4000000
	ADSMultiplier=0.2000000
	SprintOffset=(Pitch=-3000,Yaw=-4000,Roll=0)
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=7500
end object
// Reference: WeaponParams'BWBP_APC_Pro.GASCPistolWeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=3
	SightingTime=0.1500000
	SightOffset=(X=-5.0000000,Y=-6.3230000,Z=9.7100000)
	ViewOffset=(X=6.5000000,Y=7.0000000,Z=-9.0000000)
	MagAmmo=16
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.GASCPistolWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.GASCPistolWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.GASCPistolWeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsTactical.ArenaSecondaryFireParams'
end object
