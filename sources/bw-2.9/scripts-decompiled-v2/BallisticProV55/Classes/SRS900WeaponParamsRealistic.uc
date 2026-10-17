class SRS900WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Scoped"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=9.0000000,Y=0.0000000,Z=3.1500000)
		ZoomType=2
		WeaponBoneScales[0]=(BoneName="RDS",Slot=5,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=6,Scale=1.0000000)
		WeaponName="SRS900-E 7.62mm Marksman Rifle"
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		AllowedCamos[5]=5
		AllowedCamos[6]=6
		AllowedCamos[7]=7
		MagAmmo=20
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticParams_RDS'
	begin object name="RealisticParams_RDS" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Holosight"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=5.0000000,Y=0.0000000,Z=2.0300000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=5,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=6,Scale=0.0000000)
		WeaponName="SRS900-E 7.62mm Marksman Rifle"
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		AllowedCamos[5]=5
		AllowedCamos[6]=6
		AllowedCamos[7]=7
		MagAmmo=20
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticRecoilParams_Iron'
		AimParams[0]=AimParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_RDS
	// Reference: WeaponParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticParams_Irons'
	begin object name="RealisticParams_Irons" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Iron Sights"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2200000
		SightOffset=(X=1.0000000,Y=0.0000000,Z=1.3000000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=5,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=6,Scale=0.0000000)
		WeaponName="SRS900-E 7.62mm Marksman Rifle"
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		AllowedCamos[5]=5
		AllowedCamos[6]=6
		AllowedCamos[7]=7
		MagAmmo=20
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticRecoilParams_Iron'
		AimParams[0]=AimParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[2]=RealisticParams_Irons
	// Reference: WeaponParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticParams_Relic'
	begin object name="RealisticParams_Relic" class=BCoreProV55.WeaponParams
		Weight=1
		LayoutName="Relic"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2000000
		SightOffset=(X=1.0000000,Y=0.0000000,Z=0.8500000)
		WeaponName="SR18 7.62mm Battle Rifle"
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.SR18_FPm'
		AttachmentMesh=SkeletalMesh'BW_Core_WeaponAnim.SR18_TPm'
		AllowedCamos[0]=8
		AllowedCamos[1]=9
		MagAmmo=20
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticRecoilParams_Iron'
		AimParams[0]=AimParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticPrimaryFireParams_Relic'
		AltFireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[3]=RealisticParams_Relic
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_Gray'
	begin object name="SRS_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=SRS_Gray
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_Desert'
	begin object name="SRS_Desert" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS900-KMain",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS900-KScopeShine",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS900-KAmmo",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-FB",Index=4,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[5]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-S",Index=5,pIndex=-1,AIndex=-1)
		Index=1
	end object
	Camos[1]=SRS_Desert
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_DesertTac'
	begin object name="SRS_DesertTac" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert Tac"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSNSDesert",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS900-KScopeShine",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS900-KAmmo",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-FB",Index=4,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[5]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-S",Index=5,pIndex=-1,AIndex=-1)
		Index=2
	end object
	Camos[2]=SRS_DesertTac
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_Black'
	begin object name="SRS_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSNSGrey",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=SRS_Black
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_Flecktarn'
	begin object name="SRS_Flecktarn" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Flecktarn"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSM2German",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=SRS_Flecktarn
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_Blue'
	begin object name="SRS_Blue" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSNSJungle",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-BSight-FB",Index=4,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-BSight-S",Index=5,pIndex=-1,AIndex=-1)
		Index=5
	end object
	Camos[5]=SRS_Blue
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_Red'
	begin object name="SRS_Red" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSNSTiger",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-FB",Index=4,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-S",Index=5,pIndex=-1,AIndex=-1)
		Index=6
	end object
	Camos[6]=SRS_Red
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_RedTiger'
	begin object name="SRS_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSNSFlame",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-FB",Index=4,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-S",Index=5,pIndex=-1,AIndex=-1)
		Index=7
	end object
	Camos[7]=SRS_RedTiger
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_RelicWood'
	begin object name="SRS_RelicWood" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.SRS900.SR18-Main',MaterialName="",Index=1,pIndex=-1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.SRS900.SR18-Misc',MaterialName="",Index=2,pIndex=-1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=Texture'BW_Core_WeaponTex.SRS900.SRS900Ammo',MaterialName="",Index=3,pIndex=2,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.SRS900.SRS900Main',MaterialName="",Index=4,pIndex=-1,AIndex=2)
		Index=8
	end object
	Camos[8]=SRS_RelicWood
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_RelicBlack'
	begin object name="SRS_RelicBlack" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SR18-MainBlack",Index=1,pIndex=-1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SR18-MiscBlack",Index=2,pIndex=-1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=Texture'BW_Core_WeaponTex.SRS900.SRS900Ammo',MaterialName="",Index=3,pIndex=2,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.SRS900.SRS900Main',MaterialName="",Index=4,pIndex=-1,AIndex=2)
		Index=9
	end object
	Camos[9]=SRS_RelicBlack
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: AimParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=680,Max=1536)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2560,Yaw=-4096,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.0750000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=550
	ChaosTurnThreshold=170000
end object
// Reference: FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0950000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticRecoilParams_Iron'
begin object name="RealisticRecoilParams_Iron" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.1000000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.2000000
	XRandFactor=0.1850000
	YRandFactor=0.1850000
	MaxRecoil=4000.0000000
	DeclineTime=0.9000000
	DeclineDelay=0.1800000
	ViewBindFactor=0.5000000
	ADSViewBindFactor=0.3000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: InstantEffectParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=10000.0000000)
	WaterTraceRange=5000.0000000
	DecayRange=(Min=1800.0000000,Max=9000.0000000)
	RangeAtten=0.1000000
	Damage=60
	HeadMult=2.2000000
	LimbMult=0.6600000
	DamageType=Class'BallisticProV55.DTSRS900Rifle'
	DamageTypeHead=Class'BallisticProV55.DTSRS900RifleHead'
	DamageTypeArm=Class'BallisticProV55.DTSRS900Rifle'
	PenetrationEnergy=24.0000000
	PenetrateForce=125
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.SRS900.SRS-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=850.0000000
	Chaos=0.1000000
	Inaccuracy=(X=2,Y=2)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticPrimaryEffectParams_Relic'
begin object name="RealisticPrimaryEffectParams_Relic" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=10000.0000000)
	WaterTraceRange=5000.0000000
	DecayRange=(Min=1800.0000000,Max=9000.0000000)
	RangeAtten=0.1000000
	Damage=55
	HeadMult=2.2000000
	LimbMult=0.6600000
	DamageType=Class'BallisticProV55.DTSRS900Rifle'
	DamageTypeHead=Class'BallisticProV55.DTSRS900RifleHead'
	DamageTypeArm=Class'BallisticProV55.DTSRS900Rifle'
	PenetrationEnergy=24.0000000
	PenetrateForce=125
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SRSM2.SRSM2-Fire3',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=0.9000000,bAtten=false,bNoOverride=true)
	Recoil=750.0000000
	Chaos=0.1000000
	Inaccuracy=(X=2,Y=2)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticPrimaryFireParams_Relic'
begin object name="RealisticPrimaryFireParams_Relic" class=BCoreProV55.FireParams
	FireInterval=0.1550000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticPrimaryEffectParams_Relic'
end object
// Reference: FireEffectParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: RecoilParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.1000000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.2000000
	XRandFactor=0.1850000
	YRandFactor=0.1850000
	MaxRecoil=4000.0000000
	DeclineTime=0.9000000
	DeclineDelay=0.1800000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: WeaponParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Scoped"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=9.0000000,Y=0.0000000,Z=3.1500000)
	ZoomType=2
	WeaponBoneScales[0]=(BoneName="RDS",Slot=5,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=6,Scale=1.0000000)
	WeaponName="SRS900-E 7.62mm Marksman Rifle"
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	AllowedCamos[5]=5
	AllowedCamos[6]=6
	AllowedCamos[7]=7
	MagAmmo=20
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticParams_RDS'
begin object name="RealisticParams_RDS" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Holosight"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=5.0000000,Y=0.0000000,Z=2.0300000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=5,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=6,Scale=0.0000000)
	WeaponName="SRS900-E 7.62mm Marksman Rifle"
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	AllowedCamos[5]=5
	AllowedCamos[6]=6
	AllowedCamos[7]=7
	MagAmmo=20
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticRecoilParams_Iron'
	AimParams[0]=AimParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticParams_Irons'
begin object name="RealisticParams_Irons" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Iron Sights"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2200000
	SightOffset=(X=1.0000000,Y=0.0000000,Z=1.3000000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=5,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=6,Scale=0.0000000)
	WeaponName="SRS900-E 7.62mm Marksman Rifle"
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	AllowedCamos[5]=5
	AllowedCamos[6]=6
	AllowedCamos[7]=7
	MagAmmo=20
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticRecoilParams_Iron'
	AimParams[0]=AimParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticParams_Relic'
begin object name="RealisticParams_Relic" class=BCoreProV55.WeaponParams
	Weight=1
	LayoutName="Relic"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2000000
	SightOffset=(X=1.0000000,Y=0.0000000,Z=0.8500000)
	WeaponName="SR18 7.62mm Battle Rifle"
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.SR18_FPm'
	AttachmentMesh=SkeletalMesh'BW_Core_WeaponAnim.SR18_TPm'
	AllowedCamos[0]=8
	AllowedCamos[1]=9
	MagAmmo=20
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticRecoilParams_Iron'
	AimParams[0]=AimParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticPrimaryFireParams_Relic'
	AltFireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_Gray'
begin object name="SRS_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_Desert'
begin object name="SRS_Desert" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS900-KMain",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS900-KScopeShine",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS900-KAmmo",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-FB",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[5]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-S",Index=5,pIndex=-1,AIndex=-1)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_DesertTac'
begin object name="SRS_DesertTac" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert Tac"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSNSDesert",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS900-KScopeShine",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS900-KAmmo",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-FB",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[5]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-S",Index=5,pIndex=-1,AIndex=-1)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_Black'
begin object name="SRS_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSNSGrey",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_Flecktarn'
begin object name="SRS_Flecktarn" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Flecktarn"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSM2German",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_Blue'
begin object name="SRS_Blue" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSNSJungle",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-BSight-FB",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-BSight-S",Index=5,pIndex=-1,AIndex=-1)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_Red'
begin object name="SRS_Red" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSNSTiger",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-FB",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-S",Index=5,pIndex=-1,AIndex=-1)
	Index=6
end object
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_RedTiger'
begin object name="SRS_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSNSFlame",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-FB",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-S",Index=5,pIndex=-1,AIndex=-1)
	Index=7
end object
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_RelicWood'
begin object name="SRS_RelicWood" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.SRS900.SR18-Main',MaterialName="",Index=1,pIndex=-1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.SRS900.SR18-Misc',MaterialName="",Index=2,pIndex=-1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=Texture'BW_Core_WeaponTex.SRS900.SRS900Ammo',MaterialName="",Index=3,pIndex=2,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.SRS900.SRS900Main',MaterialName="",Index=4,pIndex=-1,AIndex=2)
	Index=8
end object
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsRealistic.SRS_RelicBlack'
begin object name="SRS_RelicBlack" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SR18-MainBlack",Index=1,pIndex=-1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SR18-MiscBlack",Index=2,pIndex=-1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=Texture'BW_Core_WeaponTex.SRS900.SRS900Ammo',MaterialName="",Index=3,pIndex=2,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.SRS900.SRS900Main',MaterialName="",Index=4,pIndex=-1,AIndex=2)
	Index=9
end object
