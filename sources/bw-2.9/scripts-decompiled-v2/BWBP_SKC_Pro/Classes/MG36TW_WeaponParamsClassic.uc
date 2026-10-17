class MG36TW_WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="LMG"
		LayoutTags="lmg"
		PlayerSpeedFactor=0.9000000
		InventorySize=9
		SightMoveSpeedFactor=0.5000000
		ZoomType=2
		WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="mag",Slot=31,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=0.0000000)
		MagAmmo=100
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicPrimaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicParams_AR'
	begin object name="ClassicParams_AR" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Assault Rifle"
		LayoutTags="ar"
		PlayerSpeedFactor=0.9000000
		InventorySize=9
		SightMoveSpeedFactor=0.5000000
		WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="mag",Slot=31,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="Scope",Slot=33,Scale=0.0000000)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicPrimaryFireParams_AR'
	end object
	Layouts[1]=ClassicParams_AR
	// Reference: WeaponParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicParams_Gauss'
	begin object name="ClassicParams_Gauss" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Gauss Rifle"
		LayoutTags="gauss"
		PlayerSpeedFactor=0.9000000
		InventorySize=9
		SightMoveSpeedFactor=0.5000000
		ZoomType=2
		WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="mag",Slot=31,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=1.0000000)
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicPrimaryFireParams_Gauss'
	end object
	Layouts[2]=ClassicParams_Gauss
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.MG36_Gray'
	begin object name="MG36_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=MG36_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.MG36_Desert'
	begin object name="MG36_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainDesert",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscDesert",Index=2,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=MG36_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.MG36_HexGreen'
	begin object name="MG36_HexGreen" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainJungle",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscJungle",Index=2,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=MG36_HexGreen
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.MG36_Hunter'
	begin object name="MG36_Hunter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jaeger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainJaeger",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscJaeger",Index=2,pIndex=1,AIndex=1)
		Index=3
	end object
	Camos[3]=MG36_Hunter
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.MG36_Winter'
	begin object name="MG36_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainWinter",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscWinter",Index=2,pIndex=1,AIndex=1)
		Index=4
	end object
	Camos[4]=MG36_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.MG36_Pink'
	begin object name="MG36_Pink" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Pink"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainPink",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscPink",Index=2,pIndex=1,AIndex=1)
		Index=5
	end object
	Camos[5]=MG36_Pink
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.MG36_Gold'
	begin object name="MG36_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainGold",Index=1,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=MG36_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.4000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.1500000),(InVal=0.6000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.3000000)))
	PitchFactor=0.0500000
	YawFactor=0.1000000
	XRandFactor=0.1500000
	YRandFactor=0.1500000
	MaxRecoil=1200.0000000
	DeclineTime=0.9000000
	CrouchMultiplier=0.5000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=2560)
	CrouchMultiplier=0.5000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-5000,Roll=0)
	JumpOffset=(Pitch=-4000,Yaw=-3000,Roll=0)
	ViewBindFactor=1.0000000
	JumpChaos=0.4500000
	FallingChaos=0.4500000
	SprintChaos=0.4500000
	ChaosDeclineTime=1.5000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=24
	HeadMult=3.0000000
	LimbMult=0.6250000
	DamageType=Class'BWBP_SKC_Pro.DT_MG36Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MG36AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MG36Assault'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter_C'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.JSOC.JSOC-Fire',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=80.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=3,Y=3)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0850000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicPrimaryEffectParams_AR'
begin object name="ClassicPrimaryEffectParams_AR" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=24
	HeadMult=3.0000000
	LimbMult=0.6250000
	DamageType=Class'BWBP_SKC_Pro.DT_MG36Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MG36AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MG36Assault'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter_C'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.JSOC.JSOC-FireAR',Volume=1.7500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=90.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=3,Y=3)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicPrimaryFireParams_AR'
begin object name="ClassicPrimaryFireParams_AR" class=BCoreProV55.FireParams
	FireInterval=0.0850000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicPrimaryEffectParams_AR'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicPrimaryEffectParams_Gauss'
begin object name="ClassicPrimaryEffectParams_Gauss" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=60
	HeadMult=3.0000000
	LimbMult=0.6250000
	DamageType=Class'BWBP_SKC_Pro.DT_MG36Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MG36AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MG36Assault'
	PenetrationEnergy=200.0000000
	PenetrateForce=600
	bPenetrate=true
	WallPDamageFactor=0.7500000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.M2020FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.JSOC.JSOC-FireGauss',Volume=1.7500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=240.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1,Y=1)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicPrimaryFireParams_Gauss'
begin object name="ClassicPrimaryFireParams_Gauss" class=BCoreProV55.FireParams
	FireInterval=0.2850000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicPrimaryEffectParams_Gauss'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="LMG"
	LayoutTags="lmg"
	PlayerSpeedFactor=0.9000000
	InventorySize=9
	SightMoveSpeedFactor=0.5000000
	ZoomType=2
	WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="mag",Slot=31,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=0.0000000)
	MagAmmo=100
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicPrimaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicParams_AR'
begin object name="ClassicParams_AR" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Assault Rifle"
	LayoutTags="ar"
	PlayerSpeedFactor=0.9000000
	InventorySize=9
	SightMoveSpeedFactor=0.5000000
	WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="mag",Slot=31,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="Scope",Slot=33,Scale=0.0000000)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicPrimaryFireParams_AR'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicParams_Gauss'
begin object name="ClassicParams_Gauss" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Gauss Rifle"
	LayoutTags="gauss"
	PlayerSpeedFactor=0.9000000
	InventorySize=9
	SightMoveSpeedFactor=0.5000000
	ZoomType=2
	WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="mag",Slot=31,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=1.0000000)
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.ClassicPrimaryFireParams_Gauss'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.MG36_Gray'
begin object name="MG36_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.MG36_Desert'
begin object name="MG36_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainDesert",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscDesert",Index=2,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.MG36_HexGreen'
begin object name="MG36_HexGreen" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainJungle",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscJungle",Index=2,pIndex=1,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.MG36_Hunter'
begin object name="MG36_Hunter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jaeger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainJaeger",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscJaeger",Index=2,pIndex=1,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.MG36_Winter'
begin object name="MG36_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainWinter",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscWinter",Index=2,pIndex=1,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.MG36_Pink'
begin object name="MG36_Pink" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Pink"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainPink",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscPink",Index=2,pIndex=1,AIndex=1)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36TW_WeaponParamsClassic.MG36_Gold'
begin object name="MG36_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainGold",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
