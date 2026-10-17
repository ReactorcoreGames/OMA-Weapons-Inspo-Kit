class SRS900WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.SRS900WeaponParamsComp.ArenaParams_Scope'
	begin object name="ArenaParams_Scope" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Adv Scope"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.5000000
		SightOffset=(X=9.0000000,Y=0.0000000,Z=3.1500000)
		ZoomType=2
		WeaponBoneScales[0]=(BoneName="RDS",Slot=5,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=6,Scale=1.0000000)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		AllowedCamos[5]=5
		AllowedCamos[6]=6
		AllowedCamos[7]=7
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BallisticProV55.SRS900WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.SRS900WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsComp.ArenaPrimaryFireParams'
	end object
	Layouts[0]=ArenaParams_Scope
	// Reference: WeaponParams'BallisticProV55.SRS900WeaponParamsComp.ArenaParams_RDS'
	begin object name="ArenaParams_RDS" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Holosight"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightOffset=(X=5.0000000,Y=0.0000000,Z=2.0300000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=5,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=6,Scale=0.0000000)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		AllowedCamos[5]=5
		AllowedCamos[6]=6
		AllowedCamos[7]=7
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BallisticProV55.SRS900WeaponParamsComp.ArenaRecoilParams_600'
		AimParams[0]=AimParams'BallisticProV55.SRS900WeaponParamsComp.ArenaAimParams_600'
		FireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsComp.ArenaPrimaryFireParams_600'
	end object
	Layouts[1]=ArenaParams_RDS
	// Reference: WeaponParams'BallisticProV55.SRS900WeaponParamsComp.ArenaParams_IRONS'
	begin object name="ArenaParams_IRONS" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Irons"
		LayoutTags="irons"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightOffset=(X=0.2500000,Y=0.0000000,Z=1.3000000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=5,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=6,Scale=0.0000000)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		AllowedCamos[5]=5
		AllowedCamos[6]=6
		AllowedCamos[7]=7
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BallisticProV55.SRS900WeaponParamsComp.ArenaRecoilParams_600'
		AimParams[0]=AimParams'BallisticProV55.SRS900WeaponParamsComp.ArenaAimParams_600'
		FireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsComp.ArenaPrimaryFireParams_600'
	end object
	Layouts[2]=ArenaParams_IRONS
	// Reference: WeaponParams'BallisticProV55.SRS900WeaponParamsComp.ArenaParams_Relic'
	begin object name="ArenaParams_Relic" class=BCoreProV55.WeaponParams
		Weight=1
		LayoutName="Relic"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightOffset=(X=1.0000000,Y=0.0000000,Z=0.8500000)
		WeaponName="SR18 Battle Rifle"
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.SR18_FPm'
		AttachmentMesh=SkeletalMesh'BW_Core_WeaponAnim.SR18_TPm'
		AllowedCamos[0]=8
		AllowedCamos[1]=9
		MagAmmo=20
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.SRS900WeaponParamsComp.ArenaRecoilParams_600'
		AimParams[0]=AimParams'BallisticProV55.SRS900WeaponParamsComp.ArenaAimParams_600'
		FireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsComp.ArenaPrimaryFireParams_Relic'
	end object
	Layouts[3]=ArenaParams_Relic
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_Gray'
	begin object name="SRS_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=SRS_Gray
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_Desert'
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
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_DesertTac'
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
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_Black'
	begin object name="SRS_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSNSGrey",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=SRS_Black
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_Flecktarn'
	begin object name="SRS_Flecktarn" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Flecktarn"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSM2German",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=SRS_Flecktarn
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_Blue'
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
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_Red'
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
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_RedTiger'
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
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_RelicWood'
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
	// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_RelicBlack'
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
// Reference: RecoilParams'BallisticProV55.SRS900WeaponParamsComp.ArenaRecoilParams_600'
begin object name="ArenaRecoilParams_600" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2500000,OutVal=-0.0200000),(InVal=0.4000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=-0.0400000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1200000,OutVal=0.1100000),(InVal=0.3000000,OutVal=0.3300000),(InVal=0.5000000,OutVal=0.5000000),(InVal=0.7500000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.2200000
	ViewBindFactor=0.2500000
	HipMultiplier=1.5000000
end object
// Reference: AimParams'BallisticProV55.SRS900WeaponParamsComp.ArenaAimParams_600'
begin object name="ArenaAimParams_600" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=768)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: FireParams'BallisticProV55.SRS900WeaponParamsComp.ArenaPrimaryFireParams_600'
begin object name="ArenaPrimaryFireParams_600" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=0.5500000
	FireEndAnim="None"
	FireAnimRate=0.8500000
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.SRS900WeaponParamsComp.ArenaPrimaryEffectParams_600'
end object
// Reference: InstantEffectParams'BallisticProV55.SRS900WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DecayRange=(Min=2300.0000000,Max=6000.0000000)
	RangeAtten=0.7500000
	Damage=60
	DamageType=Class'BallisticProV55.DTSRS900Rifle'
	DamageTypeHead=Class'BallisticProV55.DTSRS900RifleHead'
	DamageTypeArm=Class'BallisticProV55.DTSRS900Rifle'
	PenetrationEnergy=48.0000000
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.SRS900.SRS-Fire',Volume=1.0000000,Radius=1536.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	Recoil=600.0000000
	Chaos=0.0700000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.SRS900WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=0.5500000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.SRS900WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.SRS900WeaponParamsComp.ArenaPrimaryEffectParams_600'
begin object name="ArenaPrimaryEffectParams_600" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DecayRange=(Min=2300.0000000,Max=6000.0000000)
	RangeAtten=0.7500000
	Damage=60
	DamageType=Class'BallisticProV55.DTSRS900Rifle'
	DamageTypeHead=Class'BallisticProV55.DTSRS900RifleHead'
	DamageTypeArm=Class'BallisticProV55.DTSRS900Rifle'
	PenetrationEnergy=48.0000000
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.SRS900.SRS-Fire',Volume=1.0000000,Radius=1536.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	Recoil=600.0000000
	Chaos=0.0650000
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BallisticProV55.SRS900WeaponParamsComp.ArenaPrimaryEffectParams_Relic'
begin object name="ArenaPrimaryEffectParams_Relic" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DecayRange=(Min=2300.0000000,Max=6000.0000000)
	RangeAtten=0.7500000
	Damage=60
	DamageType=Class'BallisticProV55.DTSRS900Rifle'
	DamageTypeHead=Class'BallisticProV55.DTSRS900RifleHead'
	DamageTypeArm=Class'BallisticProV55.DTSRS900Rifle'
	PenetrationEnergy=48.0000000
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SRSM2.SRSM2-Fire3',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=0.9000000,bAtten=false,bNoOverride=true)
	Recoil=550.0000000
	Chaos=0.0750000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.SRS900WeaponParamsComp.ArenaPrimaryFireParams_Relic'
begin object name="ArenaPrimaryFireParams_Relic" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=0.5500000
	FireEndAnim="None"
	FireAnimRate=0.8500000
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.SRS900WeaponParamsComp.ArenaPrimaryEffectParams_Relic'
end object
// Reference: RecoilParams'BallisticProV55.SRS900WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2500000,OutVal=-0.0200000),(InVal=0.4000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=-0.0400000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1200000,OutVal=0.1100000),(InVal=0.3000000,OutVal=0.3300000),(InVal=0.5000000,OutVal=0.5000000),(InVal=0.7500000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.2200000
	ViewBindFactor=0.2500000
	HipMultiplier=1.5000000
end object
// Reference: AimParams'BallisticProV55.SRS900WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=768)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.SRS900WeaponParamsComp.ArenaParams_Scope'
begin object name="ArenaParams_Scope" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Adv Scope"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.5000000
	SightOffset=(X=9.0000000,Y=0.0000000,Z=3.1500000)
	ZoomType=2
	WeaponBoneScales[0]=(BoneName="RDS",Slot=5,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=6,Scale=1.0000000)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	AllowedCamos[5]=5
	AllowedCamos[6]=6
	AllowedCamos[7]=7
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BallisticProV55.SRS900WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.SRS900WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsComp.ArenaPrimaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.SRS900WeaponParamsComp.ArenaParams_RDS'
begin object name="ArenaParams_RDS" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Holosight"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightOffset=(X=5.0000000,Y=0.0000000,Z=2.0300000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=5,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=6,Scale=0.0000000)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	AllowedCamos[5]=5
	AllowedCamos[6]=6
	AllowedCamos[7]=7
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BallisticProV55.SRS900WeaponParamsComp.ArenaRecoilParams_600'
	AimParams[0]=AimParams'BallisticProV55.SRS900WeaponParamsComp.ArenaAimParams_600'
	FireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsComp.ArenaPrimaryFireParams_600'
end object
// Reference: WeaponParams'BallisticProV55.SRS900WeaponParamsComp.ArenaParams_IRONS'
begin object name="ArenaParams_IRONS" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Irons"
	LayoutTags="irons"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightOffset=(X=0.2500000,Y=0.0000000,Z=1.3000000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=5,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=6,Scale=0.0000000)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	AllowedCamos[5]=5
	AllowedCamos[6]=6
	AllowedCamos[7]=7
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BallisticProV55.SRS900WeaponParamsComp.ArenaRecoilParams_600'
	AimParams[0]=AimParams'BallisticProV55.SRS900WeaponParamsComp.ArenaAimParams_600'
	FireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsComp.ArenaPrimaryFireParams_600'
end object
// Reference: WeaponParams'BallisticProV55.SRS900WeaponParamsComp.ArenaParams_Relic'
begin object name="ArenaParams_Relic" class=BCoreProV55.WeaponParams
	Weight=1
	LayoutName="Relic"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightOffset=(X=1.0000000,Y=0.0000000,Z=0.8500000)
	WeaponName="SR18 Battle Rifle"
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.SR18_FPm'
	AttachmentMesh=SkeletalMesh'BW_Core_WeaponAnim.SR18_TPm'
	AllowedCamos[0]=8
	AllowedCamos[1]=9
	MagAmmo=20
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.SRS900WeaponParamsComp.ArenaRecoilParams_600'
	AimParams[0]=AimParams'BallisticProV55.SRS900WeaponParamsComp.ArenaAimParams_600'
	FireParams[0]=FireParams'BallisticProV55.SRS900WeaponParamsComp.ArenaPrimaryFireParams_Relic'
end object
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_Gray'
begin object name="SRS_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_Desert'
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
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_DesertTac'
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
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_Black'
begin object name="SRS_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSNSGrey",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_Flecktarn'
begin object name="SRS_Flecktarn" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Flecktarn"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSM2German",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_Blue'
begin object name="SRS_Blue" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSNSJungle",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-BSight-FB",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-BSight-S",Index=5,pIndex=-1,AIndex=-1)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_Red'
begin object name="SRS_Red" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSNSTiger",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-FB",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-S",Index=5,pIndex=-1,AIndex=-1)
	Index=6
end object
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_RedTiger'
begin object name="SRS_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRSNSFlame",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-FB",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRSCamos.SRS-HSight-S",Index=5,pIndex=-1,AIndex=-1)
	Index=7
end object
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_RelicWood'
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
// Reference: WeaponCamo'BallisticProV55.SRS900WeaponParamsComp.SRS_RelicBlack'
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
