class FG50TW_WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.8250000
		InventorySize=12
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=32,Yaw=0,Roll=0)
		WeaponName="Mounted FG-50 Heavy Machinegun"
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticAimParams'
		AimParams[1]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticControlledAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticPriControlledFireParams'
		FireParams[1]=none
		FireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
		AltFireParams[1]=none
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticParams_Bipod'
	begin object name="RealisticParams_Bipod" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.8250000
		InventorySize=12
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=32,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Holosight",Slot=51,Scale=0.0000000)
		WeaponName="Mounted FG-50 Heavy Machinegun"
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticAimParams'
		AimParams[1]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticControlledAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticPriControlledFireParams'
		FireParams[1]=none
		FireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
		AltFireParams[1]=none
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_Bipod
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.FG50_Black'
	begin object name="FG50_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=FG50_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.FG50_Wood'
	begin object name="FG50_Wood" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainWood",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
		Index=1
	end object
	Camos[1]=FG50_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.FG50_Desert'
	begin object name="FG50_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDesert",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
		Index=2
	end object
	Camos[2]=FG50_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.FG50_Dazzle'
	begin object name="FG50_Dazzle" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Dazzle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDazzle",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
		Index=3
	end object
	Camos[3]=FG50_Dazzle
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.FG50_Gold'
	begin object name="FG50_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainGold",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
		Index=4
	end object
	Camos[4]=FG50_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	TargetState="Mount"
	FireAnim="Undeploy"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticControlledAimParams'
begin object name="RealisticControlledAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=3072)
	AimAdjustTime=1.0000000
	CrouchMultiplier=1.0000000
	ADSMultiplier=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=2000
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=350
end object
// Reference: AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=398,Max=3072)
	CrouchMultiplier=1.0000000
	ADSMultiplier=0.7000000
	SprintChaos=0.4000000
	AimDamageThreshold=2000
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=375
end object
// Reference: RecoilParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.1000000
	YawFactor=0.1000000
	XRandFactor=0.5500000
	YRandFactor=0.5500000
	MaxRecoil=750.0000000
	DeclineTime=1.0000000
	ViewBindFactor=0.0000000
	ADSViewBindFactor=0.3000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticPriControlledFireParams'
begin object name="RealisticPriControlledFireParams" class=BCoreProV55.FireParams
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticPriControlledEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1600000
	BurstFireRateFactor=1.0000000
	FireAnimRate=1.5500000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=135
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
	Recoil=160.0000000
	Inaccuracy=(X=12,Y=12)
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticPriControlledEffectParams'
begin object name="RealisticPriControlledEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=135
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_FG50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_FG50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_FG50Limb'
	PenetrateForce=150
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.FG50FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AR23.AR23-HFire',Volume=6.7500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=80.0000000
	WarnTargetPct=0.4000000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.8250000
	InventorySize=12
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=32,Yaw=0,Roll=0)
	WeaponName="Mounted FG-50 Heavy Machinegun"
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticAimParams'
	AimParams[1]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticControlledAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticPriControlledFireParams'
	FireParams[1]=none
	FireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
	AltFireParams[1]=none
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticParams_Bipod'
begin object name="RealisticParams_Bipod" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.8250000
	InventorySize=12
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=32,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Holosight",Slot=51,Scale=0.0000000)
	WeaponName="Mounted FG-50 Heavy Machinegun"
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticAimParams'
	AimParams[1]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticControlledAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticPriControlledFireParams'
	FireParams[1]=none
	FireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
	AltFireParams[1]=none
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.FG50_Black'
begin object name="FG50_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.FG50_Wood'
begin object name="FG50_Wood" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainWood",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.FG50_Desert'
begin object name="FG50_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDesert",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.FG50_Dazzle'
begin object name="FG50_Dazzle" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Dazzle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDazzle",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsRealistic.FG50_Gold'
begin object name="FG50_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainGold",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
	Index=4
end object
