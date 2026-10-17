class XM20WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Quick Charge"
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4500000
		ZoomType=1
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="prototype",Slot=59,Scale=0.0000000)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		MagAmmo=34
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryFireParams'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryFireParamsOvercharge'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalParams_Shield'
	begin object name="TacticalParams_Shield" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Shield System"
		LayoutTags="Shield"
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4500000
		ZoomType=1
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="prototype",Slot=59,Scale=0.0000000)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		MagAmmo=34
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Laser Beam",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Laser: Overcharge",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryFireParams_Shield'
	end object
	Layouts[1]=TacticalParams_Shield
	// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalParams_Proto'
	begin object name="TacticalParams_Proto" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Prototype"
		LayoutTags="prototype"
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4000000
		SightOffset=(X=8.0000000,Y=0.0000000,Z=3.3000000)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.XM20.XM20-ScopeViewReflex'
		ScopeScale=0.6000000
		MaxZoom=4.0000000
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.XM20Prototype.XM20-MainProtoShine',MaterialName="",Index=2,pIndex=3,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=Texture'BWBP_SKC_Tex.XM20Prototype.XM20-MiscProto',MaterialName="",Index=3,pIndex=0,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[5]=(Material=Texture'BWBP_SKC_Tex.XM20Prototype.XM20-WiresProto',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[6]=(Material=Shader'BWBP_SKC_Tex.CYLO.CYLO-SightShader',MaterialName="",Index=6,pIndex=-1,AIndex=-1)
		WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="prototype",Slot=59,Scale=1.0000000)
		AllowedCamos[0]=5
		AllowedCamos[1]=6
		MagAmmo=40
		WeaponModes[0]=(ModeName="Laser Beam",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Laser: Quick Charge",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Laser: Overcharge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalPrimaryFireParams_Proto'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryFireParamsOvercharge'
	end object
	Layouts[2]=TacticalParams_Proto
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsTactical.XM20_Black'
	begin object name="XM20_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=XM20_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsTactical.XM20_HexGreen'
	begin object name="XM20_HexGreen" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Green Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoGreen",Index=2,pIndex=3,AIndex=1)
		Index=1
	end object
	Camos[1]=XM20_HexGreen
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsTactical.XM20_HexBlue'
	begin object name="XM20_HexBlue" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Blue Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoBlue",Index=2,pIndex=3,AIndex=1)
		Index=2
	end object
	Camos[2]=XM20_HexBlue
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsTactical.XM20_HexOrange'
	begin object name="XM20_HexOrange" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Yellow Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoWhite",Index=2,pIndex=3,AIndex=1)
		Index=3
	end object
	Camos[3]=XM20_HexOrange
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsTactical.XM20_Gold'
	begin object name="XM20_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoGold",Index=2,pIndex=3,AIndex=1)
		Index=4
	end object
	Camos[4]=XM20_Gold
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsTactical.XM20P_Blue'
	begin object name="XM20P_Blue" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Prototype"
		Index=5
	end object
	Camos[5]=XM20P_Blue
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsTactical.XM20P_Yellow'
	begin object name="XM20P_Yellow" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Test Bed"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.XM20Prototype.XM20-MainBurnedShine',MaterialName="",Index=2,pIndex=3,AIndex=1)
		Index=6
	end object
	Camos[6]=XM20P_Yellow
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.0200000),(InVal=0.2000000,OutVal=0.0500000),(InVal=0.3000000,OutVal=0.1100000),(InVal=0.4000000,OutVal=0.1300000),(InVal=0.6000000,OutVal=0.2000000),(InVal=0.8000000,OutVal=0.2500000),(InVal=1.0000000,OutVal=0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2200000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.4000000,OutVal=0.5500000),(InVal=0.5000000,OutVal=0.6000000),(InVal=0.6000000,OutVal=0.6700000),(InVal=0.7500000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0200000
	DeclineTime=0.7500000
	DeclineDelay=0.2000000
	ViewBindFactor=0.1500000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.7500000
	ChaosDeclineDelay=0.3000000
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5000.0000000,Max=7500.0000000)
	Damage=20
	HeadMult=2.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_XM20_Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_XM20_Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_XM20_Body'
	PenetrateForce=600
	MuzzleFlashClass=Class'BWBP_SKC_Pro.XM20FlashEmitter'
	FlashScaleFactor=0.3000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.XM20.XM20-PulseFire',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=8.0000000
	Heat=15.0000000
	Inaccuracy=(X=16,Y=16)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	TargetState="Laser"
	PreFireAnim="LoopStart"
	FireLoopAnim="LoopFire"
	FireEndAnim="LoopEnd"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryFireParamsOvercharge'
begin object name="TacticalSecondaryFireParamsOvercharge" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	AmmoPerFire=2
	TargetState="Laser"
	PreFireAnim="LoopOpenStart"
	FireLoopAnim="LoopOpenFire"
	FireEndAnim="LoopOpenEnd"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryEffectParamsOvercharge'
end object
// Reference: FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalPrimaryFireParams_Proto'
begin object name="TacticalPrimaryFireParams_Proto" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	Damage=8
	HeadMult=2.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_XM20_Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_XM20_Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_XM20_Body'
	FlashScaleFactor=0.1000000
	Recoil=8.0000000
	Inaccuracy=(X=16,Y=16)
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryEffectParamsOvercharge'
begin object name="TacticalSecondaryEffectParamsOvercharge" class=BCoreProV55.InstantEffectParams
	Damage=14
	HeadMult=2.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_XM20_Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_XM20_Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_XM20_Body'
	FlashScaleFactor=0.2000000
	Recoil=8.0000000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryEffectParams_Shield'
begin object name="TacticalSecondaryEffectParams_Shield" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryFireParams_Shield'
begin object name="TacticalSecondaryFireParams_Shield" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=0
	TargetState="Shield"
	FireAnim="Cock"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryEffectParams_Shield'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Quick Charge"
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4500000
	ZoomType=1
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="prototype",Slot=59,Scale=0.0000000)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	MagAmmo=34
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryFireParams'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryFireParamsOvercharge'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalParams_Shield'
begin object name="TacticalParams_Shield" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Shield System"
	LayoutTags="Shield"
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4500000
	ZoomType=1
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="prototype",Slot=59,Scale=0.0000000)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	MagAmmo=34
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Laser Beam",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Laser: Overcharge",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryFireParams_Shield'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalParams_Proto'
begin object name="TacticalParams_Proto" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Prototype"
	LayoutTags="prototype"
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4000000
	SightOffset=(X=8.0000000,Y=0.0000000,Z=3.3000000)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.XM20.XM20-ScopeViewReflex'
	ScopeScale=0.6000000
	MaxZoom=4.0000000
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.XM20Prototype.XM20-MainProtoShine',MaterialName="",Index=2,pIndex=3,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=Texture'BWBP_SKC_Tex.XM20Prototype.XM20-MiscProto',MaterialName="",Index=3,pIndex=0,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[5]=(Material=Texture'BWBP_SKC_Tex.XM20Prototype.XM20-WiresProto',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[6]=(Material=Shader'BWBP_SKC_Tex.CYLO.CYLO-SightShader',MaterialName="",Index=6,pIndex=-1,AIndex=-1)
	WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="prototype",Slot=59,Scale=1.0000000)
	AllowedCamos[0]=5
	AllowedCamos[1]=6
	MagAmmo=40
	WeaponModes[0]=(ModeName="Laser Beam",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Laser: Quick Charge",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Laser: Overcharge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalPrimaryFireParams_Proto'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsTactical.TacticalSecondaryFireParamsOvercharge'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsTactical.XM20_Black'
begin object name="XM20_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsTactical.XM20_HexGreen'
begin object name="XM20_HexGreen" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Green Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoGreen",Index=2,pIndex=3,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsTactical.XM20_HexBlue'
begin object name="XM20_HexBlue" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Blue Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoBlue",Index=2,pIndex=3,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsTactical.XM20_HexOrange'
begin object name="XM20_HexOrange" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Yellow Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoWhite",Index=2,pIndex=3,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsTactical.XM20_Gold'
begin object name="XM20_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoGold",Index=2,pIndex=3,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsTactical.XM20P_Blue'
begin object name="XM20P_Blue" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Prototype"
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsTactical.XM20P_Yellow'
begin object name="XM20P_Yellow" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Test Bed"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.XM20Prototype.XM20-MainBurnedShine',MaterialName="",Index=2,pIndex=3,AIndex=1)
	Index=6
end object
