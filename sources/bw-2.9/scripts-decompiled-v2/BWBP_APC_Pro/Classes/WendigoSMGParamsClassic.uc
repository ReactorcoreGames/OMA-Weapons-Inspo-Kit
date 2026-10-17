class WendigoSMGParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=12
		SightOffset=(X=15.0000000,Y=-0.2850000,Z=0.0400000)
		MagAmmo=70
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=12000.0000000)
	RangeAtten=0.1000000
	Damage=18
	DamageType=Class'BWBP_SKC_Pro.DTCYLORifle'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTCYLORifleHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTCYLORifle'
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.LS14-CarbineFire',Volume=1.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=70.0000000
	Chaos=0.0320000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0750000
	PreFireAnim="None"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.Wendigo_EMPTorpedo'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3600.0000000
	MaxSpeed=1000000.0000000
	AccelSpeed=1200.0000000
	Damage=70.0000000
	DamageRadius=240.0000000
	MomentumTransfer=10000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.LS14-EnergyRocket2',Volume=1.3000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AmmoPerFire=20
	FireAnim="FireAlt"
	FireEndAnim="None"
	AimedFireAnim="SightFireAlt"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0900000),(InVal=0.2000000,OutVal=0.1200000),(InVal=0.2500000,OutVal=0.1300000),(InVal=0.3000000,OutVal=0.1100000),(InVal=0.3500000,OutVal=0.0800000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.5000000,OutVal=-0.0200000),(InVal=0.6000000,OutVal=-0.0400000),(InVal=0.7000000,OutVal=0.0400000),(InVal=0.8000000,OutVal=0.0700000),(InVal=1.0000000,OutVal=0.1300000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2200000),(InVal=0.3000000,OutVal=0.2600000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.5000000,OutVal=0.5500000),(InVal=0.6000000,OutVal=0.6200000),(InVal=0.7500000,OutVal=0.7700000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	DeclineTime=0.4000000
	DeclineDelay=0.1600000
	ViewBindFactor=0.3000000
end object
// Reference: AimParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=768)
	AimAdjustTime=0.4000000
	ADSMultiplier=0.3000000
	SprintOffset=(Pitch=-3000,Yaw=-8000,Roll=0)
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=7000
end object
// Reference: WeaponParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=12
	SightOffset=(X=15.0000000,Y=-0.2850000,Z=0.0400000)
	MagAmmo=70
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.WendigoSMGParamsClassic.ArenaSecondaryFireParams'
end object
