class AH104PistolWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Iron Sights"
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=-11.5000000,Y=0.0000000,Z=2.0300000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=50,Scale=0.0000000)
		ViewOffset=(X=9.0000000,Y=7.0000000,Z=-4.0000000)
		MagAmmo=7
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicParams_Holo'
	begin object name="ClassicParams_Holo" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Holosight"
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=-29.5000000,Y=-0.0200000,Z=5.0500000)
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BWBP_SKC_Tex.TechSawnOff.DoubleBarrel_Main1_Tex',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.TechSawnOff.DoubleBarrel-MainSpec',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=50,Scale=1.0000000)
		ViewOffset=(X=9.0000000,Y=7.0000000,Z=-4.0000000)
		MagAmmo=7
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_Holo
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.AH_Black'
	begin object name="AH_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=AH_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.AH_Red'
	begin object name="AH_Red" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainRed",Index=1,pIndex=1,AIndex=0)
		Index=1
	end object
	Camos[1]=AH_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.AH_Green'
	begin object name="AH_Green" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainGreen",Index=1,pIndex=1,AIndex=0)
		Index=2
	end object
	Camos[2]=AH_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.AH_Tiger'
	begin object name="AH_Tiger" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainTiger",Index=1,pIndex=1,AIndex=0)
		Index=3
	end object
	Camos[3]=AH_Tiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.AH_Meat'
	begin object name="AH_Meat" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Meat"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainMeat",Index=1,pIndex=1,AIndex=0)
		Index=4
	end object
	Camos[4]=AH_Meat
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.AH_Gold'
	begin object name="AH_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainGoldShine",Index=1,pIndex=1,AIndex=0)
		Index=5
	end object
	Camos[5]=AH_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	BurstFireRateFactor=1.0000000
	FireAnim="FireBig"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.4500000
	YRandFactor=0.4500000
	MaxRecoil=5000.0000000
	DeclineTime=1.0000000
	DeclineDelay=0.0500000
	ViewBindFactor=0.3000000
	ADSViewBindFactor=0.3000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=40,Max=1024)
	AimAdjustTime=0.6000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.3000000
	JumpChaos=0.7500000
	FallingChaos=0.4000000
	SprintChaos=0.3000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=800
	ChaosTurnThreshold=185000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=6000.0000000,Max=6500.0000000)
	WaterTraceRange=3250.0000000
	RangeAtten=0.3500000
	Damage=100
	HeadMult=1.4700000
	DamageType=Class'BWBP_SKC_Pro.DT_AH104Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AH104PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AH104Pistol'
	PenetrationEnergy=48.0000000
	PenetrateForce=250
	bPenetrate=true
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter_C'
	FlashScaleFactor=1.1000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-Super',Volume=5.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=4096.0000000
	PushbackForce=170.0000000
	Chaos=10.0000000
	Inaccuracy=(X=3,Y=3)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=14.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-FlameLoopStart',Volume=1.6000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=0.0100000
	Chaos=0.0500000
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Iron Sights"
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=-11.5000000,Y=0.0000000,Z=2.0300000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=50,Scale=0.0000000)
	ViewOffset=(X=9.0000000,Y=7.0000000,Z=-4.0000000)
	MagAmmo=7
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicParams_Holo'
begin object name="ClassicParams_Holo" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Holosight"
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=-29.5000000,Y=-0.0200000,Z=5.0500000)
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BWBP_SKC_Tex.TechSawnOff.DoubleBarrel_Main1_Tex',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.TechSawnOff.DoubleBarrel-MainSpec',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=50,Scale=1.0000000)
	ViewOffset=(X=9.0000000,Y=7.0000000,Z=-4.0000000)
	MagAmmo=7
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.AH_Black'
begin object name="AH_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.AH_Red'
begin object name="AH_Red" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainRed",Index=1,pIndex=1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.AH_Green'
begin object name="AH_Green" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainGreen",Index=1,pIndex=1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.AH_Tiger'
begin object name="AH_Tiger" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainTiger",Index=1,pIndex=1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.AH_Meat'
begin object name="AH_Meat" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Meat"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainMeat",Index=1,pIndex=1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsClassic.AH_Gold'
begin object name="AH_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainGoldShine",Index=1,pIndex=1,AIndex=0)
	Index=5
end object
