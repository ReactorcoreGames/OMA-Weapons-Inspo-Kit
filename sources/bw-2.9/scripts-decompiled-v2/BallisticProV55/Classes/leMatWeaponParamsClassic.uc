class leMatWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="20ga Shot"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
		SightPivot=(Pitch=512,Yaw=0,Roll=-50)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
		ViewOffset=(X=-2.0000000,Y=10.0000000,Z=-8.5000000)
		MagAmmo=9
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsClassic.ClassicParams_Slug'
	begin object name="ClassicParams_Slug" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="20ga Slug"
		LayoutTags="slug"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
		SightPivot=(Pitch=512,Yaw=0,Roll=-50)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
		ViewOffset=(X=-2.0000000,Y=10.0000000,Z=-8.5000000)
		MagAmmo=9
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsClassic.ClassicSecondaryFireParams_Slug'
	end object
	Layouts[1]=ClassicParams_Slug
	// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsClassic.ClassicParams_Decoy'
	begin object name="ClassicParams_Decoy" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Noisemaker"
		LayoutTags="decoy"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
		SightPivot=(Pitch=512,Yaw=0,Roll=-50)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
		ViewOffset=(X=-2.0000000,Y=10.0000000,Z=-8.5000000)
		MagAmmo=9
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsClassic.ClassicSecondaryFireParams_Decoy'
	end object
	Layouts[2]=ClassicParams_Decoy
	// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsClassic.LeMat_Engraved'
	begin object name="LeMat_Engraved" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Engraved"
	end object
	Camos[0]=LeMat_Engraved
	// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsClassic.LeMat_Rusted'
	begin object name="LeMat_Rusted" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Rusted"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMattBR-Main1-Shine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMattBR-Main2-Shine",Index=2,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=LeMat_Rusted
	// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsClassic.LeMat_Black'
	begin object name="LeMat_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Blued"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMat-MainBlue",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=LeMat_Black
	// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsClassic.LeMat_Chrome'
	begin object name="LeMat_Chrome" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Chrome"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMat-MainChromeShine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=1)
		Index=3
	end object
	Camos[3]=LeMat_Chrome
	// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsClassic.LeMat_Gold'
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
// Reference: FireParams'BallisticProV55.leMatWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.leMatWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.leMatWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=8192.0000000
	DeclineTime=0.8000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.leMatWeaponParamsClassic.ClassicAimParams'
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
	ChaosSpeedThreshold=1200
	ChaosTurnThreshold=200000
end object
// Reference: InstantEffectParams'BallisticProV55.leMatWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=8000.0000000)
	WaterTraceRange=6400.0000000
	Damage=60
	HeadMult=1.7000000
	LimbMult=0.4000000
	DamageType=Class'BallisticProV55.DTleMatRevolver'
	DamageTypeHead=Class'BallisticProV55.DTleMatrevolverHead'
	DamageTypeArm=Class'BallisticProV55.DTleMatRevolver'
	PenetrationEnergy=24.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.leMat.LM-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1600.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=16,Y=16)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: ShotgunEffectParams'BallisticProV55.leMatWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=9
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=1500.0000000,Max=5000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.3000000
	Damage=22
	HeadMult=1.4000000
	LimbMult=0.3000000
	DamageType=Class'BallisticProV55.DTleMatShotgun'
	DamageTypeHead=Class'BallisticProV55.DTleMatShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTleMatShotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter_C'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.leMat.LM-SecFire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=500,Y=500)
	SpreadMode=2
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.leMatWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	BurstFireRateFactor=1.0000000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.leMatWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: ShotgunEffectParams'BallisticProV55.leMatWeaponParamsClassic.ClassicSecondaryEffectParams_Slug'
begin object name="ClassicSecondaryEffectParams_Slug" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	ImpactManager=Class'BallisticProV55.IM_BigBulletHMG'
	TraceRange=(Min=4500.0000000,Max=4500.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.3000000
	Damage=85
	HeadMult=1.5000000
	LimbMult=0.5000000
	DamageType=Class'BallisticProV55.DTleMatShotgun'
	DamageTypeHead=Class'BallisticProV55.DTleMatShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTleMatShotgun'
	PenetrationEnergy=32.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter_C'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.leMat.LM-SecFireSlug',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=32,Y=32)
	SpreadMode=2
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.leMatWeaponParamsClassic.ClassicSecondaryFireParams_Slug'
begin object name="ClassicSecondaryFireParams_Slug" class=BCoreProV55.FireParams
	BurstFireRateFactor=1.0000000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.leMatWeaponParamsClassic.ClassicSecondaryEffectParams_Slug'
end object
// Reference: ShotgunEffectParams'BallisticProV55.leMatWeaponParamsClassic.ClassicSecondaryEffectParams_Decoy'
begin object name="ClassicSecondaryEffectParams_Decoy" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	ImpactManager=Class'BallisticProV55.IM_Decoy'
	TraceRange=(Min=4500.0000000,Max=4500.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.3000000
	Damage=45
	HeadMult=1.5000000
	LimbMult=0.5000000
	DamageType=Class'BallisticProV55.DTleMatShotgun'
	DamageTypeHead=Class'BallisticProV55.DTleMatShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTleMatShotgun'
	PenetrationEnergy=32.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter_C'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_FireDart',Volume=0.7000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=256.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=32,Y=32)
	SpreadMode=2
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.leMatWeaponParamsClassic.ClassicSecondaryFireParams_Decoy'
begin object name="ClassicSecondaryFireParams_Decoy" class=BCoreProV55.FireParams
	BurstFireRateFactor=1.0000000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.leMatWeaponParamsClassic.ClassicSecondaryEffectParams_Decoy'
end object
// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="20ga Shot"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
	SightPivot=(Pitch=512,Yaw=0,Roll=-50)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
	ViewOffset=(X=-2.0000000,Y=10.0000000,Z=-8.5000000)
	MagAmmo=9
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsClassic.ClassicParams_Slug'
begin object name="ClassicParams_Slug" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="20ga Slug"
	LayoutTags="slug"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
	SightPivot=(Pitch=512,Yaw=0,Roll=-50)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
	ViewOffset=(X=-2.0000000,Y=10.0000000,Z=-8.5000000)
	MagAmmo=9
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsClassic.ClassicSecondaryFireParams_Slug'
end object
// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsClassic.ClassicParams_Decoy'
begin object name="ClassicParams_Decoy" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Noisemaker"
	LayoutTags="decoy"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
	SightPivot=(Pitch=512,Yaw=0,Roll=-50)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
	ViewOffset=(X=-2.0000000,Y=10.0000000,Z=-8.5000000)
	MagAmmo=9
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsClassic.ClassicSecondaryFireParams_Decoy'
end object
// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsClassic.LeMat_Engraved'
begin object name="LeMat_Engraved" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Engraved"
end object
// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsClassic.LeMat_Rusted'
begin object name="LeMat_Rusted" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Rusted"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMattBR-Main1-Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMattBR-Main2-Shine",Index=2,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsClassic.LeMat_Black'
begin object name="LeMat_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Blued"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMat-MainBlue",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsClassic.LeMat_Chrome'
begin object name="LeMat_Chrome" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Chrome"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMat-MainChromeShine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsClassic.LeMat_Gold'
begin object name="LeMat_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMat-MainGoldShine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=1)
	Index=4
end object
