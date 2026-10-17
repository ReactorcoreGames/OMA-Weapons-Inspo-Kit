class D49WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.D49WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Laser"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		WeaponPrice=1800
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1500000
		SightOffset=(X=-11.0000000,Y=-4.6000000,Z=25.5000000)
		SightPivot=(Pitch=350,Yaw=-48,Roll=-500)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-2500,Roll=0)
		RootAdjust=(Pitch=2000,Yaw=-375,Roll=0)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="ShortBarrel",Slot=51,Scale=0.0000000)
		ViewOffset=(X=10.0000000,Y=22.0000000,Z=-16.0000000)
		WeaponName="D49 .44 Magnum Revolver"
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BallisticProV55.D49WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.D49WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.D49WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.D49WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.D49WeaponParamsRealistic.RealisticParams_Scope'
	begin object name="RealisticParams_Scope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="4X Scope"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=50.0000000,Y=-0.5000000,Z=10.0000000)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="ShortBarrel",Slot=51,Scale=0.0000000)
		ViewOffset=(X=10.0000000,Y=22.0000000,Z=-16.0000000)
		WeaponName="D49 .44 Magnum Revolver (4X)"
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BallisticProV55.D49WeaponParamsRealistic.RealisticRecoilParams_Scope'
		AimParams[0]=AimParams'BallisticProV55.D49WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.D49WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.D49WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_Scope
	// Reference: WeaponCamo'BallisticProV55.D49WeaponParamsRealistic.D49_Silver'
	begin object name="D49_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=D49_Silver
	// Reference: WeaponCamo'BallisticProV55.D49WeaponParamsRealistic.D49_Black'
	begin object name="D49_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.D49Camos.D49Black-Shine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=D49_Black
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BallisticProV55.D49WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=1024)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.8200000
	ADSMultiplier=0.7700000
	SprintOffset=(Pitch=-4608,Yaw=-512,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.7000000
	ChaosSpeedThreshold=675
end object
// Reference: FireParams'BallisticProV55.D49WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=2
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.D49WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.D49WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4500000
	BurstFireRateFactor=1.0000000
	FireAnim="FireSingle"
	FireEndAnim="None"
	FireAnimRate=1.8000000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.D49WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.D49WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=6000.0000000,Max=6000.0000000)
	WaterTraceRange=5000.0000000
	DecayRange=(Min=1200.0000000,Max=6000.0000000)
	RangeAtten=0.5000000
	Damage=65
	HeadMult=2.3000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTD49Revolver'
	DamageTypeHead=Class'BallisticProV55.DTD49RevolverHead'
	DamageTypeArm=Class'BallisticProV55.DTD49Revolver'
	PenetrationEnergy=14.0000000
	PenetrateForce=50
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-FireSingle',Volume=1.1000000,Radius=512.0000000,Slot=0,Pitch=1.1000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	Chaos=0.1200000
	Inaccuracy=(X=6,Y=6)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BallisticProV55.D49WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=6000.0000000,Max=6000.0000000)
	WaterTraceRange=5000.0000000
	DecayRange=(Min=1200.0000000,Max=6000.0000000)
	RangeAtten=0.5000000
	Damage=130
	HeadMult=2.3000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTD49Revolver'
	DamageTypeHead=Class'BallisticProV55.DTD49RevolverHead'
	DamageTypeArm=Class'BallisticProV55.DTD49Revolver'
	PenetrationEnergy=14.0000000
	PenetrateForce=50
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1920.0000000
	Chaos=0.2000000
	Inaccuracy=(X=6,Y=6)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: RecoilParams'BallisticProV55.D49WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.6000000
	YawFactor=0.0000000
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=3072.0000000
	DeclineTime=0.7000000
	DeclineDelay=0.2000000
	ViewBindFactor=0.4000000
	ADSViewBindFactor=0.4000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: RecoilParams'BallisticProV55.D49WeaponParamsRealistic.RealisticRecoilParams_Scope'
begin object name="RealisticRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.6000000
	YawFactor=0.0000000
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=3072.0000000
	DeclineTime=0.7000000
	DeclineDelay=0.2000000
	ADSViewBindFactor=0.4000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: WeaponParams'BallisticProV55.D49WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Laser"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	WeaponPrice=1800
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1500000
	SightOffset=(X=-11.0000000,Y=-4.6000000,Z=25.5000000)
	SightPivot=(Pitch=350,Yaw=-48,Roll=-500)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-2500,Roll=0)
	RootAdjust=(Pitch=2000,Yaw=-375,Roll=0)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="ShortBarrel",Slot=51,Scale=0.0000000)
	ViewOffset=(X=10.0000000,Y=22.0000000,Z=-16.0000000)
	WeaponName="D49 .44 Magnum Revolver"
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BallisticProV55.D49WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.D49WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.D49WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.D49WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.D49WeaponParamsRealistic.RealisticParams_Scope'
begin object name="RealisticParams_Scope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="4X Scope"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=50.0000000,Y=-0.5000000,Z=10.0000000)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="ShortBarrel",Slot=51,Scale=0.0000000)
	ViewOffset=(X=10.0000000,Y=22.0000000,Z=-16.0000000)
	WeaponName="D49 .44 Magnum Revolver (4X)"
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BallisticProV55.D49WeaponParamsRealistic.RealisticRecoilParams_Scope'
	AimParams[0]=AimParams'BallisticProV55.D49WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.D49WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.D49WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.D49WeaponParamsRealistic.D49_Silver'
begin object name="D49_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.D49WeaponParamsRealistic.D49_Black'
begin object name="D49_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.D49Camos.D49Black-Shine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
