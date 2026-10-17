class XM20WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Quick Charge"
		PlayerSpeedFactor=1.1000000
		PlayerJumpFactor=1.1000000
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=600,Yaw=0,Roll=-1024)
		ZoomType=4
		WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="prototype",Slot=59,Scale=0.0000000)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		MagAmmo=40
		bNeedCock=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Laser Beam",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Laser: Quick Charge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Laser: Overcharge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryFireParams'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryFireParamsOvercharge'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicParams_Proto'
	begin object name="ClassicParams_Proto" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Prototype"
		LayoutTags="prototype"
		PlayerSpeedFactor=1.1000000
		PlayerJumpFactor=1.1000000
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=3.0000000)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.XM20.XM20-ScopeViewReflex'
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
		MagAmmo=50
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Laser Beam",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Laser: Quick Charge",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Laser: Overcharge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicPrimaryFireParams_Proto'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryFireParams'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryFireParamsOvercharge'
	end object
	Layouts[1]=ClassicParams_Proto
	// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicParams_Shield'
	begin object name="ClassicParams_Shield" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Shield System"
		LayoutTags="shield"
		PlayerSpeedFactor=1.1000000
		PlayerJumpFactor=1.1000000
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=600,Yaw=0,Roll=-1024)
		ZoomType=4
		WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="prototype",Slot=59,Scale=0.0000000)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		MagAmmo=40
		bNeedCock=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Laser Beam",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Laser: Overcharge",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryFireParams_Shield'
	end object
	Layouts[2]=ClassicParams_Shield
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsClassic.XM20_Black'
	begin object name="XM20_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=XM20_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsClassic.XM20_HexGreen'
	begin object name="XM20_HexGreen" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Green Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoGreen",Index=2,pIndex=3,AIndex=1)
		Index=1
	end object
	Camos[1]=XM20_HexGreen
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsClassic.XM20_HexBlue'
	begin object name="XM20_HexBlue" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Blue Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoBlue",Index=2,pIndex=3,AIndex=1)
		Index=2
	end object
	Camos[2]=XM20_HexBlue
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsClassic.XM20_HexOrange'
	begin object name="XM20_HexOrange" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Yellow Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoWhite",Index=2,pIndex=3,AIndex=1)
		Index=3
	end object
	Camos[3]=XM20_HexOrange
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsClassic.XM20_Gold'
	begin object name="XM20_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoGold",Index=2,pIndex=3,AIndex=1)
		Index=4
	end object
	Camos[4]=XM20_Gold
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsClassic.XM20P_Blue'
	begin object name="XM20P_Blue" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Prototype"
		Index=5
	end object
	Camos[5]=XM20P_Blue
	// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsClassic.XM20P_Yellow'
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
// Reference: FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0600000
	PreFireTime=0.1000000
	TargetState="Laser"
	BurstFireRateFactor=1.0000000
	PreFireAnim="LoopStart"
	FireLoopAnim="LoopFire"
	FireEndAnim="LoopEnd"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.7000000
	YRandFactor=0.7000000
	MaxRecoil=2048.0000000
	DeclineTime=1.0000000
	ViewBindFactor=0.5500000
	CrouchMultiplier=0.6000000
end object
// Reference: AimParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=40,Max=1800)
	CrouchMultiplier=0.6000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.2500000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.0000000
end object
// Reference: FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=3500.0000000
	RangeAtten=0.3500000
	Damage=20
	DamageType=Class'BWBP_SKC_Pro.DT_XM20_Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_XM20_Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_XM20_Body'
	PenetrateForce=300
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	FlashScaleFactor=0.5000000
	Chaos=-1.0000000
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryFireParamsOvercharge'
begin object name="ClassicSecondaryFireParamsOvercharge" class=BCoreProV55.FireParams
	FireInterval=0.0130000
	PreFireTime=0.1000000
	TargetState="Laser"
	BurstFireRateFactor=1.0000000
	PreFireAnim="LoopOpenStart"
	FireLoopAnim="LoopOpenFire"
	FireEndAnim="LoopOpenEnd"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5000.0000000,Max=7500.0000000)
	WaterTraceRange=6750.0000000
	RangeAtten=0.9000000
	Damage=20
	HeadMult=1.7500000
	DamageType=Class'BWBP_SKC_Pro.DT_XM20_Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_XM20_Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_XM20_Body'
	PenetrateForce=600
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.XM20FlashEmitter'
	FlashScaleFactor=0.3000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.XM20.XM20-PulseFire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=32.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=16,Y=16)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicPrimaryEffectParams_Proto'
begin object name="ClassicPrimaryEffectParams_Proto" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5000.0000000,Max=7500.0000000)
	WaterTraceRange=6750.0000000
	RangeAtten=0.9000000
	Damage=25
	HeadMult=1.7500000
	DamageType=Class'BWBP_SKC_Pro.DT_XM20_Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_XM20_Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_XM20_Body'
	PenetrateForce=600
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.XM20FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.XM20.XM20-PulseFire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=64.0000000
	Chaos=1.0000000
	Inaccuracy=(X=16,Y=16)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicPrimaryFireParams_Proto'
begin object name="ClassicPrimaryFireParams_Proto" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicPrimaryEffectParams_Proto'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryEffectParams_Shield'
begin object name="ClassicSecondaryEffectParams_Shield" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryFireParams_Shield'
begin object name="ClassicSecondaryFireParams_Shield" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=0
	TargetState="Shield"
	FireAnim="Cock"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryEffectParams_Shield'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Quick Charge"
	PlayerSpeedFactor=1.1000000
	PlayerJumpFactor=1.1000000
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=600,Yaw=0,Roll=-1024)
	ZoomType=4
	WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="prototype",Slot=59,Scale=0.0000000)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	MagAmmo=40
	bNeedCock=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Laser Beam",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Laser: Quick Charge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Laser: Overcharge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryFireParams'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryFireParamsOvercharge'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicParams_Shield'
begin object name="ClassicParams_Shield" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Shield System"
	LayoutTags="shield"
	PlayerSpeedFactor=1.1000000
	PlayerJumpFactor=1.1000000
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=600,Yaw=0,Roll=-1024)
	ZoomType=4
	WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="prototype",Slot=59,Scale=0.0000000)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	MagAmmo=40
	bNeedCock=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Laser Beam",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Laser: Overcharge",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryFireParams_Shield'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicParams_Proto'
begin object name="ClassicParams_Proto" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Prototype"
	LayoutTags="prototype"
	PlayerSpeedFactor=1.1000000
	PlayerJumpFactor=1.1000000
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=3.0000000)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.XM20.XM20-ScopeViewReflex'
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
	MagAmmo=50
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Laser Beam",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Laser: Quick Charge",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Laser: Overcharge",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicPrimaryFireParams_Proto'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryFireParams'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.XM20WeaponParamsClassic.ClassicSecondaryFireParamsOvercharge'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsClassic.XM20_Black'
begin object name="XM20_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsClassic.XM20_HexGreen'
begin object name="XM20_HexGreen" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Green Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoGreen",Index=2,pIndex=3,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsClassic.XM20_HexBlue'
begin object name="XM20_HexBlue" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Blue Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoBlue",Index=2,pIndex=3,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsClassic.XM20_HexOrange'
begin object name="XM20_HexOrange" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Yellow Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoWhite",Index=2,pIndex=3,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsClassic.XM20_Gold'
begin object name="XM20_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XM20Camos.XM20-FinalCamoGold",Index=2,pIndex=3,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsClassic.XM20P_Blue'
begin object name="XM20P_Blue" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Prototype"
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.XM20WeaponParamsClassic.XM20P_Yellow'
begin object name="XM20P_Yellow" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Test Bed"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.XM20Prototype.XM20-MainBurnedShine',MaterialName="",Index=2,pIndex=3,AIndex=1)
	Index=6
end object
