class M2020WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Overcharger Coil"
		PlayerSpeedFactor=0.9500000
		InventorySize=7
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4500000
		SightOffset=(X=4.0000000,Y=0.0000000,Z=1.9300000)
		ZoomType=2
		ScopeScale=0.7500000
		MagAmmo=10
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaPowerRecoilParams'
		RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineRecoilParams'
		RecoilParams[3]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaPowerFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineFireParams'
		FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaParams_Holo'
	begin object name="ArenaParams_Holo" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Holosight"
		PlayerSpeedFactor=0.9500000
		InventorySize=7
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.4000000
		SightOffset=(X=4.0000000,Y=-0.1000000,Z=0.7500000)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.M2020Tac_FPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Holo',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-40.0000000,Y=-1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
		MagAmmo=10
		WeaponModes[0]=(ModeName="Gauss: Recharge",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Gauss: Power",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Gauss: Offline",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=2,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Gauss: Deflecting",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=2,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeRecoilParams'
		RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineRecoilParams'
		RecoilParams[3]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineFireParams'
		FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineFireParams'
	end object
	Layouts[1]=ArenaParams_Holo
	// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaParams_Supp'
	begin object name="ArenaParams_Supp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Suppressor"
		LayoutTags="supp"
		PlayerSpeedFactor=0.9500000
		InventorySize=7
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.4500000
		SightOffset=(X=4.0000000,Y=-0.0800000,Z=0.5500000)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.M2020Tac_FPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexRU',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-40.0000000,Y=-1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorOsprey',BoneName="tip",Scale=0.2000000,AugmentOffset=(X=-15.0000000,Y=1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
		MagAmmo=10
		WeaponModes[0]=(ModeName="Gauss: Recharge",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Gauss: Power",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Gauss: Offline",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=2,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Gauss: Deflecting",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=2,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaPowerRecoilParams'
		RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineRecoilParams'
		RecoilParams[3]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeFireParams_Supp'
		FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeFireParams_Supp'
		FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineFireParams_Supp'
		FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineFireParams_Supp'
	end object
	Layouts[2]=ArenaParams_Supp
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsComp.M2020_Black'
	begin object name="M2020_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=M2020_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsComp.M2020_Aliens'
	begin object name="M2020_Aliens" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Corporate"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainAlien",Index=2,pIndex=2,AIndex=2)
		Index=1
	end object
	Camos[1]=M2020_Aliens
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsComp.M2020_Desert'
	begin object name="M2020_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainDesert",Index=2,pIndex=2,AIndex=2)
		Index=2
	end object
	Camos[2]=M2020_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsComp.M2020_Winter'
	begin object name="M2020_Winter" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Winter Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainWinter",Index=2,pIndex=2,AIndex=2)
		Index=3
	end object
	Camos[3]=M2020_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsComp.M2020_Blue'
	begin object name="M2020_Blue" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Blue Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainBlueHex",Index=2,pIndex=2,AIndex=2)
		Index=4
	end object
	Camos[4]=M2020_Blue
	// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsComp.M2020_Red'
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
// Reference: RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineRecoilParams'
begin object name="ArenaOfflineRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.8000000,OutVal=0.0100000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1800000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.7500000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=1.0000000
	DeclineDelay=0.2200000
	ViewBindFactor=0.2000000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.7500000
end object
// Reference: FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineFireParams'
begin object name="ArenaOfflineFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	FireAnim="FireUnPowered"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeRecoilParams'
begin object name="ArenaRechargeRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0400000),(InVal=0.3800000,OutVal=-0.0500000),(InVal=0.5500000,OutVal=0.0700000),(InVal=0.7200000,OutVal=-0.1000000),(InVal=1.0000000,OutVal=-0.1500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1800000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.7500000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0600000
	DeclineTime=1.0000000
	DeclineDelay=0.5000000
	ViewBindFactor=0.2000000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.7500000
end object
// Reference: AimParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=1536)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-2048,Yaw=512,Roll=0)
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeFireParams'
begin object name="ArenaRechargeFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3250000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaPowerRecoilParams'
begin object name="ArenaPowerRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.1600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1800000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.7500000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	ClimbTime=0.1250000
	DeclineTime=1.0000000
	DeclineDelay=0.7000000
	ViewBindFactor=0.2000000
	HipMultiplier=1.5000000
	CrouchMultiplier=0.7500000
end object
// Reference: FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineFireParams_Supp'
begin object name="ArenaOfflineFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	FireAnim="FireUnPowered"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineEffectParams_Supp'
end object
// Reference: FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeFireParams_Supp'
begin object name="ArenaRechargeFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.3750000
	FireEndAnim="None"
	AimedFireAnim="FireUnPowered"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeEffectParams_Supp'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeEffectParams'
begin object name="ArenaRechargeEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=65
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DT_M2020Pwr'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_M2020HeadPwr'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_M2020LimbPwr'
	PenetrationEnergy=100.0000000
	PenetrateForce=600
	bPenetrate=true
	WallPDamageFactor=0.7500000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.M2020FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.M2020.M2020-FireGaussAlt',Volume=1.7500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=400.0000000
	PushbackForce=120.0000000
	Chaos=0.6000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.4000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeEffectParams_Supp'
begin object name="ArenaRechargeEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=65
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DT_M2020Pwr'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_M2020HeadPwr'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_M2020LimbPwr'
	PenetrationEnergy=100.0000000
	PenetrateForce=600
	bPenetrate=true
	WallPDamageFactor=0.7500000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.M2020FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.M2020.M2020-FireGaussAlt',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=380.0000000
	PushbackForce=120.0000000
	Chaos=1.2000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.4000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaPowerEffectParams'
begin object name="ArenaPowerEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=125
	HeadMult=1.5000000
	LimbMult=0.9000000
	DamageType=Class'BWBP_SKC_Pro.DT_M2020Pwr'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_M2020HeadPwr'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_M2020LimbPwr'
	PenetrationEnergy=150.0000000
	PenetrateForce=600
	bPenetrate=true
	WallPDamageFactor=0.7500000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.M2020FlashEmitter'
	FlashScaleFactor=1.6000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M50A2.M2020-GaussFireSuper',Volume=6.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=1.0000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaPowerFireParams'
begin object name="ArenaPowerFireParams" class=BCoreProV55.FireParams
	FireInterval=1.5000000
	FireAnim="FirePowered"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaPowerEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineEffectParams'
begin object name="ArenaOfflineEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=40
	DamageType=Class'BWBP_SKC_Pro.DT_M2020Off'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_M2020HeadOff'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_M2020Off'
	PenetrationEnergy=48.0000000
	PenetrateForce=600
	bPenetrate=true
	WallPDamageFactor=0.7500000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.M2020FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M50A2.M2020-GaussFireLow',Volume=6.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=150.0000000
	Chaos=0.0500000
	BotRefireRate=0.5000000
	WarnTargetPct=0.4000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineEffectParams_Supp'
begin object name="ArenaOfflineEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=40
	DamageType=Class'BWBP_SKC_Pro.DT_M2020Off'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_M2020HeadOff'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_M2020Off'
	PenetrationEnergy=48.0000000
	PenetrateForce=600
	bPenetrate=true
	WallPDamageFactor=0.7500000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.Mk781.Mk781-FireSupp',Volume=1.6000000,Radius=192.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=140.0000000
	Chaos=0.1500000
	BotRefireRate=0.5000000
	WarnTargetPct=0.4000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Overcharger Coil"
	PlayerSpeedFactor=0.9500000
	InventorySize=7
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4500000
	SightOffset=(X=4.0000000,Y=0.0000000,Z=1.9300000)
	ZoomType=2
	ScopeScale=0.7500000
	MagAmmo=10
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaPowerRecoilParams'
	RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineRecoilParams'
	RecoilParams[3]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaPowerFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineFireParams'
	FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaParams_Holo'
begin object name="ArenaParams_Holo" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Holosight"
	PlayerSpeedFactor=0.9500000
	InventorySize=7
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.4000000
	SightOffset=(X=4.0000000,Y=-0.1000000,Z=0.7500000)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.M2020Tac_FPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Holo',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-40.0000000,Y=-1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
	MagAmmo=10
	WeaponModes[0]=(ModeName="Gauss: Recharge",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Gauss: Power",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Gauss: Offline",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=2,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Gauss: Deflecting",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=2,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeRecoilParams'
	RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineRecoilParams'
	RecoilParams[3]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineFireParams'
	FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaParams_Supp'
begin object name="ArenaParams_Supp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Suppressor"
	LayoutTags="supp"
	PlayerSpeedFactor=0.9500000
	InventorySize=7
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.4500000
	SightOffset=(X=4.0000000,Y=-0.0800000,Z=0.5500000)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.M2020Tac_FPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexRU',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-40.0000000,Y=-1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorOsprey',BoneName="tip",Scale=0.2000000,AugmentOffset=(X=-15.0000000,Y=1.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
	MagAmmo=10
	WeaponModes[0]=(ModeName="Gauss: Recharge",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Gauss: Power",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Gauss: Offline",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=2,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Gauss: Deflecting",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=2,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaPowerRecoilParams'
	RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineRecoilParams'
	RecoilParams[3]=RecoilParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeFireParams_Supp'
	FireParams[1]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaRechargeFireParams_Supp'
	FireParams[2]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineFireParams_Supp'
	FireParams[3]=FireParams'BWBP_SKC_Pro.M2020WeaponParamsComp.ArenaOfflineFireParams_Supp'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsComp.M2020_Black'
begin object name="M2020_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsComp.M2020_Aliens'
begin object name="M2020_Aliens" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Corporate"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainAlien",Index=2,pIndex=2,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsComp.M2020_Desert'
begin object name="M2020_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainDesert",Index=2,pIndex=2,AIndex=2)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsComp.M2020_Winter'
begin object name="M2020_Winter" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Winter Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainWinter",Index=2,pIndex=2,AIndex=2)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsComp.M2020_Blue'
begin object name="M2020_Blue" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Blue Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainBlueHex",Index=2,pIndex=2,AIndex=2)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.M2020WeaponParamsComp.M2020_Red'
begin object name="M2020_Red" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MiscMetal",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M2020Camos.M2020-MainRedTiger",Index=2,pIndex=2,AIndex=2)
	Index=5
end object
