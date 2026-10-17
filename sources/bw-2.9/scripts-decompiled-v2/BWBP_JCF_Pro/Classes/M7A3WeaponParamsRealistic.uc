class M7A3WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Holosight"
		InventorySize=7
		WeaponPrice=2500
		ReloadAnimRate=1.4000000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-10.0000000,Y=-0.4500000,Z=10.7200000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
		ViewOffset=(X=9.0000000,Y=3.0000000,Z=-8.0000000)
		WeaponName="M7A3 7.62mm Bullpup Rifle"
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticParams_Scope'
	begin object name="RealisticParams_Scope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="3X Scope"
		InventorySize=7
		ReloadAnimRate=1.4000000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=0.0000000,Y=-0.4500000,Z=11.3000000)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.MG36.G36ScopeViewDot'
		MaxZoom=3.0000000
		WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=1.0000000)
		ViewOffset=(X=9.0000000,Y=3.0000000,Z=-8.0000000)
		WeaponName="M7A3 7.62mm Bullpup Rifle"
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticRecoilParams_Scope'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_Scope
	// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticParams_57mm'
	begin object name="RealisticParams_57mm" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="5.7mm M7B2"
		InventorySize=7
		WeaponPrice=2000
		ReloadAnimRate=1.4000000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-10.0000000,Y=-0.4500000,Z=10.7200000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
		ViewOffset=(X=9.0000000,Y=3.0000000,Z=-8.0000000)
		WeaponName="M7B2 5.7mm Bullpup Rifle"
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticPrimaryFireParams_57mm'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[2]=RealisticParams_57mm
	// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticParams_57mmSupp'
	begin object name="RealisticParams_57mmSupp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="5.7mm M7B2 Supp"
		InventorySize=7
		WeaponPrice=2300
		ReloadAnimRate=1.4000000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-10.0000000,Y=-0.4500000,Z=10.7200000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
		ViewOffset=(X=9.0000000,Y=3.0000000,Z=-8.0000000)
		WeaponName="M7B2 5.7mm Bullpup Rifle"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.0750000,AugmentOffset=(X=-5.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticPrimaryFireParams_57mmSupp'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[3]=RealisticParams_57mmSupp
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=620,Max=1336)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.0750000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.2000000
	ChaosSpeedThreshold=565
end object
// Reference: FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="DartFireSingle"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.2000000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4500000)))
	YawFactor=0.1000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=4000.0000000
	DeclineTime=0.7000000
	DeclineDelay=0.2000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=10000.0000000)
	WaterTraceRange=5000.0000000
	DecayRange=(Min=1500.0000000,Max=8500.0000000)
	RangeAtten=0.1000000
	Damage=60
	HeadMult=2.2000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTM7A3RifleHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	PenetrationEnergy=24.0000000
	PenetrateForce=125
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.2000000
	FireSound=(Sound=Sound'BWBP_JCF_Sounds.M7A3.M7A3-HFire4',Volume=1.4000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=975.0000000
	Chaos=0.1000000
	Inaccuracy=(X=2,Y=2)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticPrimaryEffectParams_57mm'
begin object name="RealisticPrimaryEffectParams_57mm" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=5000.0000000)
	WaterTraceRange=750.0000000
	DecayRange=(Min=750.0000000,Max=3750.0000000)
	RangeAtten=0.1000000
	Damage=25
	HeadMult=2.2000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTM7A3RifleHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	PenetrationEnergy=24.0000000
	PenetrateForce=125
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.2000000
	FireSound=(Sound=SoundGroup'BWBP_JCF_Sounds.M7A3.M7A3-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=200.0000000
	Chaos=0.1000000
	Inaccuracy=(X=2,Y=2)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticPrimaryFireParams_57mm'
begin object name="RealisticPrimaryFireParams_57mm" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticPrimaryEffectParams_57mm'
end object
// Reference: InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticPrimaryEffectParams_57mmSupp'
begin object name="RealisticPrimaryEffectParams_57mmSupp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=5000.0000000)
	WaterTraceRange=750.0000000
	DecayRange=(Min=750.0000000,Max=3750.0000000)
	RangeAtten=0.1000000
	Damage=25
	HeadMult=2.2000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTM7A3RifleHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	PenetrationEnergy=24.0000000
	PenetrateForce=125
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.3000000
	FireSound=(Sound=SoundGroup'BWBP_JCF_Sounds.P90.P90SilFire',Volume=1.0000000,Radius=64.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	Recoil=180.0000000
	Chaos=0.1200000
	Inaccuracy=(X=2,Y=2)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticPrimaryFireParams_57mmSupp'
begin object name="RealisticPrimaryFireParams_57mmSupp" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticPrimaryEffectParams_57mmSupp'
end object
// Reference: ProjectileEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_JCF_Pro.M7A3TazerProj'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=10240.0000000
	Damage=5.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Tazer.BloodhoundTazerFire',Volume=2.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticRecoilParams_Scope'
begin object name="RealisticRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.2000000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4500000)))
	YawFactor=0.1000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=4000.0000000
	DeclineTime=0.7000000
	DeclineDelay=0.2000000
	ViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Holosight"
	InventorySize=7
	WeaponPrice=2500
	ReloadAnimRate=1.4000000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-10.0000000,Y=-0.4500000,Z=10.7200000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
	ViewOffset=(X=9.0000000,Y=3.0000000,Z=-8.0000000)
	WeaponName="M7A3 7.62mm Bullpup Rifle"
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticParams_Scope'
begin object name="RealisticParams_Scope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="3X Scope"
	InventorySize=7
	ReloadAnimRate=1.4000000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=0.0000000,Y=-0.4500000,Z=11.3000000)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.MG36.G36ScopeViewDot'
	MaxZoom=3.0000000
	WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=1.0000000)
	ViewOffset=(X=9.0000000,Y=3.0000000,Z=-8.0000000)
	WeaponName="M7A3 7.62mm Bullpup Rifle"
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticRecoilParams_Scope'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticParams_57mm'
begin object name="RealisticParams_57mm" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="5.7mm M7B2"
	InventorySize=7
	WeaponPrice=2000
	ReloadAnimRate=1.4000000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-10.0000000,Y=-0.4500000,Z=10.7200000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
	ViewOffset=(X=9.0000000,Y=3.0000000,Z=-8.0000000)
	WeaponName="M7B2 5.7mm Bullpup Rifle"
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticPrimaryFireParams_57mm'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticParams_57mmSupp'
begin object name="RealisticParams_57mmSupp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="5.7mm M7B2 Supp"
	InventorySize=7
	WeaponPrice=2300
	ReloadAnimRate=1.4000000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-10.0000000,Y=-0.4500000,Z=10.7200000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
	ViewOffset=(X=9.0000000,Y=3.0000000,Z=-8.0000000)
	WeaponName="M7B2 5.7mm Bullpup Rifle"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.0750000,AugmentOffset=(X=-5.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticPrimaryFireParams_57mmSupp'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
