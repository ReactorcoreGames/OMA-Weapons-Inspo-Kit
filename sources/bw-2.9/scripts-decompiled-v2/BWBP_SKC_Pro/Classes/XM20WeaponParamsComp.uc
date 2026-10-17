class XM20WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Quick Charge"
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4000000
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
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryFireParams'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryFireParamsOvercharge'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaParams_Shield'
	begin object name="ArenaParams_Shield" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Shield System"
		LayoutTags="shield"
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4000000
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
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryFireParams_Shield'
	end object
	Layouts[1]=ArenaParams_Shield
	// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaParams_Proto'
	begin object name="ArenaParams_Proto" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Prototype"
		LayoutTags="prototype"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
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
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Laser Beam",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Laser: Quick Charge",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Laser: Overcharge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaPrimaryFireParams_Proto'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryFireParams'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryFireParamsOvercharge'
	end object
	Layouts[2]=ArenaParams_Proto
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsComp.XM20_Black'
	begin object name="XM20_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=XM20_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsComp.XM20_HexGreen'
	begin object name="XM20_HexGreen" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Green Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoGreen",Index=2,pIndex=3,AIndex=1)
		Index=1
	end object
	Camos[1]=XM20_HexGreen
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsComp.XM20_HexBlue'
	begin object name="XM20_HexBlue" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Blue Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoBlue",Index=2,pIndex=3,AIndex=1)
		Index=2
	end object
	Camos[2]=XM20_HexBlue
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsComp.XM20_HexOrange'
	begin object name="XM20_HexOrange" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Yellow Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoWhite",Index=2,pIndex=3,AIndex=1)
		Index=3
	end object
	Camos[3]=XM20_HexOrange
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsComp.XM20_Gold'
	begin object name="XM20_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoGold",Index=2,pIndex=3,AIndex=1)
		Index=4
	end object
	Camos[4]=XM20_Gold
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsComp.XM20P_Blue'
	begin object name="XM20P_Blue" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Prototype"
		Index=5
	end object
	Camos[5]=XM20P_Blue
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsComp.XM20P_Yellow'
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
// Reference: FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	TargetState="Laser"
	PreFireAnim="LoopStart"
	FireLoopAnim="LoopFire"
	FireEndAnim="LoopEnd"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.0200000),(InVal=0.2000000,OutVal=0.0500000),(InVal=0.3000000,OutVal=0.1100000),(InVal=0.4000000,OutVal=0.1300000),(InVal=0.6000000,OutVal=0.2000000),(InVal=0.8000000,OutVal=0.2500000),(InVal=1.0000000,OutVal=0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2200000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.4000000,OutVal=0.5500000),(InVal=0.5000000,OutVal=0.6000000),(InVal=0.6000000,OutVal=0.6700000),(InVal=0.7500000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0200000
	DeclineTime=0.7500000
	DeclineDelay=0.2000000
	ViewBindFactor=0.1500000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=512)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.5000000
	ChaosDeclineDelay=0.3000000
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5000.0000000,Max=7500.0000000)
	Damage=25
	DamageType=Class'BWBP_SKC_Pro.DT_XM20_Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_XM20_Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_XM20_Body'
	PenetrateForce=600
	MuzzleFlashClass=Class'BWBP_SKC_Pro.XM20FlashEmitter'
	FlashScaleFactor=0.3000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.XM20.XM20-PulseFire',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=16.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryFireParamsOvercharge'
begin object name="ArenaSecondaryFireParamsOvercharge" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	TargetState="Laser"
	PreFireAnim="LoopOpenStart"
	FireLoopAnim="LoopOpenFire"
	FireEndAnim="LoopOpenEnd"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryEffectParamsOvercharge'
end object
// Reference: FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaPrimaryFireParams_Proto'
begin object name="ArenaPrimaryFireParams_Proto" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	Damage=12
	DamageType=Class'BWBP_SKC_Pro.DT_XM20_Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_XM20_Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_XM20_Body'
	FlashScaleFactor=0.1000000
	Recoil=16.0000000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryEffectParams_Shield'
begin object name="ArenaSecondaryEffectParams_Shield" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryFireParams_Shield'
begin object name="ArenaSecondaryFireParams_Shield" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=0
	TargetState="Shield"
	FireAnim="Cock"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryEffectParams_Shield'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryEffectParamsOvercharge'
begin object name="ArenaSecondaryEffectParamsOvercharge" class=BCoreProV55.InstantEffectParams
	Damage=18
	DamageType=Class'BWBP_SKC_Pro.DT_XM20_Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_XM20_Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_XM20_Body'
	FlashScaleFactor=0.2000000
	Recoil=64.0000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Quick Charge"
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4000000
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
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryFireParams'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryFireParamsOvercharge'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaParams_Shield'
begin object name="ArenaParams_Shield" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Shield System"
	LayoutTags="shield"
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4000000
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
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryFireParams_Shield'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaParams_Proto'
begin object name="ArenaParams_Proto" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Prototype"
	LayoutTags="prototype"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
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
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Laser Beam",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Laser: Quick Charge",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Laser: Overcharge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaPrimaryFireParams_Proto'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryFireParams'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsComp.ArenaSecondaryFireParamsOvercharge'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsComp.XM20_Black'
begin object name="XM20_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsComp.XM20_HexGreen'
begin object name="XM20_HexGreen" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Green Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoGreen",Index=2,pIndex=3,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsComp.XM20_HexBlue'
begin object name="XM20_HexBlue" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Blue Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoBlue",Index=2,pIndex=3,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsComp.XM20_HexOrange'
begin object name="XM20_HexOrange" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Yellow Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoWhite",Index=2,pIndex=3,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsComp.XM20_Gold'
begin object name="XM20_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoGold",Index=2,pIndex=3,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsComp.XM20P_Blue'
begin object name="XM20P_Blue" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Prototype"
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsComp.XM20P_Yellow'
begin object name="XM20P_Yellow" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Test Bed"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.XM20Prototype.XM20-MainBurnedShine',MaterialName="",Index=2,pIndex=3,AIndex=1)
	Index=6
end object
