class FG50WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Holosight"
		PlayerSpeedFactor=0.8250000
		InventorySize=9
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=3.0000000,Y=0.0000000,Z=3.2500000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=0.0000000)
		WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=0.0000000)
		WeaponName="FG-50 .50 Heavy Machinegun"
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticAimParams'
		AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticControlledAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticPriControlledFireParams'
		FireParams[1]=none
		FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticParams_Bipod'
	begin object name="RealisticParams_Bipod" class=BCoreProV55.WeaponParams
		Weight=20
		LayoutName="Bipod"
		PlayerSpeedFactor=0.8250000
		InventorySize=9
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=0.0000000,Y=0.0500000,Z=2.0000000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=1.0000000)
		WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=1.0000000)
		WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=1.0000000)
		WeaponName="FG-50 .50 Heavy Machinegun"
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticAimParams'
		AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticControlledAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticPriControlledFireParams'
		FireParams[1]=none
		FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticSecondaryFireParams_Mount'
	end object
	Layouts[1]=RealisticParams_Bipod
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsRealistic.FG50_Black'
	begin object name="FG50_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=FG50_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsRealistic.FG50_Wood'
	begin object name="FG50_Wood" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainWood",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
		Index=1
	end object
	Camos[1]=FG50_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsRealistic.FG50_Desert'
	begin object name="FG50_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDesert",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
		Index=2
	end object
	Camos[2]=FG50_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsRealistic.FG50_Dazzle'
	begin object name="FG50_Dazzle" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Dazzle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDazzle",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
		Index=3
	end object
	Camos[3]=FG50_Dazzle
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsRealistic.FG50_Gold'
	begin object name="FG50_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainGold",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
		Index=4
	end object
	Camos[4]=FG50_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1600000
	TargetState="IncAmmo"
	BurstFireRateFactor=1.0000000
	FireAnimRate=1.5500000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticPriControlledFireParams'
begin object name="RealisticPriControlledFireParams" class=BCoreProV55.FireParams
	TargetState="IncAmmo"
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticPriControlledEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=0.3000000)))
	YawFactor=0.2000000
	XRandFactor=0.3500000
	YRandFactor=0.3500000
	MaxRecoil=4000.0000000
	ViewBindFactor=0.3000000
	ADSViewBindFactor=0.3000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=5072)
	AimAdjustTime=1.0000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.8000000
	SprintOffset=(Pitch=-3072,Yaw=-4096,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=375
end object
// Reference: AimParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticControlledAimParams'
begin object name="RealisticControlledAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=3048)
	AimAdjustTime=1.1000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3072,Yaw=-4096,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=350
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=155
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_FG50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_FG50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_FG50Limb'
	PenetrationEnergy=48.0000000
	PenetrateForce=300
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter_C'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AS50.FG50-HeavyFire',Volume=7.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=2500.0000000
	PushbackForce=100.0000000
	Chaos=1.0000000
	Heat=0.2500000
	Inaccuracy=(X=12,Y=12)
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticPriControlledEffectParams'
begin object name="RealisticPriControlledEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=155
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_FG50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_FG50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_FG50Limb'
	PenetrateForce=150
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.FG50FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AR23.AR23-HFire',Volume=6.7500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=768.0000000
	PushbackForce=64.0000000
	Chaos=0.0700000
	Heat=0.2500000
	WarnTargetPct=0.4000000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticSecondaryEffectParams_Mount'
begin object name="RealisticSecondaryEffectParams_Mount" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticSecondaryFireParams_Mount'
begin object name="RealisticSecondaryFireParams_Mount" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Mount"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticSecondaryEffectParams_Mount'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
begin object name="RealisticSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
begin object name="RealisticSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Holosight"
	PlayerSpeedFactor=0.8250000
	InventorySize=9
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=3.0000000,Y=0.0000000,Z=3.2500000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=0.0000000)
	WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=0.0000000)
	WeaponName="FG-50 .50 Heavy Machinegun"
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticAimParams'
	AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticControlledAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticPriControlledFireParams'
	FireParams[1]=none
	FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticParams_Bipod'
begin object name="RealisticParams_Bipod" class=BCoreProV55.WeaponParams
	Weight=20
	LayoutName="Bipod"
	PlayerSpeedFactor=0.8250000
	InventorySize=9
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=0.0000000,Y=0.0500000,Z=2.0000000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=1.0000000)
	WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=1.0000000)
	WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=1.0000000)
	WeaponName="FG-50 .50 Heavy Machinegun"
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticAimParams'
	AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticControlledAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticPriControlledFireParams'
	FireParams[1]=none
	FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsRealistic.RealisticSecondaryFireParams_Mount'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsRealistic.FG50_Black'
begin object name="FG50_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsRealistic.FG50_Wood'
begin object name="FG50_Wood" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainWood",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsRealistic.FG50_Desert'
begin object name="FG50_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDesert",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsRealistic.FG50_Dazzle'
begin object name="FG50_Dazzle" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Dazzle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDazzle",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsRealistic.FG50_Gold'
begin object name="FG50_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainGold",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
	Index=4
end object
