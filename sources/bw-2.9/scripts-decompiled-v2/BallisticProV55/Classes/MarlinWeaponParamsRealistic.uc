class MarlinWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Iron Sights"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2200000
		SightOffset=(X=6.0000000,Y=-0.0400000,Z=2.8500000)
		WeaponBoneScales[0]=(BoneName="Gauss",Slot=19,Scale=0.0000000)
		WeaponName="Redwood 7000 .400 'Bearmaster' (Gauss)"
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		MagAmmo=7
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Lever Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryFireParams_Quick'
		AltFireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticParams_Gauss'
	begin object name="RealisticParams_Gauss" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Gauss Mod"
		LayoutTags="gauss"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2200000
		SightOffset=(X=6.0000000,Y=-0.0200000,Z=5.5000000)
		WeaponBoneScales[0]=(BoneName="Gauss",Slot=19,Scale=1.0000000)
		WeaponName="Redwood 7000 .400 'Bearmaster'"
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		MagAmmo=7
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Lever Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Accelerated Shot",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryFireParams_Gauss'
		AltFireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_Gauss
	// Reference: WeaponParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticParams_AdvSupp'
	begin object name="RealisticParams_AdvSupp" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Tac Supp"
		LayoutTags="laser"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2200000
		SightOffset=(X=20.0000000,Y=-0.0200000,Z=3.6500000)
		WeaponBoneScales[0]=(BoneName="Gauss",Slot=19,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Suppressor",Slot=20,Scale=1.0000000)
		ViewOffset=(X=0.0000000,Y=10.0000000,Z=-10.0000000)
		WeaponName="Redwood 7000 .400 'Bearmaster' (Sil)"
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.MarlinIvory_FPm'
		AllowedCamos[0]=4
		AllowedCamos[1]=5
		AllowedCamos[2]=6
		MagAmmo=7
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Lever Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
		AltFireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[2]=RealisticParams_AdvSupp
	// Reference: WeaponParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticParams_AdvScope'
	begin object name="RealisticParams_AdvScope" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Tac Scope"
		LayoutTags="laser"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2700000
		SightOffset=(X=30.0000000,Y=0.0000000,Z=9.4000000)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="Gauss",Slot=19,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Suppressor",Slot=20,Scale=-1.0000000)
		ViewOffset=(X=0.0000000,Y=10.0000000,Z=-10.0000000)
		WeaponName="Redwood 7000 .400 'Bearmaster' (4X)"
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.MarlinIvory_FPm'
		AllowedCamos[0]=4
		AllowedCamos[1]=5
		AllowedCamos[2]=6
		MagAmmo=7
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Lever Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticRecoilParams_Scope'
		AimParams[0]=AimParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryFireParams_Carbine'
		AltFireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[3]=RealisticParams_AdvScope
	// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsRealistic.Deer_Wood'
	begin object name="Deer_Wood" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	end object
	Camos[0]=Deer_Wood
	// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsRealistic.Deer_Redwood'
	begin object name="Deer_Redwood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Redwood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MarlinCamos.MarlinK-Shiny",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=Deer_Redwood
	// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsRealistic.Deer_Orange'
	begin object name="Deer_Orange" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MarlinCamos.DeermasterOrange-Main-Shine",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=Deer_Orange
	// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsRealistic.Deer_Gold'
	begin object name="Deer_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MarlinCamos.MarlinGold-Shine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=Deer_Gold
	// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsRealistic.Deer_AdvBlack'
	begin object name="Deer_AdvBlack" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blued"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_Black_SH',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_ammo_SH',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_glass_SH',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=FinalBlend'BW_Core_WeaponTex.Marlin.Ivory_UT2_beam_FB',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_RED_SH',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
		Index=4
	end object
	Camos[4]=Deer_AdvBlack
	// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsRealistic.Deer_AdvCarbon'
	begin object name="Deer_AdvCarbon" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Carbon"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MarlinCamos.Ivory_UT2_Carbon_SH",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_ammo_SH',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_glass_SH',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=FinalBlend'BW_Core_WeaponTex.Marlin.Ivory_UT2_beam_FB',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_RED_SH',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
		Index=5
	end object
	Camos[5]=Deer_AdvCarbon
	// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsRealistic.Deer_AdvGold'
	begin object name="Deer_AdvGold" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MarlinCamos.Ivory_UT2_body_SH",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_ammo_SH',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_glass_SH',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=FinalBlend'BW_Core_WeaponTex.Marlin.Ivory_UT2_beam_FB',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_RED_SH',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
		Index=6
	end object
	Camos[6]=Deer_AdvGold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4500000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	PreFireAnim="PrepSwipe"
	FireAnim="Swipe"
	PreFireAnimRate=2.0000000
	FireAnimRate=2.5000000
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: AimParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=1280)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3072,Yaw=-5120,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=0,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.2000000
	FallingChaos=0.1000000
	SprintChaos=0.2000000
	ChaosDeclineTime=0.6500000
	ChaosSpeedThreshold=600
end object
// Reference: RecoilParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=1536.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.2000000
	ViewBindFactor=0.3000000
	ADSViewBindFactor=0.3000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: InstantEffectParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=6000.0000000,Max=6000.0000000)
	WaterTraceRange=180.0000000
	DecayRange=(Min=1500.0000000,Max=6000.0000000)
	Damage=112
	LimbMult=0.6500000
	DamageType=Class'BallisticProV55.DTMarlinRifle'
	DamageTypeHead=Class'BallisticProV55.DTMarlinRifleHead'
	DamageTypeArm=Class'BallisticProV55.DTMarlinRifle'
	PenetrationEnergy=15.0000000
	PenetrateForce=80
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FlashScaleFactor=1.6000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Marlin.Mar-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=9,Y=9)
	BotRefireRate=0.3000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=3.0000000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryFireParams_Quick'
begin object name="RealisticPrimaryFireParams_Quick" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=1.1500000
	AimedFireAnim="SightFireCock"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryEffectParams_Gauss'
begin object name="RealisticPrimaryEffectParams_Gauss" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=6000.0000000,Max=6000.0000000)
	WaterTraceRange=180.0000000
	DecayRange=(Min=1500.0000000,Max=6000.0000000)
	Damage=132
	LimbMult=0.6500000
	DamageType=Class'BallisticProV55.DTMarlinRifle_Gauss'
	DamageTypeHead=Class'BallisticProV55.DTMarlinRifleHead_Gauss'
	DamageTypeArm=Class'BallisticProV55.DTMarlinRifle_Gauss'
	PenetrationEnergy=15.0000000
	PenetrateForce=80
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FlashScaleFactor=1.6000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Marlin.Mar-GFire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1836.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=9,Y=9)
	BotRefireRate=0.3000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryFireParams_Gauss'
begin object name="RealisticPrimaryFireParams_Gauss" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=3.0000000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryEffectParams_Gauss'
end object
// Reference: InstantEffectParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryEffectParams_Carbine'
begin object name="RealisticPrimaryEffectParams_Carbine" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=6000.0000000,Max=6000.0000000)
	WaterTraceRange=180.0000000
	DecayRange=(Min=1500.0000000,Max=6000.0000000)
	Damage=112
	LimbMult=0.6500000
	DamageType=Class'BallisticProV55.DTMarlinRifle'
	DamageTypeHead=Class'BallisticProV55.DTMarlinRifleHead'
	DamageTypeArm=Class'BallisticProV55.DTMarlinRifle'
	PenetrationEnergy=15.0000000
	PenetrateForce=80
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FlashScaleFactor=1.6000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.Marlin.Mar-HFire',Volume=1.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=9,Y=9)
	BotRefireRate=0.3000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryFireParams_Carbine'
begin object name="RealisticPrimaryFireParams_Carbine" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=3.0000000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryEffectParams_Carbine'
end object
// Reference: InstantEffectParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryEffectParams_Supp'
begin object name="RealisticPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=6000.0000000,Max=6000.0000000)
	WaterTraceRange=180.0000000
	DecayRange=(Min=1500.0000000,Max=6000.0000000)
	Damage=112
	LimbMult=0.6500000
	DamageType=Class'BallisticProV55.DTMarlinRifle'
	DamageTypeHead=Class'BallisticProV55.DTMarlinRifleHead'
	DamageTypeArm=Class'BallisticProV55.DTMarlinRifle'
	PenetrationEnergy=15.0000000
	PenetrateForce=80
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.Marlin.Mar-SFire',Volume=1.1000000,Radius=192.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=1336.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=8,Y=8)
	BotRefireRate=0.3000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
begin object name="RealisticPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=1.1000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=0.9000000
	AimedFireAnim="SightFireCock"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryEffectParams_Supp'
end object
// Reference: MeleeEffectParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=72.0000000,Max=72.0000000)
	WaterTraceRange=5000.0000000
	Damage=54
	HeadMult=2.1296290
	LimbMult=0.4629620
	DamageType=Class'BallisticProV55.DTMarlinMelee'
	DamageTypeHead=Class'BallisticProV55.DTMarlinMeleeHead'
	DamageTypeArm=Class'BallisticProV55.DTMarlinMelee'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Marlin.Mar-Melee',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.0500000
end object
// Reference: RecoilParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticRecoilParams_Scope'
begin object name="RealisticRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=1536.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.2000000
	ViewBindFactor=0.3000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: WeaponParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Iron Sights"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2200000
	SightOffset=(X=6.0000000,Y=-0.0400000,Z=2.8500000)
	WeaponBoneScales[0]=(BoneName="Gauss",Slot=19,Scale=0.0000000)
	WeaponName="Redwood 7000 .400 'Bearmaster' (Gauss)"
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	MagAmmo=7
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Lever Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryFireParams_Quick'
	AltFireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticParams_Gauss'
begin object name="RealisticParams_Gauss" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Gauss Mod"
	LayoutTags="gauss"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2200000
	SightOffset=(X=6.0000000,Y=-0.0200000,Z=5.5000000)
	WeaponBoneScales[0]=(BoneName="Gauss",Slot=19,Scale=1.0000000)
	WeaponName="Redwood 7000 .400 'Bearmaster'"
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	MagAmmo=7
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Lever Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Accelerated Shot",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryFireParams_Gauss'
	AltFireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticParams_AdvSupp'
begin object name="RealisticParams_AdvSupp" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Tac Supp"
	LayoutTags="laser"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2200000
	SightOffset=(X=20.0000000,Y=-0.0200000,Z=3.6500000)
	WeaponBoneScales[0]=(BoneName="Gauss",Slot=19,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Suppressor",Slot=20,Scale=1.0000000)
	ViewOffset=(X=0.0000000,Y=10.0000000,Z=-10.0000000)
	WeaponName="Redwood 7000 .400 'Bearmaster' (Sil)"
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.MarlinIvory_FPm'
	AllowedCamos[0]=4
	AllowedCamos[1]=5
	AllowedCamos[2]=6
	MagAmmo=7
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Lever Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
	AltFireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticParams_AdvScope'
begin object name="RealisticParams_AdvScope" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Tac Scope"
	LayoutTags="laser"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2700000
	SightOffset=(X=30.0000000,Y=0.0000000,Z=9.4000000)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="Gauss",Slot=19,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Suppressor",Slot=20,Scale=-1.0000000)
	ViewOffset=(X=0.0000000,Y=10.0000000,Z=-10.0000000)
	WeaponName="Redwood 7000 .400 'Bearmaster' (4X)"
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.MarlinIvory_FPm'
	AllowedCamos[0]=4
	AllowedCamos[1]=5
	AllowedCamos[2]=6
	MagAmmo=7
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Lever Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticRecoilParams_Scope'
	AimParams[0]=AimParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticPrimaryFireParams_Carbine'
	AltFireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsRealistic.Deer_Wood'
begin object name="Deer_Wood" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
end object
// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsRealistic.Deer_Redwood'
begin object name="Deer_Redwood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Redwood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MarlinCamos.MarlinK-Shiny",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsRealistic.Deer_Orange'
begin object name="Deer_Orange" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MarlinCamos.DeermasterOrange-Main-Shine",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsRealistic.Deer_Gold'
begin object name="Deer_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MarlinCamos.MarlinGold-Shine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsRealistic.Deer_AdvBlack'
begin object name="Deer_AdvBlack" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blued"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_Black_SH',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_ammo_SH',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_glass_SH',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=FinalBlend'BW_Core_WeaponTex.Marlin.Ivory_UT2_beam_FB',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_RED_SH',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsRealistic.Deer_AdvCarbon'
begin object name="Deer_AdvCarbon" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Carbon"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MarlinCamos.Ivory_UT2_Carbon_SH",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_ammo_SH',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_glass_SH',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=FinalBlend'BW_Core_WeaponTex.Marlin.Ivory_UT2_beam_FB',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_RED_SH',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsRealistic.Deer_AdvGold'
begin object name="Deer_AdvGold" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MarlinCamos.Ivory_UT2_body_SH",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_ammo_SH',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_glass_SH',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=FinalBlend'BW_Core_WeaponTex.Marlin.Ivory_UT2_beam_FB',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.Marlin.Ivory_UT2_RED_SH',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
	Index=6
end object
