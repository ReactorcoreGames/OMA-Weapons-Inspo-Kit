class LK05WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="5.56mm Holo"
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3200000
		SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
		WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Irons",Slot=57,Scale=-2.0000000)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalPrimaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalParams_68mm'
	begin object name="TacticalParams_68mm" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="6.8mm Holo"
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
		WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Irons",Slot=57,Scale=-2.0000000)
		MagAmmo=25
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalPrimaryFireParams_68mm'
	end object
	Layouts[1]=TacticalParams_68mm
	// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalParams_IRONS'
	begin object name="TacticalParams_IRONS" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="5.56mm Irons"
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3200000
		SightOffset=(X=3.0000000,Y=0.0000000,Z=1.5900000)
		SightPivot=(Pitch=64,Yaw=-16,Roll=0)
		WeaponBoneScales[0]=(BoneName="EOTech",Slot=54,Scale=0.0000000)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalPrimaryFireParams'
	end object
	Layouts[2]=TacticalParams_IRONS
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsTactical.LK05_Tan'
	begin object name="LK05_Tan" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Tan"
	end object
	Camos[0]=LK05_Tan
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsTactical.LK05_Gray'
	begin object name="LK05_Gray" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-RecShine',MaterialName="",Index=3,pIndex=3,AIndex=4)
		Index=1
	end object
	Camos[1]=LK05_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsTactical.LK05_Black'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsTactical.LK05_Jungle'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsTactical.LK05_Winter'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsTactical.LK05_RedTiger'
	begin object name="LK05_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecRedCamo",Index=3,pIndex=3,AIndex=4)
		Index=5
	end object
	Camos[5]=LK05_RedTiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsTactical.LK05_Meat'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsTactical.LK05_Gold'
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
// Reference: AimParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2000000,OutVal=0.0450000),(InVal=0.3500000,OutVal=-0.0600000),(InVal=0.5000000,OutVal=0.0000000),(InVal=0.7000000,OutVal=0.0900000),(InVal=0.8500000,OutVal=0.0000000),(InVal=1.0000000,OutVal=-0.0600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.7500000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1400000
	EscapeMultiplier=1.5000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: FireParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0850000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	DecayRange=(Min=1575.0000000,Max=4725.0000000)
	RangeAtten=0.5000000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DT_LK05Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_LK05AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_LK05Assault'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LK05.LK05-RapidFire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=190.0000000
	Chaos=0.0220000
	Inaccuracy=(X=32,Y=32)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalPrimaryEffectParams_68mm'
begin object name="TacticalPrimaryEffectParams_68mm" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=9000.0000000,Max=11000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=40
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DT_LK05Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_LK05AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_LK05Assault'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.LK05.LK05-HeavyFire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=220.0000000
	Chaos=0.0280000
	Inaccuracy=(X=32,Y=32)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalPrimaryFireParams_68mm'
begin object name="TacticalPrimaryFireParams_68mm" class=BCoreProV55.FireParams
	FireInterval=0.0950000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalPrimaryEffectParams_68mm'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="5.56mm Holo"
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3200000
	SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
	WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Irons",Slot=57,Scale=-2.0000000)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalPrimaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalParams_68mm'
begin object name="TacticalParams_68mm" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="6.8mm Holo"
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=1.5000000,Y=0.0000000,Z=2.1600000)
	WeaponBoneScales[0]=(BoneName="IronsRear",Slot=55,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="IronsFront",Slot=56,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Irons",Slot=57,Scale=-2.0000000)
	MagAmmo=25
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalPrimaryFireParams_68mm'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalParams_IRONS'
begin object name="TacticalParams_IRONS" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="5.56mm Irons"
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3200000
	SightOffset=(X=3.0000000,Y=0.0000000,Z=1.5900000)
	SightPivot=(Pitch=64,Yaw=-16,Roll=0)
	WeaponBoneScales[0]=(BoneName="EOTech",Slot=54,Scale=0.0000000)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LK05WeaponParamsTactical.TacticalPrimaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsTactical.LK05_Tan'
begin object name="LK05_Tan" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Tan"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsTactical.LK05_Gray'
begin object name="LK05_Gray" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-RecShine',MaterialName="",Index=3,pIndex=3,AIndex=4)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsTactical.LK05_Black'
begin object name="LK05_Black" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-MainBlack",Index=3,pIndex=3,AIndex=4)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsTactical.LK05_Jungle'
begin object name="LK05_Jungle" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecJungle",Index=3,pIndex=3,AIndex=4)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsTactical.LK05_Winter'
begin object name="LK05_Winter" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecWinter",Index=3,pIndex=3,AIndex=4)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsTactical.LK05_RedTiger'
begin object name="LK05_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecRedCamo",Index=3,pIndex=3,AIndex=4)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsTactical.LK05_Meat'
begin object name="LK05_Meat" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Meat"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecMeat",Index=3,pIndex=3,AIndex=4)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LK05WeaponParamsTactical.LK05_Gold'
begin object name="LK05_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-HandleBlack",Index=1,pIndex=0,AIndex=5)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-ButtBlack",Index=2,pIndex=5,AIndex=7)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.LK05Camos.LK05-RecGold",Index=3,pIndex=3,AIndex=4)
	Index=7
end object
