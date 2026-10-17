class R9WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.R9WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2300000
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=13,Scale=0.0000000)
		WeaponName="R9E2 .308 Ranger Rifle"
		MagAmmo=12
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BallisticProV55.R9WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.R9WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.R9WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.R9WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsRealistic.R9_Orange'
	begin object name="R9_Orange" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Orange"
	end object
	Camos[0]=R9_Orange
	// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsRealistic.R9_OrangeShine'
	begin object name="R9_OrangeShine" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Fresh Orange"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH2",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=R9_OrangeShine
	// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsRealistic.R9_Gray'
	begin object name="R9_Gray" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH4",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=R9_Gray
	// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsRealistic.R9_Jungle'
	begin object name="R9_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH3",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=R9_Jungle
	// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsRealistic.R9_Winter'
	begin object name="R9_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH5",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=R9_Winter
	// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsRealistic.R9_IceFire'
	begin object name="R9_IceFire" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Fire & Ice"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH1",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=R9_IceFire
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BallisticProV55.R9WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=2000.0000000,Max=10000.0000000)
	WaterTraceRange=5000.0000000
	Damage=93
	HeadMult=2.3870960
	LimbMult=0.6774190
	DamageType=Class'BallisticProV55.DTR9Rifle'
	DamageTypeHead=Class'BallisticProV55.DTR9RifleHead'
	DamageTypeArm=Class'BallisticProV55.DTR9Rifle'
	PenetrationEnergy=27.0000000
	PenetrateForce=200
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	Chaos=0.1000000
	Inaccuracy=(X=9,Y=9)
	BotRefireRate=0.1500000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BallisticProV55.R9WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=2.0000000
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.R9WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.R9WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.R9WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.R9WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.R9WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.6000000
	YawFactor=0.1000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=2560.0000000
	DeclineTime=0.8000000
	DeclineDelay=0.1900000
	ViewBindFactor=0.5000000
	ADSViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.R9WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=680,Max=1664)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-4096,Yaw=-3072,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.1250000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.2000000
	ChaosSpeedThreshold=550
end object
// Reference: WeaponParams'BallisticProV55.R9WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2300000
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=13,Scale=0.0000000)
	WeaponName="R9E2 .308 Ranger Rifle"
	MagAmmo=12
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BallisticProV55.R9WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.R9WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.R9WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.R9WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsRealistic.R9_Orange'
begin object name="R9_Orange" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Orange"
end object
// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsRealistic.R9_OrangeShine'
begin object name="R9_OrangeShine" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Fresh Orange"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH2",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsRealistic.R9_Gray'
begin object name="R9_Gray" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH4",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsRealistic.R9_Jungle'
begin object name="R9_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH3",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsRealistic.R9_Winter'
begin object name="R9_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH5",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsRealistic.R9_IceFire'
begin object name="R9_IceFire" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Fire & Ice"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH1",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
