class M2020WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Overcharger Coil"
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.5000000
		SightOffset=(X=4.0000000,Y=0.0000000,Z=1.9300000)
		ZoomType=4
		MagAmmo=10
		bNeedCock=true
		WeaponModes[0]=(ModeName="Gauss: Std Charge",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Gauss: Overcharge",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Gauss: Offline",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Gauss: Deflecting",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsPower'
		FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsOffline'
		FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsOffline'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicParams_Holo'
	begin object name="ClassicParams_Holo" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Holosight"
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		SightOffset=(X=4.0000000,Y=-0.1000000,Z=0.7500000)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.M2020Tac_FPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Holo',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-40.0000000,Y=-1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
		MagAmmo=10
		bNeedCock=true
		WeaponModes[0]=(ModeName="Gauss: Online",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Gauss: Full Charge",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Gauss: Offline",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Gauss: Deflecting",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsPower'
		FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsOffline'
		FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsOffline'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_Holo
	// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicParams_Supp'
	begin object name="ClassicParams_Supp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Suppressor"
		LayoutTags="supp"
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.5000000
		SightOffset=(X=4.0000000,Y=-0.0800000,Z=0.5500000)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.M2020Tac_FPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexRU',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-40.0000000,Y=-1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorOsprey',BoneName="tip",Scale=0.2000000,AugmentOffset=(X=-15.0000000,Y=1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
		MagAmmo=10
		bNeedCock=true
		WeaponModes[0]=(ModeName="Gauss: Online",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Gauss: Full Charge",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Gauss: Offline",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Gauss: Deflecting",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParams_Supp'
		FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParams_Supp'
		FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsOffline_Supp'
		FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsOffline_Supp'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[2]=ClassicParams_Supp
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsClassic.M2020_Black'
	begin object name="M2020_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=M2020_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsClassic.M2020_Aliens'
	begin object name="M2020_Aliens" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Corporate"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainAlien",Index=2,pIndex=2,AIndex=2)
		Index=1
	end object
	Camos[1]=M2020_Aliens
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsClassic.M2020_Desert'
	begin object name="M2020_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainDesert",Index=2,pIndex=2,AIndex=2)
		Index=2
	end object
	Camos[2]=M2020_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsClassic.M2020_Winter'
	begin object name="M2020_Winter" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Winter Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainWinter",Index=2,pIndex=2,AIndex=2)
		Index=3
	end object
	Camos[3]=M2020_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsClassic.M2020_Blue'
	begin object name="M2020_Blue" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Blue Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainBlueHex",Index=2,pIndex=2,AIndex=2)
		Index=4
	end object
	Camos[4]=M2020_Blue
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsClassic.M2020_Red'
	begin object name="M2020_Red" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainRedTiger",Index=2,pIndex=2,AIndex=2)
		Index=5
	end object
	Camos[5]=M2020_Red
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsOffline'
begin object name="ClassicPrimaryFireParamsOffline" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	FireAnim="FireUnPowered"
	FireEndAnim="None"
	AimedFireAnim="FireUnPowered"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryEffectParamsOffline'
end object
// Reference: AimParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=2560)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.6000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
	ChaosDeclineDelay=1.0000000
	ChaosSpeedThreshold=475
	ChaosTurnThreshold=100000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.4000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.6500000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.4000000
	XRandFactor=1.0000000
	YRandFactor=0.2000000
	MaxRecoil=8096.0000000
	DeclineTime=3.0000000
	DeclineDelay=0.4000000
	ViewBindFactor=0.4000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsOffline_Supp'
begin object name="ClassicPrimaryFireParamsOffline_Supp" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	FireAnim="FireUnPowered"
	FireEndAnim="None"
	AimedFireAnim="FireUnPowered"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryEffectParamsOffline_Supp'
end object
// Reference: FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParams_Supp'
begin object name="ClassicPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="FireUnPowered"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryEffectParams_Supp'
end object
// Reference: FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsPower'
begin object name="ClassicPrimaryFireParamsPower" class=BCoreProV55.FireParams
	FireInterval=2.0000000
	BurstFireRateFactor=1.0000000
	FireAnim="FirePowered"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryEffectParamsPower'
end object
// Reference: FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="FireUnPowered"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=20000.0000000)
	WaterTraceRange=18000.0000000
	RangeAtten=0.9000000
	Damage=80
	HeadMult=1.7000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_M2020Pwr'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_M2020HeadPwr'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_M2020LimbPwr'
	PenetrationEnergy=200.0000000
	PenetrateForce=600
	bPenetrate=true
	WallPDamageFactor=0.7500000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.M2020FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M2020.M2020-GaussFire',Volume=1.7500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1,Y=1)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryEffectParamsPower'
begin object name="ClassicPrimaryEffectParamsPower" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=20000.0000000)
	WaterTraceRange=18000.0000000
	RangeAtten=0.9500000
	Damage=110
	HeadMult=1.2000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_M2020Pwr'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_M2020HeadPwr'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_M2020LimbPwr'
	PenetrationEnergy=200.0000000
	PenetrateForce=600
	bPenetrate=true
	PDamageFactor=0.8500000
	WallPDamageFactor=0.8500000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.M2020FlashEmitter'
	FlashScaleFactor=1.6000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M50A2.M2020-GaussFireSuper',Volume=2.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=4096.0000000
	PushbackForce=120.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1,Y=1)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryEffectParamsOffline'
begin object name="ClassicPrimaryEffectParamsOffline" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=20000.0000000)
	WaterTraceRange=18000.0000000
	RangeAtten=0.8500000
	Damage=40
	HeadMult=2.2000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_M2020Off'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_M2020HeadOff'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_M2020Off'
	PenetrationEnergy=64.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter_C'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M50A2.M2020-GaussFireLow',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=172.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1,Y=1)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryEffectParams_Supp'
begin object name="ClassicPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=20000.0000000)
	WaterTraceRange=18000.0000000
	RangeAtten=0.9000000
	Damage=80
	HeadMult=1.7000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_M2020Pwr'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_M2020HeadPwr'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_M2020LimbPwr'
	PenetrationEnergy=200.0000000
	PenetrateForce=600
	bPenetrate=true
	WallPDamageFactor=0.7500000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.M2020.M2020-FireGaussAlt',Volume=1.7500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2000.0000000
	Chaos=4.0000000
	Inaccuracy=(X=1,Y=1)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryEffectParamsOffline_Supp'
begin object name="ClassicPrimaryEffectParamsOffline_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=20000.0000000)
	WaterTraceRange=18000.0000000
	RangeAtten=0.8500000
	Damage=40
	HeadMult=2.2000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_M2020Off'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_M2020HeadOff'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_M2020Off'
	PenetrationEnergy=64.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.Mk781.Mk781-FireSupp',Volume=1.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=172.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1,Y=1)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Overcharger Coil"
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.5000000
	SightOffset=(X=4.0000000,Y=0.0000000,Z=1.9300000)
	ZoomType=4
	MagAmmo=10
	bNeedCock=true
	WeaponModes[0]=(ModeName="Gauss: Std Charge",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Gauss: Overcharge",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Gauss: Offline",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Gauss: Deflecting",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsPower'
	FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsOffline'
	FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsOffline'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicParams_Holo'
begin object name="ClassicParams_Holo" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Holosight"
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	SightOffset=(X=4.0000000,Y=-0.1000000,Z=0.7500000)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.M2020Tac_FPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Holo',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-40.0000000,Y=-1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
	MagAmmo=10
	bNeedCock=true
	WeaponModes[0]=(ModeName="Gauss: Online",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Gauss: Full Charge",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Gauss: Offline",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Gauss: Deflecting",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsPower'
	FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsOffline'
	FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsOffline'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicParams_Supp'
begin object name="ClassicParams_Supp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Suppressor"
	LayoutTags="supp"
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.5000000
	SightOffset=(X=4.0000000,Y=-0.0800000,Z=0.5500000)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.M2020Tac_FPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexRU',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-40.0000000,Y=-1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorOsprey',BoneName="tip",Scale=0.2000000,AugmentOffset=(X=-15.0000000,Y=1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
	MagAmmo=10
	bNeedCock=true
	WeaponModes[0]=(ModeName="Gauss: Online",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Gauss: Full Charge",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Gauss: Offline",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Gauss: Deflecting",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParams_Supp'
	FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParams_Supp'
	FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsOffline_Supp'
	FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsClassic.ClassicPrimaryFireParamsOffline_Supp'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsClassic.M2020_Black'
begin object name="M2020_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsClassic.M2020_Aliens'
begin object name="M2020_Aliens" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Corporate"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainAlien",Index=2,pIndex=2,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsClassic.M2020_Desert'
begin object name="M2020_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainDesert",Index=2,pIndex=2,AIndex=2)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsClassic.M2020_Winter'
begin object name="M2020_Winter" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Winter Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainWinter",Index=2,pIndex=2,AIndex=2)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsClassic.M2020_Blue'
begin object name="M2020_Blue" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Blue Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainBlueHex",Index=2,pIndex=2,AIndex=2)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsClassic.M2020_Red'
begin object name="M2020_Red" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainRedTiger",Index=2,pIndex=2,AIndex=2)
	Index=5
end object
