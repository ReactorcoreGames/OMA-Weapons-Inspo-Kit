class G51WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaParams_Chaff'
	begin object name="ArenaParams_Chaff" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Adv Holo + Chaff"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightOffset=(X=-0.5000000,Y=-0.0100000,Z=3.1000000)
		WeaponBoneScales[0]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="HoloSightLower",Slot=55,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryFireParams_Chaff'
	end object
	Layouts[0]=ArenaParams_Chaff
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaParams_Sensor'
	begin object name="ArenaParams_Sensor" class=BCoreProV55.WeaponParams
		Weight=3
		LayoutName="Adv Holo + Sensor"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightOffset=(X=-0.5000000,Y=0.0000000,Z=-0.1200000)
		WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=-1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=1.0000000)
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryFireParams_Sensor'
	end object
	Layouts[1]=ArenaParams_Sensor
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaParams_HE'
	begin object name="ArenaParams_HE" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Irons + HE"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightOffset=(X=-0.5000000,Y=0.0000000,Z=0.9000000)
		WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryFireParams_HE'
	end object
	Layouts[2]=ArenaParams_HE
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaParams_3XScope'
	begin object name="ArenaParams_3XScope" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="3X Scope"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4000000
		SightOffset=(X=-0.5000000,Y=-0.0100000,Z=3.1000000)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=3.0000000
		WeaponBoneScales[0]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ACOG',BoneName="tip",Scale=0.1000000,AugmentOffset=(X=-25.0000000,Y=-4.6000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryFireParams_Scope'
		bNoaltfire=true
	end object
	Layouts[3]=ArenaParams_3XScope
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaParams_IRScope'
	begin object name="ArenaParams_IRScope" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="IR Scope"
		LayoutTags="IR"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4500000
		SightOffset=(X=3.0000000,Y=-0.0100000,Z=0.5000000)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-IRScope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=-1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_IRScope',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-27.0000000,Y=-2.6000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=-16384))
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryFireParams_Scope'
	end object
	Layouts[4]=ArenaParams_IRScope
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaParams_Suppressed'
	begin object name="ArenaParams_Suppressed" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Suppressed"
		LayoutTags="silencer"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightOffset=(X=-0.5000000,Y=0.0000000,Z=0.9000000)
		WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.1500000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimarySuppressedFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryFireParams_Scope'
	end object
	Layouts[5]=ArenaParams_Suppressed
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsComp.G51_Black'
	begin object name="G51_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=G51_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsComp.G51_Green'
	begin object name="G51_Green" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainGreen",Index=1,pIndex=1,AIndex=0)
		Index=1
	end object
	Camos[1]=G51_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsComp.G51_GreenHex'
	begin object name="G51_GreenHex" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hex Green"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainHexG",Index=1,pIndex=1,AIndex=0)
		Index=2
	end object
	Camos[2]=G51_GreenHex
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsComp.G51_BlueHex'
	begin object name="G51_BlueHex" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hex Blue"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainHexB",Index=1,pIndex=1,AIndex=0)
		Index=3
	end object
	Camos[3]=G51_BlueHex
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsComp.G51_Desert'
	begin object name="G51_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainDesert",Index=1,pIndex=1,AIndex=0)
		Index=4
	end object
	Camos[4]=G51_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsComp.G51_UTC'
	begin object name="G51_UTC" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="UTC"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.UTCG51Tex",Index=1,pIndex=1,AIndex=0)
		Index=5
	end object
	Camos[5]=G51_UTC
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsComp.G51_Inferno'
	begin object name="G51_Inferno" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Inferno"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainRed",Index=1,pIndex=1,AIndex=0)
		Index=6
	end object
	Camos[6]=G51_Inferno
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsComp.G51_Gold'
	begin object name="G51_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainGold",Index=1,pIndex=1,AIndex=0)
		Index=7
	end object
	Camos[7]=G51_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=512)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.2500000,OutVal=0.0600000),(InVal=0.4000000,OutVal=-0.0200000),(InVal=0.8000000,OutVal=0.1000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1800000),(InVal=0.3000000,OutVal=0.3200000),(InVal=0.5000000,OutVal=0.5000000),(InVal=0.7500000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.0900000
	ClimbTime=0.0400000
	DeclineTime=1.0000000
	DeclineDelay=0.1400000
	ViewBindFactor=0.4000000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0825000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryFireParams_Scope'
begin object name="ArenaSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=13000.0000000)
	DecayRange=(Min=1575.0000000,Max=3675.0000000)
	RangeAtten=0.6700000
	Damage=23
	DamageType=Class'BWBP_SKC_Pro.DT_G51Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_G51AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_G51AssaultLimb'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ55-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=150.0000000
	Chaos=0.0400000
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimarySuppressedEffectParams'
begin object name="ArenaPrimarySuppressedEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=13000.0000000)
	DecayRange=(Min=1575.0000000,Max=3675.0000000)
	RangeAtten=0.7600000
	Damage=23
	DamageType=Class'BWBP_SKC_Pro.DT_G51Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_G51AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_G51AssaultLimb'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51FlashEmitter'
	FlashScaleFactor=0.0100000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-Silenced',Volume=1.5000000,Radius=192.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=130.0000000
	Chaos=0.1300000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimarySuppressedFireParams'
begin object name="ArenaPrimarySuppressedFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0825000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimarySuppressedEffectParams'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryEffectParams_Chaff'
begin object name="ArenaSecondaryEffectParams_Chaff" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=100.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.G51Grenade_Chaff'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3750.0000000
	MaxSpeed=4500.0000000
	Damage=65.0000000
	DamageRadius=512.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51AltFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryFireParams_Chaff'
begin object name="ArenaSecondaryFireParams_Chaff" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	FireAnim="FireGrenade"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryEffectParams_Chaff'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryEffectParams_HE'
begin object name="ArenaSecondaryEffectParams_HE" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=150.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.G51Grenade_HE'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3750.0000000
	MaxSpeed=4500.0000000
	Damage=120.0000000
	DamageRadius=1024.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51AltFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryFireParams_HE'
begin object name="ArenaSecondaryFireParams_HE" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	FireAnim="FireGrenade"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryEffectParams_HE'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryEffectParams_Sensor'
begin object name="ArenaSecondaryEffectParams_Sensor" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=100.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.G51Grenade_Sensor'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3750.0000000
	MaxSpeed=4500.0000000
	Damage=10.0000000
	DamageRadius=10.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51AltFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryFireParams_Sensor'
begin object name="ArenaSecondaryFireParams_Sensor" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	FireAnim="FireGrenade"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryEffectParams_Sensor'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
begin object name="ArenaSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaParams_Chaff'
begin object name="ArenaParams_Chaff" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Adv Holo + Chaff"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightOffset=(X=-0.5000000,Y=-0.0100000,Z=3.1000000)
	WeaponBoneScales[0]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="HoloSightLower",Slot=55,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryFireParams_Chaff'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaParams_Sensor'
begin object name="ArenaParams_Sensor" class=BCoreProV55.WeaponParams
	Weight=3
	LayoutName="Adv Holo + Sensor"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightOffset=(X=-0.5000000,Y=0.0000000,Z=-0.1200000)
	WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=-1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=1.0000000)
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryFireParams_Sensor'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaParams_HE'
begin object name="ArenaParams_HE" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Irons + HE"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightOffset=(X=-0.5000000,Y=0.0000000,Z=0.9000000)
	WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryFireParams_HE'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaParams_3XScope'
begin object name="ArenaParams_3XScope" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="3X Scope"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4000000
	SightOffset=(X=-0.5000000,Y=-0.0100000,Z=3.1000000)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=3.0000000
	WeaponBoneScales[0]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ACOG',BoneName="tip",Scale=0.1000000,AugmentOffset=(X=-25.0000000,Y=-4.6000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryFireParams_Scope'
	bNoaltfire=true
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaParams_IRScope'
begin object name="ArenaParams_IRScope" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="IR Scope"
	LayoutTags="IR"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4500000
	SightOffset=(X=3.0000000,Y=-0.0100000,Z=0.5000000)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-IRScope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=-1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_IRScope',BoneName="tip",Scale=0.0500000,AugmentOffset=(X=-27.0000000,Y=-2.6000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=-16384))
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaParams_Suppressed'
begin object name="ArenaParams_Suppressed" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Suppressed"
	LayoutTags="silencer"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightOffset=(X=-0.5000000,Y=0.0000000,Z=0.9000000)
	WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.1500000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaPrimarySuppressedFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsComp.ArenaSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsComp.G51_Black'
begin object name="G51_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsComp.G51_Green'
begin object name="G51_Green" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainGreen",Index=1,pIndex=1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsComp.G51_GreenHex'
begin object name="G51_GreenHex" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hex Green"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainHexG",Index=1,pIndex=1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsComp.G51_BlueHex'
begin object name="G51_BlueHex" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hex Blue"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainHexB",Index=1,pIndex=1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsComp.G51_Desert'
begin object name="G51_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainDesert",Index=1,pIndex=1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsComp.G51_UTC'
begin object name="G51_UTC" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.UTCG51Tex",Index=1,pIndex=1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsComp.G51_Inferno'
begin object name="G51_Inferno" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Inferno"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainRed",Index=1,pIndex=1,AIndex=0)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsComp.G51_Gold'
begin object name="G51_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainGold",Index=1,pIndex=1,AIndex=0)
	Index=7
end object
