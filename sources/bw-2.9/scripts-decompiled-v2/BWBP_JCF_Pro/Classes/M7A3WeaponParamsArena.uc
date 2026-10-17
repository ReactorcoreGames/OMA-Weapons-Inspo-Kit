class M7A3WeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Holosight"
		PlayerSpeedFactor=1.0500000
		InventorySize=5
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.2500000
		SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
		ViewOffset=(X=6.0000000,Y=3.0000000,Z=-8.0000000)
		DisplaceDurationMult=0.7500000
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaParams_Scope'
	begin object name="ArenaParams_Scope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="3X Scope"
		PlayerSpeedFactor=1.0500000
		InventorySize=5
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=0.0000000,Y=-0.4500000,Z=11.3000000)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.MG36.G36ScopeViewDot'
		MaxZoom=3.0000000
		WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=1.0000000)
		ViewOffset=(X=6.0000000,Y=3.0000000,Z=-8.0000000)
		DisplaceDurationMult=0.7500000
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[1]=ArenaParams_Scope
	// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaParams_57mm'
	begin object name="ArenaParams_57mm" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="5.7mm M7B2"
		PlayerSpeedFactor=1.0500000
		InventorySize=5
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.2500000
		SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
		ViewOffset=(X=6.0000000,Y=3.0000000,Z=-8.0000000)
		DisplaceDurationMult=0.7500000
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaPrimaryFireParams_57mm'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[2]=ArenaParams_57mm
	// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaParams_57mmSupp'
	begin object name="ArenaParams_57mmSupp" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="5.7mm M7B2 Supp"
		PlayerSpeedFactor=1.0500000
		InventorySize=5
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.2500000
		SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
		ViewOffset=(X=6.0000000,Y=3.0000000,Z=-8.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.0750000,AugmentOffset=(X=-5.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		DisplaceDurationMult=0.7500000
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaPrimaryFireParams_57mmSupp'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[3]=ArenaParams_57mmSupp
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="DartFireSingle"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.1600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1500000
	YRandFactor=0.1500000
	DeclineTime=0.6500000
	DeclineDelay=0.3600000
	ViewBindFactor=0.4500000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=512)
	AimAdjustTime=0.3500000
	ADSMultiplier=0.4000000
	SprintOffset=(Pitch=-3000,Yaw=-4000,Roll=0)
	ChaosDeclineTime=1.0000000
	ChaosSpeedThreshold=1200
end object
// Reference: FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=12000.0000000)
	RangeAtten=0.8000000
	Damage=30
	HeadMult=2.5000000
	DamageType=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTM7A3RifleHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	PenetrateForce=450
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_JCF_Pro.M7A3FlashEmitter'
	FlashScaleFactor=0.2000000
	FireSound=(Sound=Sound'BWBP_JCF_Sounds.M7A3.M7A3-HFire4',Volume=1.4000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=200.0000000
	Chaos=0.1000000
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaPrimaryEffectParams_57mm'
begin object name="ArenaPrimaryEffectParams_57mm" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=12000.0000000)
	RangeAtten=0.8000000
	Damage=20
	HeadMult=2.5000000
	DamageType=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTM7A3RifleHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	PenetrateForce=450
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_JCF_Pro.M7A3FlashEmitter'
	FlashScaleFactor=0.1000000
	FireSound=(Sound=SoundGroup'BWBP_JCF_Sounds.M7A3.M7A3-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=80.0000000
	Chaos=0.1000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaPrimaryFireParams_57mm'
begin object name="ArenaPrimaryFireParams_57mm" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaPrimaryEffectParams_57mm'
end object
// Reference: InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaPrimaryEffectParams_57mmSupp'
begin object name="ArenaPrimaryEffectParams_57mmSupp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=12000.0000000)
	RangeAtten=0.8000000
	Damage=20
	HeadMult=2.5000000
	DamageType=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTM7A3RifleHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTM7A3Rifle'
	PenetrateForce=450
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.3000000
	FireSound=(Sound=SoundGroup'BWBP_JCF_Sounds.P90.P90SilFire',Volume=1.0000000,Radius=64.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	Recoil=70.0000000
	Chaos=0.1200000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaPrimaryFireParams_57mmSupp'
begin object name="ArenaPrimaryFireParams_57mmSupp" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaPrimaryEffectParams_57mmSupp'
end object
// Reference: ProjectileEffectParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_JCF_Pro.M7A3TazerProj'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=10240.0000000
	Damage=5.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Tazer.BloodhoundTazerFire',Volume=2.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Holosight"
	PlayerSpeedFactor=1.0500000
	InventorySize=5
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.2500000
	SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
	ViewOffset=(X=6.0000000,Y=3.0000000,Z=-8.0000000)
	DisplaceDurationMult=0.7500000
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaParams_Scope'
begin object name="ArenaParams_Scope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="3X Scope"
	PlayerSpeedFactor=1.0500000
	InventorySize=5
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=0.0000000,Y=-0.4500000,Z=11.3000000)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.MG36.G36ScopeViewDot'
	MaxZoom=3.0000000
	WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=1.0000000)
	ViewOffset=(X=6.0000000,Y=3.0000000,Z=-8.0000000)
	DisplaceDurationMult=0.7500000
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaParams_57mm'
begin object name="ArenaParams_57mm" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="5.7mm M7B2"
	PlayerSpeedFactor=1.0500000
	InventorySize=5
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.2500000
	SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
	ViewOffset=(X=6.0000000,Y=3.0000000,Z=-8.0000000)
	DisplaceDurationMult=0.7500000
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaPrimaryFireParams_57mm'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaParams_57mmSupp'
begin object name="ArenaParams_57mmSupp" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="5.7mm M7B2 Supp"
	PlayerSpeedFactor=1.0500000
	InventorySize=5
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.2500000
	SightOffset=(X=-3.0000000,Y=-0.4400000,Z=10.7000000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=14,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=16,Scale=0.0000000)
	ViewOffset=(X=6.0000000,Y=3.0000000,Z=-8.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.0750000,AugmentOffset=(X=-5.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	DisplaceDurationMult=0.7500000
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaPrimaryFireParams_57mmSupp'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsArena.ArenaSecondaryFireParams'
end object
