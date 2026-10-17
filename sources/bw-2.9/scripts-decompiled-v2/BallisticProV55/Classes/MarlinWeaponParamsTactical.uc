class MarlinWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Iron Sights"
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.4000000
		SightOffset=(X=6.0000000,Y=-0.0400000,Z=2.8500000)
		WeaponBoneScales[0]=(BoneName="Gauss",Slot=19,Scale=0.0000000)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		MagAmmo=8
		WeaponModes[0]=(ModeName="Lever Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryFireParams_Quick'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalParams_Gauss'
	begin object name="TacticalParams_Gauss" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Gauss Mod"
		LayoutTags="gauss"
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.4000000
		SightOffset=(X=6.0000000,Y=-0.0600000,Z=6.3000000)
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Gauss",Slot=19,Scale=1.0000000)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		MagAmmo=8
		WeaponModes[0]=(ModeName="Lever Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Accelerated Shot",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalGaussFireParams'
	end object
	Layouts[1]=TacticalParams_Gauss
	// Reference: WeaponParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalParams_AdvSupp'
	begin object name="TacticalParams_AdvSupp" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Tac Supp"
		LayoutTags="laser"
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.4000000
		SightOffset=(X=20.0000000,Y=-0.0200000,Z=3.6500000)
		WeaponBoneScales[0]=(BoneName="Gauss",Slot=19,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Suppressor",Slot=20,Scale=1.0000000)
		ViewOffset=(X=0.0000000,Y=10.0000000,Z=-10.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.MarlinIvory_FPm'
		AllowedCamos[0]=4
		AllowedCamos[1]=5
		AllowedCamos[2]=6
		MagAmmo=8
		WeaponModes[0]=(ModeName="Lever Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryFireParams_Supp'
	end object
	Layouts[2]=TacticalParams_AdvSupp
	// Reference: WeaponParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalParams_AdvScope'
	begin object name="TacticalParams_AdvScope" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Tac 4X Scope"
		LayoutTags="laser"
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4500000
		SightOffset=(X=30.0000000,Y=0.0000000,Z=9.4000000)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="Gauss",Slot=19,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Suppressor",Slot=20,Scale=-1.0000000)
		ViewOffset=(X=0.0000000,Y=10.0000000,Z=-10.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.MarlinIvory_FPm'
		AllowedCamos[0]=4
		AllowedCamos[1]=5
		AllowedCamos[2]=6
		MagAmmo=8
		WeaponModes[0]=(ModeName="Lever Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalRecoilParams_Scope'
		AimParams[0]=AimParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalAimParams_Scope'
		FireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryFireParams_Carbine'
	end object
	Layouts[3]=TacticalParams_AdvScope
	// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsTactical.Deer_Wood'
	begin object name="Deer_Wood" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	end object
	Camos[0]=Deer_Wood
	// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsTactical.Deer_Redwood'
	begin object name="Deer_Redwood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Redwood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MarlinCamos.MarlinK-Shiny",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=Deer_Redwood
	// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsTactical.Deer_Orange'
	begin object name="Deer_Orange" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MarlinCamos.DeermasterOrange-Main-Shine",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=Deer_Orange
	// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsTactical.Deer_Gold'
	begin object name="Deer_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MarlinCamos.MarlinGold-Shine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=Deer_Gold
	// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsTactical.Deer_AdvBlack'
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
	// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsTactical.Deer_AdvCarbon'
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
	// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsTactical.Deer_AdvGold'
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
// Reference: RecoilParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.1200000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.7000000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	MaxRecoil=8192.0000000
	ClimbTime=0.0800000
	DeclineTime=1.0000000
	DeclineDelay=0.2500000
	ViewBindFactor=0.3000000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.0000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.6500000
	ChaosDeclineDelay=1.0000000
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DecayRange=(Min=2625.0000000,Max=6300.0000000)
	RangeAtten=0.7500000
	Damage=80
	HeadMult=2.5000000
	DamageType=Class'BallisticProV55.DTMarlinRifle'
	DamageTypeHead=Class'BallisticProV55.DTMarlinRifleHead'
	DamageTypeArm=Class'BallisticProV55.DTMarlinRifle'
	PenetrationEnergy=48.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Marlin.Mar-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	Chaos=0.8000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=1.1500000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryFireParams_Quick'
begin object name="TacticalPrimaryFireParams_Quick" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=1.1500000
	AimedFireAnim="SightFireCock"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalGaussEffectParams'
begin object name="TacticalGaussEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	RangeAtten=0.7500000
	Damage=100
	HeadMult=2.5000000
	DamageType=Class'BallisticProV55.DTMarlinRifle_Gauss'
	DamageTypeHead=Class'BallisticProV55.DTMarlinRifleHead_Gauss'
	DamageTypeArm=Class'BallisticProV55.DTMarlinRifle_Gauss'
	PenetrateForce=20
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FlashScaleFactor=0.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Marlin.Mar-GFire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	Chaos=0.8000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalGaussFireParams'
begin object name="TacticalGaussFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=1.1500000
	AimedFireAnim="SightFireCock"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalGaussEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryEffectParams_Carbine'
begin object name="TacticalPrimaryEffectParams_Carbine" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DecayRange=(Min=2625.0000000,Max=6300.0000000)
	RangeAtten=0.7500000
	Damage=80
	HeadMult=2.5000000
	DamageType=Class'BallisticProV55.DTMarlinRifle'
	DamageTypeHead=Class'BallisticProV55.DTMarlinRifleHead'
	DamageTypeArm=Class'BallisticProV55.DTMarlinRifle'
	PenetrationEnergy=48.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.Marlin.Mar-HFire',Volume=1.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	Chaos=0.8000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryFireParams_Carbine'
begin object name="TacticalPrimaryFireParams_Carbine" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=1.1500000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryEffectParams_Carbine'
end object
// Reference: InstantEffectParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryEffectParams_Supp'
begin object name="TacticalPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DecayRange=(Min=2625.0000000,Max=6300.0000000)
	RangeAtten=0.7500000
	Damage=80
	HeadMult=2.5000000
	DamageType=Class'BallisticProV55.DTMarlinRifle'
	DamageTypeHead=Class'BallisticProV55.DTMarlinRifleHead'
	DamageTypeArm=Class'BallisticProV55.DTMarlinRifle'
	PenetrationEnergy=48.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.Marlin.Mar-SFire',Volume=1.1000000,Radius=192.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=1336.0000000
	Chaos=0.8000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryFireParams_Supp'
begin object name="TacticalPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=1.1000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=0.9000000
	AimedFireAnim="SightFireCock"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryEffectParams_Supp'
end object
// Reference: RecoilParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalRecoilParams_Scope'
begin object name="TacticalRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.1200000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.7000000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	MaxRecoil=8192.0000000
	ClimbTime=0.0800000
	DeclineTime=1.0000000
	DeclineDelay=0.2500000
	ViewBindFactor=0.3000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.0000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalAimParams_Scope'
begin object name="TacticalAimParams_Scope" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.6500000
	ChaosDeclineDelay=1.0000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Iron Sights"
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.4000000
	SightOffset=(X=6.0000000,Y=-0.0400000,Z=2.8500000)
	WeaponBoneScales[0]=(BoneName="Gauss",Slot=19,Scale=0.0000000)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	MagAmmo=8
	WeaponModes[0]=(ModeName="Lever Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryFireParams_Quick'
end object
// Reference: WeaponParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalParams_Gauss'
begin object name="TacticalParams_Gauss" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Gauss Mod"
	LayoutTags="gauss"
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.4000000
	SightOffset=(X=6.0000000,Y=-0.0600000,Z=6.3000000)
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Gauss",Slot=19,Scale=1.0000000)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	MagAmmo=8
	WeaponModes[0]=(ModeName="Lever Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Accelerated Shot",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalGaussFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalParams_AdvSupp'
begin object name="TacticalParams_AdvSupp" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Tac Supp"
	LayoutTags="laser"
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.4000000
	SightOffset=(X=20.0000000,Y=-0.0200000,Z=3.6500000)
	WeaponBoneScales[0]=(BoneName="Gauss",Slot=19,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Suppressor",Slot=20,Scale=1.0000000)
	ViewOffset=(X=0.0000000,Y=10.0000000,Z=-10.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.MarlinIvory_FPm'
	AllowedCamos[0]=4
	AllowedCamos[1]=5
	AllowedCamos[2]=6
	MagAmmo=8
	WeaponModes[0]=(ModeName="Lever Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryFireParams_Supp'
end object
// Reference: WeaponParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalParams_AdvScope'
begin object name="TacticalParams_AdvScope" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Tac 4X Scope"
	LayoutTags="laser"
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4500000
	SightOffset=(X=30.0000000,Y=0.0000000,Z=9.4000000)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="Gauss",Slot=19,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Suppressor",Slot=20,Scale=-1.0000000)
	ViewOffset=(X=0.0000000,Y=10.0000000,Z=-10.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.MarlinIvory_FPm'
	AllowedCamos[0]=4
	AllowedCamos[1]=5
	AllowedCamos[2]=6
	MagAmmo=8
	WeaponModes[0]=(ModeName="Lever Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalRecoilParams_Scope'
	AimParams[0]=AimParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalAimParams_Scope'
	FireParams[0]=FireParams'BallisticProV55.MarlinWeaponParamsTactical.TacticalPrimaryFireParams_Carbine'
end object
// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsTactical.Deer_Wood'
begin object name="Deer_Wood" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
end object
// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsTactical.Deer_Redwood'
begin object name="Deer_Redwood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Redwood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MarlinCamos.MarlinK-Shiny",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsTactical.Deer_Orange'
begin object name="Deer_Orange" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MarlinCamos.DeermasterOrange-Main-Shine",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsTactical.Deer_Gold'
begin object name="Deer_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MarlinCamos.MarlinGold-Shine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsTactical.Deer_AdvBlack'
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
// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsTactical.Deer_AdvCarbon'
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
// Reference: WeaponCamo'BallisticProV55.MarlinWeaponParamsTactical.Deer_AdvGold'
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
