class M7A3WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Holosight"
		WeaponPrice=2500
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.3200000
		SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
		ViewOffset=(X=6.0000000,Y=3.0000000,Z=-8.0000000)
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalParams_Scope'
	begin object name="TacticalParams_Scope" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="3X Scope"
		WeaponPrice=3000
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4000000
		SightOffset=(X=0.0000000,Y=-0.4500000,Z=11.3000000)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.MG36.G36ScopeViewDot'
		MaxZoom=3.0000000
		WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=1.0000000)
		ViewOffset=(X=6.0000000,Y=3.0000000,Z=-8.0000000)
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalRecoilParams_Scope'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalAimParams_Scope'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=TacticalParams_Scope
	// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalParams_57mm'
	begin object name="TacticalParams_57mm" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="5.7mm M7B2"
		WeaponPrice=2500
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.3200000
		SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
		ViewOffset=(X=6.0000000,Y=3.0000000,Z=-8.0000000)
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalPrimaryFireParams_57mm'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[2]=TacticalParams_57mm
	// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalParams_57mmSupp'
	begin object name="TacticalParams_57mmSupp" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="5.7mm M7B2 Supp"
		WeaponPrice=2500
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.3200000
		SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
		ViewOffset=(X=6.0000000,Y=3.0000000,Z=-8.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.0750000,AugmentOffset=(X=-5.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalPrimaryFireParams_57mmSupp'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[3]=TacticalParams_57mmSupp
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="DartFireSingle"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.1600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0300000
	DeclineTime=0.7500000
	DeclineDelay=0.1200000
	EscapeMultiplier=1.2000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DecayRange=(Min=2625.0000000,Max=6300.0000000)
	RangeAtten=0.7500000
	Damage=55
	HeadMult=3.0000000
	DamageType=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTM7A3RifleHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_JCF_Pro.M7A3FlashEmitter'
	FlashScaleFactor=0.1000000
	FireSound=(Sound=Sound'BWBP_JCF_Sounds.M7A3.M7A3-HFire4',Volume=1.4000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=750.0000000
	Chaos=0.1000000
	Inaccuracy=(X=32,Y=32)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalPrimaryEffectParams_57mm'
begin object name="TacticalPrimaryEffectParams_57mm" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=28
	HeadMult=3.2500000
	DamageType=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTM7A3RifleHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_JCF_Pro.M7A3FlashEmitter'
	FlashScaleFactor=0.1000000
	FireSound=(Sound=SoundGroup'BWBP_JCF_Sounds.M7A3.M7A3-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=96.0000000
	Inaccuracy=(X=32,Y=32)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalPrimaryFireParams_57mm'
begin object name="TacticalPrimaryFireParams_57mm" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalPrimaryEffectParams_57mm'
end object
// Reference: InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalPrimaryEffectParams_57mmSupp'
begin object name="TacticalPrimaryEffectParams_57mmSupp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=28
	HeadMult=3.2500000
	DamageType=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTM7A3RifleHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.3000000
	FireSound=(Sound=SoundGroup'BWBP_JCF_Sounds.P90.P90SilFire',Volume=1.0000000,Radius=64.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	Recoil=80.0000000
	Inaccuracy=(X=28,Y=28)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalPrimaryFireParams_57mmSupp'
begin object name="TacticalPrimaryFireParams_57mmSupp" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalPrimaryEffectParams_57mmSupp'
end object
// Reference: ProjectileEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_JCF_Pro.M7A3TazerProj'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=10240.0000000
	Damage=5.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Tazer.BloodhoundTazerFire',Volume=2.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalRecoilParams_Scope'
begin object name="TacticalRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.1600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0300000
	DeclineTime=0.7500000
	DeclineDelay=0.1200000
	ViewBindFactor=0.2000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalAimParams_Scope'
begin object name="TacticalAimParams_Scope" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Holosight"
	WeaponPrice=2500
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.3200000
	SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
	ViewOffset=(X=6.0000000,Y=3.0000000,Z=-8.0000000)
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalParams_Scope'
begin object name="TacticalParams_Scope" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="3X Scope"
	WeaponPrice=3000
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4000000
	SightOffset=(X=0.0000000,Y=-0.4500000,Z=11.3000000)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.MG36.G36ScopeViewDot'
	MaxZoom=3.0000000
	WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=1.0000000)
	ViewOffset=(X=6.0000000,Y=3.0000000,Z=-8.0000000)
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalRecoilParams_Scope'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalAimParams_Scope'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalParams_57mm'
begin object name="TacticalParams_57mm" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="5.7mm M7B2"
	WeaponPrice=2500
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.3200000
	SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
	ViewOffset=(X=6.0000000,Y=3.0000000,Z=-8.0000000)
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalPrimaryFireParams_57mm'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalParams_57mmSupp'
begin object name="TacticalParams_57mmSupp" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="5.7mm M7B2 Supp"
	WeaponPrice=2500
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.3200000
	SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
	ViewOffset=(X=6.0000000,Y=3.0000000,Z=-8.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.0750000,AugmentOffset=(X=-5.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalPrimaryFireParams_57mmSupp'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsTactical.TacticalSecondaryFireParams'
end object
