class SRKSmgWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2000000
		SightOffset=(X=-20.0000000,Y=-0.3450000,Z=15.8000000)
		ViewOffset=(X=4.0000000,Y=6.0000000,Z=-12.0000000)
		WeaponName="SRK-205 .45 Submachinegun"
		MagAmmo=36
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1100.0000000,Max=4800.0000000)
	DecayRange=(Min=1300.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=45
	HeadMult=3.0000000
	DamageType=Class'BWBP_APC_Pro.DTSRKSmg'
	DamageTypeHead=Class'BWBP_APC_Pro.DTSRKSmgHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTSRKSmg'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_APC_Pro.SRKSmgFlashEmitter'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BWBP_APC_Sounds.SRKS.SRKS-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=120.0000000
	Chaos=0.0500000
	Inaccuracy=(X=48,Y=48)
end object
// Reference: FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1100000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.SHADRACHRifleGrenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3750.0000000
	MaxSpeed=4500.0000000
	Damage=65.0000000
	DamageRadius=320.0000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.SRKSmgAltFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	FireAnim="GrenadeFire"
	AimedFireAnim="GrenadeFireSight"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.5500000,OutVal=-0.1000000),(InVal=0.8000000,OutVal=-0.3000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.3500000),(InVal=1.0000000,OutVal=0.3500000)))
	PitchFactor=0.2000000
	YawFactor=0.6000000
	XRandFactor=0.1500000
	YRandFactor=0.1500000
	ClimbTime=0.0600000
	DeclineTime=0.8000000
	DeclineDelay=0.2000000
	EscapeMultiplier=1.2500000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.0000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=640,Max=1480)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.0000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2000000
	SightOffset=(X=-20.0000000,Y=-0.3450000,Z=15.8000000)
	ViewOffset=(X=4.0000000,Y=6.0000000,Z=-12.0000000)
	WeaponName="SRK-205 .45 Submachinegun"
	MagAmmo=36
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsTactical.TacticalSecondaryFireParams'
end object
