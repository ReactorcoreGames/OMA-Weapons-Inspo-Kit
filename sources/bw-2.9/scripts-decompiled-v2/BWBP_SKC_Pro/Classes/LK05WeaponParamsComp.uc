class LK05WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="CQC"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
		WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=0.0000000)
		MagAmmo=25
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaPrimaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaParams_3X'
	begin object name="ArenaParams_3X" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Marksman"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4000000
		SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=3.0000000
		WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=-2.0000000)
		WeaponBoneScales[2]=(BoneName="Irons",Slot=57,Scale=-2.0000000)
		WeaponBoneScales[3]=(BoneName="EOTech",Slot=54,Scale=0.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-20.0000000,Y=-2.3000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=25
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaPrimaryFireParams_68mm'
	end object
	Layouts[1]=ArenaParams_3X
	// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaParams_IRONS'
	begin object name="ArenaParams_IRONS" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Iron Sights"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightOffset=(X=3.0000000,Y=0.0000000,Z=1.5900000)
		SightPivot=(Pitch=64,Yaw=-16,Roll=0)
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponBoneScales[0]=(BoneName="EOTech",Slot=54,Scale=0.0000000)
		MagAmmo=25
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaPrimaryFireParams'
	end object
	Layouts[2]=ArenaParams_IRONS
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsComp.LK05_Tan'
	begin object name="LK05_Tan" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Tan"
	end object
	Camos[0]=LK05_Tan
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsComp.LK05_Gray'
	begin object name="LK05_Gray" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-RecShine',MaterialName="",Index=3,pIndex=3,AIndex=4)
		Index=1
	end object
	Camos[1]=LK05_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsComp.LK05_Black'
	begin object name="LK05_Black" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-MainBlack",Index=3,pIndex=3,AIndex=4)
		Index=2
	end object
	Camos[2]=LK05_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsComp.LK05_Jungle'
	begin object name="LK05_Jungle" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecJungle",Index=3,pIndex=3,AIndex=4)
		Index=3
	end object
	Camos[3]=LK05_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsComp.LK05_Winter'
	begin object name="LK05_Winter" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecWinter",Index=3,pIndex=3,AIndex=4)
		Index=4
	end object
	Camos[4]=LK05_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsComp.LK05_RedTiger'
	begin object name="LK05_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecRedCamo",Index=3,pIndex=3,AIndex=4)
		Index=5
	end object
	Camos[5]=LK05_RedTiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsComp.LK05_Meat'
	begin object name="LK05_Meat" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Meat"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecMeat",Index=3,pIndex=3,AIndex=4)
		Index=6
	end object
	Camos[6]=LK05_Meat
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsComp.LK05_Gold'
	begin object name="LK05_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecGold",Index=3,pIndex=3,AIndex=4)
		Index=7
	end object
	Camos[7]=LK05_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=512)
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2000000,OutVal=0.0450000),(InVal=0.3500000,OutVal=-0.0600000),(InVal=0.5000000,OutVal=0.0000000),(InVal=0.7000000,OutVal=0.0900000),(InVal=0.8500000,OutVal=0.0000000),(InVal=1.0000000,OutVal=-0.0600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.7500000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1400000
	ViewBindFactor=0.3500000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: FireParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0880000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=9000.0000000,Max=11000.0000000)
	DecayRange=(Min=1575.0000000,Max=3675.0000000)
	RangeAtten=0.6700000
	Damage=28
	DamageType=Class'BWBP_SKC_Pro.DT_LK05Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_LK05AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_LK05Assault'
	PenetrateForce=150
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LK05.LK05-RapidFire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=220.0000000
	Chaos=0.0280000
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaPrimaryEffectParams_68mm'
begin object name="ArenaPrimaryEffectParams_68mm" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	DecayRange=(Min=1536.0000000,Max=4000.0000000)
	RangeAtten=0.7500000
	Damage=34
	DamageType=Class'BWBP_SKC_Pro.DT_LK05Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_LK05AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_LK05Assault'
	PenetrationEnergy=48.0000000
	PenetrateForce=150
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.LK05.LK05-HeavyFire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=260.0000000
	Chaos=0.0320000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaPrimaryFireParams_68mm'
begin object name="ArenaPrimaryFireParams_68mm" class=BCoreProV55.FireParams
	FireInterval=0.0980000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaPrimaryEffectParams_68mm'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="CQC"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
	WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=0.0000000)
	MagAmmo=25
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaPrimaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaParams_3X'
begin object name="ArenaParams_3X" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Marksman"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4000000
	SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=3.0000000
	WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=-2.0000000)
	WeaponBoneScales[2]=(BoneName="Irons",Slot=57,Scale=-2.0000000)
	WeaponBoneScales[3]=(BoneName="EOTech",Slot=54,Scale=0.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-20.0000000,Y=-2.3000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=25
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaPrimaryFireParams_68mm'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaParams_IRONS'
begin object name="ArenaParams_IRONS" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Iron Sights"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightOffset=(X=3.0000000,Y=0.0000000,Z=1.5900000)
	SightPivot=(Pitch=64,Yaw=-16,Roll=0)
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponBoneScales[0]=(BoneName="EOTech",Slot=54,Scale=0.0000000)
	MagAmmo=25
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsComp.ArenaPrimaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsComp.LK05_Tan'
begin object name="LK05_Tan" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Tan"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsComp.LK05_Gray'
begin object name="LK05_Gray" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-RecShine',MaterialName="",Index=3,pIndex=3,AIndex=4)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsComp.LK05_Black'
begin object name="LK05_Black" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-MainBlack",Index=3,pIndex=3,AIndex=4)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsComp.LK05_Jungle'
begin object name="LK05_Jungle" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecJungle",Index=3,pIndex=3,AIndex=4)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsComp.LK05_Winter'
begin object name="LK05_Winter" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecWinter",Index=3,pIndex=3,AIndex=4)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsComp.LK05_RedTiger'
begin object name="LK05_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecRedCamo",Index=3,pIndex=3,AIndex=4)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsComp.LK05_Meat'
begin object name="LK05_Meat" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Meat"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecMeat",Index=3,pIndex=3,AIndex=4)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsComp.LK05_Gold'
begin object name="LK05_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecGold",Index=3,pIndex=3,AIndex=4)
	Index=7
end object
