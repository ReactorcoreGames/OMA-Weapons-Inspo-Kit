class T9CNWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticParams_Robocop'
	begin object name="RealisticParams_Robocop" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Gauss Mod"
		LayoutTags="gauss"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		WeaponPrice=1200
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1700000
		SightOffset=(X=5.0000000,Y=0.0500000,Z=1.2000000)
		SightPivot=(Pitch=-128,Yaw=0,Roll=0)
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.T9CN.Ber-MainShine',MaterialName="",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.T9CN.Ber-SlideShine',MaterialName="",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=Shader'BWBP_SKC_Tex.T9CN.T9CN-MiscSilverShine',MaterialName="",Index=4,pIndex=-1,AIndex=0)
		WeaponBoneScales[0]=(BoneName="RCAttachment",Slot=1,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="RCSlider",Slot=2,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="RCSliderFront",Slot=3,Scale=1.0000000)
		WeaponBoneScales[3]=(BoneName="RCAttachmentIron",Slot=4,Scale=1.0000000)
		ViewOffset=(X=4.0000000,Y=7.0000000,Z=-6.0000000)
		WeaponName="T9CN 9mm Autopistol"
		MagAmmo=18
		bMagPlusOne=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticBurstRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryFireParams_Gauss'
		FireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryFireParams_Gauss'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams_Robocop
	// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticParams_Auto'
	begin object name="RealisticParams_Auto" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Automatic Mod"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		WeaponPrice=1200
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1300000
		SightOffset=(X=5.0000000,Y=0.0500000,Z=1.2000000)
		SightPivot=(Pitch=-128,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="RCAttachment",Slot=1,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="RCSlider",Slot=2,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="RCSliderFront",Slot=3,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="RCAttachmentIron",Slot=4,Scale=0.0000000)
		ViewOffset=(X=4.0000000,Y=7.0000000,Z=-6.0000000)
		WeaponName="T9CN 9mm Police Pistol"
		MagAmmo=18
		bMagPlusOne=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticBurstRecoilParams'
		RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticBurstRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[1]=RealisticParams_Auto
	// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticParams_Stock'
	begin object name="RealisticParams_Stock" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Braced"
		LayoutTags="raffica"
		PlayerSpeedFactor=1.0500000
		InventorySize=3
		WeaponPrice=1200
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1800000
		SightOffset=(X=0.0000000,Y=0.3000000,Z=1.0000000)
		ViewOffset=(X=4.0000000,Y=7.0000000,Z=-6.0000000)
		WeaponName="T9CN-R 9mm Police Pistol"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.T9CN_FPm'
		MagAmmo=18
		bMagPlusOne=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticBurstRecoilParams'
		RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticBurstRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticAimParams_Stock'
		FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryFireParams_Stock'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[2]=RealisticParams_Stock
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.M9_Inox'
	begin object name="M9_Inox" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Inox"
	end object
	Camos[0]=M9_Inox
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.M9_Silver'
	begin object name="M9_Silver" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Silver"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MainShine",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-SlideSilverShine",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=Shader'BWBP_SKC_Tex.T9CN.T9CN-MiscSilverShine',MaterialName="",Index=4,pIndex=-1,AIndex=0)
		Index=1
	end object
	Camos[1]=M9_Silver
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.M9_BlackWorn'
	begin object name="M9_BlackWorn" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineB",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideShineC",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
		Index=2
	end object
	Camos[2]=M9_BlackWorn
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.M9_BlackWood'
	begin object name="M9_BlackWood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black n Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineD",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideShineC",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
		Index=3
	end object
	Camos[3]=M9_BlackWood
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.M9_Tan'
	begin object name="M9_Tan" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineE",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideShineE",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
		Index=4
	end object
	Camos[4]=M9_Tan
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.M9_TwoTone'
	begin object name="M9_TwoTone" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Two-Tone"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineB",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.T9CN.Ber-SlideShine',MaterialName="",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
		Index=5
	end object
	Camos[5]=M9_TwoTone
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.M9_Toy'
	begin object name="M9_Toy" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Toy"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MainToy",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-SlideToy",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscToy",Index=4,pIndex=-1,AIndex=0)
		Index=6
	end object
	Camos[6]=M9_Toy
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.M9_Gold'
	begin object name="M9_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MainGold",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-SlideGold",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscGold",Index=4,pIndex=-1,AIndex=0)
		Index=7
	end object
	Camos[7]=M9_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticBurstRecoilParams'
begin object name="RealisticBurstRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.6000000
	YawFactor=0.1000000
	XRandFactor=0.4000000
	YRandFactor=0.4000000
	MaxRecoil=2048.0000000
	DeclineTime=0.6000000
	DeclineDelay=0.1800000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
begin object name="RealisticSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.5000000
	YawFactor=0.0000000
	XRandFactor=0.3500000
	YRandFactor=0.3500000
	MaxRecoil=2048.0000000
	DeclineTime=0.4000000
	DeclineDelay=0.1200000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.5500000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
begin object name="RealisticPrimaryBurstFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0600000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.5500000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryBurstEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryFireParams_Gauss'
begin object name="RealisticPrimaryFireParams_Gauss" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.5500000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryEffectParams_Gauss'
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6300000
	TargetState="Gauss"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.5500000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: AimParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=1024)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.8200000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-4608,Yaw=-512,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.6000000
	ChaosSpeedThreshold=800
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	WaterTraceRange=800.0000000
	DecayRange=(Min=800.0000000,Max=4000.0000000)
	RangeAtten=0.5000000
	Damage=33
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrationEnergy=6.0000000
	PenetrateForce=16
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=300.0000000
	Chaos=0.0700000
	Inaccuracy=(X=13,Y=13)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryBurstEffectParams'
begin object name="RealisticPrimaryBurstEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	WaterTraceRange=800.0000000
	DecayRange=(Min=800.0000000,Max=4000.0000000)
	RangeAtten=0.5000000
	Damage=33
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrationEnergy=6.0000000
	PenetrateForce=16
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=450.0000000
	Chaos=0.0700000
	Inaccuracy=(X=13,Y=13)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryEffectParams_Stock'
begin object name="RealisticPrimaryEffectParams_Stock" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	WaterTraceRange=800.0000000
	DecayRange=(Min=800.0000000,Max=4000.0000000)
	RangeAtten=0.5000000
	Damage=33
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrationEnergy=6.0000000
	PenetrateForce=16
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=300.0000000
	Chaos=0.0700000
	Inaccuracy=(X=13,Y=13)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryFireParams_Stock'
begin object name="RealisticPrimaryFireParams_Stock" class=BCoreProV55.FireParams
	FireInterval=0.0600000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.5500000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryEffectParams_Stock'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryEffectParams_Gauss'
begin object name="RealisticPrimaryEffectParams_Gauss" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	WaterTraceRange=800.0000000
	DecayRange=(Min=800.0000000,Max=4000.0000000)
	RangeAtten=0.5000000
	Damage=33
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrationEnergy=100.0000000
	PenetrateForce=200
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-FireRobo',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=450.0000000
	Chaos=0.0700000
	Inaccuracy=(X=6,Y=6)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=800.0000000,Max=7000.0000000)
	WaterTraceRange=800.0000000
	Damage=99
	HeadMult=2.1818180
	LimbMult=0.6060600
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrationEnergy=40.0000000
	PenetrateForce=50
	bPenetrate=true
	PDamageFactor=0.8000000
	WallPDamageFactor=0.6000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.M2020FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-QFire',Volume=1.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=900.0000000
	Chaos=0.2700000
	Inaccuracy=(X=13,Y=13)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
begin object name="RealisticSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: AimParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticAimParams_Stock'
begin object name="RealisticAimParams_Stock" class=BCoreProV55.AimParams
	AimSpread=(Min=386,Max=1024)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-4608,Yaw=-512,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2500000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.6000000
	ChaosSpeedThreshold=600
	ChaosTurnThreshold=140000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticParams_Robocop'
begin object name="RealisticParams_Robocop" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Gauss Mod"
	LayoutTags="gauss"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	WeaponPrice=1200
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1700000
	SightOffset=(X=5.0000000,Y=0.0500000,Z=1.2000000)
	SightPivot=(Pitch=-128,Yaw=0,Roll=0)
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.T9CN.Ber-MainShine',MaterialName="",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.T9CN.Ber-SlideShine',MaterialName="",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=Shader'BWBP_SKC_Tex.T9CN.T9CN-MiscSilverShine',MaterialName="",Index=4,pIndex=-1,AIndex=0)
	WeaponBoneScales[0]=(BoneName="RCAttachment",Slot=1,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="RCSlider",Slot=2,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="RCSliderFront",Slot=3,Scale=1.0000000)
	WeaponBoneScales[3]=(BoneName="RCAttachmentIron",Slot=4,Scale=1.0000000)
	ViewOffset=(X=4.0000000,Y=7.0000000,Z=-6.0000000)
	WeaponName="T9CN 9mm Autopistol"
	MagAmmo=18
	bMagPlusOne=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticBurstRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryFireParams_Gauss'
	FireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryFireParams_Gauss'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticParams_Auto'
begin object name="RealisticParams_Auto" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Automatic Mod"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	WeaponPrice=1200
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1300000
	SightOffset=(X=5.0000000,Y=0.0500000,Z=1.2000000)
	SightPivot=(Pitch=-128,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="RCAttachment",Slot=1,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="RCSlider",Slot=2,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="RCSliderFront",Slot=3,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="RCAttachmentIron",Slot=4,Scale=0.0000000)
	ViewOffset=(X=4.0000000,Y=7.0000000,Z=-6.0000000)
	WeaponName="T9CN 9mm Police Pistol"
	MagAmmo=18
	bMagPlusOne=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticBurstRecoilParams'
	RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticBurstRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticParams_Stock'
begin object name="RealisticParams_Stock" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Braced"
	LayoutTags="raffica"
	PlayerSpeedFactor=1.0500000
	InventorySize=3
	WeaponPrice=1200
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1800000
	SightOffset=(X=0.0000000,Y=0.3000000,Z=1.0000000)
	ViewOffset=(X=4.0000000,Y=7.0000000,Z=-6.0000000)
	WeaponName="T9CN-R 9mm Police Pistol"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.T9CN_FPm'
	MagAmmo=18
	bMagPlusOne=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticBurstRecoilParams'
	RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticBurstRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticAimParams_Stock'
	FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticPrimaryFireParams_Stock'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.M9_Inox'
begin object name="M9_Inox" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Inox"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.M9_Silver'
begin object name="M9_Silver" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MainShine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-SlideSilverShine",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=Shader'BWBP_SKC_Tex.T9CN.T9CN-MiscSilverShine',MaterialName="",Index=4,pIndex=-1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.M9_BlackWorn'
begin object name="M9_BlackWorn" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineB",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideShineC",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.M9_BlackWood'
begin object name="M9_BlackWood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black n Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineD",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideShineC",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.M9_Tan'
begin object name="M9_Tan" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineE",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideShineE",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.M9_TwoTone'
begin object name="M9_TwoTone" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Two-Tone"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineB",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.T9CN.Ber-SlideShine',MaterialName="",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.M9_Toy'
begin object name="M9_Toy" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Toy"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MainToy",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-SlideToy",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscToy",Index=4,pIndex=-1,AIndex=0)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsRealistic.M9_Gold'
begin object name="M9_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MainGold",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-SlideGold",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscGold",Index=4,pIndex=-1,AIndex=0)
	Index=7
end object
