class T9CNWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicParams_Robocop'
	begin object name="ClassicParams_Robocop" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Gauss Mod"
		LayoutTags="gauss"
		PlayerSpeedFactor=1.1000000
		InventorySize=2
		SightMoveSpeedFactor=0.5000000
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
		ViewOffset=(X=0.0000000,Y=8.0000000,Z=-4.0000000)
		MagAmmo=18
		bNeedCock=true
		bDualMixing=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicPrimaryFireParams_Robo'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams_Robocop
	// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Automatic Mod"
		PlayerSpeedFactor=1.1000000
		InventorySize=2
		SightMoveSpeedFactor=0.5000000
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
		ViewOffset=(X=0.0000000,Y=8.0000000,Z=-4.0000000)
		MagAmmo=18
		bNeedCock=true
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicAimParams_Light'
		FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[1]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicParams_Stock'
	begin object name="ClassicParams_Stock" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Braced"
		LayoutTags="raffica"
		InventorySize=2
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=0.0000000,Y=0.3000000,Z=1.0000000)
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.T9CN.Ber-MainShine',MaterialName="",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.T9CN.Ber-SlideShine',MaterialName="",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=Texture'BWBP_SKC_Tex.T9CN.T9CN-Stock',MaterialName="",Index=4,pIndex=-1,AIndex=0)
		ViewOffset=(X=0.0000000,Y=8.0000000,Z=-4.0000000)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.T9CN_FPm'
		MagAmmo=18
		bNeedCock=true
		bDualMixing=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicRecoilParams_Stock'
		AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicAimParams_Stock'
		FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicPrimaryFireParams_Stock'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[2]=ClassicParams_Stock
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsClassic.M9_Inox'
	begin object name="M9_Inox" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Inox"
	end object
	Camos[0]=M9_Inox
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsClassic.M9_Silver'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsClassic.M9_BlackWorn'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsClassic.M9_BlackWood'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsClassic.M9_Tan'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsClassic.M9_TwoTone'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsClassic.M9_Toy'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsClassic.M9_Gold'
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
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicSecondaryFireParams_Scope'
begin object name="ClassicSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.2000000
	YawFactor=0.0000000
	XRandFactor=0.2500000
	YRandFactor=0.3000000
	DeclineTime=0.4000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.4000000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=3000.0000000
	RangeAtten=0.7000000
	Damage=25
	HeadMult=2.3000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter_C'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-FireOld',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=600.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=48,Y=48)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicPrimaryEffectParams_Stock'
begin object name="ClassicPrimaryEffectParams_Stock" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=3000.0000000
	RangeAtten=0.7000000
	Damage=25
	HeadMult=2.3000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M763FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=500.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=42,Y=42)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicPrimaryFireParams_Stock'
begin object name="ClassicPrimaryFireParams_Stock" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicPrimaryEffectParams_Stock'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicPrimaryEffectParams_Robo'
begin object name="ClassicPrimaryEffectParams_Robo" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=3000.0000000
	RangeAtten=0.8000000
	Damage=25
	HeadMult=2.3000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M763FlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-FireRobo',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=500.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=16,Y=16)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicPrimaryFireParams_Robo'
begin object name="ClassicPrimaryFireParams_Robo" class=BCoreProV55.FireParams
	FireInterval=0.0850000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicPrimaryEffectParams_Robo'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=3000.0000000
	RangeAtten=0.9000000
	Damage=66
	HeadMult=2.3000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DTT9CN'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTT9CNHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTT9CN'
	PenetrationEnergy=100.0000000
	PenetrateForce=300
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.M2020FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-QFire',Volume=1.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1800.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=48,Y=48)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4800000
	TargetState="Gauss"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
begin object name="ClassicSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicRecoilParams_Stock'
begin object name="ClassicRecoilParams_Stock" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.1000000
	YawFactor=0.0000000
	XRandFactor=0.2500000
	YRandFactor=0.1000000
	DeclineTime=0.4000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.4000000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicAimParams_Light'
begin object name="ClassicAimParams_Light" class=BCoreProV55.AimParams
	AimSpread=(Min=48,Max=8192)
	AimAdjustTime=0.3500000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.0500000
	FallingChaos=0.0500000
	SprintChaos=0.0500000
	AimDamageThreshold=480
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=11200
end object
// Reference: AimParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=8192)
	AimAdjustTime=0.3500000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=480
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=11200
	ChaosTurnThreshold=196608
end object
// Reference: AimParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicAimParams_Stock'
begin object name="ClassicAimParams_Stock" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=4096)
	AimAdjustTime=0.3500000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.3000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=480
	ChaosDeclineTime=1.0000000
	ChaosSpeedThreshold=650
	ChaosTurnThreshold=140000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicParams_Robocop'
begin object name="ClassicParams_Robocop" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Gauss Mod"
	LayoutTags="gauss"
	PlayerSpeedFactor=1.1000000
	InventorySize=2
	SightMoveSpeedFactor=0.5000000
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
	ViewOffset=(X=0.0000000,Y=8.0000000,Z=-4.0000000)
	MagAmmo=18
	bNeedCock=true
	bDualMixing=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicPrimaryFireParams_Robo'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Automatic Mod"
	PlayerSpeedFactor=1.1000000
	InventorySize=2
	SightMoveSpeedFactor=0.5000000
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
	ViewOffset=(X=0.0000000,Y=8.0000000,Z=-4.0000000)
	MagAmmo=18
	bNeedCock=true
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicAimParams_Light'
	FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicParams_Stock'
begin object name="ClassicParams_Stock" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Braced"
	LayoutTags="raffica"
	InventorySize=2
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=0.0000000,Y=0.3000000,Z=1.0000000)
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.T9CN.Ber-MainShine',MaterialName="",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.T9CN.Ber-SlideShine',MaterialName="",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=Texture'BWBP_SKC_Tex.T9CN.T9CN-Stock',MaterialName="",Index=4,pIndex=-1,AIndex=0)
	ViewOffset=(X=0.0000000,Y=8.0000000,Z=-4.0000000)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.T9CN_FPm'
	MagAmmo=18
	bNeedCock=true
	bDualMixing=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicRecoilParams_Stock'
	AimParams[0]=AimParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicAimParams_Stock'
	FireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicPrimaryFireParams_Stock'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.T9CNWeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsClassic.M9_Inox'
begin object name="M9_Inox" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Inox"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsClassic.M9_Silver'
begin object name="M9_Silver" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MainShine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-SlideSilverShine",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=Shader'BWBP_SKC_Tex.T9CN.T9CN-MiscSilverShine',MaterialName="",Index=4,pIndex=-1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsClassic.M9_BlackWorn'
begin object name="M9_BlackWorn" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineB",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideShineC",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsClassic.M9_BlackWood'
begin object name="M9_BlackWood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black n Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineD",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideShineC",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsClassic.M9_Tan'
begin object name="M9_Tan" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineE",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-SlideShineE",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsClassic.M9_TwoTone'
begin object name="M9_TwoTone" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Two-Tone"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.Ber-MainShineB",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.T9CN.Ber-SlideShine',MaterialName="",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscBlack",Index=4,pIndex=-1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsClassic.M9_Toy'
begin object name="M9_Toy" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Toy"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MainToy",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-SlideToy",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscToy",Index=4,pIndex=-1,AIndex=0)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.T9CNWeaponParamsClassic.M9_Gold'
begin object name="M9_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MainGold",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-SlideGold",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.T9CNCamos.T9CN-MiscGold",Index=4,pIndex=-1,AIndex=0)
	Index=7
end object
