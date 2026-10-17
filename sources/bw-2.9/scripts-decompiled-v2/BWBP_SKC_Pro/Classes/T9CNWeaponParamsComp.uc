class T9CNWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaParams_Auto'
	begin object name="ArenaParams_Auto" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Automatic Mod"
		PlayerSpeedFactor=1.0500000
		InventorySize=4
		SightingTime=0.2250000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=1.7300000)
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.T9CN.Ber-MainShine',MaterialName="",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.T9CN.Ber-SlideShine',MaterialName="",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=Shader'BWBP_SKC_Tex.T9CN.T9CN-MiscSilverShine',MaterialName="",Index=4,pIndex=-1,AIndex=0)
		WeaponBoneScales[0]=(BoneName="RCAttachment",Slot=1,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="RCSlider",Slot=2,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="RCSliderFront",Slot=3,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="RCAttachmentIron",Slot=4,Scale=0.0000000)
		ViewOffset=(X=4.0000000,Y=7.0000000,Z=-6.0000000)
		DisplaceDurationMult=0.7500000
		MagAmmo=18
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaSecondaryFireParams_Scope'
	end object
	Layouts[0]=ArenaParams_Auto
	// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaParams_Gauss'
	begin object name="ArenaParams_Gauss" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Gauss Mod"
		LayoutTags="gauss"
		PlayerSpeedFactor=1.0500000
		InventorySize=4
		SightingTime=0.2250000
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
		DisplaceDurationMult=0.7500000
		MagAmmo=18
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaPrimaryFireParams_Gauss'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[1]=ArenaParams_Gauss
	// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaParams_Stock'
	begin object name="ArenaParams_Stock" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Brace"
		LayoutTags="raffica"
		InventorySize=4
		SightingTime=0.2500000
		SightOffset=(X=0.0000000,Y=0.3000000,Z=1.0000000)
		ViewOffset=(X=4.0000000,Y=7.0000000,Z=-6.0000000)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.T9CN_FPm'
		DisplaceDurationMult=0.7500000
		MagAmmo=18
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaPrimaryFireParams_Stock'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaSecondaryFireParams_Scope'
	end object
	Layouts[2]=ArenaParams_Stock
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsComp.M9_Inox'
	begin object name="M9_Inox" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Inox"
	end object
	Camos[0]=M9_Inox
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsComp.M9_Silver'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsComp.M9_BlackWorn'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsComp.M9_BlackWood'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsComp.M9_Tan'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsComp.M9_TwoTone'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsComp.M9_Toy'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsComp.M9_Gold'
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
// Reference: RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.3500000,OutVal=-0.0200000),(InVal=0.5000000,OutVal=0.0700000),(InVal=0.6500000,OutVal=0.1200000),(InVal=0.8000000,OutVal=-0.0600000),(InVal=1.0000000,OutVal=0.0700000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.3000000,OutVal=0.3500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	MaxRecoil=6144.0000000
	ClimbTime=0.0400000
	DeclineTime=0.5000000
	ViewBindFactor=0.3000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=512)
	AimAdjustTime=1.2000000
	ADSMultiplier=0.4000000
	ViewBindFactor=0.0500000
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=850
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaSecondaryFireParams_Scope'
begin object name="ArenaSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaSecondaryEffectParams_Scope'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	RangeAtten=0.5000000
	Damage=19
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.T9CNFlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=225.0000000
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaPrimaryEffectParams_Stock'
begin object name="ArenaPrimaryEffectParams_Stock" class=BCoreProV55.InstantEffectParams
	RangeAtten=0.5000000
	Damage=19
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.T9CNFlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=185.0000000
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaPrimaryFireParams_Stock'
begin object name="ArenaPrimaryFireParams_Stock" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaPrimaryEffectParams_Stock'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaPrimaryEffectParams_Gauss'
begin object name="ArenaPrimaryEffectParams_Gauss" class=BCoreProV55.InstantEffectParams
	RangeAtten=0.5000000
	Damage=19
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.T9CNFlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-FireRobo',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=205.0000000
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaPrimaryFireParams_Gauss'
begin object name="ArenaPrimaryFireParams_Gauss" class=BCoreProV55.FireParams
	FireInterval=0.0850000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaPrimaryEffectParams_Gauss'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	RangeAtten=0.5000000
	Damage=59
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrationEnergy=100.0000000
	PenetrateForce=580
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.M2020FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-QFire',Volume=1.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=625.0000000
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4800000
	TargetState="Gauss"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaSecondaryEffectParams_Scope'
begin object name="ArenaSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaParams_Auto'
begin object name="ArenaParams_Auto" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Automatic Mod"
	PlayerSpeedFactor=1.0500000
	InventorySize=4
	SightingTime=0.2250000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=1.7300000)
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.T9CN.Ber-MainShine',MaterialName="",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.T9CN.Ber-SlideShine',MaterialName="",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=Shader'BWBP_SKC_Tex.T9CN.T9CN-MiscSilverShine',MaterialName="",Index=4,pIndex=-1,AIndex=0)
	WeaponBoneScales[0]=(BoneName="RCAttachment",Slot=1,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="RCSlider",Slot=2,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="RCSliderFront",Slot=3,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="RCAttachmentIron",Slot=4,Scale=0.0000000)
	ViewOffset=(X=4.0000000,Y=7.0000000,Z=-6.0000000)
	DisplaceDurationMult=0.7500000
	MagAmmo=18
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaParams_Gauss'
begin object name="ArenaParams_Gauss" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Gauss Mod"
	LayoutTags="gauss"
	PlayerSpeedFactor=1.0500000
	InventorySize=4
	SightingTime=0.2250000
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
	DisplaceDurationMult=0.7500000
	MagAmmo=18
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaPrimaryFireParams_Gauss'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaParams_Stock'
begin object name="ArenaParams_Stock" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Brace"
	LayoutTags="raffica"
	InventorySize=4
	SightingTime=0.2500000
	SightOffset=(X=0.0000000,Y=0.3000000,Z=1.0000000)
	ViewOffset=(X=4.0000000,Y=7.0000000,Z=-6.0000000)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.T9CN_FPm'
	DisplaceDurationMult=0.7500000
	MagAmmo=18
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaPrimaryFireParams_Stock'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsComp.ArenaSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsComp.M9_Inox'
begin object name="M9_Inox" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Inox"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsComp.M9_Silver'
begin object name="M9_Silver" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MainShine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-SlideSilverShine",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=Shader'BWBP_SKC_Tex.T9CN.T9CN-MiscSilverShine',MaterialName="",Index=4,pIndex=-1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsComp.M9_BlackWorn'
begin object name="M9_BlackWorn" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineB",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideShineC",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsComp.M9_BlackWood'
begin object name="M9_BlackWood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black n Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineD",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideShineC",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsComp.M9_Tan'
begin object name="M9_Tan" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineE",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideShineE",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsComp.M9_TwoTone'
begin object name="M9_TwoTone" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Two-Tone"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineB",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.T9CN.Ber-SlideShine',MaterialName="",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsComp.M9_Toy'
begin object name="M9_Toy" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Toy"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MainToy",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-SlideToy",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscToy",Index=4,pIndex=-1,AIndex=0)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsComp.M9_Gold'
begin object name="M9_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MainGold",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-SlideGold",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscGold",Index=4,pIndex=-1,AIndex=0)
	Index=7
end object
