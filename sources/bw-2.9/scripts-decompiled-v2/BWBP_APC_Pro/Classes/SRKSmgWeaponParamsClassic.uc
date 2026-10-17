class SRKSmgWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		InventorySize=4
		SightingTime=0.2000000
		SightOffset=(X=-20.0000000,Y=-0.3450000,Z=15.8000000)
		ViewOffset=(X=4.0000000,Y=6.0000000,Z=-12.0000000)
		MagAmmo=24
		bNeedCock=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicPrimaryFireBurstParams'
		FireParams[2]=FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1600000
	BurstFireRateFactor=0.8000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicPrimaryBurstEffectParams'
begin object name="ClassicPrimaryBurstEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=13000.0000000)
	WaterTraceRange=7200.0000000
	RangeAtten=0.9000000
	Damage=30
	DamageType=Class'BWBP_APC_Pro.DTSRKSmg'
	DamageTypeHead=Class'BWBP_APC_Pro.DTSRKSmgHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTSRKSmg'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MRDRFlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.PK2000-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.2500000
	Inaccuracy=(X=8,Y=8)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicPrimaryFireBurstParams'
begin object name="ClassicPrimaryFireBurstParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicPrimaryBurstEffectParams'
end object
// Reference: InstantEffectParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=13000.0000000)
	WaterTraceRange=7200.0000000
	RangeAtten=0.9000000
	Damage=30
	DamageType=Class'BWBP_APC_Pro.DTSRKSmg'
	DamageTypeHead=Class'BWBP_APC_Pro.DTSRKSmgHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTSRKSmg'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MRDRFlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.PK2000-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=128.0000000
	Chaos=0.1500000
	Inaccuracy=(X=8,Y=8)
	WarnTargetPct=0.2000000
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
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
// Reference: FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	FireAnim="GrenadeFire"
	AimedFireAnim="GrenadeFireSight"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2500000,OutVal=0.1800000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.6000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1800000),(InVal=0.3000000,OutVal=0.3200000),(InVal=0.5000000,OutVal=0.5000000),(InVal=0.7500000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.3500000
	YRandFactor=0.3500000
	DeclineTime=0.6000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.0500000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=36,Max=2048)
	AimAdjustTime=0.5500000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-4000,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2500000
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=1200
end object
// Reference: WeaponParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	InventorySize=4
	SightingTime=0.2000000
	SightOffset=(X=-20.0000000,Y=-0.3450000,Z=15.8000000)
	ViewOffset=(X=4.0000000,Y=6.0000000,Z=-12.0000000)
	MagAmmo=24
	bNeedCock=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicPrimaryFireBurstParams'
	FireParams[2]=FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsClassic.ClassicSecondaryFireParams'
end object
