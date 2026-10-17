class M290WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M290WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		ViewOffset=(X=14.0000000,Y=8.0000000,Z=-13.0000000)
		WeaponName="M290 12ga Double-Shotgun"
		MagAmmo=8
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M290WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M290WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.M290WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M290WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsRealistic.M290_Yellow'
	begin object name="M290_Yellow" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Yellow"
	end object
	Camos[0]=M290_Yellow
	// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsRealistic.M290_Dark'
	begin object name="M290_Dark" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Dark Orange"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M290Camos.MiniThorSkin",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=M290_Dark
	// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsRealistic.M290_Retro'
	begin object name="M290_Retro" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Retro Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M290Camos.M290_SH1",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=M290_Retro
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ShotgunEffectParams'BallisticProV55.M290WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=16
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=600.0000000,Max=3000.0000000)
	WaterTraceRange=5000.0000000
	Damage=18
	HeadMult=2.1500000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTM290Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM290ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM290Shotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=10
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M290.M290Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	Chaos=0.2400000
	Inaccuracy=(X=950,Y=800)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.M290WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	AmmoPerFire=2
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireAnimRate=1.3500000
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.M290WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BallisticProV55.M290WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=8
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=600.0000000,Max=3000.0000000)
	WaterTraceRange=5000.0000000
	Damage=18
	HeadMult=2.1500000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTM290Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM290ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM290Shotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=10
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=3.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M290.M290SingleFire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=0.1200000
	Inaccuracy=(X=800,Y=800)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.M290WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireAnim="FireRight"
	FireAnimRate=1.8500000
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.M290WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.M290WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.8000000),(InVal=0.8500000,OutVal=-0.5000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YawFactor=0.2500000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=1536.0000000
	DeclineTime=0.5500000
	DeclineDelay=0.1650000
	ViewBindFactor=0.7000000
	ADSViewBindFactor=0.7000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.M290WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=1792)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3072,Yaw=-9000,Roll=0)
	JumpOffset=(Pitch=2000,Yaw=-5000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=1.0000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.1000000
	ChaosSpeedThreshold=550
end object
// Reference: WeaponParams'BallisticProV55.M290WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	ViewOffset=(X=14.0000000,Y=8.0000000,Z=-13.0000000)
	WeaponName="M290 12ga Double-Shotgun"
	MagAmmo=8
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M290WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M290WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.M290WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M290WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsRealistic.M290_Yellow'
begin object name="M290_Yellow" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Yellow"
end object
// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsRealistic.M290_Dark'
begin object name="M290_Dark" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Dark Orange"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M290Camos.MiniThorSkin",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsRealistic.M290_Retro'
begin object name="M290_Retro" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Retro Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M290Camos.M290_SH1",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
