class M7A3WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Holosight"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
		ViewOffset=(X=8.0000000,Y=4.0000000,Z=-8.0000000)
		MagAmmo=20
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicParams_Scope'
	begin object name="ClassicParams_Scope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Short Scope"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=0.0000000,Y=-0.4500000,Z=11.3000000)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.MG36.G36ScopeViewDot'
		MaxZoom=3.0000000
		WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=1.0000000)
		ViewOffset=(X=8.0000000,Y=4.0000000,Z=-8.0000000)
		MagAmmo=20
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_Scope
	// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicParams_57mm'
	begin object name="ClassicParams_57mm" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="5.7mm M7B2"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
		ViewOffset=(X=8.0000000,Y=4.0000000,Z=-8.0000000)
		MagAmmo=50
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicRecoilParams_57mm'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicPrimaryFireParams_57mm'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[2]=ClassicParams_57mm
	// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicParams_57mmSupp'
	begin object name="ClassicParams_57mmSupp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="5.7mm M7B2 Supp"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
		ViewOffset=(X=8.0000000,Y=4.0000000,Z=-8.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.0750000,AugmentOffset=(X=-5.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=50
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicRecoilParams_57mm'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicPrimaryFireParams_57mmSupp'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[3]=ClassicParams_57mmSupp
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="DartFireSingle"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: AimParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=2560)
	AimAdjustTime=0.3500000
	CrouchMultiplier=0.9000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.5000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.0000000
	ChaosSpeedThreshold=1200
end object
// Reference: FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0500000),(InVal=0.1000000,OutVal=0.0600000),(InVal=0.1500000,OutVal=-0.0600000),(InVal=0.2000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.2000000),(InVal=0.6000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.3000000),(InVal=1.0000000,OutVal=1.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0500000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.1500000,OutVal=0.2000000),(InVal=0.2000000,OutVal=0.3000000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=3840.0000000
	DeclineTime=0.8000000
	ViewBindFactor=0.2000000
	CrouchMultiplier=0.9000000
	bViewDecline=true
end object
// Reference: RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicRecoilParams_57mm'
begin object name="ClassicRecoilParams_57mm" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0500000),(InVal=0.1000000,OutVal=0.0600000),(InVal=0.1500000,OutVal=-0.0600000),(InVal=0.2000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.2000000),(InVal=0.6000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.3000000),(InVal=1.0000000,OutVal=-0.5000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0500000),(InVal=0.1000000,OutVal=0.0400000),(InVal=0.1500000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.3000000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=4800.0000000
	DeclineTime=0.8000000
	ViewBindFactor=0.2000000
	CrouchMultiplier=0.9000000
	bViewDecline=true
end object
// Reference: InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=12000.0000000)
	WaterTraceRange=9600.0000000
	RangeAtten=0.8000000
	Damage=35
	HeadMult=3.0000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTM7A3RifleHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	PenetrationEnergy=60.0000000
	PenetrateForce=450
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_JCF_Pro.M7A3FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_JCF_Sounds.M7A3.M7A3-HFire4',Volume=1.4000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=200.0000000
	Chaos=0.0400000
	Inaccuracy=(X=16,Y=16)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicPrimaryEffectParams_57mm'
begin object name="ClassicPrimaryEffectParams_57mm" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=12000.0000000)
	WaterTraceRange=9600.0000000
	RangeAtten=0.8000000
	Damage=21
	HeadMult=3.0000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTM7A3RifleHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	PenetrationEnergy=60.0000000
	PenetrateForce=450
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_JCF_Pro.M7A3FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=SoundGroup'BWBP_JCF_Sounds.M7A3.M7A3-Fire',Volume=1.4000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=80.0000000
	Chaos=0.0400000
	Inaccuracy=(X=128,Y=128)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicPrimaryFireParams_57mm'
begin object name="ClassicPrimaryFireParams_57mm" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicPrimaryEffectParams_57mm'
end object
// Reference: InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicPrimaryEffectParams_57mmSupp'
begin object name="ClassicPrimaryEffectParams_57mmSupp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=12000.0000000)
	WaterTraceRange=9600.0000000
	RangeAtten=0.8000000
	Damage=21
	HeadMult=3.0000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTM7A3RifleHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	PenetrationEnergy=60.0000000
	PenetrateForce=450
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.3000000
	FireSound=(Sound=SoundGroup'BWBP_JCF_Sounds.P90.P90SilFire',Volume=1.0000000,Radius=64.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	Recoil=70.0000000
	Chaos=0.0800000
	Inaccuracy=(X=128,Y=128)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicPrimaryFireParams_57mmSupp'
begin object name="ClassicPrimaryFireParams_57mmSupp" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicPrimaryEffectParams_57mmSupp'
end object
// Reference: ProjectileEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_JCF_Pro.M7A3TazerProj'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=10240.0000000
	Damage=5.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Tazer.BloodhoundTazerFire',Volume=2.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Holosight"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
	ViewOffset=(X=8.0000000,Y=4.0000000,Z=-8.0000000)
	MagAmmo=20
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicParams_Scope'
begin object name="ClassicParams_Scope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Short Scope"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=0.0000000,Y=-0.4500000,Z=11.3000000)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.MG36.G36ScopeViewDot'
	MaxZoom=3.0000000
	WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=1.0000000)
	ViewOffset=(X=8.0000000,Y=4.0000000,Z=-8.0000000)
	MagAmmo=20
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicParams_57mm'
begin object name="ClassicParams_57mm" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="5.7mm M7B2"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
	ViewOffset=(X=8.0000000,Y=4.0000000,Z=-8.0000000)
	MagAmmo=50
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicRecoilParams_57mm'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicPrimaryFireParams_57mm'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicParams_57mmSupp'
begin object name="ClassicParams_57mmSupp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="5.7mm M7B2 Supp"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
	ViewOffset=(X=8.0000000,Y=4.0000000,Z=-8.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.0750000,AugmentOffset=(X=-5.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=50
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicRecoilParams_57mm'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicPrimaryFireParams_57mmSupp'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicSecondaryFireParams'
end object
