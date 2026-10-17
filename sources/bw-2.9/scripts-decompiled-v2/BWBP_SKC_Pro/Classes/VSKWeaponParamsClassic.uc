class VSKWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4500000
		SightOffset=(X=25.0000000,Y=0.4000000,Z=11.2000000)
		ZoomType=4
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_8XScope',BoneName="tip",Scale=0.1000000,AugmentOffset=(X=-20.0000000,Y=-2.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=10
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicPrimaryFireHeavyParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicPrimaryFireStandardParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicParams_Irons'
	begin object name="ClassicParams_Irons" class=BCoreProV55.WeaponParams
		Weight=30
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=20.0000000,Y=0.5000000,Z=3.2000000)
		MagAmmo=10
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicPrimaryFireHeavyParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicPrimaryFireStandardParams'
	end object
	Layouts[1]=ClassicParams_Irons
	// Reference: WeaponCamo'BWBP_SKC_Pro.VSKWeaponParamsClassic.VSK_Gray'
	begin object name="VSK_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=VSK_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.VSKWeaponParamsClassic.VSK_UTC'
	begin object name="VSK_UTC" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="UTC"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.VSKCamos.UTCVskShine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=VSK_UTC
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicPrimaryFireHeavyParams'
begin object name="ClassicPrimaryFireHeavyParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicPrimaryEffectHeavyParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicPrimaryFireStandardParams'
begin object name="ClassicPrimaryFireStandardParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicPrimaryEffectStandardParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.4000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.6500000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.4000000
	XRandFactor=0.3000000
	YRandFactor=0.2000000
	MaxRecoil=2048.0000000
	ViewBindFactor=0.6000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicPrimaryEffectHeavyParams'
begin object name="ClassicPrimaryEffectHeavyParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	WaterTraceRange=5000.0000000
	Damage=35
	HeadMult=2.5000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_VSKTranq'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_VSKTranqHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_VSKTranq'
	PenetrationEnergy=1.0000000
	PenetrateForce=150
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.VSK.VSK-SuperShot',Volume=1.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=172.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1,Y=1)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicPrimaryEffectStandardParams'
begin object name="ClassicPrimaryEffectStandardParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	Damage=15
	HeadMult=4.0000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_VSKTranq'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_VSKTranqHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_VSKTranq'
	PenetrateForce=150
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.VSK.VSK-Shot',Volume=1.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=88.0000000
	WarnTargetPct=0.2000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4500000
	SightOffset=(X=25.0000000,Y=0.4000000,Z=11.2000000)
	ZoomType=4
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_8XScope',BoneName="tip",Scale=0.1000000,AugmentOffset=(X=-20.0000000,Y=-2.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=10
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicPrimaryFireHeavyParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicPrimaryFireStandardParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicParams_Irons'
begin object name="ClassicParams_Irons" class=BCoreProV55.WeaponParams
	Weight=30
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=20.0000000,Y=0.5000000,Z=3.2000000)
	MagAmmo=10
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicPrimaryFireHeavyParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.VSKWeaponParamsClassic.ClassicPrimaryFireStandardParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.VSKWeaponParamsClassic.VSK_Gray'
begin object name="VSK_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.VSKWeaponParamsClassic.VSK_UTC'
begin object name="VSK_UTC" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.VSKCamos.UTCVskShine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
