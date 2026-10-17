class D49WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.D49WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Laser"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-11.0000000,Y=-4.6000000,Z=25.5000000)
		SightPivot=(Pitch=350,Yaw=-48,Roll=-500)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-2500,Roll=0)
		RootAdjust=(Pitch=2000,Yaw=-375,Roll=0)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="ShortBarrel",Slot=51,Scale=0.0000000)
		ViewOffset=(X=-7.0000000,Y=18.0000000,Z=-8.5000000)
		MagAmmo=6
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BallisticProV55.D49WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.D49WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.D49WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.D49WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BallisticProV55.D49WeaponParamsClassic.ClassicParams_Scope'
	begin object name="ClassicParams_Scope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="4X Scope"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=50.0000000,Y=-0.5000000,Z=10.0000000)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="ShortBarrel",Slot=51,Scale=0.0000000)
		ViewOffset=(X=-7.0000000,Y=18.0000000,Z=-8.5000000)
		MagAmmo=6
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BallisticProV55.D49WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.D49WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.D49WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.D49WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_Scope
	// Reference: WeaponCamo'BallisticProV55.D49WeaponParamsClassic.D49_Silver'
	begin object name="D49_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=D49_Silver
	// Reference: WeaponCamo'BallisticProV55.D49WeaponParamsClassic.D49_Black'
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
// Reference: AimParams'BallisticProV55.D49WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=1024)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.7000000
	ChaosSpeedThreshold=1100
end object
// Reference: RecoilParams'BallisticProV55.D49WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=8192.0000000
	DeclineTime=0.8000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.3000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BallisticProV55.D49WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=2
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.D49WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.D49WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	BurstFireRateFactor=1.0000000
	FireAnim="FireSingle"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.D49WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.D49WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=9000.0000000)
	WaterTraceRange=7200.0000000
	RangeAtten=0.8000000
	Damage=75
	HeadMult=1.5000000
	LimbMult=0.5000000
	DamageType=Class'BallisticProV55.DTD49Revolver'
	DamageTypeHead=Class'BallisticProV55.DTD49RevolverHead'
	DamageTypeArm=Class'BallisticProV55.DTD49Revolver'
	PenetrationEnergy=32.0000000
	PenetrateForce=200
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-FireSingle',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=4096.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=4,Y=4)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BallisticProV55.D49WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=9000.0000000)
	WaterTraceRange=7200.0000000
	RangeAtten=0.8000000
	Damage=150
	HeadMult=1.5000000
	LimbMult=0.5000000
	DamageType=Class'BallisticProV55.DTD49Revolver'
	DamageTypeHead=Class'BallisticProV55.DTD49RevolverHead'
	DamageTypeArm=Class'BallisticProV55.DTD49Revolver'
	PenetrationEnergy=32.0000000
	PenetrateForce=200
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=4096.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=4,Y=4)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: WeaponParams'BallisticProV55.D49WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Laser"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-11.0000000,Y=-4.6000000,Z=25.5000000)
	SightPivot=(Pitch=350,Yaw=-48,Roll=-500)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-2500,Roll=0)
	RootAdjust=(Pitch=2000,Yaw=-375,Roll=0)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="ShortBarrel",Slot=51,Scale=0.0000000)
	ViewOffset=(X=-7.0000000,Y=18.0000000,Z=-8.5000000)
	MagAmmo=6
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BallisticProV55.D49WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.D49WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.D49WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.D49WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.D49WeaponParamsClassic.ClassicParams_Scope'
begin object name="ClassicParams_Scope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="4X Scope"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=50.0000000,Y=-0.5000000,Z=10.0000000)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="ShortBarrel",Slot=51,Scale=0.0000000)
	ViewOffset=(X=-7.0000000,Y=18.0000000,Z=-8.5000000)
	MagAmmo=6
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BallisticProV55.D49WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.D49WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.D49WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.D49WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.D49WeaponParamsClassic.D49_Silver'
begin object name="D49_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.D49WeaponParamsClassic.D49_Black'
begin object name="D49_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.D49Camos.D49Black-Shine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
