class MJ51WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalParams_HE'
	begin object name="TacticalParams_HE" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Irons + HE"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightOffset=(X=25.0000000,Y=-6.4500000,Z=20.5000000)
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalSecondaryFireParams_HE'
	end object
	Layouts[0]=TacticalParams_HE
	// Reference: WeaponParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalParams_EOtech'
	begin object name="TacticalParams_EOtech" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="EOtech + HE"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightOffset=(X=25.0000000,Y=-6.4500000,Z=20.5000000)
		LayoutMesh=SkeletalMesh'BWBP_APC_Anim.M4A1Carbine_FPm'
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalSecondaryFireParams_HE'
	end object
	Layouts[1]=TacticalParams_EOtech
	// Reference: WeaponCamo'BWBP_APC_Pro.MJ51WeaponParamsTactical.MJ51_Black'
	begin object name="MJ51_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=MJ51_Black
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0825000
	BurstFireRateFactor=1.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalSecondaryFireParams_HE'
begin object name="TacticalSecondaryFireParams_HE" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	FireAnim="FireGrenade"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalSecondaryEffectParams_HE'
end object
// Reference: RecoilParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.2500000,OutVal=0.0600000),(InVal=0.4000000,OutVal=-0.0200000),(InVal=0.8000000,OutVal=0.1000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1800000),(InVal=0.3000000,OutVal=0.3200000),(InVal=0.5000000,OutVal=0.5000000),(InVal=0.7500000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.0900000
	ClimbTime=0.0400000
	DeclineTime=1.0000000
	DeclineDelay=0.1400000
	ViewBindFactor=0.4000000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=512)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=13000.0000000)
	DecayRange=(Min=1575.0000000,Max=3675.0000000)
	RangeAtten=0.9000000
	Damage=26
	DamageType=Class'BWBP_APC_Pro.DTMJ51Assault'
	DamageTypeHead=Class'BWBP_APC_Pro.DTMJ51AssaultHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTMJ51AssaultLimb'
	PenetrationEnergy=32.0000000
	PenetrateForce=18
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51FlashEmitter'
	FlashScaleFactor=0.4500000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ55-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=128.0000000
	Chaos=0.0400000
	WarnTargetPct=0.2000000
end object
// Reference: GrenadeEffectParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalSecondaryEffectParams_HE'
begin object name="TacticalSecondaryEffectParams_HE" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=150.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.G51Grenade_HE'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3750.0000000
	MaxSpeed=4500.0000000
	Damage=120.0000000
	DamageRadius=1024.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51AltFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: WeaponParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalParams_HE'
begin object name="TacticalParams_HE" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Irons + HE"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightOffset=(X=25.0000000,Y=-6.4500000,Z=20.5000000)
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalSecondaryFireParams_HE'
end object
// Reference: WeaponParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalParams_EOtech'
begin object name="TacticalParams_EOtech" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="EOtech + HE"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightOffset=(X=25.0000000,Y=-6.4500000,Z=20.5000000)
	LayoutMesh=SkeletalMesh'BWBP_APC_Anim.M4A1Carbine_FPm'
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.MJ51WeaponParamsTactical.TacticalSecondaryFireParams_HE'
end object
// Reference: WeaponCamo'BWBP_APC_Pro.MJ51WeaponParamsTactical.MJ51_Black'
begin object name="MJ51_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
