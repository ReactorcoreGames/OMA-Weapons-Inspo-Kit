class MG36WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalParams_LMG'
	begin object name="TacticalParams_LMG" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="LMG"
		LayoutTags="lmg"
		PlayerSpeedFactor=0.9000000
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4500000
		ZoomType=2
		WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="MagDrum",Slot=31,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=0.0000000)
		WeaponName="Mk 88 Squad Automatic Weapon"
		DisplaceDurationMult=1.2500000
		MagAmmo=100
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalAimParams_LMG'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalPrimaryFireParams_LMG'
	end object
	Layouts[0]=TacticalParams_LMG
	// Reference: WeaponParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalParams_AR'
	begin object name="TacticalParams_AR" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Assault Rifle"
		LayoutTags="ar"
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4000000
		SightOffset=(X=-3.0000000,Y=0.3250000,Z=1.4300000)
		WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="MagDrum",Slot=31,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="Scope",Slot=33,Scale=0.0000000)
		WeaponName="Mk 88 Assault Rifle"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-49.5000000,Y=-2.8000000,Z=0.1000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalRecoilParams_AR'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalAimParams_AR'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalPrimaryFireParams_AR'
	end object
	Layouts[1]=TacticalParams_AR
	// Reference: WeaponParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalParams_Gauss'
	begin object name="TacticalParams_Gauss" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Gauss Rifle"
		LayoutTags="gauss"
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4000000
		ZoomType=2
		WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="MagDrum",Slot=31,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=1.0000000)
		WeaponName="Mk 88 Gauss Rifle"
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalRecoilParams_Gauss'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalAimParams_LMG'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalPrimaryFireParams_Gauss'
	end object
	Layouts[2]=TacticalParams_Gauss
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsTactical.MG36_Gray'
	begin object name="MG36_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=MG36_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsTactical.MG36_Desert'
	begin object name="MG36_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainDesert",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscDesert",Index=2,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=MG36_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsTactical.MG36_HexGreen'
	begin object name="MG36_HexGreen" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainJungle",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscJungle",Index=2,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=MG36_HexGreen
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsTactical.MG36_Hunter'
	begin object name="MG36_Hunter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jaeger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainJaeger",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscJaeger",Index=2,pIndex=1,AIndex=1)
		Index=3
	end object
	Camos[3]=MG36_Hunter
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsTactical.MG36_Winter'
	begin object name="MG36_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainWinter",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscWinter",Index=2,pIndex=1,AIndex=1)
		Index=4
	end object
	Camos[4]=MG36_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsTactical.MG36_Pink'
	begin object name="MG36_Pink" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Pink"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainPink",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscPink",Index=2,pIndex=1,AIndex=1)
		Index=5
	end object
	Camos[5]=MG36_Pink
	// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsTactical.MG36_Gold'
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
// Reference: AimParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalAimParams_LMG'
begin object name="TacticalAimParams_LMG" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=2872)
	AimAdjustTime=0.8000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-5000,Roll=0)
	ChaosDeclineTime=1.5000000
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalPrimaryEffectParams_LMG'
begin object name="TacticalPrimaryEffectParams_LMG" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DT_MG36Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MG36AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MG36Assault'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.JSOC.JSOC-Fire',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=230.0000000
	Inaccuracy=(X=3,Y=3)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalPrimaryFireParams_LMG'
begin object name="TacticalPrimaryFireParams_LMG" class=BCoreProV55.FireParams
	FireInterval=0.0850000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalPrimaryEffectParams_LMG'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalPrimaryEffectParams_AR'
begin object name="TacticalPrimaryEffectParams_AR" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DT_MG36Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MG36AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MG36Assault'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.JSOC.JSOC-FireAR',Volume=1.7500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=190.0000000
	Inaccuracy=(X=3,Y=3)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalPrimaryFireParams_AR'
begin object name="TacticalPrimaryFireParams_AR" class=BCoreProV55.FireParams
	FireInterval=0.0860000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalPrimaryEffectParams_AR'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalPrimaryEffectParams_Gauss'
begin object name="TacticalPrimaryEffectParams_Gauss" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DecayRange=(Min=5250.0000000,Max=10250.0000000)
	RangeAtten=0.9700000
	Damage=60
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DT_MG36Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MG36AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MG36Assault'
	PenetrationEnergy=150.0000000
	PenetrateForce=600
	bPenetrate=true
	PDamageFactor=0.8000000
	WallPDamageFactor=0.6000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.M2020FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.JSOC.JSOC-FireGauss',Volume=1.7500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1200.0000000
	PushbackForce=250.0000000
	Chaos=0.0500000
	Inaccuracy=(X=1,Y=1)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalPrimaryFireParams_Gauss'
begin object name="TacticalPrimaryFireParams_Gauss" class=BCoreProV55.FireParams
	FireInterval=0.2800000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalPrimaryEffectParams_Gauss'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=-0.1000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1200000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.5000000,OutVal=0.6000000),(InVal=0.7500000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.2500000
	YawFactor=0.3000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=3200.0000000
	DeclineTime=0.7500000
	DeclineDelay=0.1450000
	ViewBindFactor=0.3500000
	CrouchMultiplier=0.8000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalRecoilParams_Gauss'
begin object name="TacticalRecoilParams_Gauss" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=-0.1000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.2000000),(InVal=0.8000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4000000)))
	PitchFactor=0.3500000
	YawFactor=0.3000000
	XRandFactor=0.4500000
	YRandFactor=0.4500000
	MaxRecoil=3200.0000000
	ClimbTime=0.0600000
	DeclineTime=0.7500000
	DeclineDelay=0.2150000
	ViewBindFactor=0.5500000
	CrouchMultiplier=0.8000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalRecoilParams_AR'
begin object name="TacticalRecoilParams_AR" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.0800000),(InVal=0.2500000,OutVal=0.0400000),(InVal=0.3000000,OutVal=-0.0500000),(InVal=0.4500000,OutVal=0.0000000),(InVal=0.6000000,OutVal=-0.4000000),(InVal=0.8000000,OutVal=-0.1200000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1200000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.5000000,OutVal=0.6000000),(InVal=0.7500000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1500000
	YRandFactor=0.4500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1200000
	EscapeMultiplier=1.4500000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.6000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalAimParams_AR'
begin object name="TacticalAimParams_AR" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalParams_LMG'
begin object name="TacticalParams_LMG" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="LMG"
	LayoutTags="lmg"
	PlayerSpeedFactor=0.9000000
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4500000
	ZoomType=2
	WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="MagDrum",Slot=31,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=0.0000000)
	WeaponName="Mk 88 Squad Automatic Weapon"
	DisplaceDurationMult=1.2500000
	MagAmmo=100
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalAimParams_LMG'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalPrimaryFireParams_LMG'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalParams_AR'
begin object name="TacticalParams_AR" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Assault Rifle"
	LayoutTags="ar"
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4000000
	SightOffset=(X=-3.0000000,Y=0.3250000,Z=1.4300000)
	WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="MagDrum",Slot=31,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="Scope",Slot=33,Scale=0.0000000)
	WeaponName="Mk 88 Assault Rifle"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-49.5000000,Y=-2.8000000,Z=0.1000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalRecoilParams_AR'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalAimParams_AR'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalPrimaryFireParams_AR'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalParams_Gauss'
begin object name="TacticalParams_Gauss" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Gauss Rifle"
	LayoutTags="gauss"
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4000000
	ZoomType=2
	WeaponBoneScales[0]=(BoneName="MagSmall",Slot=30,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="MagDrum",Slot=31,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Reciever",Slot=32,Scale=1.0000000)
	WeaponName="Mk 88 Gauss Rifle"
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalRecoilParams_Gauss'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalAimParams_LMG'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MG36WeaponParamsTactical.TacticalPrimaryFireParams_Gauss'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsTactical.MG36_Gray'
begin object name="MG36_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsTactical.MG36_Desert'
begin object name="MG36_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainDesert",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscDesert",Index=2,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsTactical.MG36_HexGreen'
begin object name="MG36_HexGreen" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainJungle",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscJungle",Index=2,pIndex=1,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsTactical.MG36_Hunter'
begin object name="MG36_Hunter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jaeger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainJaeger",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscJaeger",Index=2,pIndex=1,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsTactical.MG36_Winter'
begin object name="MG36_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainWinter",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscWinter",Index=2,pIndex=1,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsTactical.MG36_Pink'
begin object name="MG36_Pink" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Pink"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainPink",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MiscPink",Index=2,pIndex=1,AIndex=1)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MG36WeaponParamsTactical.MG36_Gold'
begin object name="MG36_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MG36Camos.MG36-MainGold",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
