class leMatWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="20ga Shot"
		InventorySize=2
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
		SightPivot=(Pitch=512,Yaw=0,Roll=-50)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
		DisplaceDurationMult=0.5000000
		MagAmmo=9
		RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsComp.ArenaParams_Slug'
	begin object name="ArenaParams_Slug" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="20ga Slug"
		LayoutTags="slug"
		InventorySize=2
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
		SightPivot=(Pitch=512,Yaw=0,Roll=-50)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
		DisplaceDurationMult=0.5000000
		MagAmmo=9
		RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsComp.ArenaSecondaryFireParams_Slug'
	end object
	Layouts[1]=ArenaParams_Slug
	// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsComp.ArenaParams_Decoy'
	begin object name="ArenaParams_Decoy" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Noisemaker"
		LayoutTags="decoy"
		InventorySize=2
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
		SightPivot=(Pitch=512,Yaw=0,Roll=-50)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
		DisplaceDurationMult=0.5000000
		MagAmmo=9
		RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsComp.ArenaSecondaryFireParams_Decoy'
	end object
	Layouts[2]=ArenaParams_Decoy
	// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsComp.LeMat_Engraved'
	begin object name="LeMat_Engraved" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Engraved"
	end object
	Camos[0]=LeMat_Engraved
	// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsComp.LeMat_Rusted'
	begin object name="LeMat_Rusted" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Rusted"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMattBR-Main1-Shine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMattBR-Main2-Shine",Index=2,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=LeMat_Rusted
	// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsComp.LeMat_Black'
	begin object name="LeMat_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Blued"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMat-MainBlue",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=LeMat_Black
	// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsComp.LeMat_Chrome'
	begin object name="LeMat_Chrome" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Chrome"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMat-MainChromeShine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=1)
		Index=3
	end object
	Camos[3]=LeMat_Chrome
	// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsComp.LeMat_Gold'
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
// Reference: FireParams'BallisticProV55.leMatWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3200000
	FireEndAnim="None"
	FireAnimRate=1.5000000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.leMatWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.leMatWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.3600000,OutVal=0.0700000),(InVal=0.6200000,OutVal=0.0900000),(InVal=0.6000000,OutVal=0.1100000),(InVal=1.0000000,OutVal=0.1500000)))
	XRandFactor=0.1500000
	YRandFactor=0.1500000
	ClimbTime=0.0800000
	DeclineTime=0.5000000
	DeclineDelay=0.2500000
	ViewBindFactor=0.6000000
end object
// Reference: AimParams'BallisticProV55.leMatWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	ADSMultiplier=2.0000000
	ChaosDeclineTime=0.4500000
end object
// Reference: InstantEffectParams'BallisticProV55.leMatWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=8000.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.5000000
	Damage=38
	DamageType=Class'BallisticProV55.DTleMatRevolver'
	DamageTypeHead=Class'BallisticProV55.DTleMatrevolverHead'
	DamageTypeArm=Class'BallisticProV55.DTleMatRevolver'
	PenetrationEnergy=24.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.leMat.LM-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=800.0000000
	Chaos=0.0400000
	BotRefireRate=0.9000000
	WarnTargetPct=0.3500000
end object
// Reference: ShotgunEffectParams'BallisticProV55.leMatWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2500.0000000,Max=2500.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.5000000
	Damage=7
	DamageType=Class'BallisticProV55.DTleMatShotgun'
	DamageTypeHead=Class'BallisticProV55.DTleMatShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTleMatShotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.leMat.LM-SecFire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	Chaos=0.3000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.leMatWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0000000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.leMatWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: ShotgunEffectParams'BallisticProV55.leMatWeaponParamsComp.ArenaSecondaryEffectParams_Slug'
begin object name="ArenaSecondaryEffectParams_Slug" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2500.0000000,Max=2500.0000000)
	DecayRange=(Min=1050.0000000,Max=3150.0000000)
	RangeAtten=0.5000000
	Damage=60
	DamageType=Class'BallisticProV55.DTleMatShotgun'
	DamageTypeHead=Class'BallisticProV55.DTleMatShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTleMatShotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.leMat.LM-SecFireSlug',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	Chaos=0.3000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.leMatWeaponParamsComp.ArenaSecondaryFireParams_Slug'
begin object name="ArenaSecondaryFireParams_Slug" class=BCoreProV55.FireParams
	FireInterval=0.0000000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.leMatWeaponParamsComp.ArenaSecondaryEffectParams_Slug'
end object
// Reference: ShotgunEffectParams'BallisticProV55.leMatWeaponParamsComp.ArenaSecondaryEffectParams_Decoy'
begin object name="ArenaSecondaryEffectParams_Decoy" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	ImpactManager=Class'BallisticProV55.IM_Decoy'
	TraceRange=(Min=3150.0000000,Max=3150.0000000)
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
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.leMatWeaponParamsComp.ArenaSecondaryFireParams_Decoy'
begin object name="ArenaSecondaryFireParams_Decoy" class=BCoreProV55.FireParams
	FireInterval=0.0000000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.leMatWeaponParamsComp.ArenaSecondaryEffectParams_Decoy'
end object
// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="20ga Shot"
	InventorySize=2
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
	SightPivot=(Pitch=512,Yaw=0,Roll=-50)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
	DisplaceDurationMult=0.5000000
	MagAmmo=9
	RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsComp.ArenaParams_Slug'
begin object name="ArenaParams_Slug" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="20ga Slug"
	LayoutTags="slug"
	InventorySize=2
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
	SightPivot=(Pitch=512,Yaw=0,Roll=-50)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
	DisplaceDurationMult=0.5000000
	MagAmmo=9
	RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsComp.ArenaSecondaryFireParams_Slug'
end object
// Reference: WeaponParams'BallisticProV55.leMatWeaponParamsComp.ArenaParams_Decoy'
begin object name="ArenaParams_Decoy" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Noisemaker"
	LayoutTags="decoy"
	InventorySize=2
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
	SightPivot=(Pitch=512,Yaw=0,Roll=-50)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
	DisplaceDurationMult=0.5000000
	MagAmmo=9
	RecoilParams[0]=RecoilParams'BallisticProV55.leMatWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.leMatWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.leMatWeaponParamsComp.ArenaSecondaryFireParams_Decoy'
end object
// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsComp.LeMat_Engraved'
begin object name="LeMat_Engraved" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Engraved"
end object
// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsComp.LeMat_Rusted'
begin object name="LeMat_Rusted" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Rusted"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMattBR-Main1-Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMattBR-Main2-Shine",Index=2,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsComp.LeMat_Black'
begin object name="LeMat_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Blued"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMat-MainBlue",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsComp.LeMat_Chrome'
begin object name="LeMat_Chrome" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Chrome"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMat-MainChromeShine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.leMatWeaponParamsComp.LeMat_Gold'
begin object name="LeMat_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LeMattCamos.LeMat-MainGoldShine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=1)
	Index=4
end object
