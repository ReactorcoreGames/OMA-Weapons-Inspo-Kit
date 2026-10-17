class T9CNWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalParams_Auto'
	begin object name="TacticalParams_Auto" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Automatic Mod"
		InventorySize=3
		WeaponPrice=1200
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.1700000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=1.7300000)
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="RCAttachment",Slot=1,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="RCSlider",Slot=2,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="RCSliderFront",Slot=3,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="RCAttachmentIron",Slot=4,Scale=0.0000000)
		MagAmmo=18
		bDualBlocked=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalControlledRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAutoRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSemiFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAutoFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAutoFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	end object
	Layouts[0]=TacticalParams_Auto
	// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalParams_Robocop'
	begin object name="TacticalParams_Robocop" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Gauss Mod"
		LayoutTags="gauss"
		InventorySize=3
		WeaponPrice=1200
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2000000
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
		MagAmmo=18
		bDualBlocked=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalControlledRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAutoRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalFireParams_Gauss'
		FireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalFireParams_Gauss'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=TacticalParams_Robocop
	// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalParams_Stock'
	begin object name="TacticalParams_Stock" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Braced"
		LayoutTags="raffica"
		InventorySize=3
		WeaponPrice=1200
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2200000
		SightOffset=(X=0.0000000,Y=0.3000000,Z=1.0000000)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.T9CN_FPm'
		MagAmmo=18
		bDualBlocked=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalControlledRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAutoRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAimParams_Stock'
		FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalFireParams_Stock'
		FireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalFireParams_Stock'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	end object
	Layouts[2]=TacticalParams_Stock
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsTactical.M9_Inox'
	begin object name="M9_Inox" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Inox"
	end object
	Camos[0]=M9_Inox
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsTactical.M9_Silver'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsTactical.M9_BlackWorn'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsTactical.M9_BlackWood'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsTactical.M9_Tan'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsTactical.M9_TwoTone'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsTactical.M9_Toy'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsTactical.M9_Gold'
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
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
begin object name="TacticalSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.5300000
	TargetState="Gauss"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=0.7000000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalControlledRecoilParams'
begin object name="TacticalControlledRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0100000),(InVal=0.3500000,OutVal=0.0400000),(InVal=0.6000000,OutVal=-0.0500000),(InVal=0.8000000,OutVal=-0.0300000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.3000000,OutVal=0.3500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	MaxRecoil=8192.0000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1200000
	EscapeMultiplier=1.1000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.5000000
	MaxMoveMultiplier=1.5000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAutoRecoilParams'
begin object name="TacticalAutoRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0900000),(InVal=0.3500000,OutVal=-0.0900000),(InVal=0.5000000,OutVal=0.0210000),(InVal=0.6500000,OutVal=0.3600000),(InVal=0.8000000,OutVal=-0.1800000),(InVal=1.0000000,OutVal=0.2100000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.3000000,OutVal=0.3500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	MaxRecoil=8192.0000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1200000
	EscapeMultiplier=1.1000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.2500000
	MaxMoveMultiplier=1.2500000
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAutoFireParams'
begin object name="TacticalAutoFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0600000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAutoEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalFireParams_Stock'
begin object name="TacticalFireParams_Stock" class=BCoreProV55.FireParams
	FireInterval=0.0600000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalEffectParams_Stock'
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalFireParams_Gauss'
begin object name="TacticalFireParams_Gauss" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalEffectParams_Gauss'
end object
// Reference: AimParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=768)
	CrouchMultiplier=1.0000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	SprintChaos=0.0500000
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSemiEffectParams'
begin object name="TacticalSemiEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=23
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=210.0000000
	Chaos=0.1500000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSemiFireParams'
begin object name="TacticalSemiFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSemiEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAutoEffectParams'
begin object name="TacticalAutoEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=23
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=280.0000000
	Chaos=0.0700000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalEffectParams_Stock'
begin object name="TacticalEffectParams_Stock" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=23
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=220.0000000
	Chaos=0.1400000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalEffectParams_Gauss'
begin object name="TacticalEffectParams_Gauss" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=23
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-FireRobo',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=240.0000000
	Chaos=0.1000000
	Inaccuracy=(X=96,Y=96)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireEffectParams'
begin object name="TacticalSecondaryFireEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=6000.0000000,Max=6000.0000000)
	DecayRange=(Min=2500.0000000,Max=5000.0000000)
	RangeAtten=0.7500000
	Damage=69
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrationEnergy=100.0000000
	PenetrateForce=300
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.M2020FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-QFire',Volume=1.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=610.0000000
	Chaos=0.4500000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
begin object name="TacticalSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: AimParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAimParams_Stock'
begin object name="TacticalAimParams_Stock" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=768)
	CrouchMultiplier=0.8500000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.5000000
	SprintChaos=0.0500000
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalParams_Auto'
begin object name="TacticalParams_Auto" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Automatic Mod"
	InventorySize=3
	WeaponPrice=1200
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.1700000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=1.7300000)
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="RCAttachment",Slot=1,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="RCSlider",Slot=2,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="RCSliderFront",Slot=3,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="RCAttachmentIron",Slot=4,Scale=0.0000000)
	MagAmmo=18
	bDualBlocked=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalControlledRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAutoRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSemiFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAutoFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAutoFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalParams_Robocop'
begin object name="TacticalParams_Robocop" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Gauss Mod"
	LayoutTags="gauss"
	InventorySize=3
	WeaponPrice=1200
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2000000
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
	MagAmmo=18
	bDualBlocked=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalControlledRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAutoRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalFireParams_Gauss'
	FireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalFireParams_Gauss'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalParams_Stock'
begin object name="TacticalParams_Stock" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Braced"
	LayoutTags="raffica"
	InventorySize=3
	WeaponPrice=1200
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2200000
	SightOffset=(X=0.0000000,Y=0.3000000,Z=1.0000000)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.T9CN_FPm'
	MagAmmo=18
	bDualBlocked=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalControlledRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAutoRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalAimParams_Stock'
	FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalFireParams_Stock'
	FireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalFireParams_Stock'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsTactical.M9_Inox'
begin object name="M9_Inox" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Inox"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsTactical.M9_Silver'
begin object name="M9_Silver" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MainShine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-SlideSilverShine",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=Shader'BWBP_SKC_Tex.T9CN.T9CN-MiscSilverShine',MaterialName="",Index=4,pIndex=-1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsTactical.M9_BlackWorn'
begin object name="M9_BlackWorn" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineB",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideShineC",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsTactical.M9_BlackWood'
begin object name="M9_BlackWood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black n Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineD",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideShineC",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsTactical.M9_Tan'
begin object name="M9_Tan" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineE",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideShineE",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsTactical.M9_TwoTone'
begin object name="M9_TwoTone" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Two-Tone"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineB",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.T9CN.Ber-SlideShine',MaterialName="",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsTactical.M9_Toy'
begin object name="M9_Toy" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Toy"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MainToy",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-SlideToy",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscToy",Index=4,pIndex=-1,AIndex=0)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsTactical.M9_Gold'
begin object name="M9_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MainGold",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-SlideGold",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscGold",Index=4,pIndex=-1,AIndex=0)
	Index=7
end object
