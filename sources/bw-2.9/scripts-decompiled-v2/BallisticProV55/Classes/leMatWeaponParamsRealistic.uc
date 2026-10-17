class leMatWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="20ga Shot"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		WeaponPrice=9000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1400000
		SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
		SightPivot=(Pitch=512,Yaw=0,Roll=-50)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
		ViewPivot=(Pitch=512,Yaw=0,Roll=0)
		MagAmmo=9
		RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticParams_Slug'
	begin object name="RealisticParams_Slug" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="20ga Slug"
		LayoutTags="slug"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		WeaponPrice=9000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1400000
		SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
		SightPivot=(Pitch=512,Yaw=0,Roll=-50)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
		ViewPivot=(Pitch=512,Yaw=0,Roll=0)
		MagAmmo=9
		RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticSecondaryFireParams_Slug'
	end object
	Layouts[1]=RealisticParams_Slug
	// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticParams_Decoy'
	begin object name="RealisticParams_Decoy" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Noisemaker"
		LayoutTags="decoy"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		WeaponPrice=9000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1400000
		SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
		SightPivot=(Pitch=512,Yaw=0,Roll=-50)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
		ViewPivot=(Pitch=512,Yaw=0,Roll=0)
		MagAmmo=9
		RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticSecondaryFireParams_Decoy'
	end object
	Layouts[2]=RealisticParams_Decoy
	// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsRealistic.LeMat_Engraved'
	begin object name="LeMat_Engraved" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Engraved"
	end object
	Camos[0]=LeMat_Engraved
	// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsRealistic.LeMat_Rusted'
	begin object name="LeMat_Rusted" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Rusted"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMattBR-Main1-Shine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMattBR-Main2-Shine",Index=2,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=LeMat_Rusted
	// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsRealistic.LeMat_Black'
	begin object name="LeMat_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Blued"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMat-MainBlue",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=LeMat_Black
	// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsRealistic.LeMat_Chrome'
	begin object name="LeMat_Chrome" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Chrome"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMat-MainChromeShine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=1)
		Index=3
	end object
	Camos[3]=LeMat_Chrome
	// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsRealistic.LeMat_Gold'
	begin object name="LeMat_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMat-MainGoldShine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=1)
		Index=4
	end object
	Camos[4]=LeMat_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2400000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.9000000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.6000000,OutVal=0.4000000),(InVal=7.0000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.5000000)))
	PitchFactor=0.6000000
	YawFactor=0.2000000
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=1840.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.1450000
	ViewBindFactor=0.3000000
	ADSViewBindFactor=0.3000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticAimParams'
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
	ChaosTurnThreshold=200000
end object
// Reference: InstantEffectParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1000.0000000,Max=5000.0000000)
	WaterTraceRange=5000.0000000
	Damage=51
	HeadMult=2.2549010
	LimbMult=0.6470580
	DamageType=Class'BallisticProV55.DTleMatRevolver'
	DamageTypeHead=Class'BallisticProV55.DTleMatrevolverHead'
	DamageTypeArm=Class'BallisticProV55.DTleMatRevolver'
	PenetrationEnergy=11.0000000
	PenetrateForce=40
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.leMat.LM-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=800.0000000
	Chaos=0.0800000
	Inaccuracy=(X=8,Y=8)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: ShotgunEffectParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=9
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=600.0000000,Max=3000.0000000)
	WaterTraceRange=5000.0000000
	Damage=20
	HeadMult=2.0500000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTleMatShotgun'
	DamageTypeHead=Class'BallisticProV55.DTleMatShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTleMatShotgun'
	PenetrationEnergy=5.0000000
	PenetrateForce=8
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.leMat.LM-SecFire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	Chaos=0.2400000
	Inaccuracy=(X=1100,Y=1100)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	BurstFireRateFactor=1.0000000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: ShotgunEffectParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticSecondaryEffectParams_Slug'
begin object name="RealisticSecondaryEffectParams_Slug" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=3150.0000000,Max=3150.0000000)
	DecayRange=(Min=1050.0000000,Max=3150.0000000)
	RangeAtten=0.5000000
	Damage=75
	HeadMult=3.2500000
	DamageType=Class'BallisticProV55.DTleMatShotgun'
	DamageTypeHead=Class'BallisticProV55.DTleMatShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTleMatShotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.leMat.LM-SecFireSlug',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2036.0000000
	Chaos=0.3000000
	Inaccuracy=(X=64,Y=64)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticSecondaryFireParams_Slug'
begin object name="RealisticSecondaryFireParams_Slug" class=BCoreProV55.FireParams
	FireInterval=0.0000000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticSecondaryEffectParams_Slug'
end object
// Reference: ShotgunEffectParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticSecondaryEffectParams_Decoy'
begin object name="RealisticSecondaryEffectParams_Decoy" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	ImpactManager=Class'BallisticProV55.IM_Decoy'
	TraceRange=(Min=2500.0000000,Max=2500.0000000)
	DecayRange=(Min=1050.0000000,Max=3150.0000000)
	RangeAtten=0.5000000
	Damage=35
	HeadMult=3.2500000
	DamageType=Class'BallisticProV55.DTleMatShotgun'
	DamageTypeHead=Class'BallisticProV55.DTleMatShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTleMatShotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_FireDart',Volume=0.7000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.3000000
	Inaccuracy=(X=64,Y=64)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticSecondaryFireParams_Decoy'
begin object name="RealisticSecondaryFireParams_Decoy" class=BCoreProV55.FireParams
	FireInterval=0.0000000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticSecondaryEffectParams_Decoy'
end object
// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="20ga Shot"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	WeaponPrice=9000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1400000
	SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
	SightPivot=(Pitch=512,Yaw=0,Roll=-50)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
	ViewPivot=(Pitch=512,Yaw=0,Roll=0)
	MagAmmo=9
	RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticParams_Slug'
begin object name="RealisticParams_Slug" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="20ga Slug"
	LayoutTags="slug"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	WeaponPrice=9000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1400000
	SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
	SightPivot=(Pitch=512,Yaw=0,Roll=-50)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
	ViewPivot=(Pitch=512,Yaw=0,Roll=0)
	MagAmmo=9
	RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticSecondaryFireParams_Slug'
end object
// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticParams_Decoy'
begin object name="RealisticParams_Decoy" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Noisemaker"
	LayoutTags="decoy"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	WeaponPrice=9000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1400000
	SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
	SightPivot=(Pitch=512,Yaw=0,Roll=-50)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
	ViewPivot=(Pitch=512,Yaw=0,Roll=0)
	MagAmmo=9
	RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsRealistic.RealisticSecondaryFireParams_Decoy'
end object
// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsRealistic.LeMat_Engraved'
begin object name="LeMat_Engraved" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Engraved"
end object
// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsRealistic.LeMat_Rusted'
begin object name="LeMat_Rusted" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Rusted"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMattBR-Main1-Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMattBR-Main2-Shine",Index=2,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsRealistic.LeMat_Black'
begin object name="LeMat_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Blued"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMat-MainBlue",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsRealistic.LeMat_Chrome'
begin object name="LeMat_Chrome" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Chrome"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMat-MainChromeShine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsRealistic.LeMat_Gold'
begin object name="LeMat_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMat-MainGoldShine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=1)
	Index=4
end object
